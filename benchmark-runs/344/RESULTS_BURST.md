## Overview for: `burst-vus`

Each benchmark runs a GraphQL gateway with 4 subgraphs and executes a heavy nested query that exercises federation/composition capabilities.

Results are split by subgraph technology:
- **Rust Subgraphs** = [async-graphql](https://github.com/async-graphql/async-graphql) + axum
- **.NET Subgraphs** = [HotChocolate](https://github.com/ChilliCream/graphql-platform)

**Methodology:** Each gateway executes 10 runs of 120s each. The first run is a full-duration warmup (discarded). The remaining 9 runs are measured. Results are ranked by **median RPS** across the 9 measured runs, with best/worst/CV% reported for transparency.

This scenario is a burst stress test with peaks up to **500 VUs** over **120s**.


### Rust Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.84 | 2,705 | 2,891 | 2,683 | 2.7% |  |
| fusion-nightly-net11 | 16.7.0-p.5 | 2,580 | 2,643 | 2,523 | 1.5% |  |
| fusion | 16.6.4 | 2,493 | 2,654 | 2,465 | 2.9% |  |
| fusion-nightly | 16.7.0-p.5 | 2,452 | 2,547 | 2,435 | 1.6% |  |
| fusion-nightly-fed | 16.7.0-p.5 | 2,316 | 2,401 | 2,293 | 1.6% |  |
| cosmo | 0.334.0 | 1,198 | 1,237 | 1,185 | 1.6% |  |
| hive-gateway-router-runtime | 2.10.8 | 550 | 565 | 548 | 1.0% |  |
| hive-gateway | 2.10.8 | 251 | 258 | 248 | 1.2% |  |
| apollo-gateway | 2.14.3 | 231 | 237 | 228 | 1.1% |  |
| apollo-router | v2.16.1 | — | — | — | — | non-compatible response (4469 across 9/9 runs) |
| feddi | — | — | — | — | — | not run |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (551552 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| fusion-nightly-net11 | 16.7.0-p.5 | 2,442 | 2,541 | 2,434 | 1.6% |  |
| hive-router | v0.0.84 | 2,434 | 2,567 | 2,425 | 2.0% |  |
| fusion-nightly | 16.7.0-p.5 | 2,422 | 2,526 | 2,412 | 1.6% |  |
| fusion | 16.6.4 | 2,414 | 2,512 | 2,382 | 1.7% |  |
| fusion-nightly-fed | 16.7.0-p.5 | 2,243 | 2,328 | 2,238 | 1.4% |  |
| cosmo | 0.334.0 | 1,149 | 1,180 | 1,140 | 1.1% |  |
| hive-gateway-router-runtime | 2.10.8 | 532 | 545 | 530 | 1.0% |  |
| hive-gateway | 2.10.8 | 242 | 251 | 239 | 1.5% |  |
| apollo-gateway | 2.14.3 | 234 | 239 | 232 | 0.8% |  |
| apollo-router | v2.16.1 | — | — | — | — | non-compatible response (31313 across 9/9 runs) |
| feddi | — | — | — | — | — | not run |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (306049 across 9/9 runs) |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.84)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 497385      ✗ 0     
     data_received..................: 15 GB   237 MB/s
     data_sent......................: 200 MB  3.2 MB/s
     http_req_blocked...............: avg=14.73µs  min=831ns   med=2.07µs  max=52.99ms  p(90)=3.52µs   p(95)=4.63µs   p(99.9)=862.92µs
     http_req_connecting............: avg=11.58µs  min=0s      med=0s      max=52.82ms  p(90)=0s       p(95)=0s       p(99.9)=776.63µs
     http_req_duration..............: avg=85.23ms  min=1.35ms  med=80.51ms max=265.25ms p(90)=165.5ms  p(95)=178.05ms p(99.9)=219.98ms
       { expected_response:true }...: avg=85.23ms  min=1.35ms  med=80.51ms max=265.25ms p(90)=165.5ms  p(95)=178.05ms p(99.9)=219.98ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 166795
     http_req_receiving.............: avg=124.48µs min=25.55µs med=49.45µs max=40.53ms  p(90)=119.55µs p(95)=311.43µs p(99.9)=14.81ms 
     http_req_sending...............: avg=58.48µs  min=4.33µs  med=8.97µs  max=164ms    p(90)=17.33µs  p(95)=107.16µs p(99.9)=7.89ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=85.04ms  min=1.3ms   med=80.32ms max=265.2ms  p(90)=165.22ms p(95)=177.77ms p(99.9)=219.48ms
     http_reqs......................: 166795  2705.517263/s
     iteration_duration.............: avg=85.98ms  min=2ms     med=81.33ms max=378.77ms p(90)=165.91ms p(95)=178.4ms  p(99.9)=221.42ms
     iterations.....................: 165795  2689.296649/s
     success_rate...................: 100.00% ✓ 165795      ✗ 0     
     vus............................: 86      min=0         max=492 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (rust subgraphs) (16.7.0-p.5)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 478140      ✗ 0     
     data_received..................: 14 GB   226 MB/s
     data_sent......................: 193 MB  3.1 MB/s
     http_req_blocked...............: avg=20.53µs min=1.06µs  med=2.64µs   max=60.02ms  p(90)=4.23µs   p(95)=5.33µs   p(99.9)=2.5ms   
     http_req_connecting............: avg=17.16µs min=0s      med=0s       max=59.9ms   p(90)=0s       p(95)=0s       p(99.9)=2.45ms  
     http_req_duration..............: avg=88.63ms min=1.86ms  med=84.31ms  max=336.13ms p(90)=169.28ms p(95)=186.52ms p(99.9)=256.04ms
       { expected_response:true }...: avg=88.63ms min=1.86ms  med=84.31ms  max=336.13ms p(90)=169.28ms p(95)=186.52ms p(99.9)=256.04ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 160380
     http_req_receiving.............: avg=1.39ms  min=53.22µs med=179.24µs max=215.89ms p(90)=3.4ms    p(95)=5.12ms   p(99.9)=33.74ms 
     http_req_sending...............: avg=67.78µs min=4.41µs  med=9.44µs   max=108.9ms  p(90)=18.93µs  p(95)=118.6µs  p(99.9)=9.02ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=87.17ms min=1.8ms   med=82.78ms  max=335.66ms p(90)=167.68ms p(95)=184.98ms p(99.9)=255.24ms
     http_reqs......................: 160380  2580.961922/s
     iteration_duration.............: avg=89.45ms min=3.77ms  med=85.2ms   max=346.64ms p(90)=169.76ms p(95)=186.95ms p(99.9)=258.09ms
     iterations.....................: 159380  2564.86913/s
     success_rate...................: 100.00% ✓ 159380      ✗ 0     
     vus............................: 63      min=0         max=496 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (rust subgraphs) (16.6.4)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 463383      ✗ 0     
     data_received..................: 14 GB   219 MB/s
     data_sent......................: 187 MB  3.0 MB/s
     http_req_blocked...............: avg=18.37µs min=902ns   med=2.27µs  max=66.12ms  p(90)=3.71µs   p(95)=4.77µs   p(99.9)=1.55ms  
     http_req_connecting............: avg=15.51µs min=0s      med=0s      max=65.97ms  p(90)=0s       p(95)=0s       p(99.9)=1.46ms  
     http_req_duration..............: avg=91.5ms  min=1.95ms  med=77.45ms max=1.58s    p(90)=172.73ms p(95)=202.35ms p(99.9)=642.87ms
       { expected_response:true }...: avg=91.5ms  min=1.95ms  med=77.45ms max=1.58s    p(90)=172.73ms p(95)=202.35ms p(99.9)=642.87ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 155461
     http_req_receiving.............: avg=1.46ms  min=52.04µs med=97.14µs max=876.23ms p(90)=1.47ms   p(95)=4.14ms   p(99.9)=107.38ms
     http_req_sending...............: avg=68.79µs min=4.5µs   med=9µs     max=292.99ms p(90)=16.13µs  p(95)=102.69µs p(99.9)=9.17ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=89.97ms min=1.86ms  med=76.36ms max=1.58s    p(90)=170.86ms p(95)=199.52ms p(99.9)=606.39ms
     http_reqs......................: 155461  2493.756887/s
     iteration_duration.............: avg=92.34ms min=3.08ms  med=78.42ms max=1.58s    p(90)=173.28ms p(95)=203.16ms p(99.9)=644.22ms
     iterations.....................: 154461  2477.715842/s
     success_rate...................: 100.00% ✓ 154461      ✗ 0     
     vus............................: 75      min=0         max=494 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (rust subgraphs) (16.7.0-p.5)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 455238      ✗ 0     
     data_received..................: 13 GB   215 MB/s
     data_sent......................: 184 MB  2.9 MB/s
     http_req_blocked...............: avg=14.17µs min=872ns   med=1.98µs  max=61.13ms  p(90)=3.27µs   p(95)=4.27µs   p(99.9)=1.56ms  
     http_req_connecting............: avg=11.52µs min=0s      med=0s      max=61.08ms  p(90)=0s       p(95)=0s       p(99.9)=1.43ms  
     http_req_duration..............: avg=93.16ms min=1.95ms  med=79.98ms max=1.29s    p(90)=176.56ms p(95)=201.61ms p(99.9)=570.05ms
       { expected_response:true }...: avg=93.16ms min=1.95ms  med=79.98ms max=1.29s    p(90)=176.56ms p(95)=201.61ms p(99.9)=570.05ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 152746
     http_req_receiving.............: avg=1.63ms  min=51.79µs med=99.94µs max=905.84ms p(90)=1.9ms    p(95)=5.23ms   p(99.9)=98.03ms 
     http_req_sending...............: avg=56.71µs min=4.53µs  med=8.47µs  max=72.38ms  p(90)=14.9µs   p(95)=95.22µs  p(99.9)=8.02ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=91.47ms min=1.86ms  med=78.59ms max=1.29s    p(90)=174.74ms p(95)=198.64ms p(99.9)=550.78ms
     http_reqs......................: 152746  2452.777691/s
     iteration_duration.............: avg=94.01ms min=3.25ms  med=81.01ms max=1.29s    p(90)=177.05ms p(95)=202.26ms p(99.9)=570.58ms
     iterations.....................: 151746  2436.719806/s
     success_rate...................: 100.00% ✓ 151746      ✗ 0     
     vus............................: 69      min=0         max=495 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (rust subgraphs) (16.7.0-p.5)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 428127      ✗ 0     
     data_received..................: 13 GB   204 MB/s
     data_sent......................: 173 MB  2.8 MB/s
     http_req_blocked...............: avg=22.76µs min=1µs     med=2.67µs  max=124.73ms p(90)=4.25µs   p(95)=5.3µs    p(99.9)=4.48ms  
     http_req_connecting............: avg=19.05µs min=0s      med=0s      max=124.54ms p(90)=0s       p(95)=0s       p(99.9)=4.26ms  
     http_req_duration..............: avg=98.99ms min=1.62ms  med=81.65ms max=1.54s    p(90)=191.48ms p(95)=228.37ms p(99.9)=810.96ms
       { expected_response:true }...: avg=98.99ms min=1.62ms  med=81.65ms max=1.54s    p(90)=191.48ms p(95)=228.37ms p(99.9)=810.96ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 143709
     http_req_receiving.............: avg=1.54ms  min=53.51µs med=104.4µs max=889.89ms p(90)=1.74ms   p(95)=4.53ms   p(99.9)=118.91ms
     http_req_sending...............: avg=61.22µs min=4.4µs   med=9.84µs  max=159.82ms p(90)=17.54µs  p(95)=108.21µs p(99.9)=7.87ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=97.39ms min=1.54ms  med=80.57ms max=1.54s    p(90)=189.32ms p(95)=225.08ms p(99.9)=793.5ms 
     http_reqs......................: 143709  2316.964046/s
     iteration_duration.............: avg=99.98ms min=2.73ms  med=82.68ms max=1.54s    p(90)=192.17ms p(95)=229.66ms p(99.9)=813.41ms
     iterations.....................: 142709  2300.841436/s
     success_rate...................: 100.00% ✓ 142709      ✗ 0     
     vus............................: 57      min=0         max=498 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (rust subgraphs) (0.334.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 221700      ✗ 0    
     data_received..................: 6.6 GB  105 MB/s
     data_sent......................: 90 MB   1.4 MB/s
     http_req_blocked...............: avg=6.03µs   min=1.03µs  med=2.54µs   max=32.37ms  p(90)=4.16µs   p(95)=5.07µs   p(99.9)=501.27µs
     http_req_connecting............: avg=2.82µs   min=0s      med=0s       max=32.32ms  p(90)=0s       p(95)=0s       p(99.9)=434.18µs
     http_req_duration..............: avg=190.5ms  min=1.9ms   med=192.26ms max=536.91ms p(90)=351.54ms p(95)=376.77ms p(99.9)=455.32ms
       { expected_response:true }...: avg=190.5ms  min=1.9ms   med=192.26ms max=536.91ms p(90)=351.54ms p(95)=376.77ms p(99.9)=455.32ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 74900
     http_req_receiving.............: avg=79.98µs  min=27.48µs med=62.34µs  max=150.18ms p(90)=100.12µs p(95)=115.67µs p(99.9)=1.49ms  
     http_req_sending...............: avg=30.87µs  min=5.27µs  med=10.76µs  max=269.55ms p(90)=17.32µs  p(95)=21.19µs  p(99.9)=3.03ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=190.39ms min=1.82ms  med=192.11ms max=536.84ms p(90)=351.38ms p(95)=376.65ms p(99.9)=455.25ms
     http_reqs......................: 74900   1198.057419/s
     iteration_duration.............: avg=193.31ms min=5.32ms  med=195.51ms max=537.16ms p(90)=352.39ms p(95)=377.49ms p(99.9)=455.67ms
     iterations.....................: 73900   1182.061993/s
     success_rate...................: 100.00% ✓ 73900       ✗ 0    
     vus............................: 81      min=0         max=493
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (rust subgraphs) (2.10.8)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 103257     ✗ 0    
     data_received..................: 3.1 GB  48 MB/s
     data_sent......................: 43 MB   661 kB/s
     http_req_blocked...............: avg=7.75µs   min=1.03µs  med=2.4µs    max=5.14ms   p(90)=4.09µs   p(95)=5.01µs   p(99.9)=1.39ms
     http_req_connecting............: avg=4.4µs    min=0s      med=0s       max=5.06ms   p(90)=0s       p(95)=0s       p(99.9)=1.37ms
     http_req_duration..............: avg=404.99ms min=3.55ms  med=376.02ms max=1.77s    p(90)=799.88ms p(95)=868.08ms p(99.9)=1.25s 
       { expected_response:true }...: avg=404.99ms min=3.55ms  med=376.02ms max=1.77s    p(90)=799.88ms p(95)=868.08ms p(99.9)=1.25s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 35419
     http_req_receiving.............: avg=80.42µs  min=28.64µs med=64.42µs  max=131.17ms p(90)=103.18µs p(95)=117.21µs p(99.9)=1.07ms
     http_req_sending...............: avg=29.1µs   min=4.87µs  med=11.53µs  max=133.19ms p(90)=19.03µs  p(95)=21.88µs  p(99.9)=2.63ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=404.89ms min=3.5ms   med=375.93ms max=1.77s    p(90)=799.76ms p(95)=868.02ms p(99.9)=1.25s 
     http_reqs......................: 35419   550.641144/s
     iteration_duration.............: avg=416.97ms min=20.3ms  med=391.63ms max=1.77s    p(90)=803.7ms  p(95)=870.47ms p(99.9)=1.26s 
     iterations.....................: 34419   535.094653/s
     success_rate...................: 100.00% ✓ 34419      ✗ 0    
     vus............................: 69      min=0        max=495
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (rust subgraphs) (2.10.8)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 47958      ✗ 0    
     data_received..................: 1.5 GB  22 MB/s
     data_sent......................: 21 MB   303 kB/s
     http_req_blocked...............: avg=10.66µs  min=1.14µs  med=3.26µs   max=3.15ms  p(90)=4.99µs   p(95)=6.18µs   p(99.9)=1.29ms
     http_req_connecting............: avg=5.78µs   min=0s      med=0s       max=2.94ms  p(90)=0s       p(95)=0s       p(99.9)=1.13ms
     http_req_duration..............: avg=836.8ms  min=5.59ms  med=754.6ms  max=17.13s  p(90)=1.46s    p(95)=1.66s    p(99.9)=15.74s
       { expected_response:true }...: avg=836.8ms  min=5.59ms  med=754.6ms  max=17.13s  p(90)=1.46s    p(95)=1.66s    p(99.9)=15.74s
     http_req_failed................: 0.00%   ✓ 0          ✗ 16986
     http_req_receiving.............: avg=102.97µs min=33.06µs med=89.79µs  max=66.05ms p(90)=126.71µs p(95)=142.21µs p(99.9)=1.64ms
     http_req_sending...............: avg=30.11µs  min=5.35µs  med=17.13µs  max=40.58ms p(90)=22.51µs  p(95)=26.52µs  p(99.9)=2.01ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=836.67ms min=5.51ms  med=754.47ms max=17.13s  p(90)=1.46s    p(95)=1.66s    p(99.9)=15.74s
     http_reqs......................: 16986   251.690036/s
     iteration_duration.............: avg=889.13ms min=48.2ms  med=817.93ms max=17.13s  p(90)=1.49s    p(95)=1.67s    p(99.9)=15.91s
     iterations.....................: 15986   236.872537/s
     success_rate...................: 100.00% ✓ 15986      ✗ 0    
     vus............................: 79      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-gateway (rust subgraphs) (2.14.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 47751      ✗ 0    
     data_received..................: 1.5 GB  20 MB/s
     data_sent......................: 21 MB   283 kB/s
     http_req_blocked...............: avg=13.8µs   min=1.05µs med=3.1µs    max=11.04ms  p(90)=4.65µs   p(95)=5.87µs   p(99.9)=2.2ms   
     http_req_connecting............: avg=9.22µs   min=0s     med=0s       max=10.98ms  p(90)=0s       p(95)=0s       p(99.9)=2.18ms  
     http_req_duration..............: avg=391.31ms min=7.48ms med=459.5ms  max=1.09s    p(90)=642.61ms p(95)=683.93ms p(99.9)=965.99ms
       { expected_response:true }...: avg=391.31ms min=7.48ms med=459.5ms  max=1.09s    p(90)=642.61ms p(95)=683.93ms p(99.9)=965.99ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 16917
     http_req_receiving.............: avg=96.68µs  min=34.2µs med=82.49µs  max=95.46ms  p(90)=121.54µs p(95)=136.8µs  p(99.9)=1.19ms  
     http_req_sending...............: avg=34.26µs  min=5.34µs med=15.81µs  max=109.85ms p(90)=20.71µs  p(95)=24.93µs  p(99.9)=1.77ms  
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=391.18ms min=7.39ms med=459.41ms max=1.09s    p(90)=642.27ms p(95)=683.82ms p(99.9)=965.88ms
     http_reqs......................: 16917   231.150305/s
     iteration_duration.............: avg=415.9ms  min=8.75ms med=480.69ms max=1.09s    p(90)=647.58ms p(95)=688.66ms p(99.9)=973.96ms
     iterations.....................: 15917   217.486517/s
     success_rate...................: 100.00% ✓ 15917      ✗ 0    
     vus............................: 59      min=0        max=496
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (.net subgraphs) (16.7.0-p.5)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 450168      ✗ 0     
     data_received..................: 13 GB   214 MB/s
     data_sent......................: 181 MB  2.9 MB/s
     http_req_blocked...............: avg=16.9µs  min=812ns   med=2.29µs   max=48.36ms  p(90)=4.23µs   p(95)=5.43µs   p(99.9)=1.21ms  
     http_req_connecting............: avg=13.62µs min=0s      med=0s       max=48.28ms  p(90)=0s       p(95)=0s       p(99.9)=1.13ms  
     http_req_duration..............: avg=94.14ms min=1.4ms   med=89.03ms  max=366.39ms p(90)=180.08ms p(95)=196.62ms p(99.9)=270.44ms
       { expected_response:true }...: avg=94.14ms min=1.4ms   med=89.03ms  max=366.39ms p(90)=180.08ms p(95)=196.62ms p(99.9)=270.44ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 151056
     http_req_receiving.............: avg=1.39ms  min=51.85µs med=150.87µs max=327.01ms p(90)=3.4ms    p(95)=5.16ms   p(99.9)=35.65ms 
     http_req_sending...............: avg=65.51µs min=4.58µs  med=9.46µs   max=157.12ms p(90)=22.47µs  p(95)=111.8µs  p(99.9)=8.58ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=92.68ms min=1.33ms  med=87.5ms   max=366.29ms p(90)=178.52ms p(95)=195.1ms  p(99.9)=268.74ms
     http_reqs......................: 151056  2442.551027/s
     iteration_duration.............: avg=95.02ms min=3.71ms  med=90.01ms  max=366.56ms p(90)=180.54ms p(95)=197.06ms p(99.9)=271.72ms
     iterations.....................: 150056  2426.381189/s
     success_rate...................: 100.00% ✓ 150056      ✗ 0     
     vus............................: 95      min=0         max=500 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.84)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 448644      ✗ 0     
     data_received..................: 13 GB   213 MB/s
     data_sent......................: 181 MB  2.9 MB/s
     http_req_blocked...............: avg=19.99µs  min=921ns  med=3.01µs  max=58.5ms   p(90)=4.97µs   p(95)=6.19µs   p(99.9)=1.81ms  
     http_req_connecting............: avg=16.17µs  min=0s     med=0s      max=58.26ms  p(90)=0s       p(95)=0s       p(99.9)=1.76ms  
     http_req_duration..............: avg=94.46ms  min=1.51ms med=88.79ms max=290.55ms p(90)=183.63ms p(95)=200.55ms p(99.9)=250.04ms
       { expected_response:true }...: avg=94.46ms  min=1.51ms med=88.79ms max=290.55ms p(90)=183.63ms p(95)=200.55ms p(99.9)=250.04ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 150548
     http_req_receiving.............: avg=145.78µs min=27.2µs med=58.69µs max=101.4ms  p(90)=156.8µs  p(95)=378.63µs p(99.9)=13.76ms 
     http_req_sending...............: avg=75.33µs  min=4.93µs med=11.42µs max=200.98ms p(90)=22.17µs  p(95)=131.46µs p(99.9)=10.24ms 
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=94.24ms  min=1.45ms med=88.56ms max=287.43ms p(90)=183.39ms p(95)=200.27ms p(99.9)=249.27ms
     http_reqs......................: 150548  2434.974709/s
     iteration_duration.............: avg=95.35ms  min=3.66ms med=89.89ms max=291.6ms  p(90)=184.13ms p(95)=201.04ms p(99.9)=250.94ms
     iterations.....................: 149548  2418.800634/s
     success_rate...................: 100.00% ✓ 149548      ✗ 0     
     vus............................: 94      min=0         max=500 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.7.0-p.5)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 446979      ✗ 0     
     data_received..................: 13 GB   212 MB/s
     data_sent......................: 180 MB  2.9 MB/s
     http_req_blocked...............: avg=17.24µs min=851ns   med=2.21µs   max=81.29ms  p(90)=3.95µs   p(95)=5.12µs   p(99.9)=1.13ms  
     http_req_connecting............: avg=14.21µs min=0s      med=0s       max=81.13ms  p(90)=0s       p(95)=0s       p(99.9)=1.03ms  
     http_req_duration..............: avg=94.81ms min=1.41ms  med=82.57ms  max=1.2s     p(90)=180.57ms p(95)=211.13ms p(99.9)=662.54ms
       { expected_response:true }...: avg=94.81ms min=1.41ms  med=82.57ms  max=1.2s     p(90)=180.57ms p(95)=211.13ms p(99.9)=662.54ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 149993
     http_req_receiving.............: avg=1.49ms  min=50.53µs med=103.58µs max=640.93ms p(90)=1.68ms   p(95)=4.75ms   p(99.9)=95.32ms 
     http_req_sending...............: avg=62.06µs min=4.48µs  med=9.22µs   max=92.1ms   p(90)=19.54µs  p(95)=103.53µs p(99.9)=8.43ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=93.25ms min=1.34ms  med=81.5ms   max=1.2s     p(90)=178.07ms p(95)=207.41ms p(99.9)=659.42ms
     http_reqs......................: 149993  2422.562362/s
     iteration_duration.............: avg=95.72ms min=2.93ms  med=83.61ms  max=1.2s     p(90)=181.24ms p(95)=211.93ms p(99.9)=663.64ms
     iterations.....................: 148993  2406.411192/s
     success_rate...................: 100.00% ✓ 148993      ✗ 0     
     vus............................: 53      min=0         max=499 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (.net subgraphs) (16.6.4)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 445587      ✗ 0     
     data_received..................: 13 GB   212 MB/s
     data_sent......................: 180 MB  2.9 MB/s
     http_req_blocked...............: avg=23.58µs min=982ns   med=2.98µs   max=141.06ms p(90)=4.78µs   p(95)=5.99µs   p(99.9)=2.36ms  
     http_req_connecting............: avg=19.89µs min=0s      med=0s       max=140.82ms p(90)=0s       p(95)=0s       p(99.9)=2.31ms  
     http_req_duration..............: avg=95.08ms min=1.59ms  med=81.71ms  max=1.66s    p(90)=181.35ms p(95)=214.84ms p(99.9)=673.46ms
       { expected_response:true }...: avg=95.08ms min=1.59ms  med=81.71ms  max=1.66s    p(90)=181.35ms p(95)=214.84ms p(99.9)=673.46ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 149529
     http_req_receiving.............: avg=1.65ms  min=54.04µs med=107.35µs max=720.42ms p(90)=1.77ms   p(95)=4.81ms   p(99.9)=117.62ms
     http_req_sending...............: avg=78.53µs min=4.98µs  med=10.86µs  max=121ms    p(90)=21.46µs  p(95)=121.05µs p(99.9)=10.43ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=93.34ms min=1.5ms   med=80.47ms  max=1.66s    p(90)=178.76ms p(95)=209.9ms  p(99.9)=657.88ms
     http_reqs......................: 149529  2414.362882/s
     iteration_duration.............: avg=96.03ms min=2.98ms  med=82.71ms  max=1.66s    p(90)=182.05ms p(95)=215.83ms p(99.9)=674.07ms
     iterations.....................: 148529  2398.21643/s
     success_rate...................: 100.00% ✓ 148529      ✗ 0     
     vus............................: 54      min=0         max=499 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (.net subgraphs) (16.7.0-p.5)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 415521      ✗ 0     
     data_received..................: 12 GB   197 MB/s
     data_sent......................: 168 MB  2.7 MB/s
     http_req_blocked...............: avg=21.01µs  min=992ns   med=3.02µs   max=60.23ms  p(90)=4.98µs   p(95)=6.24µs   p(99.9)=2.56ms  
     http_req_connecting............: avg=17.1µs   min=0s      med=0s       max=60.17ms  p(90)=0s       p(95)=0s       p(99.9)=2.44ms  
     http_req_duration..............: avg=102.01ms min=1.79ms  med=90.89ms  max=1.15s    p(90)=195.68ms p(95)=222.81ms p(99.9)=605.11ms
       { expected_response:true }...: avg=102.01ms min=1.79ms  med=90.89ms  max=1.15s    p(90)=195.68ms p(95)=222.81ms p(99.9)=605.11ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 139507
     http_req_receiving.............: avg=1.14ms   min=54.32µs med=110.42µs max=349.31ms p(90)=1.47ms   p(95)=3.65ms   p(99.9)=77.68ms 
     http_req_sending...............: avg=72.8µs   min=5.02µs  med=11.75µs  max=128.59ms p(90)=23.07µs  p(95)=129.88µs p(99.9)=9.44ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=100.79ms min=1.68ms  med=89.89ms  max=1.15s    p(90)=193.79ms p(95)=220.25ms p(99.9)=603.26ms
     http_reqs......................: 139507  2243.710847/s
     iteration_duration.............: avg=103.02ms min=2.91ms  med=91.98ms  max=1.15s    p(90)=196.25ms p(95)=223.47ms p(99.9)=606.43ms
     iterations.....................: 138507  2227.627705/s
     success_rate...................: 100.00% ✓ 138507      ✗ 0     
     vus............................: 66      min=0         max=496 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (.net subgraphs) (0.334.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 212817      ✗ 0    
     data_received..................: 6.3 GB  101 MB/s
     data_sent......................: 86 MB   1.4 MB/s
     http_req_blocked...............: avg=6.28µs   min=1.1µs   med=3.07µs   max=4.34ms   p(90)=4.91µs   p(95)=5.88µs   p(99.9)=626.93µs
     http_req_connecting............: avg=2.51µs   min=0s      med=0s       max=4.1ms    p(90)=0s       p(95)=0s       p(99.9)=537.61µs
     http_req_duration..............: avg=198.37ms min=2.04ms  med=198.64ms max=532.95ms p(90)=369.35ms p(95)=395.74ms p(99.9)=470.84ms
       { expected_response:true }...: avg=198.37ms min=2.04ms  med=198.64ms max=532.95ms p(90)=369.35ms p(95)=395.74ms p(99.9)=470.84ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 71939
     http_req_receiving.............: avg=83.37µs  min=29.23µs med=70.28µs  max=44.54ms  p(90)=112.1µs  p(95)=127.61µs p(99.9)=1.33ms  
     http_req_sending...............: avg=36.07µs  min=5.48µs  med=12.85µs  max=201.22ms p(90)=20.51µs  p(95)=24.29µs  p(99.9)=3.23ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=198.25ms min=1.94ms  med=198.54ms max=532.85ms p(90)=369.25ms p(95)=395.62ms p(99.9)=470.77ms
     http_reqs......................: 71939   1149.270147/s
     iteration_duration.............: avg=201.41ms min=5.03ms  med=202.07ms max=533.11ms p(90)=370.17ms p(95)=396.45ms p(99.9)=472.04ms
     iterations.....................: 70939   1133.294526/s
     success_rate...................: 100.00% ✓ 70939       ✗ 0    
     vus............................: 84      min=0         max=498
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (.net subgraphs) (2.10.8)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 100443     ✗ 0    
     data_received..................: 3.0 GB  47 MB/s
     data_sent......................: 41 MB   640 kB/s
     http_req_blocked...............: avg=9.78µs   min=1.15µs  med=3.32µs   max=12.78ms p(90)=5.1µs    p(95)=6.18µs   p(99.9)=1.62ms
     http_req_connecting............: avg=5.24µs   min=0s      med=0s       max=12.6ms  p(90)=0s       p(95)=0s       p(99.9)=1.54ms
     http_req_duration..............: avg=415.88ms min=3.79ms  med=382.31ms max=1.77s   p(90)=836.49ms p(95)=908ms    p(99.9)=1.37s 
       { expected_response:true }...: avg=415.88ms min=3.79ms  med=382.31ms max=1.77s   p(90)=836.49ms p(95)=908ms    p(99.9)=1.37s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 34481
     http_req_receiving.............: avg=88.12µs  min=29.73µs med=75.91µs  max=53.94ms p(90)=115.45µs p(95)=130.85µs p(99.9)=1.08ms
     http_req_sending...............: avg=29.48µs  min=5.74µs  med=15.67µs  max=121.9ms p(90)=22.97µs  p(95)=26.17µs  p(99.9)=2.48ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=415.77ms min=3.72ms  med=382.2ms  max=1.77s   p(90)=836.43ms p(95)=907.89ms p(99.9)=1.37s 
     http_reqs......................: 34481   532.841995/s
     iteration_duration.............: avg=428.54ms min=9.35ms  med=398.52ms max=1.78s   p(90)=841ms    p(95)=910.5ms  p(99.9)=1.37s 
     iterations.....................: 33481   517.388789/s
     success_rate...................: 100.00% ✓ 33481      ✗ 0    
     vus............................: 90      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (.net subgraphs) (2.10.8)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 46314      ✗ 0    
     data_received..................: 1.4 GB  21 MB/s
     data_sent......................: 20 MB   291 kB/s
     http_req_blocked...............: avg=13.26µs  min=1.13µs  med=3.3µs    max=3.19ms  p(90)=5.11µs   p(95)=6.78µs   p(99.9)=2ms   
     http_req_connecting............: avg=8.3µs    min=0s      med=0s       max=3.15ms  p(90)=0s       p(95)=0s       p(99.9)=1.98ms
     http_req_duration..............: avg=885.83ms min=5.77ms  med=781.73ms max=5.59s   p(90)=1.77s    p(95)=2.01s    p(99.9)=3.95s 
       { expected_response:true }...: avg=885.83ms min=5.77ms  med=781.73ms max=5.59s   p(90)=1.77s    p(95)=2.01s    p(99.9)=3.95s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 16438
     http_req_receiving.............: avg=101.47µs min=33.41µs med=91.68µs  max=58.61ms p(90)=129.17µs p(95)=143.64µs p(99.9)=1ms   
     http_req_sending...............: avg=27.77µs  min=5.48µs  med=17.93µs  max=43.1ms  p(90)=23.34µs  p(95)=28.08µs  p(99.9)=2.03ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=885.7ms  min=5.68ms  med=781.62ms max=5.59s   p(90)=1.77s    p(95)=2.01s    p(99.9)=3.95s 
     http_reqs......................: 16438   242.019003/s
     iteration_duration.............: avg=943.22ms min=64.45ms med=870.78ms max=5.59s   p(90)=1.78s    p(95)=2.02s    p(99.9)=3.99s 
     iterations.....................: 15438   227.295861/s
     success_rate...................: 100.00% ✓ 15438      ✗ 0    
     vus............................: 10      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-gateway (.net subgraphs) (2.14.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 45432      ✗ 0    
     data_received..................: 1.4 GB  21 MB/s
     data_sent......................: 19 MB   282 kB/s
     http_req_blocked...............: avg=15.58µs  min=1.29µs  med=3.56µs   max=13.41ms p(90)=5.45µs   p(95)=7.17µs   p(99.9)=2.24ms
     http_req_connecting............: avg=9.5µs    min=0s      med=0s       max=13.33ms p(90)=0s       p(95)=0s       p(99.9)=2.11ms
     http_req_duration..............: avg=899.64ms min=7.8ms   med=811.2ms  max=3.59s   p(90)=1.86s    p(95)=1.96s    p(99.9)=2.82s 
       { expected_response:true }...: avg=899.64ms min=7.8ms   med=811.2ms  max=3.59s   p(90)=1.86s    p(95)=1.96s    p(99.9)=2.82s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 16144
     http_req_receiving.............: avg=100.54µs min=36.3µs  med=91.64µs  max=6ms     p(90)=132.68µs p(95)=149.54µs p(99.9)=1.3ms 
     http_req_sending...............: avg=32.66µs  min=5.94µs  med=18.29µs  max=59.56ms p(90)=24.39µs  p(95)=29.75µs  p(99.9)=2.22ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=899.5ms  min=7.7ms   med=811.07ms max=3.59s   p(90)=1.86s    p(95)=1.96s    p(99.9)=2.82s 
     http_reqs......................: 16144   234.644084/s
     iteration_duration.............: avg=959.01ms min=22.94ms med=893.29ms max=3.59s   p(90)=1.88s    p(95)=1.96s    p(99.9)=2.84s 
     iterations.....................: 15144   220.109638/s
     success_rate...................: 100.00% ✓ 15144      ✗ 0    
     vus............................: 98      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

