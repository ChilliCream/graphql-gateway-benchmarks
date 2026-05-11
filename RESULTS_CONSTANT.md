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
| hive-router | v0.0.49 | 2,944 | 3,102 | 2,891 | 2.3% |  |
| hotchocolate | 16.1.0-p.1.10 | 2,146 | 2,195 | 2,139 | 0.8% |  |
| grafbase | 0.53.3 | 2,044 | 2,094 | 2,015 | 1.3% |  |
| cosmo | 0.307.0 | 1,277 | 1,287 | 1,271 | 0.5% | non-compatible response (6 across 4/9 runs) |
| hive-gateway-router-runtime | 2.5.25 | 541 | 550 | 536 | 0.8% |  |
| apollo-router | v2.13.1 | 429 | 438 | 413 | 2.4% |  |
| hive-gateway | 2.5.25 | 255 | 259 | 253 | 0.8% |  |
| apollo-gateway | 2.13.3 | 242 | 244 | 241 | 0.5% |  |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.49 | 2,383 | 2,520 | 2,357 | 2.3% |  |
| hotchocolate | 16.1.0-p.1.10 | 1,992 | 2,042 | 1,813 | 3.3% |  |
| grafbase | 0.53.3 | 1,521 | 1,548 | 1,503 | 1.0% |  |
| cosmo | 0.307.0 | 1,169 | 1,193 | 1,166 | 0.9% | non-compatible response (3 across 3/9 runs) |
| hive-gateway-router-runtime | 2.5.25 | 531 | 542 | 528 | 0.9% |  |
| apollo-router | v2.13.1 | 399 | 408 | 396 | 1.0% |  |
| hive-gateway | 2.5.25 | 253 | 255 | 250 | 0.7% |  |
| apollo-gateway | 2.13.3 | 241 | 243 | 241 | 0.3% |  |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.49)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 1061577     ✗ 0     
     data_received..................: 31 GB   258 MB/s
     data_sent......................: 425 MB  3.5 MB/s
     http_req_blocked...............: avg=2.86µs   min=981ns   med=2.16µs  max=8.33ms   p(90)=3.39µs  p(95)=4.03µs   p(99.9)=33.64µs
     http_req_connecting............: avg=288ns    min=0s      med=0s      max=3.98ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=16.71ms  min=1.63ms  med=15.74ms max=337.69ms p(90)=24.7ms  p(95)=28.67ms  p(99.9)=52.39ms
       { expected_response:true }...: avg=16.71ms  min=1.63ms  med=15.74ms max=337.69ms p(90)=24.7ms  p(95)=28.67ms  p(99.9)=52.39ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 353959
     http_req_receiving.............: avg=134.66µs min=28.42µs med=50.34µs max=81.15ms  p(90)=99.95µs p(95)=282.66µs p(99.9)=11.16ms
     http_req_sending...............: avg=60.99µs  min=5.34µs  med=9.14µs  max=156.75ms p(90)=15.44µs p(95)=123.77µs p(99.9)=11.55ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=16.52ms  min=1.56ms  med=15.59ms max=337.02ms p(90)=24.43ms p(95)=28.25ms  p(99.9)=50.59ms
     http_reqs......................: 353959  2944.359145/s
     iteration_duration.............: avg=16.94ms  min=2.16ms  med=15.95ms max=347.58ms p(90)=24.93ms p(95)=28.93ms  p(99.9)=53.75ms
     iterations.....................: 353859  2943.527309/s
     success_rate...................: 100.00% ✓ 353859      ✗ 0     
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

     checks.........................: 100.00% ✓ 774390      ✗ 0     
     data_received..................: 23 GB   188 MB/s
     data_sent......................: 310 MB  2.6 MB/s
     http_req_blocked...............: avg=3.01µs   min=1.01µs  med=2.24µs   max=4.88ms   p(90)=3.44µs   p(95)=4.06µs   p(99.9)=34.87µs 
     http_req_connecting............: avg=410ns    min=0s      med=0s       max=4.84ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=23ms     min=2.43ms  med=14.7ms   max=303.25ms p(90)=51.32ms  p(95)=69.81ms  p(99.9)=167.47ms
       { expected_response:true }...: avg=23ms     min=2.43ms  med=14.7ms   max=303.25ms p(90)=51.32ms  p(95)=69.81ms  p(99.9)=167.47ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 258230
     http_req_receiving.............: avg=647.83µs min=51.19µs med=108.76µs max=270.59ms p(90)=957.06µs p(95)=1.47ms   p(99.9)=57.79ms 
     http_req_sending...............: avg=44.26µs  min=5.15µs  med=9.63µs   max=113.11ms p(90)=16.04µs  p(95)=111.75µs p(99.9)=2.73ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=22.3ms   min=2.3ms   med=14.19ms  max=302.71ms p(90)=49.92ms  p(95)=68.54ms  p(99.9)=164.89ms
     http_reqs......................: 258230  2146.460456/s
     iteration_duration.............: avg=23.23ms  min=3.26ms  med=14.91ms  max=347.83ms p(90)=51.57ms  p(95)=70.04ms  p(99.9)=169.35ms
     iterations.....................: 258130  2145.629236/s
     success_rate...................: 100.00% ✓ 258130      ✗ 0     
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

     checks.........................: 100.00% ✓ 737202      ✗ 0     
     data_received..................: 22 GB   180 MB/s
     data_sent......................: 295 MB  2.5 MB/s
     http_req_blocked...............: avg=3.2µs    min=942ns   med=2.28µs  max=13.95ms  p(90)=3.77µs   p(95)=4.59µs   p(99.9)=39.86µs
     http_req_connecting............: avg=413ns    min=0s      med=0s      max=4.05ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=24.17ms  min=1.99ms  med=23.93ms max=356.34ms p(90)=28.94ms  p(95)=31.23ms  p(99.9)=53.87ms
       { expected_response:true }...: avg=24.17ms  min=1.99ms  med=23.93ms max=356.34ms p(90)=28.94ms  p(95)=31.23ms  p(99.9)=53.87ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 245834
     http_req_receiving.............: avg=110.93µs min=28.87µs med=57.79µs max=53.16ms  p(90)=101.62µs p(95)=190.88µs p(99.9)=9.16ms 
     http_req_sending...............: avg=44.91µs  min=5.15µs  med=10.33µs max=189.07ms p(90)=17.52µs  p(95)=115.13µs p(99.9)=3.19ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=24.01ms  min=1.89ms  med=23.81ms max=346.83ms p(90)=28.77ms  p(95)=30.97ms  p(99.9)=52.57ms
     http_reqs......................: 245834  2044.309734/s
     iteration_duration.............: avg=24.4ms   min=3.93ms  med=24.14ms max=366.13ms p(90)=29.17ms  p(95)=31.48ms  p(99.9)=54.51ms
     iterations.....................: 245734  2043.478153/s
     success_rate...................: 100.00% ✓ 245734      ✗ 0     
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

     checks.........................: 100.00% ✓ 460611      ✗ 0     
     data_received..................: 14 GB   112 MB/s
     data_sent......................: 185 MB  1.5 MB/s
     http_req_blocked...............: avg=3.52µs  min=1.06µs  med=2.34µs  max=10.65ms  p(90)=3.77µs  p(95)=4.41µs   p(99.9)=35.89µs
     http_req_connecting............: avg=861ns   min=0s      med=0s      max=10.61ms  p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=38.83ms min=2.13ms  med=38.28ms max=315.05ms p(90)=54.77ms p(95)=59.76ms  p(99.9)=83.7ms 
       { expected_response:true }...: avg=38.83ms min=2.13ms  med=38.28ms max=315.05ms p(90)=54.77ms p(95)=59.76ms  p(99.9)=83.7ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 153637
     http_req_receiving.............: avg=81.79µs min=29.25µs med=59.87µs max=112.01ms p(90)=95.59µs p(95)=113.41µs p(99.9)=1.85ms 
     http_req_sending...............: avg=28.08µs min=5.24µs  med=10.4µs  max=110.99ms p(90)=16.04µs p(95)=20.13µs  p(99.9)=1.46ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=38.72ms min=2.05ms  med=38.19ms max=276.61ms p(90)=54.66ms p(95)=59.63ms  p(99.9)=83.49ms
     http_reqs......................: 153637  1277.4833/s
     iteration_duration.............: avg=39.07ms min=4.12ms  med=38.49ms max=333.98ms p(90)=54.98ms p(95)=59.97ms  p(99.9)=84.37ms
     iterations.....................: 153537  1276.651806/s
     success_rate...................: 100.00% ✓ 153537      ✗ 0     
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

     checks.........................: 100.00% ✓ 195495     ✗ 0    
     data_received..................: 5.7 GB  48 MB/s
     data_sent......................: 78 MB   650 kB/s
     http_req_blocked...............: avg=4.51µs  min=1.17µs  med=2.82µs  max=4.08ms   p(90)=4.29µs   p(95)=4.87µs   p(99.9)=46.28µs 
     http_req_connecting............: avg=1.35µs  min=0s      med=0s      max=4.03ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=91.72ms min=4.01ms  med=84.68ms max=345.14ms p(90)=128.43ms p(95)=143.26ms p(99.9)=240.26ms
       { expected_response:true }...: avg=91.72ms min=4.01ms  med=84.68ms max=345.14ms p(90)=128.43ms p(95)=143.26ms p(99.9)=240.26ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 65265
     http_req_receiving.............: avg=91.46µs min=32.05µs med=75.58µs max=116.78ms p(90)=109.19µs p(95)=121.59µs p(99.9)=990.66µs
     http_req_sending...............: avg=21.48µs min=5.71µs  med=12.75µs max=75.41ms  p(90)=18.81µs  p(95)=21.17µs  p(99.9)=647.85µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=91.6ms  min=3.95ms  med=84.57ms max=344.56ms p(90)=128.33ms p(95)=143.13ms p(99.9)=240.08ms
     http_reqs......................: 65265   541.347423/s
     iteration_duration.............: avg=92.09ms min=26.94ms med=84.93ms max=358.16ms p(90)=128.67ms p(95)=143.6ms  p(99.9)=241.51ms
     iterations.....................: 65165   540.517963/s
     success_rate...................: 100.00% ✓ 65165      ✗ 0    
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

     checks.........................: 100.00% ✓ 155178     ✗ 0    
     data_received..................: 4.5 GB  38 MB/s
     data_sent......................: 62 MB   516 kB/s
     http_req_blocked...............: avg=5.51µs   min=1.18µs  med=3.38µs   max=3.92ms   p(90)=4.83µs   p(95)=5.39µs   p(99.9)=136.67µs
     http_req_connecting............: avg=1.91µs   min=0s      med=0s       max=3.88ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=115.53ms min=5.48ms  med=115.28ms max=389.81ms p(90)=139.72ms p(95)=147.1ms  p(99.9)=181.59ms
       { expected_response:true }...: avg=115.53ms min=5.48ms  med=115.28ms max=389.81ms p(90)=139.72ms p(95)=147.1ms  p(99.9)=181.59ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 51826
     http_req_receiving.............: avg=95.61µs  min=30.83µs med=82.39µs  max=192.48ms p(90)=114.36µs p(95)=126.96µs p(99.9)=777.64µs
     http_req_sending...............: avg=25.55µs  min=5.48µs  med=14.9µs   max=80.2ms   p(90)=20.59µs  p(95)=22.46µs  p(99.9)=589.63µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=115.41ms min=5.37ms  med=115.16ms max=384.22ms p(90)=139.6ms  p(95)=146.97ms p(99.9)=180.68ms
     http_reqs......................: 51826   429.419923/s
     iteration_duration.............: avg=116.02ms min=19.7ms  med=115.56ms max=400.13ms p(90)=139.98ms p(95)=147.36ms p(99.9)=183.39ms
     iterations.....................: 51726   428.591343/s
     success_rate...................: 100.00% ✓ 51726      ✗ 0    
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

     checks.........................: 100.00% ✓ 92307      ✗ 0    
     data_received..................: 2.7 GB  22 MB/s
     data_sent......................: 37 MB   306 kB/s
     http_req_blocked...............: avg=6.98µs   min=1.29µs  med=3.44µs   max=4.47ms   p(90)=4.89µs   p(95)=5.51µs   p(99.9)=1.42ms  
     http_req_connecting............: avg=3.34µs   min=0s      med=0s       max=4.43ms   p(90)=0s       p(95)=0s       p(99.9)=1.39ms  
     http_req_duration..............: avg=194.27ms min=6.3ms   med=189.97ms max=760.09ms p(90)=266.17ms p(95)=362.18ms p(99.9)=585.4ms 
       { expected_response:true }...: avg=194.27ms min=6.3ms   med=189.97ms max=760.09ms p(90)=266.17ms p(95)=362.18ms p(99.9)=585.4ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 30869
     http_req_receiving.............: avg=98.01µs  min=31.64µs med=93.28µs  max=2.03ms   p(90)=125.75µs p(95)=139.19µs p(99.9)=715.07µs
     http_req_sending...............: avg=25.24µs  min=5.87µs  med=17.04µs  max=72.52ms  p(90)=22.42µs  p(95)=24.43µs  p(99.9)=675.37µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=194.15ms min=6.17ms  med=189.84ms max=759.99ms p(90)=266.08ms p(95)=362.05ms p(99.9)=585.28ms
     http_reqs......................: 30869   255.168466/s
     iteration_duration.............: avg=195.16ms min=30.99ms med=190.47ms max=760.32ms p(90)=266.66ms p(95)=363.27ms p(99.9)=587.12ms
     iterations.....................: 30769   254.341849/s
     success_rate...................: 100.00% ✓ 30769      ✗ 0    
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

     checks.........................: 100.00% ✓ 87636      ✗ 0    
     data_received..................: 2.6 GB  21 MB/s
     data_sent......................: 35 MB   291 kB/s
     http_req_blocked...............: avg=6.91µs   min=1.25µs  med=3.27µs   max=4.11ms   p(90)=4.48µs   p(95)=5µs      p(99.9)=1.78ms  
     http_req_connecting............: avg=3.48µs   min=0s      med=0s       max=4.05ms   p(90)=0s       p(95)=0s       p(99.9)=1.75ms  
     http_req_duration..............: avg=204.53ms min=8.5ms   med=201.27ms max=433.81ms p(90)=234.43ms p(95)=244.87ms p(99.9)=308.43ms
       { expected_response:true }...: avg=204.53ms min=8.5ms   med=201.27ms max=433.81ms p(90)=234.43ms p(95)=244.87ms p(99.9)=308.43ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29312
     http_req_receiving.............: avg=111.84µs min=34.78µs med=89.27µs  max=38.28ms  p(90)=120.14µs p(95)=132.02µs p(99.9)=1.05ms  
     http_req_sending...............: avg=39.38µs  min=5.99µs  med=15.78µs  max=175.17ms p(90)=21.18µs  p(95)=22.97µs  p(99.9)=640.44µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=204.37ms min=8.36ms  med=201.15ms max=415.65ms p(90)=234.26ms p(95)=244.71ms p(99.9)=307.25ms
     http_reqs......................: 29312   242.129568/s
     iteration_duration.............: avg=205.51ms min=27.09ms med=201.56ms max=450.39ms p(90)=234.74ms p(95)=245.17ms p(99.9)=326.1ms 
     iterations.....................: 29212   241.303526/s
     success_rate...................: 100.00% ✓ 29212      ✗ 0    
     vus............................: 31      min=31       max=50 
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

     checks.........................: 100.00% ✓ 859470      ✗ 0     
     data_received..................: 25 GB   208 MB/s
     data_sent......................: 344 MB  2.9 MB/s
     http_req_blocked...............: avg=2.99µs   min=942ns   med=2.15µs  max=9.45ms   p(90)=3.56µs  p(95)=4.34µs   p(99.9)=33.81µs
     http_req_connecting............: avg=353ns    min=0s      med=0s      max=4.36ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=20.7ms   min=1.79ms  med=20.21ms max=316.06ms p(90)=28.68ms p(95)=31.83ms  p(99.9)=54.22ms
       { expected_response:true }...: avg=20.7ms   min=1.79ms  med=20.21ms max=316.06ms p(90)=28.68ms p(95)=31.83ms  p(99.9)=54.22ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 286590
     http_req_receiving.............: avg=117.41µs min=27.94µs med=52.91µs max=97.42ms  p(90)=100.1µs p(95)=252.75µs p(99.9)=9.93ms 
     http_req_sending...............: avg=52.85µs  min=5.12µs  med=9.45µs  max=241.92ms p(90)=17.25µs p(95)=122.45µs p(99.9)=5.91ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=20.53ms  min=1.71ms  med=20.07ms max=300.35ms p(90)=28.46ms p(95)=31.52ms  p(99.9)=53.36ms
     http_reqs......................: 286590  2383.512391/s
     iteration_duration.............: avg=20.93ms  min=3.27ms  med=20.42ms max=335ms    p(90)=28.9ms  p(95)=32.07ms  p(99.9)=54.74ms
     iterations.....................: 286490  2382.68071/s
     success_rate...................: 100.00% ✓ 286490      ✗ 0     
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

     checks.........................: 100.00% ✓ 718281      ✗ 0     
     data_received..................: 21 GB   175 MB/s
     data_sent......................: 288 MB  2.4 MB/s
     http_req_blocked...............: avg=2.72µs   min=1µs     med=2.13µs  max=10.36ms  p(90)=3.53µs  p(95)=4.26µs   p(99.9)=33.15µs 
     http_req_connecting............: avg=167ns    min=0s      med=0s      max=2.11ms   p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=24.81ms  min=1.81ms  med=17.54ms max=609.5ms  p(90)=50.75ms p(95)=67.06ms  p(99.9)=183.25ms
       { expected_response:true }...: avg=24.81ms  min=1.81ms  med=17.54ms max=609.5ms  p(90)=50.75ms p(95)=67.06ms  p(99.9)=183.25ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 239527
     http_req_receiving.............: avg=679.61µs min=50.63µs med=99.73µs max=265.79ms p(90)=1.16ms  p(95)=1.91ms   p(99.9)=53.96ms 
     http_req_sending...............: avg=43.78µs  min=5.33µs  med=9.34µs  max=137.14ms p(90)=17.52µs p(95)=109.74µs p(99.9)=2.87ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=24.09ms  min=1.7ms   med=16.96ms max=609.38ms p(90)=49.47ms p(95)=65.54ms  p(99.9)=180.32ms
     http_reqs......................: 239527  1992.18741/s
     iteration_duration.............: avg=25.05ms  min=2.78ms  med=17.76ms max=609.72ms p(90)=50.99ms p(95)=67.32ms  p(99.9)=185.48ms
     iterations.....................: 239427  1991.355693/s
     success_rate...................: 100.00% ✓ 239427      ✗ 0     
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

     checks.........................: 100.00% ✓ 548934      ✗ 0     
     data_received..................: 16 GB   133 MB/s
     data_sent......................: 220 MB  1.8 MB/s
     http_req_blocked...............: avg=3.71µs   min=942ns   med=2.38µs  max=8.93ms   p(90)=4.74µs   p(95)=5.91µs   p(99.9)=47.75µs
     http_req_connecting............: avg=636ns    min=0s      med=0s      max=4.52ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=32.51ms  min=2.36ms  med=31.6ms  max=337.76ms p(90)=43.05ms  p(95)=47.81ms  p(99.9)=86.67ms
       { expected_response:true }...: avg=32.51ms  min=2.36ms  med=31.6ms  max=337.76ms p(90)=43.05ms  p(95)=47.81ms  p(99.9)=86.67ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 183078
     http_req_receiving.............: avg=111.53µs min=29.33µs med=62.1µs  max=206.31ms p(90)=134.53µs p(95)=281.35µs p(99.9)=5.25ms 
     http_req_sending...............: avg=45.79µs  min=5.19µs  med=10.51µs max=214.21ms p(90)=24.03µs  p(95)=134.09µs p(99.9)=3.19ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=32.35ms  min=2.29ms  med=31.46ms max=336.83ms p(90)=42.89ms  p(95)=47.6ms   p(99.9)=86.32ms
     http_reqs......................: 183078  1521.903211/s
     iteration_duration.............: avg=32.78ms  min=4.72ms  med=31.83ms max=368.63ms p(90)=43.3ms   p(95)=48.06ms  p(99.9)=87.68ms
     iterations.....................: 182978  1521.071924/s
     success_rate...................: 100.00% ✓ 182978      ✗ 0     
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

     checks.........................: 100.00% ✓ 421578      ✗ 0     
     data_received..................: 12 GB   102 MB/s
     data_sent......................: 169 MB  1.4 MB/s
     http_req_blocked...............: avg=3.5µs   min=1.1µs   med=2.79µs  max=2.72ms   p(90)=4.3µs    p(95)=4.97µs   p(99.9)=37.62µs
     http_req_connecting............: avg=403ns   min=0s      med=0s      max=2.69ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=42.43ms min=2.24ms  med=41.86ms max=312.68ms p(90)=59.71ms  p(95)=65.01ms  p(99.9)=91.94ms
       { expected_response:true }...: avg=42.43ms min=2.24ms  med=41.86ms max=312.68ms p(90)=59.71ms  p(95)=65.01ms  p(99.9)=91.94ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 140626
     http_req_receiving.............: avg=87.03µs min=29.86µs med=68.33µs max=40.06ms  p(90)=106.33µs p(95)=124.75µs p(99.9)=1.75ms 
     http_req_sending...............: avg=31.39µs min=5.45µs  med=12.02µs max=170.44ms p(90)=18.2µs   p(95)=22.07µs  p(99.9)=1.31ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=42.31ms min=2.16ms  med=41.75ms max=312.29ms p(90)=59.59ms  p(95)=64.87ms  p(99.9)=91.41ms
     http_reqs......................: 140626  1169.069/s
     iteration_duration.............: avg=42.69ms min=4.45ms  med=42.08ms max=335.52ms p(90)=59.94ms  p(95)=65.24ms  p(99.9)=92.96ms
     iterations.....................: 140526  1168.237668/s
     success_rate...................: 100.00% ✓ 140526      ✗ 0     
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

     checks.........................: 100.00% ✓ 191943     ✗ 0    
     data_received..................: 5.6 GB  47 MB/s
     data_sent......................: 77 MB   638 kB/s
     http_req_blocked...............: avg=5.09µs   min=1.15µs  med=3.15µs  max=4.14ms   p(90)=4.73µs   p(95)=5.37µs   p(99.9)=45.71µs 
     http_req_connecting............: avg=1.67µs   min=0s      med=0s      max=4.1ms    p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=93.39ms  min=4.12ms  med=88.51ms max=345.42ms p(90)=119.91ms p(95)=136.34ms p(99.9)=234.33ms
       { expected_response:true }...: avg=93.39ms  min=4.12ms  med=88.51ms max=345.42ms p(90)=119.91ms p(95)=136.34ms p(99.9)=234.33ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 64081
     http_req_receiving.............: avg=123.78µs min=31.16µs med=80.51µs max=275.81ms p(90)=114.87µs p(95)=128.28µs p(99.9)=1.11ms  
     http_req_sending...............: avg=24.48µs  min=5.62µs  med=13.96µs max=88.19ms  p(90)=20.83µs  p(95)=23.02µs  p(99.9)=661.4µs 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=93.24ms  min=4.05ms  med=88.38ms max=334ms    p(90)=119.77ms p(95)=136.05ms p(99.9)=232.77ms
     http_reqs......................: 64081   531.554661/s
     iteration_duration.............: avg=93.79ms  min=23.5ms  med=88.76ms max=368.13ms p(90)=120.18ms p(95)=136.71ms p(99.9)=237.86ms
     iterations.....................: 63981   530.725157/s
     success_rate...................: 100.00% ✓ 63981      ✗ 0    
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

     checks.........................: 100.00% ✓ 144291     ✗ 0    
     data_received..................: 4.2 GB  35 MB/s
     data_sent......................: 58 MB   479 kB/s
     http_req_blocked...............: avg=5.75µs   min=1.22µs  med=3.53µs   max=4.4ms    p(90)=5.09µs   p(95)=5.7µs    p(99.9)=177.53µs
     http_req_connecting............: avg=2.03µs   min=0s      med=0s       max=4.36ms   p(90)=0s       p(95)=0s       p(99.9)=121.48µs
     http_req_duration..............: avg=124.24ms min=5.93ms  med=121.75ms max=331.67ms p(90)=164.63ms p(95)=177.3ms  p(99.9)=225.85ms
       { expected_response:true }...: avg=124.24ms min=5.93ms  med=121.75ms max=331.67ms p(90)=164.63ms p(95)=177.3ms  p(99.9)=225.85ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 48197
     http_req_receiving.............: avg=94.4µs   min=31.61µs med=88.41µs  max=21.21ms  p(90)=120.82µs p(95)=133.56µs p(99.9)=833.08µs
     http_req_sending...............: avg=29.3µs   min=5.95µs  med=16.67µs  max=150.17ms p(90)=22.19µs  p(95)=24.04µs  p(99.9)=618.08µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=124.11ms min=5.85ms  med=121.64ms max=331.12ms p(90)=164.49ms p(95)=177.18ms p(99.9)=225.78ms
     http_reqs......................: 48197   399.145517/s
     iteration_duration.............: avg=124.78ms min=11.51ms med=122.07ms max=366.45ms p(90)=164.94ms p(95)=177.65ms p(99.9)=228.62ms
     iterations.....................: 48097   398.317363/s
     success_rate...................: 100.00% ✓ 48097      ✗ 0    
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

     checks.........................: 100.00% ✓ 91842      ✗ 0    
     data_received..................: 2.7 GB  22 MB/s
     data_sent......................: 37 MB   305 kB/s
     http_req_blocked...............: avg=6.82µs   min=1.28µs  med=3.57µs   max=4.24ms   p(90)=4.98µs   p(95)=5.59µs   p(99.9)=1.28ms  
     http_req_connecting............: avg=3.03µs   min=0s      med=0s       max=4.2ms    p(90)=0s       p(95)=0s       p(99.9)=1.25ms  
     http_req_duration..............: avg=195.22ms min=6.45ms  med=192.78ms max=700.4ms  p(90)=249.3ms  p(95)=347.86ms p(99.9)=583.89ms
       { expected_response:true }...: avg=195.22ms min=6.45ms  med=192.78ms max=700.4ms  p(90)=249.3ms  p(95)=347.86ms p(99.9)=583.89ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 30714
     http_req_receiving.............: avg=99.31µs  min=33.69µs med=94.96µs  max=9.81ms   p(90)=125.84µs p(95)=138.99µs p(99.9)=795.64µs
     http_req_sending...............: avg=37.79µs  min=5.89µs  med=17.58µs  max=193.49ms p(90)=22.35µs  p(95)=24.14µs  p(99.9)=846.81µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=195.09ms min=6.31ms  med=192.65ms max=700.29ms p(90)=249.19ms p(95)=347.25ms p(99.9)=583.77ms
     http_reqs......................: 30714   253.643498/s
     iteration_duration.............: avg=196.16ms min=33.17ms med=193.26ms max=700.66ms p(90)=249.76ms p(95)=352.36ms p(99.9)=584.43ms
     iterations.....................: 30614   252.817675/s
     success_rate...................: 100.00% ✓ 30614      ✗ 0    
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

     checks.........................: 100.00% ✓ 87384      ✗ 0    
     data_received..................: 2.6 GB  21 MB/s
     data_sent......................: 35 MB   290 kB/s
     http_req_blocked...............: avg=7.44µs   min=1.23µs  med=3.56µs   max=4.53ms   p(90)=4.96µs   p(95)=5.51µs   p(99.9)=1.65ms  
     http_req_connecting............: avg=3.72µs   min=0s      med=0s       max=4.49ms   p(90)=0s       p(95)=0s       p(99.9)=1.62ms  
     http_req_duration..............: avg=205.14ms min=8.65ms  med=196.69ms max=425.16ms p(90)=248.44ms p(95)=255.11ms p(99.9)=330.06ms
       { expected_response:true }...: avg=205.14ms min=8.65ms  med=196.69ms max=425.16ms p(90)=248.44ms p(95)=255.11ms p(99.9)=330.06ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29228
     http_req_receiving.............: avg=101.03µs min=33.35µs med=95.84µs  max=13.16ms  p(90)=128.36µs p(95)=141.82µs p(99.9)=659.05µs
     http_req_sending...............: avg=29.24µs  min=5.77µs  med=17.72µs  max=79.03ms  p(90)=22.69µs  p(95)=24.6µs   p(99.9)=512.47µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=205.01ms min=8.55ms  med=196.57ms max=424.91ms p(90)=248.32ms p(95)=254.99ms p(99.9)=329.96ms
     http_reqs......................: 29228   241.343424/s
     iteration_duration.............: avg=206.13ms min=55.64ms med=196.99ms max=453.04ms p(90)=248.76ms p(95)=255.46ms p(99.9)=333.68ms
     iterations.....................: 29128   240.517697/s
     success_rate...................: 100.00% ✓ 29128      ✗ 0    
     vus............................: 46      min=46       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-177-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

