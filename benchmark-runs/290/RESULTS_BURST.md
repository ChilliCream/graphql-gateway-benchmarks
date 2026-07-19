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
| hive-router | v0.0.83 | 2,795 | 2,988 | 2,730 | 2.7% |  |
| fusion-nightly-net11 | 16.5.1-p.2 | 2,574 | 2,666 | 2,564 | 1.3% |  |
| fusion-nightly | 16.5.1-p.2 | 2,490 | 2,550 | 2,466 | 1.1% |  |
| fusion | 16.5.0 | 2,461 | 2,541 | 2,439 | 1.5% |  |
| cosmo | 0.331.1 | 1,199 | 1,236 | 1,188 | 1.4% |  |
| hive-gateway-router-runtime | 2.10.4 | 572 | 583 | 571 | 0.7% |  |
| hive-gateway | 2.10.4 | 255 | 260 | 253 | 1.1% |  |
| apollo-gateway | 2.14.2 | 230 | 237 | 228 | 1.2% |  |
| apollo-router | v2.16.0 | — | — | — | — | non-compatible response (10362 across 9/9 runs) |
| feddi | — | — | — | — | — | not run |
| fusion-nightly-fed | — | — | — | — | — | not run |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (535192 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| fusion-nightly-net11 | 16.5.1-p.2 | 2,398 | 2,488 | 2,385 | 1.5% |  |
| fusion-nightly | 16.5.1-p.2 | 2,342 | 2,422 | 2,333 | 1.3% |  |
| fusion | 16.5.0 | 2,336 | 2,422 | 2,330 | 1.3% |  |
| hive-router | v0.0.83 | 2,310 | 2,468 | 2,269 | 2.6% |  |
| fusion-nightly-fed | 16.5.1-p.2 | 2,151 | 2,238 | 2,142 | 1.5% |  |
| cosmo | 0.331.1 | 1,129 | 1,178 | 1,120 | 1.9% |  |
| hive-gateway-router-runtime | 2.10.4 | 523 | 538 | 517 | 1.3% |  |
| hive-gateway | 2.10.4 | 245 | 249 | 242 | 0.8% |  |
| apollo-gateway | 2.14.2 | 232 | 236 | 231 | 0.7% |  |
| apollo-router | v2.16.0 | — | — | — | — | non-compatible response (34090 across 9/9 runs) |
| feddi | — | — | — | — | — | not run |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (281908 across 9/9 runs) |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.83)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 514476      ✗ 0     
     data_received..................: 15 GB   245 MB/s
     data_sent......................: 207 MB  3.4 MB/s
     http_req_blocked...............: avg=13.26µs  min=831ns   med=2µs     max=54.56ms  p(90)=3.33µs   p(95)=4.35µs   p(99.9)=738.33µs
     http_req_connecting............: avg=10.51µs  min=0s      med=0s      max=54.49ms  p(90)=0s       p(95)=0s       p(99.9)=689.59µs
     http_req_duration..............: avg=82.41ms  min=1.37ms  med=77.74ms max=284.17ms p(90)=158.23ms p(95)=172.4ms  p(99.9)=224.97ms
       { expected_response:true }...: avg=82.41ms  min=1.37ms  med=77.74ms max=284.17ms p(90)=158.23ms p(95)=172.4ms  p(99.9)=224.97ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 172492
     http_req_receiving.............: avg=122.19µs min=25.26µs med=48.18µs max=50.07ms  p(90)=117.49µs p(95)=306.29µs p(99.9)=14.51ms 
     http_req_sending...............: avg=57.46µs  min=4.43µs  med=8.64µs  max=210.88ms p(90)=15.97µs  p(95)=105.65µs p(99.9)=7.69ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=82.23ms  min=1.3ms   med=77.57ms max=283.37ms p(90)=157.99ms p(95)=172.16ms p(99.9)=223.86ms
     http_reqs......................: 172492  2795.266097/s
     iteration_duration.............: avg=83.12ms  min=2.18ms  med=78.49ms max=340.77ms p(90)=158.64ms p(95)=172.84ms p(99.9)=225.63ms
     iterations.....................: 171492  2779.060905/s
     success_rate...................: 100.00% ✓ 171492      ✗ 0     
     vus............................: 88      min=0         max=497 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (rust subgraphs) (16.5.1-p.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 477876      ✗ 0     
     data_received..................: 14 GB   226 MB/s
     data_sent......................: 193 MB  3.1 MB/s
     http_req_blocked...............: avg=14.06µs  min=831ns   med=2.05µs   max=43.45ms  p(90)=3.45µs   p(95)=4.5µs    p(99.9)=1.26ms  
     http_req_connecting............: avg=10.94µs  min=0s      med=0s       max=42.86ms  p(90)=0s       p(95)=0s       p(99.9)=1.18ms  
     http_req_duration..............: avg=88.71ms  min=1.83ms  med=84.63ms  max=319.4ms  p(90)=168.95ms p(95)=183.7ms  p(99.9)=242.42ms
       { expected_response:true }...: avg=88.71ms  min=1.83ms  med=84.63ms  max=319.4ms  p(90)=168.95ms p(95)=183.7ms  p(99.9)=242.42ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 160292
     http_req_receiving.............: avg=723.69µs min=52.13µs med=118.43µs max=66.85ms  p(90)=1.49ms   p(95)=2.38ms   p(99.9)=25.17ms 
     http_req_sending...............: avg=61.13µs  min=4.72µs  med=8.69µs   max=198.42ms p(90)=17.21µs  p(95)=105.93µs p(99.9)=8.27ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=87.92ms  min=1.76ms  med=83.89ms  max=318.36ms p(90)=168.14ms p(95)=182.77ms p(99.9)=241.08ms
     http_reqs......................: 160292  2574.049697/s
     iteration_duration.............: avg=89.5ms   min=3.82ms  med=85.51ms  max=329.12ms p(90)=169.39ms p(95)=184.1ms  p(99.9)=243.64ms
     iterations.....................: 159292  2557.991193/s
     success_rate...................: 100.00% ✓ 159292      ✗ 0     
     vus............................: 69      min=0         max=495 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (rust subgraphs) (16.5.1-p.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 462075      ✗ 0     
     data_received..................: 14 GB   218 MB/s
     data_sent......................: 186 MB  3.0 MB/s
     http_req_blocked...............: avg=16.09µs min=862ns   med=2.01µs  max=59.61ms  p(90)=3.43µs   p(95)=4.48µs   p(99.9)=1.58ms  
     http_req_connecting............: avg=13.35µs min=0s      med=0s      max=59.27ms  p(90)=0s       p(95)=0s       p(99.9)=1.5ms   
     http_req_duration..............: avg=91.77ms min=1.93ms  med=80.5ms  max=1.13s    p(90)=177ms    p(95)=201.67ms p(99.9)=686.48ms
       { expected_response:true }...: avg=91.77ms min=1.93ms  med=80.5ms  max=1.13s    p(90)=177ms    p(95)=201.67ms p(99.9)=686.48ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 155025
     http_req_receiving.............: avg=1.2ms   min=51.71µs med=93.62µs max=698.97ms p(90)=1.5ms    p(95)=4.07ms   p(99.9)=80.04ms 
     http_req_sending...............: avg=61.43µs min=4.55µs  med=8.71µs  max=125.74ms p(90)=16.87µs  p(95)=102.55µs p(99.9)=8.39ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=90.5ms  min=1.83ms  med=79.39ms max=1.13s    p(90)=175.54ms p(95)=199.28ms p(99.9)=680.48ms
     http_reqs......................: 155025  2490.446688/s
     iteration_duration.............: avg=92.61ms min=3.36ms  med=81.47ms max=1.13s    p(90)=177.56ms p(95)=202.27ms p(99.9)=688.76ms
     iterations.....................: 154025  2474.381882/s
     success_rate...................: 100.00% ✓ 154025      ✗ 0     
     vus............................: 68      min=0         max=495 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (rust subgraphs) (16.5.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 457548      ✗ 0     
     data_received..................: 14 GB   216 MB/s
     data_sent......................: 184 MB  3.0 MB/s
     http_req_blocked...............: avg=14.93µs min=862ns   med=2.1µs   max=51.77ms  p(90)=3.54µs   p(95)=4.58µs   p(99.9)=1.46ms  
     http_req_connecting............: avg=12.06µs min=0s      med=0s      max=51.6ms   p(90)=0s       p(95)=0s       p(99.9)=1.4ms   
     http_req_duration..............: avg=92.69ms min=1.97ms  med=81.71ms max=1.89s    p(90)=177.6ms  p(95)=203.44ms p(99.9)=660.69ms
       { expected_response:true }...: avg=92.69ms min=1.97ms  med=81.71ms max=1.89s    p(90)=177.6ms  p(95)=203.44ms p(99.9)=660.69ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 153516
     http_req_receiving.............: avg=1.31ms  min=51.18µs med=95.22µs max=621.66ms p(90)=1.55ms   p(95)=4.2ms    p(99.9)=76.69ms 
     http_req_sending...............: avg=62.09µs min=4.42µs  med=8.87µs  max=199.34ms p(90)=17.59µs  p(95)=103.8µs  p(99.9)=8.01ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=91.31ms min=1.88ms  med=80.72ms max=1.89s    p(90)=175.75ms p(95)=200.22ms p(99.9)=635.88ms
     http_reqs......................: 153516  2461.064663/s
     iteration_duration.............: avg=93.54ms min=3.12ms  med=82.62ms max=1.89s    p(90)=178.14ms p(95)=204.04ms p(99.9)=660.97ms
     iterations.....................: 152516  2445.03334/s
     success_rate...................: 100.00% ✓ 152516      ✗ 0     
     vus............................: 74      min=0         max=494 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (rust subgraphs) (0.331.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 221862      ✗ 0    
     data_received..................: 6.6 GB  105 MB/s
     data_sent......................: 90 MB   1.4 MB/s
     http_req_blocked...............: avg=5.49µs   min=1.03µs  med=2.51µs   max=10.18ms  p(90)=4.07µs   p(95)=4.91µs   p(99.9)=414.32µs
     http_req_connecting............: avg=2.34µs   min=0s      med=0s       max=10.12ms  p(90)=0s       p(95)=0s       p(99.9)=376.29µs
     http_req_duration..............: avg=190.35ms min=1.88ms  med=191.16ms max=486.75ms p(90)=353.52ms p(95)=378.34ms p(99.9)=450.11ms
       { expected_response:true }...: avg=190.35ms min=1.88ms  med=191.16ms max=486.75ms p(90)=353.52ms p(95)=378.34ms p(99.9)=450.11ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 74954
     http_req_receiving.............: avg=70.19µs  min=25.93µs med=57.45µs  max=131.2ms  p(90)=91.06µs  p(95)=104.5µs  p(99.9)=884µs   
     http_req_sending...............: avg=29.35µs  min=4.96µs  med=10.63µs  max=123.76ms p(90)=16.06µs  p(95)=19.34µs  p(99.9)=3.08ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=190.25ms min=1.83ms  med=191.07ms max=486.66ms p(90)=353.43ms p(95)=378.27ms p(99.9)=450.04ms
     http_reqs......................: 74954   1199.972293/s
     iteration_duration.............: avg=193.14ms min=3.8ms   med=194.26ms max=486.93ms p(90)=354.28ms p(95)=379.03ms p(99.9)=450.54ms
     iterations.....................: 73954   1183.962843/s
     success_rate...................: 100.00% ✓ 73954       ✗ 0    
     vus............................: 78      min=0         max=493
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (rust subgraphs) (2.10.4)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 107232     ✗ 0    
     data_received..................: 3.2 GB  50 MB/s
     data_sent......................: 44 MB   687 kB/s
     http_req_blocked...............: avg=22.94µs  min=1.1µs   med=3.15µs   max=55.32ms p(90)=4.97µs   p(95)=5.99µs   p(99.9)=2.38ms
     http_req_connecting............: avg=17.73µs  min=0s      med=0s       max=50.47ms p(90)=0s       p(95)=0s       p(99.9)=1.71ms
     http_req_duration..............: avg=390.09ms min=3.56ms  med=361.67ms max=1.73s   p(90)=765.56ms p(95)=837.7ms  p(99.9)=1.22s 
       { expected_response:true }...: avg=390.09ms min=3.56ms  med=361.67ms max=1.73s   p(90)=765.56ms p(95)=837.7ms  p(99.9)=1.22s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 36744
     http_req_receiving.............: avg=81.97µs  min=28.88µs med=70.8µs   max=7.43ms  p(90)=110.77µs p(95)=125.93µs p(99.9)=1.18ms
     http_req_sending...............: avg=40.8µs   min=4.93µs  med=14.1µs   max=85.69ms p(90)=21.74µs  p(95)=24.76µs  p(99.9)=4.76ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=389.97ms min=3.46ms  med=361.59ms max=1.73s   p(90)=765.46ms p(95)=837.62ms p(99.9)=1.22s 
     http_reqs......................: 36744   572.055488/s
     iteration_duration.............: avg=401.24ms min=23.94ms med=375.02ms max=1.74s   p(90)=769.6ms  p(95)=840.3ms  p(99.9)=1.22s 
     iterations.....................: 35744   556.48681/s
     success_rate...................: 100.00% ✓ 35744      ✗ 0    
     vus............................: 65      min=0        max=496
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (rust subgraphs) (2.10.4)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 48468      ✗ 0    
     data_received..................: 1.5 GB  23 MB/s
     data_sent......................: 21 MB   308 kB/s
     http_req_blocked...............: avg=13.14µs  min=1.24µs  med=3.78µs   max=4.47ms  p(90)=5.61µs   p(95)=7.19µs  p(99.9)=1.96ms
     http_req_connecting............: avg=7.47µs   min=0s      med=0s       max=4.34ms  p(90)=0s       p(95)=0s      p(99.9)=1.83ms
     http_req_duration..............: avg=827.44ms min=5.36ms  med=748.47ms max=17.82s  p(90)=1.46s    p(95)=1.65s   p(99.9)=16.14s
       { expected_response:true }...: avg=827.44ms min=5.36ms  med=748.47ms max=17.82s  p(90)=1.46s    p(95)=1.65s   p(99.9)=16.14s
     http_req_failed................: 0.00%   ✓ 0          ✗ 17156
     http_req_receiving.............: avg=101.18µs min=35.54µs med=91.28µs  max=23.76ms p(90)=128.31µs p(95)=143.7µs p(99.9)=1.35ms
     http_req_sending...............: avg=28.96µs  min=5.86µs  med=18.19µs  max=47.74ms p(90)=24.03µs  p(95)=28.13µs p(99.9)=2.26ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s      p(99.9)=0s    
     http_req_waiting...............: avg=827.31ms min=5.27ms  med=748.35ms max=17.82s  p(90)=1.46s    p(95)=1.65s   p(99.9)=16.14s
     http_reqs......................: 17156   255.710012/s
     iteration_duration.............: avg=878.7ms  min=40.41ms med=804.52ms max=17.82s  p(90)=1.47s    p(95)=1.66s   p(99.9)=16.25s
     iterations.....................: 16156   240.805021/s
     success_rate...................: 100.00% ✓ 16156      ✗ 0    
     vus............................: 47      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-gateway (rust subgraphs) (2.14.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 47532      ✗ 0    
     data_received..................: 1.5 GB  20 MB/s
     data_sent......................: 21 MB   282 kB/s
     http_req_blocked...............: avg=12.93µs  min=1.12µs  med=2.94µs   max=3.99ms  p(90)=4.48µs   p(95)=5.77µs   p(99.9)=2.12ms  
     http_req_connecting............: avg=8.45µs   min=0s      med=0s       max=3.91ms  p(90)=0s       p(95)=0s       p(99.9)=2.09ms  
     http_req_duration..............: avg=405.29ms min=7.41ms  med=452.43ms max=1.23s   p(90)=714.04ms p(95)=780.51ms p(99.9)=1.09s   
       { expected_response:true }...: avg=405.29ms min=7.41ms  med=452.43ms max=1.23s   p(90)=714.04ms p(95)=780.51ms p(99.9)=1.09s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 16844
     http_req_receiving.............: avg=96.62µs  min=32.8µs  med=81.9µs   max=97.66ms p(90)=121.15µs p(95)=134.14µs p(99.9)=991.16µs
     http_req_sending...............: avg=27.41µs  min=5.58µs  med=15.96µs  max=54.67ms p(90)=21.06µs  p(95)=25.42µs  p(99.9)=1.77ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=405.17ms min=7.28ms  med=452.33ms max=1.23s   p(90)=713.95ms p(95)=780.41ms p(99.9)=1.09s   
     http_reqs......................: 16844   230.443568/s
     iteration_duration.............: avg=430.85ms min=13.08ms med=480.68ms max=1.23s   p(90)=721.14ms p(95)=788.88ms p(99.9)=1.1s    
     iterations.....................: 15844   216.762521/s
     success_rate...................: 100.00% ✓ 15844      ✗ 0    
     vus............................: 57      min=0        max=497
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (.net subgraphs) (16.5.1-p.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 441912      ✗ 0     
     data_received..................: 13 GB   210 MB/s
     data_sent......................: 178 MB  2.9 MB/s
     http_req_blocked...............: avg=21.83µs min=990ns   med=3.02µs   max=65.96ms  p(90)=4.91µs   p(95)=6.17µs   p(99.9)=2.65ms  
     http_req_connecting............: avg=18µs    min=0s      med=0s       max=65.91ms  p(90)=0s       p(95)=0s       p(99.9)=2.58ms  
     http_req_duration..............: avg=95.88ms min=1.46ms  med=90.78ms  max=380.97ms p(90)=183.61ms p(95)=202.17ms p(99.9)=269.42ms
       { expected_response:true }...: avg=95.88ms min=1.46ms  med=90.78ms  max=380.97ms p(90)=183.61ms p(95)=202.17ms p(99.9)=269.42ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 148304
     http_req_receiving.............: avg=779.3µs min=53.79µs med=119.99µs max=134.53ms p(90)=1.6ms    p(95)=2.61ms   p(99.9)=28.58ms 
     http_req_sending...............: avg=75.45µs min=4.77µs  med=11.18µs  max=109.24ms p(90)=22.96µs  p(95)=129.71µs p(99.9)=10.56ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=95.02ms min=1.38ms  med=89.96ms  max=379.83ms p(90)=182.74ms p(95)=201.26ms p(99.9)=267.44ms
     http_reqs......................: 148304  2398.314284/s
     iteration_duration.............: avg=96.8ms  min=3.56ms  med=91.88ms  max=381.37ms p(90)=184.11ms p(95)=202.65ms p(99.9)=269.86ms
     iterations.....................: 147304  2382.142675/s
     success_rate...................: 100.00% ✓ 147304      ✗ 0     
     vus............................: 94      min=0         max=500 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.5.1-p.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 432072      ✗ 0     
     data_received..................: 13 GB   205 MB/s
     data_sent......................: 174 MB  2.8 MB/s
     http_req_blocked...............: avg=16.49µs min=862ns   med=2.33µs   max=77.74ms  p(90)=4.17µs   p(95)=5.31µs   p(99.9)=1.86ms  
     http_req_connecting............: avg=12.8µs  min=0s      med=0s       max=72.28ms  p(90)=0s       p(95)=0s       p(99.9)=1.81ms  
     http_req_duration..............: avg=98.09ms min=1.53ms  med=87.77ms  max=1.32s    p(90)=186.02ms p(95)=212.58ms p(99.9)=604.03ms
       { expected_response:true }...: avg=98.09ms min=1.53ms  med=87.77ms  max=1.32s    p(90)=186.02ms p(95)=212.58ms p(99.9)=604.03ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 145024
     http_req_receiving.............: avg=1.33ms  min=50.48µs med=103.22µs max=520.66ms p(90)=1.67ms   p(95)=4.06ms   p(99.9)=79.59ms 
     http_req_sending...............: avg=62.68µs min=4.6µs   med=9.54µs   max=114.32ms p(90)=20.01µs  p(95)=108.13µs p(99.9)=8.52ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=96.7ms  min=1.46ms  med=86.6ms   max=1.32s    p(90)=184.39ms p(95)=209.37ms p(99.9)=587.79ms
     http_reqs......................: 145024  2342.834783/s
     iteration_duration.............: avg=99.03ms min=2.75ms  med=88.82ms  max=1.32s    p(90)=186.57ms p(95)=213.25ms p(99.9)=604.33ms
     iterations.....................: 144024  2326.679975/s
     success_rate...................: 100.00% ✓ 144024      ✗ 0     
     vus............................: 54      min=0         max=499 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (.net subgraphs) (16.5.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 431091      ✗ 0     
     data_received..................: 13 GB   205 MB/s
     data_sent......................: 174 MB  2.8 MB/s
     http_req_blocked...............: avg=20.37µs min=911ns   med=2.95µs   max=69.97ms  p(90)=4.77µs   p(95)=5.98µs   p(99.9)=2.18ms  
     http_req_connecting............: avg=16.69µs min=0s      med=0s       max=69.91ms  p(90)=0s       p(95)=0s       p(99.9)=2.14ms  
     http_req_duration..............: avg=98.33ms min=1.58ms  med=85.83ms  max=2.13s    p(90)=188.25ms p(95)=217.04ms p(99.9)=689.03ms
       { expected_response:true }...: avg=98.33ms min=1.58ms  med=85.83ms  max=2.13s    p(90)=188.25ms p(95)=217.04ms p(99.9)=689.03ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 144697
     http_req_receiving.............: avg=1.54ms  min=52.13µs med=106.11µs max=592.56ms p(90)=1.59ms   p(95)=4.43ms   p(99.9)=119.18ms
     http_req_sending...............: avg=74.21µs min=5.07µs  med=11.09µs  max=61.72ms  p(90)=22.18µs  p(95)=124.34µs p(99.9)=10.59ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=96.71ms min=1.5ms   med=84.58ms  max=2.13s    p(90)=186.26ms p(95)=213.08ms p(99.9)=677.51ms
     http_reqs......................: 144697  2336.01775/s
     iteration_duration.............: avg=99.29ms min=2.98ms  med=87.03ms  max=2.13s    p(90)=188.91ms p(95)=217.77ms p(99.9)=689.95ms
     iterations.....................: 143697  2319.873547/s
     success_rate...................: 100.00% ✓ 143697      ✗ 0     
     vus............................: 55      min=0         max=499 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.83)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 425646      ✗ 0     
     data_received..................: 13 GB   202 MB/s
     data_sent......................: 172 MB  2.8 MB/s
     http_req_blocked...............: avg=10.89µs  min=802ns   med=2.33µs  max=40.23ms  p(90)=3.94µs   p(95)=5.08µs   p(99.9)=573.17µs
     http_req_connecting............: avg=7.8µs    min=0s      med=0s      max=40.16ms  p(90)=0s       p(95)=0s       p(99.9)=480.63µs
     http_req_duration..............: avg=99.58ms  min=1.49ms  med=92.62ms max=299.14ms p(90)=196.27ms p(95)=210.8ms  p(99.9)=259.53ms
       { expected_response:true }...: avg=99.58ms  min=1.49ms  med=92.62ms max=299.14ms p(90)=196.27ms p(95)=210.8ms  p(99.9)=259.53ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 142882
     http_req_receiving.............: avg=101.09µs min=25.18µs med=53.31µs max=255.68ms p(90)=107.34µs p(95)=295.87µs p(99.9)=5.91ms  
     http_req_sending...............: avg=54.96µs  min=4.66µs  med=10.02µs max=193ms    p(90)=18.39µs  p(95)=105.86µs p(99.9)=6.97ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=99.42ms  min=1.45ms  med=92.48ms max=299.02ms p(90)=196.09ms p(95)=210.63ms p(99.9)=258.68ms
     http_reqs......................: 142882  2310.935258/s
     iteration_duration.............: avg=100.51ms min=3.49ms  med=93.75ms max=300.96ms p(90)=196.71ms p(95)=211.24ms p(99.9)=260.25ms
     iterations.....................: 141882  2294.761525/s
     success_rate...................: 100.00% ✓ 141882      ✗ 0     
     vus............................: 94      min=0         max=500 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (.net subgraphs) (16.5.1-p.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 399672      ✗ 0     
     data_received..................: 12 GB   189 MB/s
     data_sent......................: 161 MB  2.6 MB/s
     http_req_blocked...............: avg=12.47µs  min=941ns  med=2.51µs   max=40.34ms  p(90)=4.52µs   p(95)=5.72µs   p(99.9)=1.1ms   
     http_req_connecting............: avg=9.1µs    min=0s     med=0s       max=40.27ms  p(90)=0s       p(95)=0s       p(99.9)=990.11µs
     http_req_duration..............: avg=106.03ms min=1.98ms med=93.82ms  max=1.58s    p(90)=203.01ms p(95)=229.77ms p(99.9)=636.1ms 
       { expected_response:true }...: avg=106.03ms min=1.98ms med=93.82ms  max=1.58s    p(90)=203.01ms p(95)=229.77ms p(99.9)=636.1ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 134224
     http_req_receiving.............: avg=1.2ms    min=51.2µs med=108.06µs max=577.78ms p(90)=1.58ms   p(95)=3.75ms   p(99.9)=65.06ms 
     http_req_sending...............: avg=63.78µs  min=5.02µs med=10.25µs  max=222.01ms p(90)=21.37µs  p(95)=106.48µs p(99.9)=7.7ms   
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=104.77ms min=1.88ms med=92.78ms  max=1.58s    p(90)=201.46ms p(95)=227.14ms p(99.9)=623.98ms
     http_reqs......................: 134224  2151.129836/s
     iteration_duration.............: avg=107.09ms min=4.07ms med=95.05ms  max=1.58s    p(90)=203.63ms p(95)=230.44ms p(99.9)=636.88ms
     iterations.....................: 133224  2135.103419/s
     success_rate...................: 100.00% ✓ 133224      ✗ 0     
     vus............................: 76      min=0         max=494 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (.net subgraphs) (0.331.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 209004      ✗ 0    
     data_received..................: 6.2 GB  99 MB/s
     data_sent......................: 85 MB   1.4 MB/s
     http_req_blocked...............: avg=9.3µs    min=1.23µs  med=2.9µs    max=15.44ms  p(90)=4.67µs   p(95)=5.66µs   p(99.9)=605.58µs
     http_req_connecting............: avg=5.58µs   min=0s      med=0s       max=15.28ms  p(90)=0s       p(95)=0s       p(99.9)=537.54µs
     http_req_duration..............: avg=201.9ms  min=1.9ms   med=202.61ms max=551.25ms p(90)=374.71ms p(95)=401.3ms  p(99.9)=485.58ms
       { expected_response:true }...: avg=201.9ms  min=1.9ms   med=202.61ms max=551.25ms p(90)=374.71ms p(95)=401.3ms  p(99.9)=485.58ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 70668
     http_req_receiving.............: avg=80.24µs  min=27.02µs med=65.91µs  max=40.53ms  p(90)=107.92µs p(95)=125.02µs p(99.9)=1.29ms  
     http_req_sending...............: avg=35.13µs  min=5.33µs  med=12.29µs  max=208.37ms p(90)=19.39µs  p(95)=23.29µs  p(99.9)=2.97ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=201.79ms min=1.84ms  med=202.52ms max=551.16ms p(90)=374.61ms p(95)=401.19ms p(99.9)=485.49ms
     http_reqs......................: 70668   1129.017423/s
     iteration_duration.............: avg=205.05ms min=4.97ms  med=205.84ms max=551.44ms p(90)=375.76ms p(95)=402ms    p(99.9)=485.96ms
     iterations.....................: 69668   1113.041063/s
     success_rate...................: 100.00% ✓ 69668       ✗ 0    
     vus............................: 85      min=0         max=497
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (.net subgraphs) (2.10.4)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 98457      ✗ 0    
     data_received..................: 3.0 GB  46 MB/s
     data_sent......................: 41 MB   628 kB/s
     http_req_blocked...............: avg=8.93µs   min=1.25µs  med=3.26µs   max=3.86ms   p(90)=4.97µs   p(95)=5.97µs   p(99.9)=1.44ms  
     http_req_connecting............: avg=4.65µs   min=0s      med=0s       max=3.83ms   p(90)=0s       p(95)=0s       p(99.9)=1.4ms   
     http_req_duration..............: avg=424.39ms min=3.66ms  med=394.4ms  max=1.89s    p(90)=831.15ms p(95)=909.05ms p(99.9)=1.32s   
       { expected_response:true }...: avg=424.39ms min=3.66ms  med=394.4ms  max=1.89s    p(90)=831.15ms p(95)=909.05ms p(99.9)=1.32s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 33819
     http_req_receiving.............: avg=84.83µs  min=30.68µs med=75.52µs  max=6.09ms   p(90)=112.84µs p(95)=127.08µs p(99.9)=957.51µs
     http_req_sending...............: avg=33.84µs  min=5.88µs  med=15.13µs  max=125.48ms p(90)=21.86µs  p(95)=25µs     p(99.9)=2.68ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=424.27ms min=3.56ms  med=394.28ms max=1.89s    p(90)=831.01ms p(95)=908.85ms p(99.9)=1.32s   
     http_reqs......................: 33819   523.26374/s
     iteration_duration.............: avg=437.54ms min=6.26ms  med=410.04ms max=1.89s    p(90)=835.58ms p(95)=912.42ms p(99.9)=1.33s   
     iterations.....................: 32819   507.791262/s
     success_rate...................: 100.00% ✓ 32819      ✗ 0    
     vus............................: 87      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (.net subgraphs) (2.10.4)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 46902      ✗ 0    
     data_received..................: 1.5 GB  22 MB/s
     data_sent......................: 20 MB   294 kB/s
     http_req_blocked...............: avg=14.79µs  min=1.11µs  med=3.28µs   max=13.05ms  p(90)=5.04µs   p(95)=6.56µs   p(99.9)=2.21ms
     http_req_connecting............: avg=9.85µs   min=0s      med=0s       max=13ms     p(90)=0s       p(95)=0s       p(99.9)=2.19ms
     http_req_duration..............: avg=874.66ms min=5.57ms  med=797.92ms max=4.91s    p(90)=1.73s    p(95)=1.95s    p(99.9)=3.76s 
       { expected_response:true }...: avg=874.66ms min=5.57ms  med=797.92ms max=4.91s    p(90)=1.73s    p(95)=1.95s    p(99.9)=3.76s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 16634
     http_req_receiving.............: avg=106.88µs min=32.97µs med=89.88µs  max=178.54ms p(90)=127.49µs p(95)=142.81µs p(99.9)=1.04ms
     http_req_sending...............: avg=40.49µs  min=5.69µs  med=17.77µs  max=101.86ms p(90)=23.39µs  p(95)=28.24µs  p(99.9)=4.67ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=874.51ms min=5.49ms  med=797.82ms max=4.91s    p(90)=1.73s    p(95)=1.95s    p(99.9)=3.76s 
     http_reqs......................: 16634   245.32251/s
     iteration_duration.............: avg=930.67ms min=6.87ms  med=874.21ms max=4.92s    p(90)=1.76s    p(95)=1.98s    p(99.9)=3.81s 
     iterations.....................: 15634   230.574252/s
     success_rate...................: 100.00% ✓ 15634      ✗ 0    
     vus............................: 83      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-gateway (.net subgraphs) (2.14.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 45042      ✗ 0    
     data_received..................: 1.4 GB  20 MB/s
     data_sent......................: 19 MB   280 kB/s
     http_req_blocked...............: avg=14.1µs   min=1.16µs  med=3.16µs   max=3.58ms  p(90)=4.89µs   p(95)=6.42µs   p(99.9)=2.2ms   
     http_req_connecting............: avg=9.25µs   min=0s      med=0s       max=3.42ms  p(90)=0s       p(95)=0s       p(99.9)=2.14ms  
     http_req_duration..............: avg=907.52ms min=7.79ms  med=824.38ms max=3.32s   p(90)=1.86s    p(95)=1.98s    p(99.9)=2.83s   
       { expected_response:true }...: avg=907.52ms min=7.79ms  med=824.38ms max=3.32s   p(90)=1.86s    p(95)=1.98s    p(99.9)=2.83s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 16014
     http_req_receiving.............: avg=101.66µs min=35.7µs  med=87.52µs  max=82.24ms p(90)=126.09µs p(95)=141.15µs p(99.9)=933.09µs
     http_req_sending...............: avg=38.48µs  min=5.22µs  med=16.51µs  max=82.12ms p(90)=21.79µs  p(95)=27.06µs  p(99.9)=2.55ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=907.38ms min=7.7ms   med=824.27ms max=3.32s   p(90)=1.86s    p(95)=1.98s    p(99.9)=2.83s   
     http_reqs......................: 16014   232.957569/s
     iteration_duration.............: avg=967.92ms min=50.52ms med=918.12ms max=3.33s   p(90)=1.87s    p(95)=1.98s    p(99.9)=2.86s   
     iterations.....................: 15014   218.410449/s
     success_rate...................: 100.00% ✓ 15014      ✗ 0    
     vus............................: 92      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

