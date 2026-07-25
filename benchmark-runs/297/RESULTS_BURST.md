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
| hive-router | v0.0.83 | 2,746 | 2,893 | 2,716 | 2.2% |  |
| fusion-nightly-net11 | 16.6.0-p.3 | 2,612 | 2,732 | 2,599 | 1.7% |  |
| fusion-nightly | 16.6.0-p.3 | 2,482 | 2,591 | 2,460 | 1.8% |  |
| fusion | 16.5.1 | 2,401 | 2,494 | 2,376 | 1.7% |  |
| cosmo | 0.331.1 | 1,194 | 1,239 | 1,187 | 1.7% |  |
| hive-gateway-router-runtime | 2.10.4 | 564 | 577 | 560 | 1.1% |  |
| hive-gateway | 2.10.4 | 249 | 256 | 246 | 1.4% |  |
| apollo-gateway | 2.14.2 | 236 | 241 | 235 | 0.8% |  |
| apollo-router | v2.16.0 | — | — | — | — | non-compatible response (6538 across 9/9 runs) |
| feddi | — | — | — | — | — | not run |
| fusion-nightly-fed | — | — | — | — | — | not run |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (542286 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| fusion-nightly | 16.6.0-p.3 | 2,405 | 2,498 | 2,397 | 1.4% |  |
| fusion-nightly-net11 | 16.6.0-p.3 | 2,363 | 2,459 | 2,346 | 1.7% |  |
| fusion | 16.5.1 | 2,299 | 2,388 | 2,267 | 1.8% |  |
| fusion-nightly-fed | 16.6.0-p.3 | 2,221 | 2,307 | 2,216 | 1.5% |  |
| hive-router | v0.0.83 | 2,199 | 2,375 | 2,179 | 3.1% |  |
| cosmo | 0.331.1 | 1,151 | 1,183 | 1,138 | 1.4% |  |
| hive-gateway-router-runtime | 2.10.4 | 517 | 536 | 516 | 1.4% |  |
| hive-gateway | 2.10.4 | 242 | 249 | 239 | 1.2% |  |
| apollo-gateway | 2.14.2 | 234 | 238 | 232 | 0.7% |  |
| apollo-router | v2.16.0 | — | — | — | — | non-compatible response (32139 across 9/9 runs) |
| feddi | — | — | — | — | — | not run |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (362791 across 9/9 runs) |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.83)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 504591      ✗ 0     
     data_received..................: 15 GB   241 MB/s
     data_sent......................: 203 MB  3.3 MB/s
     http_req_blocked...............: avg=18.79µs  min=972ns   med=2.62µs  max=56.98ms  p(90)=4.22µs   p(95)=5.34µs   p(99.9)=1.21ms  
     http_req_connecting............: avg=15.31µs  min=0s      med=0s      max=56.92ms  p(90)=0s       p(95)=0s       p(99.9)=1.17ms  
     http_req_duration..............: avg=83.99ms  min=1.36ms  med=78.25ms max=289.22ms p(90)=161.43ms p(95)=175.83ms p(99.9)=230.71ms
       { expected_response:true }...: avg=83.99ms  min=1.36ms  med=78.25ms max=289.22ms p(90)=161.43ms p(95)=175.83ms p(99.9)=230.71ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 169197
     http_req_receiving.............: avg=143.04µs min=25.89µs med=52.16µs max=68.72ms  p(90)=153.53µs p(95)=348.09µs p(99.9)=16.93ms 
     http_req_sending...............: avg=69.75µs  min=4.5µs   med=9.71µs  max=180.18ms p(90)=18.59µs  p(95)=123.15µs p(99.9)=9.2ms   
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=83.78ms  min=1.3ms   med=78.05ms max=288.9ms  p(90)=161.19ms p(95)=175.46ms p(99.9)=229.58ms
     http_reqs......................: 169197  2746.597366/s
     iteration_duration.............: avg=84.75ms  min=2.05ms  med=79.06ms max=317.42ms p(90)=161.88ms p(95)=176.28ms p(99.9)=232.09ms
     iterations.....................: 168197  2730.364233/s
     success_rate...................: 100.00% ✓ 168197      ✗ 0     
     vus............................: 84      min=0         max=493 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (rust subgraphs) (16.6.0-p.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 484278      ✗ 0     
     data_received..................: 14 GB   229 MB/s
     data_sent......................: 195 MB  3.1 MB/s
     http_req_blocked...............: avg=26.54µs  min=982ns   med=2.66µs   max=92.1ms   p(90)=4.28µs   p(95)=5.42µs   p(99.9)=3.56ms  
     http_req_connecting............: avg=22.83µs  min=0s      med=0s       max=70.31ms  p(90)=0s       p(95)=0s       p(99.9)=3.39ms  
     http_req_duration..............: avg=87.51ms  min=1.88ms  med=81.46ms  max=386.29ms p(90)=168.01ms p(95)=186.67ms p(99.9)=250.02ms
       { expected_response:true }...: avg=87.51ms  min=1.88ms  med=81.46ms  max=386.29ms p(90)=168.01ms p(95)=186.67ms p(99.9)=250.02ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 162426
     http_req_receiving.............: avg=688.57µs min=54.71µs med=111.07µs max=120.11ms p(90)=1.42ms   p(95)=2.26ms   p(99.9)=28.18ms 
     http_req_sending...............: avg=78.66µs  min=4.61µs  med=9.8µs    max=180ms    p(90)=19.48µs  p(95)=126.58µs p(99.9)=11.13ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=86.74ms  min=1.81ms  med=80.67ms  max=386.15ms p(90)=167.24ms p(95)=185.91ms p(99.9)=248.9ms 
     http_reqs......................: 162426  2612.48255/s
     iteration_duration.............: avg=88.32ms  min=3.81ms  med=82.31ms  max=386.49ms p(90)=168.51ms p(95)=187.18ms p(99.9)=250.9ms 
     iterations.....................: 161426  2596.398409/s
     success_rate...................: 100.00% ✓ 161426      ✗ 0     
     vus............................: 63      min=0         max=496 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (rust subgraphs) (16.6.0-p.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 460614      ✗ 0     
     data_received..................: 14 GB   218 MB/s
     data_sent......................: 186 MB  3.0 MB/s
     http_req_blocked...............: avg=17.11µs min=872ns   med=2.14µs  max=65.99ms  p(90)=3.7µs    p(95)=4.83µs   p(99.9)=1.92ms  
     http_req_connecting............: avg=13.96µs min=0s      med=0s      max=65.95ms  p(90)=0s       p(95)=0s       p(99.9)=1.89ms  
     http_req_duration..............: avg=92.06ms min=1.96ms  med=80.62ms max=1.63s    p(90)=177.34ms p(95)=202.98ms p(99.9)=631.81ms
       { expected_response:true }...: avg=92.06ms min=1.96ms  med=80.62ms max=1.63s    p(90)=177.34ms p(95)=202.98ms p(99.9)=631.81ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 154538
     http_req_receiving.............: avg=1.16ms  min=50.47µs med=97.12µs max=523.39ms p(90)=1.39ms   p(95)=3.83ms   p(99.9)=65.49ms 
     http_req_sending...............: avg=64.28µs min=4.44µs  med=8.99µs  max=178.93ms p(90)=17.98µs  p(95)=105.83µs p(99.9)=8.72ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=90.83ms min=1.87ms  med=79.61ms max=1.63s    p(90)=175.62ms p(95)=200.3ms  p(99.9)=630.31ms
     http_reqs......................: 154538  2482.510135/s
     iteration_duration.............: avg=92.91ms min=3.3ms   med=81.54ms max=1.64s    p(90)=177.96ms p(95)=203.6ms  p(99.9)=632.4ms 
     iterations.....................: 153538  2466.446059/s
     success_rate...................: 100.00% ✓ 153538      ✗ 0     
     vus............................: 69      min=0         max=495 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (rust subgraphs) (16.5.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 445677      ✗ 0     
     data_received..................: 13 GB   211 MB/s
     data_sent......................: 180 MB  2.9 MB/s
     http_req_blocked...............: avg=12.87µs min=852ns   med=2.05µs  max=42.03ms  p(90)=3.35µs   p(95)=4.3µs    p(99.9)=1.04ms  
     http_req_connecting............: avg=10.13µs min=0s      med=0s      max=41.88ms  p(90)=0s       p(95)=0s       p(99.9)=967.2µs 
     http_req_duration..............: avg=95.12ms min=1.98ms  med=84.22ms max=1.14s    p(90)=180.39ms p(95)=209.49ms p(99.9)=623.95ms
       { expected_response:true }...: avg=95.12ms min=1.98ms  med=84.22ms max=1.14s    p(90)=180.39ms p(95)=209.49ms p(99.9)=623.95ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 149559
     http_req_receiving.............: avg=1.6ms   min=52.83µs med=99.83µs max=935.91ms p(90)=1.84ms   p(95)=4.85ms   p(99.9)=98.69ms 
     http_req_sending...............: avg=58.53µs min=4.5µs   med=8.62µs  max=225.39ms p(90)=15.48µs  p(95)=95.91µs  p(99.9)=7.67ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=93.46ms min=1.89ms  med=82.9ms  max=1.14s    p(90)=178.42ms p(95)=205.72ms p(99.9)=595.77ms
     http_reqs......................: 149559  2401.207549/s
     iteration_duration.............: avg=96.02ms min=3.62ms  med=85.32ms max=1.14s    p(90)=180.94ms p(95)=210.45ms p(99.9)=624.21ms
     iterations.....................: 148559  2385.152296/s
     success_rate...................: 100.00% ✓ 148559      ✗ 0     
     vus............................: 69      min=0         max=495 
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

     checks.........................: 100.00% ✓ 220965      ✗ 0    
     data_received..................: 6.6 GB  105 MB/s
     data_sent......................: 90 MB   1.4 MB/s
     http_req_blocked...............: avg=4.78µs   min=952ns   med=1.95µs   max=5.28ms   p(90)=3.38µs   p(95)=4.21µs   p(99.9)=427.52µs
     http_req_connecting............: avg=2.17µs   min=0s      med=0s       max=5.22ms   p(90)=0s       p(95)=0s       p(99.9)=366.24µs
     http_req_duration..............: avg=191.13ms min=1.87ms  med=189.26ms max=541.38ms p(90)=355.96ms p(95)=381.45ms p(99.9)=462.82ms
       { expected_response:true }...: avg=191.13ms min=1.87ms  med=189.26ms max=541.38ms p(90)=355.96ms p(95)=381.45ms p(99.9)=462.82ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 74655
     http_req_receiving.............: avg=71.64µs  min=28.05µs med=56.75µs  max=146.97ms p(90)=90.64µs  p(95)=104.76µs p(99.9)=835.55µs
     http_req_sending...............: avg=26.32µs  min=4.46µs  med=9.43µs   max=158.78ms p(90)=14.92µs  p(95)=18.5µs   p(99.9)=2.65ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=191.03ms min=1.79ms  med=189.16ms max=541.32ms p(90)=355.89ms p(95)=381.37ms p(99.9)=462.75ms
     http_reqs......................: 74655   1194.835515/s
     iteration_duration.............: avg=193.94ms min=5.39ms  med=192.49ms max=541.55ms p(90)=356.86ms p(95)=382.12ms p(99.9)=463.46ms
     iterations.....................: 73655   1178.830753/s
     success_rate...................: 100.00% ✓ 73655       ✗ 0    
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

     checks.........................: 100.00% ✓ 105756     ✗ 0    
     data_received..................: 3.2 GB  50 MB/s
     data_sent......................: 44 MB   677 kB/s
     http_req_blocked...............: avg=8.52µs   min=1.16µs  med=3.14µs   max=16.25ms  p(90)=4.88µs   p(95)=5.89µs   p(99.9)=1.16ms  
     http_req_connecting............: avg=4.43µs   min=0s      med=0s       max=16.19ms  p(90)=0s       p(95)=0s       p(99.9)=1.14ms  
     http_req_duration..............: avg=395.6ms  min=3.57ms  med=368.31ms max=1.69s    p(90)=774.69ms p(95)=838.02ms p(99.9)=1.24s   
       { expected_response:true }...: avg=395.6ms  min=3.57ms  med=368.31ms max=1.69s    p(90)=774.69ms p(95)=838.02ms p(99.9)=1.24s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 36252
     http_req_receiving.............: avg=86.68µs  min=30.69µs med=71.63µs  max=108.96ms p(90)=109.43µs p(95)=124.93µs p(99.9)=918.52µs
     http_req_sending...............: avg=35.63µs  min=5.46µs  med=14.12µs  max=185.24ms p(90)=21.74µs  p(95)=24.96µs  p(99.9)=2.83ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=395.48ms min=3.5ms   med=368.22ms max=1.69s    p(90)=774.53ms p(95)=837.91ms p(99.9)=1.24s   
     http_reqs......................: 36252   564.12422/s
     iteration_duration.............: avg=407.06ms min=19.37ms med=383.59ms max=1.69s    p(90)=777.97ms p(95)=841.03ms p(99.9)=1.25s   
     iterations.....................: 35252   548.563031/s
     success_rate...................: 100.00% ✓ 35252      ✗ 0    
     vus............................: 69      min=0        max=496
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

     checks.........................: 100.00% ✓ 47292      ✗ 0    
     data_received..................: 1.5 GB  22 MB/s
     data_sent......................: 20 MB   300 kB/s
     http_req_blocked...............: avg=13.48µs  min=1.27µs  med=3.57µs   max=3.71ms  p(90)=5.28µs   p(95)=6.72µs   p(99.9)=2.23ms
     http_req_connecting............: avg=8.23µs   min=0s      med=0s       max=3.67ms  p(90)=0s       p(95)=0s       p(99.9)=2.21ms
     http_req_duration..............: avg=856.77ms min=5.48ms  med=727.66ms max=20.07s  p(90)=1.42s    p(95)=1.62s    p(99.9)=16.4s 
       { expected_response:true }...: avg=856.77ms min=5.48ms  med=727.66ms max=20.07s  p(90)=1.42s    p(95)=1.62s    p(99.9)=16.4s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 16764
     http_req_receiving.............: avg=106.27µs min=37.83µs med=88.83µs  max=91.17ms p(90)=126.43µs p(95)=141.08µs p(99.9)=1.27ms
     http_req_sending...............: avg=36.34µs  min=5.89µs  med=17µs     max=43.8ms  p(90)=22.61µs  p(95)=27.05µs  p(99.9)=3.66ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=856.62ms min=5.4ms   med=727.56ms max=20.07s  p(90)=1.42s    p(95)=1.62s    p(99.9)=16.4s 
     http_reqs......................: 16764   249.397281/s
     iteration_duration.............: avg=911.17ms min=17.03ms med=781.69ms max=20.07s  p(90)=1.44s    p(95)=1.64s    p(99.9)=16.48s
     iterations.....................: 15764   234.520325/s
     success_rate...................: 100.00% ✓ 15764      ✗ 0    
     vus............................: 72      min=0        max=497
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

     checks.........................: 100.00% ✓ 48918      ✗ 0    
     data_received..................: 1.5 GB  21 MB/s
     data_sent......................: 21 MB   289 kB/s
     http_req_blocked...............: avg=15.5µs   min=1.28µs  med=3.58µs   max=29.57ms p(90)=5.27µs   p(95)=6.63µs   p(99.9)=2.14ms
     http_req_connecting............: avg=10.3µs   min=0s      med=0s       max=29.41ms p(90)=0s       p(95)=0s       p(99.9)=2.12ms
     http_req_duration..............: avg=393.27ms min=7.49ms  med=427.8ms  max=1.21s   p(90)=692.45ms p(95)=739.79ms p(99.9)=1.06s 
       { expected_response:true }...: avg=393.27ms min=7.49ms  med=427.8ms  max=1.21s   p(90)=692.45ms p(95)=739.79ms p(99.9)=1.06s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 17306
     http_req_receiving.............: avg=95.55µs  min=35.75µs med=85.76µs  max=40.87ms p(90)=124.3µs  p(95)=139.26µs p(99.9)=1.16ms
     http_req_sending...............: avg=29.17µs  min=5.78µs  med=17.13µs  max=27ms    p(90)=22.62µs  p(95)=27.27µs  p(99.9)=3.18ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=393.15ms min=7.41ms  med=427.7ms  max=1.21s   p(90)=692.31ms p(95)=739.62ms p(99.9)=1.06s 
     http_reqs......................: 17306   236.674717/s
     iteration_duration.............: avg=417.39ms min=12.67ms med=440.57ms max=1.21s   p(90)=695.51ms p(95)=743.9ms  p(99.9)=1.06s 
     iterations.....................: 16306   222.99884/s
     success_rate...................: 100.00% ✓ 16306      ✗ 0    
     vus............................: 50      min=0        max=496
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.6.0-p.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 443727      ✗ 0     
     data_received..................: 13 GB   211 MB/s
     data_sent......................: 179 MB  2.9 MB/s
     http_req_blocked...............: avg=22.63µs min=871ns   med=2.5µs    max=86.92ms  p(90)=4.37µs   p(95)=5.55µs   p(99.9)=1.51ms  
     http_req_connecting............: avg=19.05µs min=0s      med=0s       max=86.78ms  p(90)=0s       p(95)=0s       p(99.9)=1.41ms  
     http_req_duration..............: avg=95.59ms min=1.53ms  med=76.01ms  max=1.66s    p(90)=181.63ms p(95)=212.04ms p(99.9)=997.49ms
       { expected_response:true }...: avg=95.59ms min=1.53ms  med=76.01ms  max=1.66s    p(90)=181.63ms p(95)=212.04ms p(99.9)=997.49ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 148909
     http_req_receiving.............: avg=2.06ms  min=53.13µs med=103.27µs max=1.01s    p(90)=1.63ms   p(95)=4.52ms   p(99.9)=199.01ms
     http_req_sending...............: avg=75.53µs min=4.77µs  med=9.99µs   max=193.48ms p(90)=20.74µs  p(95)=112.08µs p(99.9)=10.35ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=93.45ms min=1.43ms  med=74.93ms  max=1.66s    p(90)=179.62ms p(95)=209.06ms p(99.9)=920.36ms
     http_reqs......................: 148909  2405.514401/s
     iteration_duration.............: avg=96.51ms min=2.89ms  med=77.01ms  max=1.66s    p(90)=182.34ms p(95)=212.83ms p(99.9)=1s      
     iterations.....................: 147909  2389.360143/s
     success_rate...................: 100.00% ✓ 147909      ✗ 0     
     vus............................: 53      min=0         max=499 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (.net subgraphs) (16.6.0-p.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 435168      ✗ 0     
     data_received..................: 13 GB   207 MB/s
     data_sent......................: 175 MB  2.8 MB/s
     http_req_blocked...............: avg=20.61µs  min=921ns  med=3.02µs  max=80.48ms  p(90)=4.85µs   p(95)=6.08µs   p(99.9)=2.4ms   
     http_req_connecting............: avg=16.52µs  min=0s     med=0s      max=80.2ms   p(90)=0s       p(95)=0s       p(99.9)=2.34ms  
     http_req_duration..............: avg=97.36ms  min=1.46ms med=92.42ms max=359.07ms p(90)=186.96ms p(95)=203.05ms p(99.9)=260.1ms 
       { expected_response:true }...: avg=97.36ms  min=1.46ms med=92.42ms max=359.07ms p(90)=186.96ms p(95)=203.05ms p(99.9)=260.1ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 146056
     http_req_receiving.............: avg=821.74µs min=54.9µs med=123.6µs max=225.37ms p(90)=1.68ms   p(95)=2.76ms   p(99.9)=28.87ms 
     http_req_sending...............: avg=70.38µs  min=4.99µs med=11.11µs max=182.22ms p(90)=22.12µs  p(95)=127.82µs p(99.9)=9.63ms  
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=96.47ms  min=1.34ms med=91.46ms max=349.04ms p(90)=185.99ms p(95)=201.99ms p(99.9)=259.06ms
     http_reqs......................: 146056  2363.211856/s
     iteration_duration.............: avg=98.3ms   min=3.26ms med=93.48ms max=370.43ms p(90)=187.45ms p(95)=203.53ms p(99.9)=260.67ms
     iterations.....................: 145056  2347.031679/s
     success_rate...................: 100.00% ✓ 145056      ✗ 0     
     vus............................: 95      min=0         max=500 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (.net subgraphs) (16.5.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 423885      ✗ 0     
     data_received..................: 13 GB   202 MB/s
     data_sent......................: 171 MB  2.8 MB/s
     http_req_blocked...............: avg=13.33µs  min=842ns   med=2.15µs   max=71.36ms  p(90)=3.77µs   p(95)=4.88µs   p(99.9)=1.01ms  
     http_req_connecting............: avg=10.51µs  min=0s      med=0s       max=71.31ms  p(90)=0s       p(95)=0s       p(99.9)=877.72µs
     http_req_duration..............: avg=100.03ms min=1.55ms  med=82.77ms  max=1.63s    p(90)=190.6ms  p(95)=223.05ms p(99.9)=753.72ms
       { expected_response:true }...: avg=100.03ms min=1.55ms  med=82.77ms  max=1.63s    p(90)=190.6ms  p(95)=223.05ms p(99.9)=753.72ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 142295
     http_req_receiving.............: avg=2.25ms   min=53.37µs med=108.99µs max=898.29ms p(90)=2.06ms   p(95)=5.75ms   p(99.9)=251.06ms
     http_req_sending...............: avg=62.23µs  min=4.64µs  med=9.12µs   max=280.71ms p(90)=18.62µs  p(95)=99.57µs  p(99.9)=8.04ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=97.71ms  min=1.43ms  med=81.54ms  max=1.63s    p(90)=187.23ms p(95)=218.27ms p(99.9)=724.93ms
     http_reqs......................: 142295  2299.334937/s
     iteration_duration.............: avg=100.99ms min=2.87ms  med=83.75ms  max=1.63s    p(90)=191.23ms p(95)=223.99ms p(99.9)=754.72ms
     iterations.....................: 141295  2283.176007/s
     success_rate...................: 100.00% ✓ 141295      ✗ 0     
     vus............................: 53      min=0         max=499 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (.net subgraphs) (16.6.0-p.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 412029      ✗ 0     
     data_received..................: 12 GB   195 MB/s
     data_sent......................: 166 MB  2.7 MB/s
     http_req_blocked...............: avg=14.32µs  min=872ns   med=2.47µs   max=61.57ms  p(90)=4.52µs   p(95)=5.66µs   p(99.9)=991.6µs 
     http_req_connecting............: avg=11.15µs  min=0s      med=0s       max=61.53ms  p(90)=0s       p(95)=0s       p(99.9)=929.64µs
     http_req_duration..............: avg=102.85ms min=1.85ms  med=92.69ms  max=2.52s    p(90)=194.16ms p(95)=220.84ms p(99.9)=756.24ms
       { expected_response:true }...: avg=102.85ms min=1.85ms  med=92.69ms  max=2.52s    p(90)=194.16ms p(95)=220.84ms p(99.9)=756.24ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 138343
     http_req_receiving.............: avg=1.3ms    min=52.69µs med=106.89µs max=605.11ms p(90)=1.48ms   p(95)=3.53ms   p(99.9)=137.99ms
     http_req_sending...............: avg=63.34µs  min=4.85µs  med=10µs     max=98.56ms  p(90)=21.71µs  p(95)=107.62µs p(99.9)=8.51ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=101.48ms min=1.76ms  med=91.69ms  max=2.52s    p(90)=192.53ms p(95)=218.46ms p(99.9)=670.33ms
     http_reqs......................: 138343  2221.71542/s
     iteration_duration.............: avg=103.85ms min=3.53ms  med=93.99ms  max=2.52s    p(90)=194.69ms p(95)=221.58ms p(99.9)=757.26ms
     iterations.....................: 137343  2205.655949/s
     success_rate...................: 100.00% ✓ 137343      ✗ 0     
     vus............................: 70      min=0         max=495 
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

     checks.........................: 100.00% ✓ 405219      ✗ 0     
     data_received..................: 12 GB   192 MB/s
     data_sent......................: 163 MB  2.6 MB/s
     http_req_blocked...............: avg=14.37µs  min=1.06µs med=2.91µs   max=47.77ms  p(90)=4.66µs   p(95)=5.82µs   p(99.9)=760.68µs
     http_req_connecting............: avg=10.76µs  min=0s     med=0s       max=47.51ms  p(90)=0s       p(95)=0s       p(99.9)=690.91µs
     http_req_duration..............: avg=104.56ms min=1.48ms med=99.85ms  max=325.83ms p(90)=201.72ms p(95)=218.06ms p(99.9)=264.5ms 
       { expected_response:true }...: avg=104.56ms min=1.48ms med=99.85ms  max=325.83ms p(90)=201.72ms p(95)=218.06ms p(99.9)=264.5ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 136073
     http_req_receiving.............: avg=117.55µs min=27.9µs med=58.43µs  max=51.73ms  p(90)=122.48µs p(95)=345.53µs p(99.9)=8.28ms  
     http_req_sending...............: avg=62.38µs  min=4.97µs med=11.2µs   max=219.83ms p(90)=19.9µs   p(95)=124.76µs p(99.9)=7.62ms  
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=104.38ms min=1.43ms med=99.65ms  max=325.71ms p(90)=201.46ms p(95)=217.83ms p(99.9)=263.94ms
     http_reqs......................: 136073  2199.089206/s
     iteration_duration.............: avg=105.58ms min=4.09ms med=100.98ms max=329.37ms p(90)=202.27ms p(95)=218.54ms p(99.9)=265.64ms
     iterations.....................: 135073  2182.928107/s
     success_rate...................: 100.00% ✓ 135073      ✗ 0     
     vus............................: 52      min=0         max=500 
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

     checks.........................: 100.00% ✓ 213504      ✗ 0    
     data_received..................: 6.3 GB  101 MB/s
     data_sent......................: 87 MB   1.4 MB/s
     http_req_blocked...............: avg=6.21µs   min=1.03µs  med=3.03µs   max=21.86ms  p(90)=4.91µs   p(95)=5.93µs   p(99.9)=436.07µs
     http_req_connecting............: avg=2.43µs   min=0s      med=0s       max=21.78ms  p(90)=0s       p(95)=0s       p(99.9)=338.42µs
     http_req_duration..............: avg=197.73ms min=1.99ms  med=197.41ms max=544.78ms p(90)=365.87ms p(95)=392.81ms p(99.9)=475.27ms
       { expected_response:true }...: avg=197.73ms min=1.99ms  med=197.41ms max=544.78ms p(90)=365.87ms p(95)=392.81ms p(99.9)=475.27ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 72168
     http_req_receiving.............: avg=88.25µs  min=27.59µs med=68.87µs  max=193.36ms p(90)=109.88µs p(95)=126.41µs p(99.9)=1.5ms   
     http_req_sending...............: avg=37.9µs   min=5.18µs  med=12.6µs   max=193.32ms p(90)=20.05µs  p(95)=24.16µs  p(99.9)=3.86ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=197.61ms min=1.93ms  med=197.29ms max=544.73ms p(90)=365.73ms p(95)=392.67ms p(99.9)=475.21ms
     http_reqs......................: 72168   1151.92776/s
     iteration_duration.............: avg=200.76ms min=4.43ms  med=200.72ms max=544.96ms p(90)=366.66ms p(95)=393.43ms p(99.9)=475.67ms
     iterations.....................: 71168   1135.966008/s
     success_rate...................: 100.00% ✓ 71168       ✗ 0    
     vus............................: 87      min=0         max=496
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

     checks.........................: 100.00% ✓ 97542      ✗ 0    
     data_received..................: 2.9 GB  45 MB/s
     data_sent......................: 40 MB   621 kB/s
     http_req_blocked...............: avg=8.36µs   min=1.02µs med=2.81µs   max=8.83ms   p(90)=4.45µs   p(95)=5.32µs   p(99.9)=1.4ms   
     http_req_connecting............: avg=4.64µs   min=0s     med=0s       max=8.76ms   p(90)=0s       p(95)=0s       p(99.9)=1.37ms  
     http_req_duration..............: avg=428.12ms min=3.85ms med=396.71ms max=2.08s    p(90)=853.24ms p(95)=922.75ms p(99.9)=1.35s   
       { expected_response:true }...: avg=428.12ms min=3.85ms med=396.71ms max=2.08s    p(90)=853.24ms p(95)=922.75ms p(99.9)=1.35s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 33514
     http_req_receiving.............: avg=92.5µs   min=30.7µs med=73.42µs  max=215.89ms p(90)=111.98µs p(95)=125.63µs p(99.9)=908.98µs
     http_req_sending...............: avg=35.39µs  min=4.88µs med=13.64µs  max=178.54ms p(90)=20.9µs   p(95)=23.74µs  p(99.9)=1.97ms  
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=427.99ms min=3.74ms med=396.62ms max=2.08s    p(90)=853.16ms p(95)=922.64ms p(99.9)=1.35s   
     http_reqs......................: 33514   517.589641/s
     iteration_duration.............: avg=441.51ms min=25.6ms med=412.58ms max=2.08s    p(90)=857.17ms p(95)=925.48ms p(99.9)=1.35s   
     iterations.....................: 32514   502.145658/s
     success_rate...................: 100.00% ✓ 32514      ✗ 0    
     vus............................: 90      min=0        max=500
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

     checks.........................: 100.00% ✓ 46335      ✗ 0    
     data_received..................: 1.4 GB  21 MB/s
     data_sent......................: 20 MB   291 kB/s
     http_req_blocked...............: avg=15.13µs  min=1.14µs  med=3.4µs    max=10.83ms p(90)=5.29µs   p(95)=7.11µs   p(99.9)=2.21ms
     http_req_connecting............: avg=9.83µs   min=0s      med=0s       max=10.76ms p(90)=0s       p(95)=0s       p(99.9)=2.17ms
     http_req_duration..............: avg=884.38ms min=5.87ms  med=790.35ms max=4.68s   p(90)=1.76s    p(95)=1.98s    p(99.9)=4.08s 
       { expected_response:true }...: avg=884.38ms min=5.87ms  med=790.35ms max=4.68s   p(90)=1.76s    p(95)=1.98s    p(99.9)=4.08s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 16445
     http_req_receiving.............: avg=111.09µs min=33.26µs med=92.36µs  max=84.65ms p(90)=130.49µs p(95)=146.53µs p(99.9)=1.71ms
     http_req_sending...............: avg=35.59µs  min=5.68µs  med=18.1µs   max=81.04ms p(90)=23.98µs  p(95)=29.33µs  p(99.9)=3.03ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=884.24ms min=5.79ms  med=790.25ms max=4.68s   p(90)=1.76s    p(95)=1.98s    p(99.9)=4.08s 
     http_reqs......................: 16445   242.153305/s
     iteration_duration.............: avg=941.66ms min=40ms    med=855.79ms max=4.69s   p(90)=1.78s    p(95)=1.99s    p(99.9)=4.13s 
     iterations.....................: 15445   227.428264/s
     success_rate...................: 100.00% ✓ 15445      ✗ 0    
     vus............................: 24      min=0        max=500
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

     checks.........................: 100.00% ✓ 45507      ✗ 0    
     data_received..................: 1.4 GB  21 MB/s
     data_sent......................: 19 MB   281 kB/s
     http_req_blocked...............: avg=13.95µs  min=1.11µs  med=3.08µs   max=7.99ms   p(90)=4.79µs  p(95)=6.32µs   p(99.9)=2.29ms  
     http_req_connecting............: avg=9.11µs   min=0s      med=0s       max=7.8ms    p(90)=0s      p(95)=0s       p(99.9)=2.27ms  
     http_req_duration..............: avg=898.56ms min=7.87ms  med=808.95ms max=3.26s    p(90)=1.81s   p(95)=1.95s    p(99.9)=2.81s   
       { expected_response:true }...: avg=898.56ms min=7.87ms  med=808.95ms max=3.26s    p(90)=1.81s   p(95)=1.95s    p(99.9)=2.81s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 16169
     http_req_receiving.............: avg=104.5µs  min=30.81µs med=89.57µs  max=122.84ms p(90)=127.5µs p(95)=144.73µs p(99.9)=963.42µs
     http_req_sending...............: avg=37.07µs  min=5.31µs  med=17.24µs  max=54.11ms  p(90)=22.97µs p(95)=28.1µs   p(99.9)=3.11ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=898.42ms min=7.75ms  med=808.86ms max=3.26s    p(90)=1.81s   p(95)=1.95s    p(99.9)=2.81s   
     http_reqs......................: 16169   234.213189/s
     iteration_duration.............: avg=957.72ms min=52.64ms med=895.22ms max=3.27s    p(90)=1.82s   p(95)=1.96s    p(99.9)=2.83s   
     iterations.....................: 15169   219.727866/s
     success_rate...................: 100.00% ✓ 15169      ✗ 0    
     vus............................: 57      min=0        max=499
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

