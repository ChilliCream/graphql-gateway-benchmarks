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
| hive-router | v0.0.84 | 2,923 | 3,070 | 2,894 | 2.1% |  |
| fusion-nightly-net11 | 16.6.2-p.4 | 2,654 | 2,750 | 2,643 | 1.4% |  |
| fusion-nightly | 16.6.2-p.4 | 2,533 | 2,654 | 2,521 | 1.9% |  |
| fusion | 16.6.1 | 2,478 | 2,586 | 2,455 | 1.8% |  |
| fusion-nightly-fed | 16.6.2-p.4 | 2,322 | 2,431 | 2,283 | 2.0% |  |
| cosmo | 0.334.0 | 1,197 | 1,242 | 1,186 | 1.7% |  |
| hive-gateway-router-runtime | 2.10.8 | 575 | 588 | 569 | 1.0% |  |
| hive-gateway | 2.10.8 | 254 | 259 | 251 | 0.8% |  |
| apollo-gateway | 2.14.3 | 233 | 241 | 232 | 1.2% |  |
| apollo-router | v2.16.1 | — | — | — | — | non-compatible response (8750 across 9/9 runs) |
| feddi | — | — | — | — | — | not run |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (496014 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| fusion-nightly-net11 | 16.6.2-p.4 | 2,509 | 2,605 | 2,501 | 1.4% |  |
| fusion | 16.6.1 | 2,412 | 2,505 | 2,401 | 1.5% |  |
| fusion-nightly | 16.6.2-p.4 | 2,365 | 2,455 | 2,343 | 1.6% |  |
| hive-router | v0.0.84 | 2,207 | 2,375 | 2,182 | 2.9% |  |
| fusion-nightly-fed | 16.6.2-p.4 | 2,150 | 2,247 | 2,140 | 1.7% |  |
| cosmo | 0.334.0 | 1,121 | 1,162 | 1,110 | 1.7% |  |
| hive-gateway-router-runtime | 2.10.8 | 532 | 544 | 530 | 0.8% |  |
| hive-gateway | 2.10.8 | 243 | 251 | 241 | 1.5% |  |
| apollo-gateway | 2.14.3 | 235 | 241 | 234 | 1.0% |  |
| apollo-router | v2.16.1 | — | — | — | — | non-compatible response (23432 across 9/9 runs) |
| feddi | — | — | — | — | — | not run |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (336519 across 9/9 runs) |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.84)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 537537      ✗ 0     
     data_received..................: 16 GB   257 MB/s
     data_sent......................: 216 MB  3.5 MB/s
     http_req_blocked...............: avg=27.96µs  min=1.02µs  med=2.7µs   max=65ms     p(90)=4.4µs    p(95)=5.62µs   p(99.9)=3.07ms  
     http_req_connecting............: avg=24.44µs  min=0s      med=0s      max=64.92ms  p(90)=0s       p(95)=0s       p(99.9)=2.96ms  
     http_req_duration..............: avg=78.82ms  min=1.41ms  med=73.36ms max=286.98ms p(90)=152.98ms p(95)=171.32ms p(99.9)=233.07ms
       { expected_response:true }...: avg=78.82ms  min=1.41ms  med=73.36ms max=286.98ms p(90)=152.98ms p(95)=171.32ms p(99.9)=233.07ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 180179
     http_req_receiving.............: avg=191.53µs min=24.23µs med=51.18µs max=79.33ms  p(90)=168.86µs p(95)=363.14µs p(99.9)=26.59ms 
     http_req_sending...............: avg=79.71µs  min=4.68µs  med=10.09µs max=88.47ms  p(90)=19.11µs  p(95)=125.78µs p(99.9)=11.35ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=78.55ms  min=1.35ms  med=73.14ms max=286.79ms p(90)=152.66ms p(95)=170.69ms p(99.9)=231.31ms
     http_reqs......................: 180179  2923.954735/s
     iteration_duration.............: avg=79.55ms  min=2.09ms  med=74.15ms max=340.37ms p(90)=153.48ms p(95)=171.89ms p(99.9)=234.13ms
     iterations.....................: 179179  2907.72668/s
     success_rate...................: 100.00% ✓ 179179      ✗ 0     
     vus............................: 84      min=0         max=493 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (rust subgraphs) (16.6.2-p.4)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 492309      ✗ 0     
     data_received..................: 15 GB   233 MB/s
     data_sent......................: 198 MB  3.2 MB/s
     http_req_blocked...............: avg=25.18µs  min=862ns   med=2.61µs   max=85.78ms  p(90)=4.2µs    p(95)=5.36µs   p(99.9)=2.37ms  
     http_req_connecting............: avg=21.44µs  min=0s      med=0s       max=63.72ms  p(90)=0s       p(95)=0s       p(99.9)=1.86ms  
     http_req_duration..............: avg=86.08ms  min=1.86ms  med=80.76ms  max=388.07ms p(90)=165.81ms p(95)=184.87ms p(99.9)=248.03ms
       { expected_response:true }...: avg=86.08ms  min=1.86ms  med=80.76ms  max=388.07ms p(90)=165.81ms p(95)=184.87ms p(99.9)=248.03ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 165103
     http_req_receiving.............: avg=569.94µs min=52.66µs med=100.66µs max=99.15ms  p(90)=1.04ms   p(95)=1.88ms   p(99.9)=26.69ms 
     http_req_sending...............: avg=79.01µs  min=4.45µs  med=9.8µs    max=254.05ms p(90)=19.08µs  p(95)=122.53µs p(99.9)=11.68ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=85.43ms  min=1.77ms  med=80.04ms  max=387.57ms p(90)=165.1ms  p(95)=184.12ms p(99.9)=246.22ms
     http_reqs......................: 165103  2654.712123/s
     iteration_duration.............: avg=86.88ms  min=3.92ms  med=81.65ms  max=388.27ms p(90)=166.36ms p(95)=185.46ms p(99.9)=249.2ms 
     iterations.....................: 164103  2638.632996/s
     success_rate...................: 100.00% ✓ 164103      ✗ 0     
     vus............................: 65      min=0         max=496 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (rust subgraphs) (16.6.2-p.4)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 470991      ✗ 0     
     data_received..................: 14 GB   222 MB/s
     data_sent......................: 190 MB  3.0 MB/s
     http_req_blocked...............: avg=29.18µs min=821ns   med=2.11µs  max=216.04ms p(90)=3.58µs   p(95)=4.68µs   p(99.9)=4.33ms  
     http_req_connecting............: avg=25.06µs min=0s      med=0s      max=101.16ms p(90)=0s       p(95)=0s       p(99.9)=4.26ms  
     http_req_duration..............: avg=89.99ms min=1.95ms  med=79.46ms max=1.43s    p(90)=169.16ms p(95)=196.86ms p(99.9)=701.4ms 
       { expected_response:true }...: avg=89.99ms min=1.95ms  med=79.46ms max=1.43s    p(90)=169.16ms p(95)=196.86ms p(99.9)=701.4ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 157997
     http_req_receiving.............: avg=1.33ms  min=50.03µs med=94.84µs max=873.1ms  p(90)=1.43ms   p(95)=4.09ms   p(99.9)=77.9ms  
     http_req_sending...............: avg=71.51µs min=4.48µs  med=8.91µs  max=165.32ms p(90)=17.45µs  p(95)=104.31µs p(99.9)=9.28ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=88.58ms min=1.88ms  med=78.34ms max=1.43s    p(90)=167.23ms p(95)=193.91ms p(99.9)=691.68ms
     http_reqs......................: 157997  2533.524379/s
     iteration_duration.............: avg=90.82ms min=3.78ms  med=80.32ms max=1.43s    p(90)=169.73ms p(95)=197.61ms p(99.9)=701.87ms
     iterations.....................: 156997  2517.48911/s
     success_rate...................: 100.00% ✓ 156997      ✗ 0     
     vus............................: 73      min=0         max=494 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (rust subgraphs) (16.6.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 460593      ✗ 0     
     data_received..................: 14 GB   217 MB/s
     data_sent......................: 186 MB  3.0 MB/s
     http_req_blocked...............: avg=20.61µs min=1.01µs  med=2.51µs  max=80.93ms  p(90)=3.97µs   p(95)=5.01µs   p(99.9)=2.11ms  
     http_req_connecting............: avg=17.47µs min=0s      med=0s      max=80.69ms  p(90)=0s       p(95)=0s       p(99.9)=1.99ms  
     http_req_duration..............: avg=92.05ms min=1.94ms  med=79.22ms max=1.05s    p(90)=181.15ms p(95)=209.65ms p(99.9)=537.43ms
       { expected_response:true }...: avg=92.05ms min=1.94ms  med=79.22ms max=1.05s    p(90)=181.15ms p(95)=209.65ms p(99.9)=537.43ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 154531
     http_req_receiving.............: avg=1.48ms  min=52.95µs med=99.48µs max=530.29ms p(90)=1.62ms   p(95)=4.69ms   p(99.9)=93.98ms 
     http_req_sending...............: avg=70.03µs min=4.73µs  med=9.49µs  max=115.72ms p(90)=16.97µs  p(95)=112.79µs p(99.9)=9.87ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=90.49ms min=1.85ms  med=78.09ms max=1.05s    p(90)=178.89ms p(95)=205.92ms p(99.9)=527.13ms
     http_reqs......................: 154531  2478.358611/s
     iteration_duration.............: avg=92.9ms  min=3.18ms  med=80.27ms max=1.05s    p(90)=181.76ms p(95)=210.44ms p(99.9)=537.98ms
     iterations.....................: 153531  2462.320673/s
     success_rate...................: 100.00% ✓ 153531      ✗ 0     
     vus............................: 73      min=0         max=494 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (rust subgraphs) (16.6.2-p.4)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 429414      ✗ 0     
     data_received..................: 13 GB   204 MB/s
     data_sent......................: 173 MB  2.8 MB/s
     http_req_blocked...............: avg=14.67µs min=871ns   med=2.03µs   max=69.62ms  p(90)=3.42µs   p(95)=4.42µs   p(99.9)=970.83µs
     http_req_connecting............: avg=11.85µs min=0s      med=0s       max=69.41ms  p(90)=0s       p(95)=0s       p(99.9)=886.04µs
     http_req_duration..............: avg=98.75ms min=1.64ms  med=85.73ms  max=2.11s    p(90)=187.6ms  p(95)=218.09ms p(99.9)=729.93ms
       { expected_response:true }...: avg=98.75ms min=1.64ms  med=85.73ms  max=2.11s    p(90)=187.6ms  p(95)=218.09ms p(99.9)=729.93ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 144138
     http_req_receiving.............: avg=1.42ms  min=51.45µs med=100.01µs max=1.81s    p(90)=1.7ms    p(95)=4.3ms    p(99.9)=101.24ms
     http_req_sending...............: avg=57.63µs min=4.74µs  med=8.83µs   max=165.26ms p(90)=16.51µs  p(95)=94.02µs  p(99.9)=8.04ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=97.27ms min=1.58ms  med=84.7ms   max=2.11s    p(90)=185.68ms p(95)=214.51ms p(99.9)=686.88ms
     http_reqs......................: 144138  2322.652579/s
     iteration_duration.............: avg=99.68ms min=2.74ms  med=86.88ms  max=2.11s    p(90)=188.1ms  p(95)=218.92ms p(99.9)=731.91ms
     iterations.....................: 143138  2306.53849/s
     success_rate...................: 100.00% ✓ 143138      ✗ 0     
     vus............................: 59      min=0         max=497 
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

     checks.........................: 100.00% ✓ 221613      ✗ 0    
     data_received..................: 6.6 GB  105 MB/s
     data_sent......................: 90 MB   1.4 MB/s
     http_req_blocked...............: avg=5.36µs  min=972ns   med=2.05µs   max=17.79ms  p(90)=3.55µs   p(95)=4.43µs   p(99.9)=509.64µs
     http_req_connecting............: avg=2.68µs  min=0s      med=0s       max=17.73ms  p(90)=0s       p(95)=0s       p(99.9)=469.27µs
     http_req_duration..............: avg=190.6ms min=1.95ms  med=191.32ms max=482.29ms p(90)=352.29ms p(95)=376.16ms p(99.9)=447.72ms
       { expected_response:true }...: avg=190.6ms min=1.95ms  med=191.32ms max=482.29ms p(90)=352.29ms p(95)=376.16ms p(99.9)=447.72ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 74871
     http_req_receiving.............: avg=71.18µs min=27.67µs med=57.8µs   max=171.43ms p(90)=93.72µs  p(95)=108.57µs p(99.9)=880.78µs
     http_req_sending...............: avg=31.14µs min=4.91µs  med=9.71µs   max=210.69ms p(90)=15.83µs  p(95)=19.62µs  p(99.9)=2.86ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=190.5ms min=1.86ms  med=191.21ms max=482.24ms p(90)=352.21ms p(95)=376.08ms p(99.9)=447.66ms
     http_reqs......................: 74871   1197.510466/s
     iteration_duration.............: avg=193.4ms min=4.21ms  med=194.32ms max=482.47ms p(90)=353.08ms p(95)=376.7ms  p(99.9)=448.09ms
     iterations.....................: 73871   1181.516149/s
     success_rate...................: 100.00% ✓ 73871       ✗ 0    
     vus............................: 80      min=0         max=494
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

     checks.........................: 100.00% ✓ 108021     ✗ 0    
     data_received..................: 3.3 GB  51 MB/s
     data_sent......................: 44 MB   691 kB/s
     http_req_blocked...............: avg=7.57µs   min=1.11µs  med=3.13µs   max=3.95ms   p(90)=4.89µs   p(95)=5.99µs   p(99.9)=885.46µs
     http_req_connecting............: avg=3.47µs   min=0s      med=0s       max=3.79ms   p(90)=0s       p(95)=0s       p(99.9)=827.42µs
     http_req_duration..............: avg=387.58ms min=3.46ms  med=359.24ms max=1.75s    p(90)=767.39ms p(95)=830.88ms p(99.9)=1.18s   
       { expected_response:true }...: avg=387.58ms min=3.46ms  med=359.24ms max=1.75s    p(90)=767.39ms p(95)=830.88ms p(99.9)=1.18s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 37007
     http_req_receiving.............: avg=82.51µs  min=30.12µs med=70.77µs  max=9.95ms   p(90)=110.98µs p(95)=126.49µs p(99.9)=1.16ms  
     http_req_sending...............: avg=30.67µs  min=5.28µs  med=14.33µs  max=129.04ms p(90)=22.13µs  p(95)=25.29µs  p(99.9)=2.71ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=387.47ms min=3.4ms   med=359.15ms max=1.75s    p(90)=767.2ms  p(95)=830.75ms p(99.9)=1.18s   
     http_reqs......................: 37007   575.495307/s
     iteration_duration.............: avg=398.58ms min=25.63ms med=370.73ms max=1.75s    p(90)=770.84ms p(95)=833.08ms p(99.9)=1.19s   
     iterations.....................: 36007   559.944322/s
     success_rate...................: 100.00% ✓ 36007      ✗ 0    
     vus............................: 72      min=0        max=495
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

     checks.........................: 100.00% ✓ 48348      ✗ 0    
     data_received..................: 1.5 GB  22 MB/s
     data_sent......................: 21 MB   306 kB/s
     http_req_blocked...............: avg=10.6µs   min=1.18µs  med=3.79µs   max=10.07ms p(90)=5.6µs    p(95)=6.97µs   p(99.9)=764.72µs
     http_req_connecting............: avg=5.19µs   min=0s      med=0s       max=9.9ms   p(90)=0s       p(95)=0s       p(99.9)=720.77µs
     http_req_duration..............: avg=834.23ms min=5.53ms  med=717.45ms max=19.11s  p(90)=1.43s    p(95)=1.59s    p(99.9)=16.82s  
       { expected_response:true }...: avg=834.23ms min=5.53ms  med=717.45ms max=19.11s  p(90)=1.43s    p(95)=1.59s    p(99.9)=16.82s  
     http_req_failed................: 0.00%   ✓ 0          ✗ 17116
     http_req_receiving.............: avg=102.92µs min=36.35µs med=93.96µs  max=13.02ms p(90)=130.87µs p(95)=146.04µs p(99.9)=1.41ms  
     http_req_sending...............: avg=27.94µs  min=5.65µs  med=18.47µs  max=7.93ms  p(90)=24.13µs  p(95)=28.36µs  p(99.9)=2.81ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=834.1ms  min=5.4ms   med=717.32ms max=19.11s  p(90)=1.43s    p(95)=1.59s    p(99.9)=16.82s  
     http_reqs......................: 17116   254.392849/s
     iteration_duration.............: avg=886.02ms min=48.35ms med=770.68ms max=19.12s  p(90)=1.46s    p(95)=1.59s    p(99.9)=17.18s  
     iterations.....................: 16116   239.529981/s
     success_rate...................: 100.00% ✓ 16116      ✗ 0    
     vus............................: 67      min=0        max=498
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

     checks.........................: 100.00% ✓ 48345      ✗ 0    
     data_received..................: 1.5 GB  21 MB/s
     data_sent......................: 21 MB   286 kB/s
     http_req_blocked...............: avg=15.38µs  min=1.27µs  med=3.36µs   max=12.63ms p(90)=5.05µs   p(95)=6.47µs   p(99.9)=2.34ms
     http_req_connecting............: avg=10.32µs  min=0s      med=0s       max=12.57ms p(90)=0s       p(95)=0s       p(99.9)=2.32ms
     http_req_duration..............: avg=389.09ms min=7.51ms  med=446.94ms max=1.12s   p(90)=659.87ms p(95)=708.37ms p(99.9)=1s    
       { expected_response:true }...: avg=389.09ms min=7.51ms  med=446.94ms max=1.12s   p(90)=659.87ms p(95)=708.37ms p(99.9)=1s    
     http_req_failed................: 0.00%   ✓ 0          ✗ 17115
     http_req_receiving.............: avg=97.24µs  min=33.34µs med=83.92µs  max=58.8ms  p(90)=121.71µs p(95)=136.48µs p(99.9)=1.09ms
     http_req_sending...............: avg=35.46µs  min=6.14µs  med=16.8µs   max=78.5ms  p(90)=22.58µs  p(95)=26.87µs  p(99.9)=2.63ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=388.96ms min=7.39ms  med=446.85ms max=1.12s   p(90)=659.78ms p(95)=708.23ms p(99.9)=1s    
     http_reqs......................: 17115   233.88318/s
     iteration_duration.............: avg=413.21ms min=12.28ms med=466.83ms max=1.12s   p(90)=664.53ms p(95)=711.41ms p(99.9)=1s    
     iterations.....................: 16115   220.217788/s
     success_rate...................: 100.00% ✓ 16115      ✗ 0    
     vus............................: 58      min=0        max=496
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (.net subgraphs) (16.6.2-p.4)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 461754      ✗ 0     
     data_received..................: 14 GB   220 MB/s
     data_sent......................: 186 MB  3.0 MB/s
     http_req_blocked...............: avg=23.58µs  min=1.02µs  med=2.94µs   max=61.57ms  p(90)=4.72µs   p(95)=5.96µs   p(99.9)=2.58ms  
     http_req_connecting............: avg=19.89µs  min=0s      med=0s       max=61.41ms  p(90)=0s       p(95)=0s       p(99.9)=2.5ms   
     http_req_duration..............: avg=91.75ms  min=1.42ms  med=86.13ms  max=325.58ms p(90)=177.73ms p(95)=194.3ms  p(99.9)=252.42ms
       { expected_response:true }...: avg=91.75ms  min=1.42ms  med=86.13ms  max=325.58ms p(90)=177.73ms p(95)=194.3ms  p(99.9)=252.42ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 154918
     http_req_receiving.............: avg=617.31µs min=52.81µs med=105.32µs max=92.31ms  p(90)=1.17ms   p(95)=2.13ms   p(99.9)=28.1ms  
     http_req_sending...............: avg=81.91µs  min=4.74µs  med=10.83µs  max=219.67ms p(90)=21.82µs  p(95)=128.61µs p(99.9)=11.8ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=91.05ms  min=1.31ms  med=85.42ms  max=325.34ms p(90)=177.06ms p(95)=193.62ms p(99.9)=251.54ms
     http_reqs......................: 154918  2509.004328/s
     iteration_duration.............: avg=92.64ms  min=3.32ms  med=87.02ms  max=337.13ms p(90)=178.33ms p(95)=194.93ms p(99.9)=253.62ms
     iterations.....................: 153918  2492.808635/s
     success_rate...................: 100.00% ✓ 153918      ✗ 0     
     vus............................: 90      min=0         max=499 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (.net subgraphs) (16.6.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 444774      ✗ 0     
     data_received..................: 13 GB   211 MB/s
     data_sent......................: 179 MB  2.9 MB/s
     http_req_blocked...............: avg=17.5µs  min=852ns   med=2.24µs   max=81.93ms  p(90)=3.93µs   p(95)=5.09µs   p(99.9)=1.85ms  
     http_req_connecting............: avg=14.44µs min=0s      med=0s       max=81.86ms  p(90)=0s       p(95)=0s       p(99.9)=1.73ms  
     http_req_duration..............: avg=95.31ms min=1.51ms  med=83.07ms  max=1.44s    p(90)=179.42ms p(95)=214.63ms p(99.9)=800.27ms
       { expected_response:true }...: avg=95.31ms min=1.51ms  med=83.07ms  max=1.44s    p(90)=179.42ms p(95)=214.63ms p(99.9)=800.27ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 149258
     http_req_receiving.............: avg=1.72ms  min=50.81µs med=102.15µs max=876.63ms p(90)=1.85ms   p(95)=5.09ms   p(99.9)=125.59ms
     http_req_sending...............: avg=63.39µs min=4.95µs  med=9.47µs   max=137.93ms p(90)=19.75µs  p(95)=107.68µs p(99.9)=8.62ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=93.52ms min=1.43ms  med=81.91ms  max=1.44s    p(90)=176.93ms p(95)=210.4ms  p(99.9)=788.55ms
     http_reqs......................: 149258  2412.091763/s
     iteration_duration.............: avg=96.23ms min=2.49ms  med=84.06ms  max=1.44s    p(90)=180.08ms p(95)=215.34ms p(99.9)=806.16ms
     iterations.....................: 148258  2395.93121/s
     success_rate...................: 100.00% ✓ 148258      ✗ 0     
     vus............................: 51      min=0         max=499 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.6.2-p.4)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 436320      ✗ 0     
     data_received..................: 13 GB   207 MB/s
     data_sent......................: 176 MB  2.8 MB/s
     http_req_blocked...............: avg=16.81µs min=911ns   med=2.3µs    max=60.79ms  p(90)=3.98µs   p(95)=5.14µs   p(99.9)=1.74ms  
     http_req_connecting............: avg=13.42µs min=0s      med=0s       max=58.87ms  p(90)=0s       p(95)=0s       p(99.9)=1.7ms   
     http_req_duration..............: avg=97.17ms min=1.45ms  med=83.42ms  max=1.84s    p(90)=181.27ms p(95)=211.75ms p(99.9)=1.11s   
       { expected_response:true }...: avg=97.17ms min=1.45ms  med=83.42ms  max=1.84s    p(90)=181.27ms p(95)=211.75ms p(99.9)=1.11s   
     http_req_failed................: 0.00%   ✓ 0           ✗ 146440
     http_req_receiving.............: avg=1.77ms  min=51.67µs med=106.88µs max=1.23s    p(90)=2.01ms   p(95)=5.26ms   p(99.9)=115.88ms
     http_req_sending...............: avg=61.6µs  min=4.6µs   med=9.53µs   max=142.98ms p(90)=19.27µs  p(95)=101.67µs p(99.9)=8.3ms   
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=95.33ms min=1.38ms  med=82.09ms  max=1.84s    p(90)=179.19ms p(95)=208.24ms p(99.9)=1.09s   
     http_reqs......................: 146440  2365.894314/s
     iteration_duration.............: avg=98.1ms  min=2.86ms  med=84.53ms  max=1.84s    p(90)=181.84ms p(95)=212.51ms p(99.9)=1.11s   
     iterations.....................: 145440  2349.738248/s
     success_rate...................: 100.00% ✓ 145440      ✗ 0     
     vus............................: 51      min=0         max=499 
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

     checks.........................: 100.00% ✓ 407880      ✗ 0     
     data_received..................: 12 GB   193 MB/s
     data_sent......................: 165 MB  2.7 MB/s
     http_req_blocked...............: avg=14.88µs  min=1.07µs  med=2.95µs   max=41.9ms   p(90)=4.7µs    p(95)=5.9µs    p(99.9)=1.55ms  
     http_req_connecting............: avg=11.09µs  min=0s      med=0s       max=34.34ms  p(90)=0s       p(95)=0s       p(99.9)=1.42ms  
     http_req_duration..............: avg=103.88ms min=1.55ms  med=99.03ms  max=310.41ms p(90)=201.25ms p(95)=217.93ms p(99.9)=262.38ms
       { expected_response:true }...: avg=103.88ms min=1.55ms  med=99.03ms  max=310.41ms p(90)=201.25ms p(95)=217.93ms p(99.9)=262.38ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 136960
     http_req_receiving.............: avg=125.04µs min=28.51µs med=59.01µs  max=56.66ms  p(90)=144.14µs p(95)=368.42µs p(99.9)=9.12ms  
     http_req_sending...............: avg=65.45µs  min=4.86µs  med=11.63µs  max=109.55ms p(90)=21.3µs   p(95)=131.02µs p(99.9)=8.17ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=103.69ms min=1.47ms  med=98.82ms  max=310.34ms p(90)=201.04ms p(95)=217.72ms p(99.9)=261.57ms
     http_reqs......................: 136960  2207.724646/s
     iteration_duration.............: avg=104.9ms  min=4.64ms  med=100.28ms max=340.63ms p(90)=201.72ms p(95)=218.38ms p(99.9)=263.28ms
     iterations.....................: 135960  2191.605161/s
     success_rate...................: 100.00% ✓ 135960      ✗ 0     
     vus............................: 58      min=0         max=498 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (.net subgraphs) (16.6.2-p.4)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 398286      ✗ 0     
     data_received..................: 12 GB   189 MB/s
     data_sent......................: 161 MB  2.6 MB/s
     http_req_blocked...............: avg=13.82µs  min=861ns   med=2.33µs   max=54.31ms  p(90)=4.2µs    p(95)=5.33µs   p(99.9)=1.38ms  
     http_req_connecting............: avg=10.71µs  min=0s      med=0s       max=54.25ms  p(90)=0s       p(95)=0s       p(99.9)=1.29ms  
     http_req_duration..............: avg=106.45ms min=1.84ms  med=92.72ms  max=1.78s    p(90)=198.77ms p(95)=230.53ms p(99.9)=825.23ms
       { expected_response:true }...: avg=106.45ms min=1.84ms  med=92.72ms  max=1.78s    p(90)=198.77ms p(95)=230.53ms p(99.9)=825.23ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 133762
     http_req_receiving.............: avg=1.8ms    min=52.64µs med=112.45µs max=631.17ms p(90)=1.72ms   p(95)=4.18ms   p(99.9)=179.74ms
     http_req_sending...............: avg=57.88µs  min=4.83µs  med=9.97µs   max=102.56ms p(90)=20.92µs  p(95)=98.54µs  p(99.9)=7.58ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=104.59ms min=1.73ms  med=91.53ms  max=1.76s    p(90)=196.04ms p(95)=226.56ms p(99.9)=713.08ms
     http_reqs......................: 133762  2150.230473/s
     iteration_duration.............: avg=107.51ms min=3.2ms   med=93.9ms   max=1.78s    p(90)=199.4ms  p(95)=231.37ms p(99.9)=829.64ms
     iterations.....................: 132762  2134.155426/s
     success_rate...................: 100.00% ✓ 132762      ✗ 0     
     vus............................: 70      min=0         max=496 
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

     checks.........................: 100.00% ✓ 207711      ✗ 0    
     data_received..................: 6.1 GB  98 MB/s
     data_sent......................: 84 MB   1.3 MB/s
     http_req_blocked...............: avg=5.78µs   min=1µs     med=2.29µs   max=11.98ms  p(90)=4.04µs   p(95)=5.04µs   p(99.9)=680.34µs
     http_req_connecting............: avg=2.76µs   min=0s      med=0s       max=11.79ms  p(90)=0s       p(95)=0s       p(99.9)=576.78µs
     http_req_duration..............: avg=203.18ms min=1.95ms  med=203.87ms max=524.48ms p(90)=375.15ms p(95)=401.58ms p(99.9)=488.17ms
       { expected_response:true }...: avg=203.18ms min=1.95ms  med=203.87ms max=524.48ms p(90)=375.15ms p(95)=401.58ms p(99.9)=488.17ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 70237
     http_req_receiving.............: avg=80.04µs  min=29.65µs med=65.51µs  max=36.6ms   p(90)=106.97µs p(95)=123.07µs p(99.9)=1.2ms   
     http_req_sending...............: avg=28.43µs  min=4.95µs  med=11.2µs   max=94.22ms  p(90)=18.84µs  p(95)=22.51µs  p(99.9)=3.14ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=203.07ms min=1.89ms  med=203.74ms max=524.41ms p(90)=375.02ms p(95)=401.47ms p(99.9)=488.1ms 
     http_reqs......................: 70237   1121.359842/s
     iteration_duration.............: avg=206.34ms min=5.19ms  med=207.06ms max=524.65ms p(90)=375.97ms p(95)=402.35ms p(99.9)=488.66ms
     iterations.....................: 69237   1105.39447/s
     success_rate...................: 100.00% ✓ 69237       ✗ 0    
     vus............................: 86      min=0         max=496
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

     checks.........................: 100.00% ✓ 100041     ✗ 0    
     data_received..................: 3.0 GB  47 MB/s
     data_sent......................: 41 MB   639 kB/s
     http_req_blocked...............: avg=7.86µs   min=992ns   med=2.49µs   max=7.52ms   p(90)=4.21µs   p(95)=5.18µs   p(99.9)=1.32ms  
     http_req_connecting............: avg=4.38µs   min=0s      med=0s       max=7.45ms   p(90)=0s       p(95)=0s       p(99.9)=1.3ms   
     http_req_duration..............: avg=417.98ms min=3.75ms  med=384.84ms max=1.91s    p(90)=825.98ms p(95)=892.58ms p(99.9)=1.41s   
       { expected_response:true }...: avg=417.98ms min=3.75ms  med=384.84ms max=1.91s    p(90)=825.98ms p(95)=892.58ms p(99.9)=1.41s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 34347
     http_req_receiving.............: avg=83.53µs  min=30.1µs  med=70.35µs  max=117.72ms p(90)=109.03µs p(95)=122.6µs  p(99.9)=890.48µs
     http_req_sending...............: avg=28.77µs  min=5.11µs  med=12.61µs  max=104.46ms p(90)=20.14µs  p(95)=23.13µs  p(99.9)=2.49ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=417.87ms min=3.69ms  med=384.75ms max=1.91s    p(90)=825.86ms p(95)=892.49ms p(99.9)=1.41s   
     http_reqs......................: 34347   532.422623/s
     iteration_duration.............: avg=430.75ms min=29.65ms med=401.88ms max=1.91s    p(90)=829.45ms p(95)=895.46ms p(99.9)=1.43s   
     iterations.....................: 33347   516.921338/s
     success_rate...................: 100.00% ✓ 33347      ✗ 0    
     vus............................: 79      min=0        max=498
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

     checks.........................: 100.00% ✓ 46701      ✗ 0    
     data_received..................: 1.5 GB  21 MB/s
     data_sent......................: 20 MB   293 kB/s
     http_req_blocked...............: avg=15.17µs  min=1.08µs  med=3.36µs   max=15.3ms   p(90)=5.22µs   p(95)=7.27µs   p(99.9)=2.17ms
     http_req_connecting............: avg=10.11µs  min=0s      med=0s       max=15.25ms  p(90)=0s       p(95)=0s       p(99.9)=2.15ms
     http_req_duration..............: avg=879.56ms min=5.87ms  med=783.6ms  max=5.27s    p(90)=1.77s    p(95)=2s       p(99.9)=4.18s 
       { expected_response:true }...: avg=879.56ms min=5.87ms  med=783.6ms  max=5.27s    p(90)=1.77s    p(95)=2s       p(99.9)=4.18s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 16567
     http_req_receiving.............: avg=115.42µs min=33.27µs med=95.44µs  max=196.41ms p(90)=135.47µs p(95)=151.13µs p(99.9)=1.2ms 
     http_req_sending...............: avg=36.32µs  min=5.83µs  med=17.98µs  max=82.93ms  p(90)=23.57µs  p(95)=28.57µs  p(99.9)=2.59ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=879.41ms min=5.71ms  med=783.41ms max=5.27s    p(90)=1.77s    p(95)=2s       p(99.9)=4.18s 
     http_reqs......................: 16567   243.789102/s
     iteration_duration.............: avg=936.1ms  min=29.34ms med=855.23ms max=5.28s    p(90)=1.79s    p(95)=2.01s    p(99.9)=4.21s 
     iterations.....................: 15567   229.073758/s
     success_rate...................: 100.00% ✓ 15567      ✗ 0    
     vus............................: 8       min=0        max=500
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

     checks.........................: 100.00% ✓ 45651      ✗ 0    
     data_received..................: 1.4 GB  21 MB/s
     data_sent......................: 20 MB   283 kB/s
     http_req_blocked...............: avg=14.64µs  min=1.06µs  med=3.38µs   max=16.04ms p(90)=5.22µs   p(95)=6.72µs   p(99.9)=2.46ms  
     http_req_connecting............: avg=9.36µs   min=0s      med=0s       max=15.98ms p(90)=0s       p(95)=0s       p(99.9)=2.32ms  
     http_req_duration..............: avg=895.16ms min=7.74ms  med=827.91ms max=3.05s   p(90)=1.84s    p(95)=1.93s    p(99.9)=2.73s   
       { expected_response:true }...: avg=895.16ms min=7.74ms  med=827.91ms max=3.05s   p(90)=1.84s    p(95)=1.93s    p(99.9)=2.73s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 16217
     http_req_receiving.............: avg=100.08µs min=33.16µs med=91.04µs  max=21.33ms p(90)=131.41µs p(95)=148.61µs p(99.9)=974.34µs
     http_req_sending...............: avg=35.42µs  min=5.77µs  med=17.5µs   max=51.35ms p(90)=23.26µs  p(95)=28.19µs  p(99.9)=3.51ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=895.02ms min=7.65ms  med=827.84ms max=3.05s   p(90)=1.84s    p(95)=1.93s    p(99.9)=2.73s   
     http_reqs......................: 16217   235.620591/s
     iteration_duration.............: avg=953.93ms min=33.46ms med=887.5ms  max=3.05s   p(90)=1.85s    p(95)=1.94s    p(99.9)=2.75s   
     iterations.....................: 15217   221.091357/s
     success_rate...................: 100.00% ✓ 15217      ✗ 0    
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

