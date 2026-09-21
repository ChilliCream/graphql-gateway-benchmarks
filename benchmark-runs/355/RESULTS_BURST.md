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
| hive-router | v0.0.84 | 2,714 | 2,878 | 2,689 | 2.6% |  |
| fusion-nightly-net11 | 16.7.0-p.8 | 2,603 | 2,705 | 2,573 | 1.8% |  |
| fusion-nightly | 16.7.0-p.8 | 2,529 | 2,623 | 2,520 | 1.4% |  |
| fusion | 16.6.6 | 2,455 | 2,575 | 2,439 | 1.9% |  |
| fusion-nightly-fed | 16.7.0-p.8 | 2,328 | 2,413 | 2,316 | 1.5% |  |
| cosmo | 0.334.0 | 1,197 | 1,233 | 1,186 | 1.3% |  |
| hive-gateway-router-runtime | 2.10.8 | 571 | 577 | 565 | 0.6% |  |
| hive-gateway | 2.10.8 | 259 | 266 | 258 | 0.9% |  |
| apollo-gateway | 2.14.3 | 230 | 236 | 227 | 1.3% | 1 failed requests across 1/9 runs |
| apollo-router | v2.16.1 | — | — | — | — | non-compatible response (6354 across 9/9 runs) |
| feddi | — | — | — | — | — | not run |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (531765 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| fusion | 16.6.6 | 2,367 | 2,510 | 2,328 | 2.4% |  |
| hive-router | v0.0.84 | 2,365 | 2,482 | 2,324 | 2.2% |  |
| fusion-nightly-net11 | 16.7.0-p.8 | 2,355 | 2,453 | 2,340 | 1.7% |  |
| fusion-nightly | 16.7.0-p.8 | 2,344 | 2,442 | 2,332 | 1.7% |  |
| fusion-nightly-fed | 16.7.0-p.8 | 2,238 | 2,336 | 2,227 | 1.6% |  |
| cosmo | 0.334.0 | 1,163 | 1,204 | 1,156 | 1.5% |  |
| hive-gateway-router-runtime | 2.10.8 | 522 | 542 | 519 | 1.5% |  |
| hive-gateway | 2.10.8 | 239 | 246 | 236 | 1.2% |  |
| apollo-gateway | 2.14.3 | 236 | 239 | 235 | 0.5% |  |
| apollo-router | v2.16.1 | — | — | — | — | non-compatible response (29166 across 9/9 runs) |
| feddi | — | — | — | — | — | not run |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (281653 across 9/9 runs) |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.84)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 499509      ✗ 0     
     data_received..................: 15 GB   238 MB/s
     data_sent......................: 201 MB  3.3 MB/s
     http_req_blocked...............: avg=17.16µs  min=911ns  med=2.42µs  max=47.04ms  p(90)=3.97µs   p(95)=4.99µs   p(99.9)=832.21µs
     http_req_connecting............: avg=13.84µs  min=0s     med=0s      max=46.96ms  p(90)=0s       p(95)=0s       p(99.9)=764.77µs
     http_req_duration..............: avg=84.87ms  min=1.38ms med=80.2ms  max=325.25ms p(90)=164.04ms p(95)=176.47ms p(99.9)=226.7ms 
       { expected_response:true }...: avg=84.87ms  min=1.38ms med=80.2ms  max=325.25ms p(90)=164.04ms p(95)=176.47ms p(99.9)=226.7ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 167503
     http_req_receiving.............: avg=129.42µs min=26.4µs med=52.36µs max=96.62ms  p(90)=130.78µs p(95)=325.44µs p(99.9)=13.08ms 
     http_req_sending...............: avg=66.39µs  min=4.54µs med=9.65µs  max=179.02ms p(90)=17.57µs  p(95)=112.9µs  p(99.9)=9.25ms  
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=84.68ms  min=1.33ms med=79.99ms max=325.1ms  p(90)=163.81ms p(95)=176.19ms p(99.9)=225.99ms
     http_reqs......................: 167503  2714.459369/s
     iteration_duration.............: avg=85.62ms  min=2.46ms med=81.06ms max=350.03ms p(90)=164.43ms p(95)=176.86ms p(99.9)=227.56ms
     iterations.....................: 166503  2698.253931/s
     success_rate...................: 100.00% ✓ 166503      ✗ 0     
     vus............................: 90      min=0         max=497 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (rust subgraphs) (16.7.0-p.8)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 482940      ✗ 0     
     data_received..................: 14 GB   228 MB/s
     data_sent......................: 195 MB  3.1 MB/s
     http_req_blocked...............: avg=16.48µs min=882ns   med=2.19µs   max=66.96ms  p(90)=3.63µs   p(95)=4.71µs   p(99.9)=1.75ms  
     http_req_connecting............: avg=13.61µs min=0s      med=0s       max=66.8ms   p(90)=0s       p(95)=0s       p(99.9)=1.69ms  
     http_req_duration..............: avg=87.77ms min=1.84ms  med=83.57ms  max=323.13ms p(90)=168.16ms p(95)=184.2ms  p(99.9)=252.46ms
       { expected_response:true }...: avg=87.77ms min=1.84ms  med=83.57ms  max=323.13ms p(90)=168.16ms p(95)=184.2ms  p(99.9)=252.46ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 161980
     http_req_receiving.............: avg=1.37ms  min=52.19µs med=203.53µs max=97.08ms  p(90)=3.34ms   p(95)=5.05ms   p(99.9)=33.09ms 
     http_req_sending...............: avg=64.23µs min=4.29µs  med=9.03µs   max=70.29ms  p(90)=18.52µs  p(95)=107.93µs p(99.9)=8.56ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=86.33ms min=1.78ms  med=82ms     max=322.65ms p(90)=166.61ms p(95)=182.77ms p(99.9)=250.52ms
     http_reqs......................: 161980  2603.611233/s
     iteration_duration.............: avg=88.57ms min=4.49ms  med=84.53ms  max=333.09ms p(90)=168.64ms p(95)=184.62ms p(99.9)=253.93ms
     iterations.....................: 160980  2587.537574/s
     success_rate...................: 100.00% ✓ 160980      ✗ 0     
     vus............................: 67      min=0         max=496 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (rust subgraphs) (16.7.0-p.8)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 470784      ✗ 0     
     data_received..................: 14 GB   222 MB/s
     data_sent......................: 190 MB  3.0 MB/s
     http_req_blocked...............: avg=18.3µs  min=881ns   med=2.16µs  max=78.89ms  p(90)=3.77µs   p(95)=4.88µs   p(99.9)=1.62ms  
     http_req_connecting............: avg=15.38µs min=0s      med=0s      max=78.73ms  p(90)=0s       p(95)=0s       p(99.9)=1.57ms  
     http_req_duration..............: avg=90.05ms min=1.98ms  med=79.46ms max=1.32s    p(90)=173.51ms p(95)=199.18ms p(99.9)=601.82ms
       { expected_response:true }...: avg=90.05ms min=1.98ms  med=79.46ms max=1.32s    p(90)=173.51ms p(95)=199.18ms p(99.9)=601.82ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 157928
     http_req_receiving.............: avg=1.1ms   min=50.77µs med=94.58µs max=842.22ms p(90)=1.44ms   p(95)=3.72ms   p(99.9)=74.93ms 
     http_req_sending...............: avg=61.98µs min=4.48µs  med=8.85µs  max=165.13ms p(90)=17.25µs  p(95)=100.83µs p(99.9)=8.23ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=88.88ms min=1.9ms   med=78.48ms max=1.32s    p(90)=171.92ms p(95)=197.44ms p(99.9)=599.74ms
     http_reqs......................: 157928  2529.523637/s
     iteration_duration.............: avg=90.88ms min=3.37ms  med=80.36ms max=1.32s    p(90)=174.16ms p(95)=199.93ms p(99.9)=602.02ms
     iterations.....................: 156928  2513.506694/s
     success_rate...................: 100.00% ✓ 156928      ✗ 0     
     vus............................: 78      min=0         max=493 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (rust subgraphs) (16.6.6)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 456870      ✗ 0     
     data_received..................: 13 GB   215 MB/s
     data_sent......................: 184 MB  2.9 MB/s
     http_req_blocked...............: avg=15.67µs min=891ns   med=2.06µs  max=88.32ms  p(90)=3.36µs   p(95)=4.34µs   p(99.9)=1.46ms  
     http_req_connecting............: avg=12.9µs  min=0s      med=0s      max=88.27ms  p(90)=0s       p(95)=0s       p(99.9)=1.41ms  
     http_req_duration..............: avg=92.77ms min=1.94ms  med=79.33ms max=1.2s     p(90)=174.81ms p(95)=203.82ms p(99.9)=676.08ms
       { expected_response:true }...: avg=92.77ms min=1.94ms  med=79.33ms max=1.2s     p(90)=174.81ms p(95)=203.82ms p(99.9)=676.08ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 153290
     http_req_receiving.............: avg=1.8ms   min=51.24µs med=99.46µs max=1.08s    p(90)=2.06ms   p(95)=5.56ms   p(99.9)=111.68ms
     http_req_sending...............: avg=57.65µs min=4.28µs  med=8.81µs  max=142.31ms p(90)=15.87µs  p(95)=98.64µs  p(99.9)=7.43ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=90.91ms min=1.87ms  med=77.92ms max=1.2s     p(90)=172.63ms p(95)=199.93ms p(99.9)=659.85ms
     http_reqs......................: 153290  2455.5492/s
     iteration_duration.............: avg=93.64ms min=3.11ms  med=80.24ms max=1.2s     p(90)=175.36ms p(95)=204.58ms p(99.9)=677.56ms
     iterations.....................: 152290  2439.530222/s
     success_rate...................: 100.00% ✓ 152290      ✗ 0     
     vus............................: 75      min=0         max=493 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (rust subgraphs) (16.7.0-p.8)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 429939      ✗ 0     
     data_received..................: 13 GB   205 MB/s
     data_sent......................: 173 MB  2.8 MB/s
     http_req_blocked...............: avg=12.13µs min=861ns  med=1.98µs   max=74.13ms  p(90)=3.3µs    p(95)=4.27µs   p(99.9)=847.64µs
     http_req_connecting............: avg=9.51µs  min=0s     med=0s       max=74.09ms  p(90)=0s       p(95)=0s       p(99.9)=770.31µs
     http_req_duration..............: avg=98.62ms min=1.6ms  med=84.91ms  max=1.62s    p(90)=184.51ms p(95)=216.08ms p(99.9)=784.06ms
       { expected_response:true }...: avg=98.62ms min=1.6ms  med=84.91ms  max=1.62s    p(90)=184.51ms p(95)=216.08ms p(99.9)=784.06ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 144313
     http_req_receiving.............: avg=1.44ms  min=52.3µs med=100.85µs max=686.67ms p(90)=1.76ms   p(95)=4.57ms   p(99.9)=85.79ms 
     http_req_sending...............: avg=56.28µs min=4.49µs med=8.58µs   max=198.84ms p(90)=15.65µs  p(95)=88.87µs  p(99.9)=7.27ms  
     http_req_tls_handshaking.......: avg=0s      min=0s     med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=97.11ms min=1.54ms med=83.73ms  max=1.62s    p(90)=182.72ms p(95)=212.89ms p(99.9)=747.58ms
     http_reqs......................: 144313  2328.420877/s
     iteration_duration.............: avg=99.54ms min=2.57ms med=85.99ms  max=1.62s    p(90)=185.09ms p(95)=216.8ms  p(99.9)=785.55ms
     iterations.....................: 143313  2312.286357/s
     success_rate...................: 100.00% ✓ 143313      ✗ 0     
     vus............................: 56      min=0         max=498 
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

     checks.........................: 100.00% ✓ 221583      ✗ 0    
     data_received..................: 6.6 GB  105 MB/s
     data_sent......................: 90 MB   1.4 MB/s
     http_req_blocked...............: avg=5.65µs   min=951ns   med=2.59µs   max=12.73ms  p(90)=4.21µs   p(95)=5.12µs   p(99.9)=404.14µs
     http_req_connecting............: avg=2.4µs    min=0s      med=0s       max=12.64ms  p(90)=0s       p(95)=0s       p(99.9)=305.95µs
     http_req_duration..............: avg=190.64ms min=1.82ms  med=190.69ms max=564.43ms p(90)=355.42ms p(95)=381.83ms p(99.9)=497.69ms
       { expected_response:true }...: avg=190.64ms min=1.82ms  med=190.69ms max=564.43ms p(90)=355.42ms p(95)=381.83ms p(99.9)=497.69ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 74861
     http_req_receiving.............: avg=75.43µs  min=25.87µs med=60.68µs  max=71.02ms  p(90)=98.17µs  p(95)=113.51µs p(99.9)=1.17ms  
     http_req_sending...............: avg=29.59µs  min=5.08µs  med=10.95µs  max=159.04ms p(90)=17.11µs  p(95)=20.84µs  p(99.9)=3.17ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=190.53ms min=1.77ms  med=190.58ms max=564.35ms p(90)=355.29ms p(95)=381.76ms p(99.9)=497.6ms 
     http_reqs......................: 74861   1197.971866/s
     iteration_duration.............: avg=193.44ms min=4.45ms  med=193.77ms max=564.6ms  p(90)=356.32ms p(95)=382.5ms  p(99.9)=498.18ms
     iterations.....................: 73861   1181.96925/s
     success_rate...................: 100.00% ✓ 73861       ✗ 0    
     vus............................: 79      min=0         max=493
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

     checks.........................: 100.00% ✓ 107037     ✗ 0    
     data_received..................: 3.2 GB  50 MB/s
     data_sent......................: 44 MB   687 kB/s
     http_req_blocked...............: avg=8.51µs   min=951ns   med=2.59µs   max=14.19ms  p(90)=4.31µs   p(95)=5.27µs   p(99.9)=1.4ms   
     http_req_connecting............: avg=4.9µs    min=0s      med=0s       max=14.12ms  p(90)=0s       p(95)=0s       p(99.9)=1.33ms  
     http_req_duration..............: avg=391.09ms min=3.42ms  med=365.53ms max=1.46s    p(90)=771.04ms p(95)=826.78ms p(99.9)=1.21s   
       { expected_response:true }...: avg=391.09ms min=3.42ms  med=365.53ms max=1.46s    p(90)=771.04ms p(95)=826.78ms p(99.9)=1.21s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 36679
     http_req_receiving.............: avg=79.44µs  min=29.78µs med=65.64µs  max=104.09ms p(90)=105.67µs p(95)=121.15µs p(99.9)=865.43µs
     http_req_sending...............: avg=37.97µs  min=5.22µs  med=12.83µs  max=190.91ms p(90)=20.51µs  p(95)=23.3µs   p(99.9)=2.85ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=390.97ms min=3.37ms  med=365.46ms max=1.46s    p(90)=770.98ms p(95)=826.68ms p(99.9)=1.21s   
     http_reqs......................: 36679   571.868577/s
     iteration_duration.............: avg=402.29ms min=14.92ms med=379.88ms max=1.47s    p(90)=773.76ms p(95)=829.21ms p(99.9)=1.21s   
     iterations.....................: 35679   556.277406/s
     success_rate...................: 100.00% ✓ 35679      ✗ 0    
     vus............................: 64      min=0        max=497
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

     checks.........................: 100.00% ✓ 49325      ✗ 0    
     data_received..................: 1.5 GB  23 MB/s
     data_sent......................: 21 MB   312 kB/s
     http_req_blocked...............: avg=15.37µs  min=1.22µs  med=3.86µs   max=25.32ms  p(90)=5.69µs   p(95)=7.3µs    p(99.9)=2.25ms
     http_req_connecting............: avg=9.9µs    min=0s      med=0s       max=25.18ms  p(90)=0s       p(95)=0s       p(99.9)=2.22ms
     http_req_duration..............: avg=822.27ms min=5.53ms  med=724.41ms max=16.75s   p(90)=1.48s    p(95)=1.67s    p(99.9)=15.11s
       { expected_response:true }...: avg=822.27ms min=5.53ms  med=724.41ms max=16.75s   p(90)=1.48s    p(95)=1.67s    p(99.9)=15.11s
     http_req_failed................: 0.00%   ✓ 0          ✗ 17442
     http_req_receiving.............: avg=117.94µs min=37.82µs med=97.54µs  max=88.76ms  p(90)=135.32µs p(95)=152.04µs p(99.9)=1.35ms
     http_req_sending...............: avg=35.08µs  min=5.87µs  med=19.21µs  max=105.99ms p(90)=24.9µs   p(95)=29.21µs  p(99.9)=2.79ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=822.12ms min=5.45ms  med=724.3ms  max=16.74s   p(90)=1.48s    p(95)=1.67s    p(99.9)=15.11s
     http_reqs......................: 17442   259.451965/s
     iteration_duration.............: avg=871.44ms min=41.84ms med=783.04ms max=16.75s   p(90)=1.51s    p(95)=1.68s    p(99.9)=15.11s
     iterations.....................: 16441   244.561963/s
     success_rate...................: 100.00% ✓ 16441      ✗ 0    
     vus............................: 61      min=0        max=498
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

     checks.........................: 100.00% ✓ 47628      ✗ 0    
     data_received..................: 1.5 GB  20 MB/s
     data_sent......................: 21 MB   283 kB/s
     http_req_blocked...............: avg=11.99µs  min=1.18µs  med=3.42µs   max=11.34ms  p(90)=5.06µs   p(95)=6.41µs   p(99.9)=1.44ms  
     http_req_connecting............: avg=6.95µs   min=0s      med=0s       max=11.28ms  p(90)=0s       p(95)=0s       p(99.9)=1.4ms   
     http_req_duration..............: avg=388.09ms min=7.52ms  med=422.35ms max=1.11s    p(90)=694.2ms  p(95)=727.39ms p(99.9)=1.01s   
       { expected_response:true }...: avg=388.09ms min=7.52ms  med=422.35ms max=1.11s    p(90)=694.2ms  p(95)=727.39ms p(99.9)=1.01s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 16876
     http_req_receiving.............: avg=91.87µs  min=33.63µs med=85.93µs  max=3.9ms    p(90)=123.96µs p(95)=138.67µs p(99.9)=951.09µs
     http_req_sending...............: avg=39.17µs  min=5.48µs  med=16.98µs  max=111.63ms p(90)=22.26µs  p(95)=26.9µs   p(99.9)=2.79ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=387.96ms min=7.42ms  med=422.21ms max=1.11s    p(90)=694.12ms p(95)=727.3ms  p(99.9)=1.01s   
     http_reqs......................: 16876   230.688285/s
     iteration_duration.............: avg=412.62ms min=8.34ms  med=439.15ms max=1.12s    p(90)=698.08ms p(95)=729.86ms p(99.9)=1.02s   
     iterations.....................: 15876   217.018678/s
     success_rate...................: 100.00% ✓ 15876      ✗ 0    
     vus............................: 55      min=0        max=496
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (.net subgraphs) (16.6.6)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 436698      ✗ 0     
     data_received..................: 13 GB   208 MB/s
     data_sent......................: 176 MB  2.8 MB/s
     http_req_blocked...............: avg=20.23µs min=1.09µs  med=2.86µs   max=69.8ms  p(90)=4.58µs   p(95)=5.76µs   p(99.9)=1.86ms  
     http_req_connecting............: avg=16.7µs  min=0s      med=0s       max=69.54ms p(90)=0s       p(95)=0s       p(99.9)=1.82ms  
     http_req_duration..............: avg=97.17ms min=1.48ms  med=83.54ms  max=2.19s   p(90)=185.15ms p(95)=218.83ms p(99.9)=884.79ms
       { expected_response:true }...: avg=97.17ms min=1.48ms  med=83.54ms  max=2.19s   p(90)=185.15ms p(95)=218.83ms p(99.9)=884.79ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 146566
     http_req_receiving.............: avg=1.68ms  min=54.15µs med=110.14µs max=1.66s   p(90)=1.97ms   p(95)=5.21ms   p(99.9)=106.18ms
     http_req_sending...............: avg=72.09µs min=4.42µs  med=10.56µs  max=94.09ms p(90)=19.71µs  p(95)=119.63µs p(99.9)=9.81ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=95.42ms min=1.4ms   med=82.3ms   max=2.19s   p(90)=182.7ms  p(95)=214.65ms p(99.9)=864.11ms
     http_reqs......................: 146566  2367.754707/s
     iteration_duration.............: avg=98.11ms min=2.82ms  med=84.51ms  max=2.19s   p(90)=185.81ms p(95)=219.64ms p(99.9)=889.92ms
     iterations.....................: 145566  2351.599837/s
     success_rate...................: 100.00% ✓ 145566      ✗ 0     
     vus............................: 52      min=0         max=499 
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

     checks.........................: 100.00% ✓ 436317      ✗ 0     
     data_received..................: 13 GB   207 MB/s
     data_sent......................: 176 MB  2.8 MB/s
     http_req_blocked...............: avg=15.65µs  min=942ns   med=2.66µs  max=48ms     p(90)=4.62µs   p(95)=5.87µs   p(99.9)=1.22ms  
     http_req_connecting............: avg=12.26µs  min=0s      med=0s      max=47.92ms  p(90)=0s       p(95)=0s       p(99.9)=1.15ms  
     http_req_duration..............: avg=97.13ms  min=1.57ms  med=92.06ms max=327.84ms p(90)=186.64ms p(95)=201.74ms p(99.9)=248.56ms
       { expected_response:true }...: avg=97.13ms  min=1.57ms  med=92.06ms max=327.84ms p(90)=186.64ms p(95)=201.74ms p(99.9)=248.56ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 146439
     http_req_receiving.............: avg=132.68µs min=24.77µs med=55.64µs max=153.36ms p(90)=141.61µs p(95)=360.33µs p(99.9)=12.03ms 
     http_req_sending...............: avg=66.76µs  min=4.67µs  med=11.31µs max=149.28ms p(90)=22.51µs  p(95)=127.31µs p(99.9)=8.8ms   
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=96.93ms  min=1.51ms  med=91.9ms  max=327.16ms p(90)=186.4ms  p(95)=201.5ms  p(99.9)=248.07ms
     http_reqs......................: 146439  2365.629859/s
     iteration_duration.............: avg=98.05ms  min=3.65ms  med=93.11ms max=358.81ms p(90)=187.11ms p(95)=202.19ms p(99.9)=249.5ms 
     iterations.....................: 145439  2349.475489/s
     success_rate...................: 100.00% ✓ 145439      ✗ 0     
     vus............................: 53      min=0         max=499 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (.net subgraphs) (16.7.0-p.8)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 433614      ✗ 0     
     data_received..................: 13 GB   207 MB/s
     data_sent......................: 175 MB  2.8 MB/s
     http_req_blocked...............: avg=20.77µs min=1.02µs  med=2.89µs   max=67.51ms  p(90)=4.67µs   p(95)=5.86µs   p(99.9)=1.89ms  
     http_req_connecting............: avg=17µs    min=0s      med=0s       max=67.45ms  p(90)=0s       p(95)=0s       p(99.9)=1.82ms  
     http_req_duration..............: avg=97.71ms min=1.45ms  med=91.42ms  max=412.98ms p(90)=188.26ms p(95)=206.17ms p(99.9)=293.27ms
       { expected_response:true }...: avg=97.71ms min=1.45ms  med=91.42ms  max=412.98ms p(90)=188.26ms p(95)=206.17ms p(99.9)=293.27ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 145538
     http_req_receiving.............: avg=1.44ms  min=52.22µs med=145.19µs max=179.72ms p(90)=3.36ms   p(95)=5.36ms   p(99.9)=42.32ms 
     http_req_sending...............: avg=74.34µs min=4.99µs  med=10.65µs  max=229.78ms p(90)=21.54µs  p(95)=122.76µs p(99.9)=9.1ms   
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=96.19ms min=1.37ms  med=89.99ms  max=406.64ms p(90)=186.55ms p(95)=204.52ms p(99.9)=287.11ms
     http_reqs......................: 145538  2355.46937/s
     iteration_duration.............: avg=98.65ms min=4.07ms  med=92.44ms  max=413.18ms p(90)=188.73ms p(95)=206.69ms p(99.9)=295.14ms
     iterations.....................: 144538  2339.284804/s
     success_rate...................: 100.00% ✓ 144538      ✗ 0     
     vus............................: 92      min=0         max=500 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.7.0-p.8)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 432207      ✗ 0     
     data_received..................: 13 GB   206 MB/s
     data_sent......................: 174 MB  2.8 MB/s
     http_req_blocked...............: avg=13.47µs min=852ns   med=2.19µs   max=60.23ms  p(90)=3.68µs   p(95)=4.77µs   p(99.9)=1.5ms   
     http_req_connecting............: avg=10.59µs min=0s      med=0s       max=60.17ms  p(90)=0s       p(95)=0s       p(99.9)=1.44ms  
     http_req_duration..............: avg=98.13ms min=1.49ms  med=86.62ms  max=1.15s    p(90)=187.19ms p(95)=216.14ms p(99.9)=736.68ms
       { expected_response:true }...: avg=98.13ms min=1.49ms  med=86.62ms  max=1.15s    p(90)=187.19ms p(95)=216.14ms p(99.9)=736.68ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 145069
     http_req_receiving.............: avg=1.53ms  min=52.34µs med=107.71µs max=695.53ms p(90)=1.95ms   p(95)=4.84ms   p(99.9)=88.03ms 
     http_req_sending...............: avg=62.84µs min=4.79µs  med=9.34µs   max=216.75ms p(90)=18.09µs  p(95)=102.76µs p(99.9)=7.68ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=96.53ms min=1.41ms  med=85.37ms  max=1.15s    p(90)=185.2ms  p(95)=212.69ms p(99.9)=707.03ms
     http_reqs......................: 145069  2344.918893/s
     iteration_duration.............: avg=99.05ms min=2.66ms  med=87.62ms  max=1.15s    p(90)=187.73ms p(95)=216.81ms p(99.9)=737.24ms
     iterations.....................: 144069  2328.754731/s
     success_rate...................: 100.00% ✓ 144069      ✗ 0     
     vus............................: 97      min=0         max=500 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (.net subgraphs) (16.7.0-p.8)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 415587      ✗ 0     
     data_received..................: 12 GB   196 MB/s
     data_sent......................: 168 MB  2.7 MB/s
     http_req_blocked...............: avg=23.27µs  min=1.04µs  med=3.01µs   max=70.1ms   p(90)=4.89µs   p(95)=6.12µs   p(99.9)=2.1ms   
     http_req_connecting............: avg=19.42µs  min=0s      med=0s       max=69.9ms   p(90)=0s       p(95)=0s       p(99.9)=2.03ms  
     http_req_duration..............: avg=102.03ms min=1.85ms  med=87.5ms   max=1.73s    p(90)=192.79ms p(95)=222.27ms p(99.9)=873.05ms
       { expected_response:true }...: avg=102.03ms min=1.85ms  med=87.5ms   max=1.73s    p(90)=192.79ms p(95)=222.27ms p(99.9)=873.05ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 139529
     http_req_receiving.............: avg=1.34ms   min=52.58µs med=108.59µs max=786.65ms p(90)=1.51ms   p(95)=3.83ms   p(99.9)=88.3ms  
     http_req_sending...............: avg=75.5µs   min=4.96µs  med=12.05µs  max=176.7ms  p(90)=23.61µs  p(95)=126.52µs p(99.9)=9.45ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=100.61ms min=1.72ms  med=86.51ms  max=1.69s    p(90)=191.13ms p(95)=219.04ms p(99.9)=837.96ms
     http_reqs......................: 139529  2238.417648/s
     iteration_duration.............: avg=103.05ms min=3.26ms  med=88.69ms  max=1.73s    p(90)=193.46ms p(95)=223.27ms p(99.9)=873.44ms
     iterations.....................: 138529  2222.374978/s
     success_rate...................: 100.00% ✓ 138529      ✗ 0     
     vus............................: 76      min=0         max=494 
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

     checks.........................: 100.00% ✓ 215460      ✗ 0    
     data_received..................: 6.4 GB  102 MB/s
     data_sent......................: 87 MB   1.4 MB/s
     http_req_blocked...............: avg=5.85µs   min=982ns   med=2.6µs    max=7.57ms   p(90)=4.5µs    p(95)=5.5µs    p(99.9)=584.9µs 
     http_req_connecting............: avg=2.54µs   min=0s      med=0s       max=7.52ms   p(90)=0s       p(95)=0s       p(99.9)=502.52µs
     http_req_duration..............: avg=195.95ms min=2.05ms  med=196.42ms max=574.05ms p(90)=361.95ms p(95)=388.06ms p(99.9)=507.43ms
       { expected_response:true }...: avg=195.95ms min=2.05ms  med=196.42ms max=574.05ms p(90)=361.95ms p(95)=388.06ms p(99.9)=507.43ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 72820
     http_req_receiving.............: avg=78.12µs  min=27.78µs med=63.5µs   max=90.96ms  p(90)=105.24µs p(95)=121.08µs p(99.9)=1.04ms  
     http_req_sending...............: avg=32.34µs  min=5.22µs  med=11.66µs  max=141.68ms p(90)=19.42µs  p(95)=23.27µs  p(99.9)=3.16ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=195.84ms min=1.94ms  med=196.31ms max=573.98ms p(90)=361.86ms p(95)=387.98ms p(99.9)=507.36ms
     http_reqs......................: 72820   1163.210003/s
     iteration_duration.............: avg=198.93ms min=4.71ms  med=199.81ms max=574.25ms p(90)=362.83ms p(95)=388.89ms p(99.9)=507.85ms
     iterations.....................: 71820   1147.236232/s
     success_rate...................: 100.00% ✓ 71820       ✗ 0    
     vus............................: 84      min=0         max=496
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

     checks.........................: 100.00% ✓ 98469      ✗ 0    
     data_received..................: 3.0 GB  46 MB/s
     data_sent......................: 41 MB   627 kB/s
     http_req_blocked...............: avg=9.11µs   min=1.24µs  med=3.31µs   max=3.98ms   p(90)=5.02µs   p(95)=6.11µs   p(99.9)=1.43ms
     http_req_connecting............: avg=4.73µs   min=0s      med=0s       max=3.92ms   p(90)=0s       p(95)=0s       p(99.9)=1.4ms 
     http_req_duration..............: avg=424.32ms min=3.81ms  med=395.64ms max=1.84s    p(90)=837.02ms p(95)=906.02ms p(99.9)=1.37s 
       { expected_response:true }...: avg=424.32ms min=3.81ms  med=395.64ms max=1.84s    p(90)=837.02ms p(95)=906.02ms p(99.9)=1.37s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 33823
     http_req_receiving.............: avg=89.94µs  min=32µs    med=77.75µs  max=92.68ms  p(90)=116.76µs p(95)=131.14µs p(99.9)=1.05ms
     http_req_sending...............: avg=33.4µs   min=5.88µs  med=15.71µs  max=136.24ms p(90)=22.56µs  p(95)=25.75µs  p(99.9)=2.68ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=424.2ms  min=3.75ms  med=395.54ms max=1.84s    p(90)=836.91ms p(95)=905.93ms p(99.9)=1.37s 
     http_reqs......................: 33823   522.215525/s
     iteration_duration.............: avg=437.48ms min=15.44ms med=412ms    max=1.84s    p(90)=840.8ms  p(95)=908.34ms p(99.9)=1.38s 
     iterations.....................: 32823   506.775868/s
     success_rate...................: 100.00% ✓ 32823      ✗ 0    
     vus............................: 93      min=0        max=500
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

     checks.........................: 100.00% ✓ 45603      ✗ 0    
     data_received..................: 1.4 GB  21 MB/s
     data_sent......................: 19 MB   288 kB/s
     http_req_blocked...............: avg=14.24µs  min=1.22µs  med=3.7µs    max=8.1ms   p(90)=5.48µs   p(95)=7.05µs   p(99.9)=2.26ms
     http_req_connecting............: avg=8.77µs   min=0s      med=0s       max=8.04ms  p(90)=0s       p(95)=0s       p(99.9)=2.23ms
     http_req_duration..............: avg=899.33ms min=5.61ms  med=808.59ms max=4.89s   p(90)=1.78s    p(95)=2.03s    p(99.9)=4.39s 
       { expected_response:true }...: avg=899.33ms min=5.61ms  med=808.59ms max=4.89s   p(90)=1.78s    p(95)=2.03s    p(99.9)=4.39s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 16201
     http_req_receiving.............: avg=139.45µs min=33.72µs med=91.35µs  max=92.93ms p(90)=129.57µs p(95)=145.02µs p(99.9)=2.65ms
     http_req_sending...............: avg=25.56µs  min=5.82µs  med=18.23µs  max=7.63ms  p(90)=23.73µs  p(95)=28.33µs  p(99.9)=1.91ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=899.17ms min=5.5ms   med=808.5ms  max=4.89s   p(90)=1.78s    p(95)=2.03s    p(99.9)=4.39s 
     http_reqs......................: 16201   239.591758/s
     iteration_duration.............: avg=958.51ms min=42.01ms med=878.96ms max=4.89s   p(90)=1.8s     p(95)=2.05s    p(99.9)=4.46s 
     iterations.....................: 15201   224.803056/s
     success_rate...................: 100.00% ✓ 15201      ✗ 0    
     vus............................: 81      min=0        max=500
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

     checks.........................: 100.00% ✓ 45717      ✗ 0    
     data_received..................: 1.4 GB  21 MB/s
     data_sent......................: 20 MB   284 kB/s
     http_req_blocked...............: avg=15.54µs  min=1.33µs  med=3.62µs   max=17.07ms  p(90)=5.43µs   p(95)=7.08µs   p(99.9)=2.17ms
     http_req_connecting............: avg=10.06µs  min=0s      med=0s       max=17.02ms  p(90)=0s       p(95)=0s       p(99.9)=2.13ms
     http_req_duration..............: avg=894.72ms min=7.77ms  med=821.85ms max=3.04s    p(90)=1.84s    p(95)=1.95s    p(99.9)=2.8s  
       { expected_response:true }...: avg=894.72ms min=7.77ms  med=821.85ms max=3.04s    p(90)=1.84s    p(95)=1.95s    p(99.9)=2.8s  
     http_req_failed................: 0.00%   ✓ 0          ✗ 16239
     http_req_receiving.............: avg=110.39µs min=35.87µs med=92.86µs  max=100.99ms p(90)=134.53µs p(95)=152.15µs p(99.9)=1.2ms 
     http_req_sending...............: avg=48.73µs  min=5.77µs  med=18.34µs  max=177.64ms p(90)=24.3µs   p(95)=29.43µs  p(99.9)=2.95ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=894.56ms min=7.68ms  med=821.74ms max=3.04s    p(90)=1.84s    p(95)=1.95s    p(99.9)=2.8s  
     http_reqs......................: 16239   236.245737/s
     iteration_duration.............: avg=953.44ms min=18.2ms  med=891.06ms max=3.04s    p(90)=1.85s    p(95)=1.97s    p(99.9)=2.81s 
     iterations.....................: 15239   221.69769/s
     success_rate...................: 100.00% ✓ 15239      ✗ 0    
     vus............................: 95      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

