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
| hive-router | v0.0.49 | 3,068 | 3,223 | 3,000 | 2.2% |  |
| hotchocolate | 16.1.0-p.1.10 | 2,165 | 2,212 | 2,150 | 0.9% |  |
| grafbase | 0.53.3 | 2,051 | 2,110 | 2,021 | 1.4% |  |
| cosmo | 0.307.0 | 1,279 | 1,301 | 1,272 | 0.7% | non-compatible response (1 across 1/9 runs) |
| hive-gateway-router-runtime | 2.5.25 | 542 | 554 | 537 | 1.0% |  |
| apollo-router | v2.13.1 | 430 | 440 | 427 | 1.1% |  |
| hive-gateway | 2.5.25 | 256 | 261 | 254 | 0.8% |  |
| apollo-gateway | 2.13.3 | 244 | 248 | 243 | 0.8% |  |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.49 | 2,502 | 2,611 | 2,466 | 1.9% |  |
| hotchocolate | 16.1.0-p.1.10 | 1,921 | 1,979 | 1,904 | 1.3% |  |
| grafbase | 0.53.3 | 1,547 | 1,594 | 1,519 | 1.5% |  |
| cosmo | 0.307.0 | 1,212 | 1,231 | 1,204 | 0.8% |  |
| hive-gateway-router-runtime | 2.5.25 | 523 | 538 | 518 | 1.3% |  |
| apollo-router | v2.13.1 | 370 | 382 | 365 | 1.6% |  |
| hive-gateway | 2.5.25 | 249 | 255 | 247 | 1.1% |  |
| apollo-gateway | 2.13.3 | 238 | 240 | 236 | 0.6% |  |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.49)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 1106451     ✗ 0     
     data_received..................: 32 GB   269 MB/s
     data_sent......................: 443 MB  3.7 MB/s
     http_req_blocked...............: avg=3.25µs   min=1µs     med=2.36µs  max=26.14ms  p(90)=3.63µs  p(95)=4.29µs   p(99.9)=37.29µs
     http_req_connecting............: avg=257ns    min=0s      med=0s      max=4.35ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=16.02ms  min=1.7ms   med=14.86ms max=330.5ms  p(90)=24.07ms p(95)=28.73ms  p(99.9)=52.69ms
       { expected_response:true }...: avg=16.02ms  min=1.7ms   med=14.86ms max=330.5ms  p(90)=24.07ms p(95)=28.73ms  p(99.9)=52.69ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 368917
     http_req_receiving.............: avg=165.93µs min=27.61µs med=48.76µs max=257.42ms p(90)=99.34µs p(95)=289.21µs p(99.9)=18.83ms
     http_req_sending...............: avg=62.77µs  min=5.28µs  med=9.25µs  max=103.87ms p(90)=16.1µs  p(95)=123.28µs p(99.9)=13.63ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=15.79ms  min=1.64ms  med=14.71ms max=146.34ms p(90)=23.71ms p(95)=28.15ms  p(99.9)=50.72ms
     http_reqs......................: 368917  3068.773527/s
     iteration_duration.............: avg=16.25ms  min=2.05ms  med=15.07ms max=347.71ms p(90)=24.32ms p(95)=29.02ms  p(99.9)=54.92ms
     iterations.....................: 368817  3067.941694/s
     success_rate...................: 100.00% ✓ 368817      ✗ 0     
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

     checks.........................: 100.00% ✓ 781314      ✗ 0     
     data_received..................: 23 GB   190 MB/s
     data_sent......................: 313 MB  2.6 MB/s
     http_req_blocked...............: avg=4.34µs  min=1.02µs  med=2.35µs   max=18.8ms   p(90)=3.56µs   p(95)=4.18µs   p(99.9)=34.93µs 
     http_req_connecting............: avg=1.54µs  min=0s      med=0s       max=18.76ms  p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=22.79ms min=2.36ms  med=14.77ms  max=357.73ms p(90)=50.11ms  p(95)=68.37ms  p(99.9)=165.61ms
       { expected_response:true }...: avg=22.79ms min=2.36ms  med=14.77ms  max=357.73ms p(90)=50.11ms  p(95)=68.37ms  p(99.9)=165.61ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 260538
     http_req_receiving.............: avg=636.3µs min=51.59µs med=104.64µs max=246.98ms p(90)=966.82µs p(95)=1.5ms    p(99.9)=58.95ms 
     http_req_sending...............: avg=47.23µs min=5.37µs  med=9.61µs   max=98.39ms  p(90)=16.32µs  p(95)=109.74µs p(99.9)=4.55ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=22.11ms min=2.28ms  med=14.26ms  max=356.88ms p(90)=48.9ms   p(95)=67.03ms  p(99.9)=161.46ms
     http_reqs......................: 260538  2165.830192/s
     iteration_duration.............: avg=23.02ms min=3.48ms  med=14.99ms  max=357.93ms p(90)=50.35ms  p(95)=68.62ms  p(99.9)=166.88ms
     iterations.....................: 260438  2164.998901/s
     success_rate...................: 100.00% ✓ 260438      ✗ 0     
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

     checks.........................: 100.00% ✓ 739887      ✗ 0     
     data_received..................: 22 GB   180 MB/s
     data_sent......................: 297 MB  2.5 MB/s
     http_req_blocked...............: avg=3.11µs   min=1µs    med=2.16µs  max=10.77ms  p(90)=3.58µs   p(95)=4.34µs   p(99.9)=42.68µs
     http_req_connecting............: avg=434ns    min=0s     med=0s      max=4.46ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=24.08ms  min=1.9ms  med=23.82ms max=341.5ms  p(90)=28.97ms  p(95)=31.35ms  p(99.9)=53.63ms
       { expected_response:true }...: avg=24.08ms  min=1.9ms  med=23.82ms max=341.5ms  p(90)=28.97ms  p(95)=31.35ms  p(99.9)=53.63ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 246729
     http_req_receiving.............: avg=137.61µs min=29.5µs med=57.64µs max=301.09ms p(90)=101.11µs p(95)=199.9µs  p(99.9)=10.91ms
     http_req_sending...............: avg=45.52µs  min=4.46µs med=9.91µs  max=147.41ms p(90)=17.55µs  p(95)=115.42µs p(99.9)=3.73ms 
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=23.9ms   min=1.83ms med=23.7ms  max=181.49ms p(90)=28.78ms  p(95)=31.06ms  p(99.9)=51.82ms
     http_reqs......................: 246729  2051.94409/s
     iteration_duration.............: avg=24.31ms  min=3.33ms med=24.02ms max=351.34ms p(90)=29.19ms  p(95)=31.6ms   p(99.9)=54.09ms
     iterations.....................: 246629  2051.112431/s
     success_rate...................: 100.00% ✓ 246629      ✗ 0     
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

     checks.........................: 100.00% ✓ 461355      ✗ 0     
     data_received..................: 14 GB   112 MB/s
     data_sent......................: 185 MB  1.5 MB/s
     http_req_blocked...............: avg=3.14µs  min=1.03µs  med=2.22µs  max=4.01ms   p(90)=3.61µs  p(95)=4.25µs   p(99.9)=32.72µs
     http_req_connecting............: avg=588ns   min=0s      med=0s      max=3.98ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=38.77ms min=2.17ms  med=38.21ms max=291.38ms p(90)=54.83ms p(95)=59.87ms  p(99.9)=83.36ms
       { expected_response:true }...: avg=38.77ms min=2.17ms  med=38.21ms max=291.38ms p(90)=54.83ms p(95)=59.87ms  p(99.9)=83.36ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 153885
     http_req_receiving.............: avg=85.61µs min=28.14µs med=61.66µs max=179.32ms p(90)=99.23µs p(95)=119.29µs p(99.9)=2.13ms 
     http_req_sending...............: avg=26.91µs min=5.11µs  med=10.31µs max=217.75ms p(90)=16.2µs  p(95)=20.38µs  p(99.9)=1.28ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=38.66ms min=2.05ms  med=38.1ms  max=285.68ms p(90)=54.71ms p(95)=59.74ms  p(99.9)=82.84ms
     http_reqs......................: 153885  1279.348055/s
     iteration_duration.............: avg=39ms    min=4.15ms  med=38.41ms max=324.78ms p(90)=55.04ms p(95)=60.07ms  p(99.9)=83.95ms
     iterations.....................: 153785  1278.516689/s
     success_rate...................: 100.00% ✓ 153785      ✗ 0     
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

     checks.........................: 100.00% ✓ 196014     ✗ 0    
     data_received..................: 5.7 GB  48 MB/s
     data_sent......................: 79 MB   652 kB/s
     http_req_blocked...............: avg=4.4µs   min=1.08µs  med=2.4µs   max=4.37ms   p(90)=3.91µs   p(95)=4.46µs   p(99.9)=45.66µs 
     http_req_connecting............: avg=1.67µs  min=0s      med=0s      max=4.32ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=91.49ms min=4.08ms  med=88.01ms max=357.77ms p(90)=120.13ms p(95)=134.04ms p(99.9)=225.4ms 
       { expected_response:true }...: avg=91.49ms min=4.08ms  med=88.01ms max=357.77ms p(90)=120.13ms p(95)=134.04ms p(99.9)=225.4ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 65438
     http_req_receiving.............: avg=87.15µs min=30.31µs med=73.88µs max=170.25ms p(90)=108.03µs p(95)=120.71µs p(99.9)=847.31µs
     http_req_sending...............: avg=20.86µs min=5.4µs   med=12.14µs max=61.36ms  p(90)=18.76µs  p(95)=20.75µs  p(99.9)=653.38µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=91.38ms min=3.98ms  med=87.91ms max=345.72ms p(90)=120.02ms p(95)=133.94ms p(99.9)=224.44ms
     http_reqs......................: 65438   542.703319/s
     iteration_duration.............: avg=91.85ms min=11.86ms med=88.26ms max=368.35ms p(90)=120.38ms p(95)=134.3ms  p(99.9)=227.54ms
     iterations.....................: 65338   541.873979/s
     success_rate...................: 100.00% ✓ 65338      ✗ 0    
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

     checks.........................: 100.00% ✓ 155685     ✗ 0    
     data_received..................: 4.6 GB  38 MB/s
     data_sent......................: 62 MB   517 kB/s
     http_req_blocked...............: avg=5.16µs   min=1.19µs  med=3.01µs   max=4.03ms   p(90)=4.39µs   p(95)=4.9µs    p(99.9)=151.78µs
     http_req_connecting............: avg=1.92µs   min=0s      med=0s       max=3.99ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=115.16ms min=5.6ms   med=114.98ms max=364.62ms p(90)=139.12ms p(95)=146.26ms p(99.9)=179.66ms
       { expected_response:true }...: avg=115.16ms min=5.6ms   med=114.98ms max=364.62ms p(90)=139.12ms p(95)=146.26ms p(99.9)=179.66ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 51995
     http_req_receiving.............: avg=90.66µs  min=31.87µs med=83.69µs  max=108.18ms p(90)=113.79µs p(95)=125.96µs p(99.9)=760.18µs
     http_req_sending...............: avg=23.34µs  min=5.81µs  med=16.04µs  max=66.92ms  p(90)=20.79µs  p(95)=22.55µs  p(99.9)=601.53µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=115.05ms min=5.49ms  med=114.88ms max=363.94ms p(90)=139.01ms p(95)=146.15ms p(99.9)=179.56ms
     http_reqs......................: 51995   430.81582/s
     iteration_duration.............: avg=115.64ms min=32.91ms med=115.25ms max=390.28ms p(90)=139.38ms p(95)=146.55ms p(99.9)=182.06ms
     iterations.....................: 51895   429.987248/s
     success_rate...................: 100.00% ✓ 51895      ✗ 0    
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

     checks.........................: 100.00% ✓ 92652      ✗ 0    
     data_received..................: 2.7 GB  23 MB/s
     data_sent......................: 37 MB   308 kB/s
     http_req_blocked...............: avg=6.59µs   min=1.17µs  med=3.22µs   max=4.29ms   p(90)=4.59µs   p(95)=5.2µs    p(99.9)=1.37ms  
     http_req_connecting............: avg=3.1µs    min=0s      med=0s       max=4.26ms   p(90)=0s       p(95)=0s       p(99.9)=1.19ms  
     http_req_duration..............: avg=193.47ms min=6.27ms  med=203.61ms max=742.97ms p(90)=256.88ms p(95)=342.22ms p(99.9)=576.1ms 
       { expected_response:true }...: avg=193.47ms min=6.27ms  med=203.61ms max=742.97ms p(90)=256.88ms p(95)=342.22ms p(99.9)=576.1ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 30984
     http_req_receiving.............: avg=101.93µs min=33.24µs med=96.17µs  max=81.69ms  p(90)=127.09µs p(95)=140.26µs p(99.9)=559.85µs
     http_req_sending...............: avg=35.54µs  min=5.65µs  med=17.76µs  max=124.56ms p(90)=22.54µs  p(95)=24.49µs  p(99.9)=566.39µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=193.34ms min=6.13ms  med=203.5ms  max=742.86ms p(90)=256.78ms p(95)=342.03ms p(99.9)=575.97ms
     http_reqs......................: 30984   256.074522/s
     iteration_duration.............: avg=194.37ms min=23.28ms med=204.04ms max=743.2ms  p(90)=257.28ms p(95)=344.16ms p(99.9)=576.35ms
     iterations.....................: 30884   255.248049/s
     success_rate...................: 100.00% ✓ 30884      ✗ 0    
     vus............................: 4       min=4        max=50 
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

     checks.........................: 100.00% ✓ 88518      ✗ 0    
     data_received..................: 2.6 GB  22 MB/s
     data_sent......................: 36 MB   294 kB/s
     http_req_blocked...............: avg=5.52µs   min=1.25µs  med=3µs      max=3.3ms    p(90)=4.21µs   p(95)=4.69µs   p(99.9)=1.03ms  
     http_req_connecting............: avg=2.26µs   min=0s      med=0s       max=2.9ms    p(90)=0s       p(95)=0s       p(99.9)=941.08µs
     http_req_duration..............: avg=202.53ms min=8.46ms  med=202.75ms max=369.58ms p(90)=213.08ms p(95)=219.03ms p(99.9)=285.79ms
       { expected_response:true }...: avg=202.53ms min=8.46ms  med=202.75ms max=369.58ms p(90)=213.08ms p(95)=219.03ms p(99.9)=285.79ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29606
     http_req_receiving.............: avg=94.13µs  min=33.6µs  med=87.85µs  max=70.24ms  p(90)=118.09µs p(95)=129.39µs p(99.9)=540.93µs
     http_req_sending...............: avg=35.48µs  min=6.32µs  med=15.81µs  max=147.35ms p(90)=20.21µs  p(95)=21.8µs   p(99.9)=761.87µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=202.4ms  min=8.28ms  med=202.63ms max=369.27ms p(90)=212.97ms p(95)=218.88ms p(99.9)=285.38ms
     http_reqs......................: 29606   244.571622/s
     iteration_duration.............: avg=203.46ms min=30.81ms med=203.06ms max=400.24ms p(90)=213.34ms p(95)=219.37ms p(99.9)=290.37ms
     iterations.....................: 29506   243.745534/s
     success_rate...................: 100.00% ✓ 29506      ✗ 0    
     vus............................: 28      min=28       max=50 
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

     checks.........................: 100.00% ✓ 902508      ✗ 0     
     data_received..................: 26 GB   219 MB/s
     data_sent......................: 362 MB  3.0 MB/s
     http_req_blocked...............: avg=3.29µs   min=962ns   med=2.44µs  max=12.81ms  p(90)=4.09µs   p(95)=4.94µs   p(99.9)=40.94µs
     http_req_connecting............: avg=334ns    min=0s      med=0s      max=4ms      p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=19.69ms  min=1.83ms  med=19.11ms max=310.95ms p(90)=27.29ms  p(95)=30.53ms  p(99.9)=52.8ms 
       { expected_response:true }...: avg=19.69ms  min=1.83ms  med=19.11ms max=310.95ms p(90)=27.29ms  p(95)=30.53ms  p(99.9)=52.8ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 300936
     http_req_receiving.............: avg=124.36µs min=27.96µs med=54.39µs max=89.37ms  p(90)=110.65µs p(95)=283.79µs p(99.9)=9.72ms 
     http_req_sending...............: avg=55.72µs  min=5.21µs  med=10.23µs max=157.04ms p(90)=19.94µs  p(95)=131.56µs p(99.9)=5.42ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=19.51ms  min=1.74ms  med=18.96ms max=310.44ms p(90)=27.07ms  p(95)=30.2ms   p(99.9)=51.98ms
     http_reqs......................: 300936  2502.826865/s
     iteration_duration.............: avg=19.93ms  min=3.5ms   med=19.32ms max=369.87ms p(90)=27.51ms  p(95)=30.78ms  p(99.9)=53.54ms
     iterations.....................: 300836  2501.995184/s
     success_rate...................: 100.00% ✓ 300836      ✗ 0     
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

     checks.........................: 100.00% ✓ 692868      ✗ 0     
     data_received..................: 20 GB   168 MB/s
     data_sent......................: 278 MB  2.3 MB/s
     http_req_blocked...............: avg=3.21µs   min=962ns   med=2.05µs   max=12.71ms  p(90)=3.31µs  p(95)=3.98µs  p(99.9)=31.63µs 
     http_req_connecting............: avg=639ns    min=0s      med=0s       max=6.1ms    p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=25.73ms  min=1.91ms  med=17.37ms  max=587.83ms p(90)=55.21ms p(95)=72.91ms p(99.9)=187.13ms
       { expected_response:true }...: avg=25.73ms  min=1.91ms  med=17.37ms  max=587.83ms p(90)=55.21ms p(95)=72.91ms p(99.9)=187.13ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 231056
     http_req_receiving.............: avg=692.26µs min=51.62µs med=109.48µs max=164.27ms p(90)=1.11ms  p(95)=1.75ms  p(99.9)=60.33ms 
     http_req_sending...............: avg=40.58µs  min=5.22µs  med=9.21µs   max=122.18ms p(90)=17.07µs p(95)=93.66µs p(99.9)=2.35ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=25ms     min=1.8ms   med=16.8ms   max=587.72ms p(90)=53.91ms p(95)=71.34ms p(99.9)=184.8ms 
     http_reqs......................: 231056  1921.376126/s
     iteration_duration.............: avg=25.96ms  min=2.81ms  med=17.58ms  max=588ms    p(90)=55.44ms p(95)=73.14ms p(99.9)=188.95ms
     iterations.....................: 230956  1920.544563/s
     success_rate...................: 100.00% ✓ 230956      ✗ 0     
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

     checks.........................: 100.00% ✓ 558312      ✗ 0     
     data_received..................: 16 GB   136 MB/s
     data_sent......................: 224 MB  1.9 MB/s
     http_req_blocked...............: avg=3.65µs   min=962ns   med=2.42µs  max=4.19ms   p(90)=4.82µs  p(95)=5.96µs   p(99.9)=44.67µs
     http_req_connecting............: avg=573ns    min=0s      med=0s      max=4.16ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=31.96ms  min=2.42ms  med=31.13ms max=336.78ms p(90)=42.54ms p(95)=47.05ms  p(99.9)=87.58ms
       { expected_response:true }...: avg=31.96ms  min=2.42ms  med=31.13ms max=336.78ms p(90)=42.54ms p(95)=47.05ms  p(99.9)=87.58ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 186204
     http_req_receiving.............: avg=116.81µs min=30.45µs med=62.53µs max=165.89ms p(90)=137.2µs p(95)=294.71µs p(99.9)=6.52ms 
     http_req_sending...............: avg=48.86µs  min=5.21µs  med=10.78µs max=150.56ms p(90)=25.16µs p(95)=138.25µs p(99.9)=3.53ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=31.79ms  min=2.33ms  med=30.99ms max=336.59ms p(90)=42.35ms p(95)=46.81ms  p(99.9)=87.24ms
     http_reqs......................: 186204  1547.732336/s
     iteration_duration.............: avg=32.22ms  min=3.43ms  med=31.37ms max=344.44ms p(90)=42.79ms p(95)=47.3ms   p(99.9)=87.85ms
     iterations.....................: 186104  1546.901134/s
     success_rate...................: 100.00% ✓ 186104      ✗ 0     
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

     checks.........................: 100.00% ✓ 437355      ✗ 0     
     data_received..................: 13 GB   106 MB/s
     data_sent......................: 175 MB  1.5 MB/s
     http_req_blocked...............: avg=3.45µs  min=1.09µs  med=2.82µs  max=2.16ms   p(90)=4.46µs   p(95)=5.15µs   p(99.9)=37.1µs 
     http_req_connecting............: avg=305ns   min=0s      med=0s      max=2.13ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=40.89ms min=2.24ms  med=40.33ms max=309.73ms p(90)=57.27ms  p(95)=62.4ms   p(99.9)=87.06ms
       { expected_response:true }...: avg=40.89ms min=2.24ms  med=40.33ms max=309.73ms p(90)=57.27ms  p(95)=62.4ms   p(99.9)=87.06ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 145885
     http_req_receiving.............: avg=87.55µs min=28.88µs med=68.52µs max=47.71ms  p(90)=107.53µs p(95)=126.99µs p(99.9)=1.75ms 
     http_req_sending...............: avg=29.25µs min=5.28µs  med=12.26µs max=106.78ms p(90)=19.34µs  p(95)=23.44µs  p(99.9)=1.37ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=40.77ms min=2.16ms  med=40.21ms max=309.47ms p(90)=57.14ms  p(95)=62.27ms  p(99.9)=86.97ms
     http_reqs......................: 145885  1212.721774/s
     iteration_duration.............: avg=41.15ms min=4.1ms   med=40.55ms max=331.24ms p(90)=57.49ms  p(95)=62.63ms  p(99.9)=88.04ms
     iterations.....................: 145785  1211.890488/s
     success_rate...................: 100.00% ✓ 145785      ✗ 0     
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

     checks.........................: 100.00% ✓ 189039     ✗ 0    
     data_received..................: 5.5 GB  46 MB/s
     data_sent......................: 76 MB   628 kB/s
     http_req_blocked...............: avg=3.9µs   min=1.18µs med=2.91µs  max=2.64ms   p(90)=4.41µs   p(95)=5µs      p(99.9)=46.39µs 
     http_req_connecting............: avg=762ns   min=0s     med=0s      max=2.61ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=94.84ms min=4.26ms med=92.03ms max=340.87ms p(90)=114.56ms p(95)=126.6ms  p(99.9)=218.69ms
       { expected_response:true }...: avg=94.84ms min=4.26ms med=92.03ms max=340.87ms p(90)=114.56ms p(95)=126.6ms  p(99.9)=218.69ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 63113
     http_req_receiving.............: avg=88.81µs min=31.1µs med=80.58µs max=34.26ms  p(90)=114.96µs p(95)=127.66µs p(99.9)=942.54µs
     http_req_sending...............: avg=29.74µs min=5.67µs med=14.51µs max=143.06ms p(90)=20.89µs  p(95)=23.08µs  p(99.9)=690.65µs
     http_req_tls_handshaking.......: avg=0s      min=0s     med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=94.72ms min=4.13ms med=91.92ms max=340.49ms p(90)=114.44ms p(95)=126.47ms p(99.9)=218.15ms
     http_reqs......................: 63113   523.294829/s
     iteration_duration.............: avg=95.24ms min=9.6ms  med=92.28ms max=350.91ms p(90)=114.82ms p(95)=126.92ms p(99.9)=220.6ms 
     iterations.....................: 63013   522.46569/s
     success_rate...................: 100.00% ✓ 63013      ✗ 0    
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

     checks.........................: 100.00% ✓ 133986     ✗ 0    
     data_received..................: 3.9 GB  32 MB/s
     data_sent......................: 54 MB   445 kB/s
     http_req_blocked...............: avg=5.68µs   min=1.21µs  med=3.17µs   max=4ms      p(90)=4.58µs   p(95)=5.11µs   p(99.9)=382.95µs
     http_req_connecting............: avg=2.34µs   min=0s      med=0s       max=3.96ms   p(90)=0s       p(95)=0s       p(99.9)=359.83µs
     http_req_duration..............: avg=133.84ms min=5.97ms  med=131.34ms max=362ms    p(90)=177.26ms p(95)=190.75ms p(99.9)=244.04ms
       { expected_response:true }...: avg=133.84ms min=5.97ms  med=131.34ms max=362ms    p(90)=177.26ms p(95)=190.75ms p(99.9)=244.04ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 44762
     http_req_receiving.............: avg=93.15µs  min=31.59µs med=87.1µs   max=71.31ms  p(90)=118.04µs p(95)=129.7µs  p(99.9)=680.03µs
     http_req_sending...............: avg=25.42µs  min=5.74µs  med=15.88µs  max=73.84ms  p(90)=20.93µs  p(95)=22.71µs  p(99.9)=613.75µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=133.72ms min=5.85ms  med=131.22ms max=361.35ms p(90)=177.16ms p(95)=190.62ms p(99.9)=243.57ms
     http_reqs......................: 44762   370.633927/s
     iteration_duration.............: avg=134.39ms min=34.64ms med=131.69ms max=368.77ms p(90)=177.58ms p(95)=191.09ms p(99.9)=249.32ms
     iterations.....................: 44662   369.805916/s
     success_rate...................: 100.00% ✓ 44662      ✗ 0    
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

     checks.........................: 100.00% ✓ 90321      ✗ 0    
     data_received..................: 2.6 GB  22 MB/s
     data_sent......................: 36 MB   300 kB/s
     http_req_blocked...............: avg=6.94µs   min=1.27µs  med=3.41µs   max=4.1ms    p(90)=4.79µs   p(95)=5.37µs   p(99.9)=1.68ms  
     http_req_connecting............: avg=3.31µs   min=0s      med=0s       max=4.05ms   p(90)=0s       p(95)=0s       p(99.9)=1.66ms  
     http_req_duration..............: avg=198.47ms min=6.47ms  med=184.15ms max=752.15ms p(90)=245.73ms p(95)=381.69ms p(99.9)=546.35ms
       { expected_response:true }...: avg=198.47ms min=6.47ms  med=184.15ms max=752.15ms p(90)=245.73ms p(95)=381.69ms p(99.9)=546.35ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 30207
     http_req_receiving.............: avg=103.74µs min=34.28µs med=98.37µs  max=38.34ms  p(90)=130.09µs p(95)=143.66µs p(99.9)=697.5µs 
     http_req_sending...............: avg=34.1µs   min=6.09µs  med=18.16µs  max=96.58ms  p(90)=22.84µs  p(95)=24.61µs  p(99.9)=589.32µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=198.33ms min=6.32ms  med=184.02ms max=751.88ms p(90)=245.62ms p(95)=381.34ms p(99.9)=546.25ms
     http_reqs......................: 30207   249.586708/s
     iteration_duration.............: avg=199.41ms min=40.95ms med=184.62ms max=752.4ms  p(90)=246.27ms p(95)=382.49ms p(99.9)=546.68ms
     iterations.....................: 30107   248.760454/s
     success_rate...................: 100.00% ✓ 30107      ✗ 0    
     vus............................: 21      min=21       max=50 
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

     checks.........................: 100.00% ✓ 86217      ✗ 0    
     data_received..................: 2.5 GB  21 MB/s
     data_sent......................: 35 MB   286 kB/s
     http_req_blocked...............: avg=7.4µs    min=1.2µs   med=3.32µs   max=4.29ms   p(90)=4.62µs   p(95)=5.17µs   p(99.9)=1.99ms  
     http_req_connecting............: avg=3.9µs    min=0s      med=0s       max=4.24ms   p(90)=0s       p(95)=0s       p(99.9)=1.96ms  
     http_req_duration..............: avg=207.87ms min=8.61ms  med=210.16ms max=455.75ms p(90)=222.16ms p(95)=230.46ms p(99.9)=297.15ms
       { expected_response:true }...: avg=207.87ms min=8.61ms  med=210.16ms max=455.75ms p(90)=222.16ms p(95)=230.46ms p(99.9)=297.15ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 28839
     http_req_receiving.............: avg=105.78µs min=34.76µs med=94.55µs  max=196.44ms p(90)=126.39µs p(95)=139.26µs p(99.9)=505.94µs
     http_req_sending...............: avg=50.75µs  min=5.81µs  med=17.66µs  max=255.42ms p(90)=22.2µs   p(95)=24.09µs  p(99.9)=493.81µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=207.71ms min=8.46ms  med=210.05ms max=455.35ms p(90)=222.05ms p(95)=230.33ms p(99.9)=296.69ms
     http_reqs......................: 28839   238.190818/s
     iteration_duration.............: avg=208.9ms  min=52.62ms med=210.98ms max=466.89ms p(90)=222.49ms p(95)=230.77ms p(99.9)=316.93ms
     iterations.....................: 28739   237.364885/s
     success_rate...................: 100.00% ✓ 28739      ✗ 0    
     vus............................: 41      min=41       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-176-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

