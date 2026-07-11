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
| hive-router | v0.0.78 | 2,836 | 3,011 | 2,765 | 2.9% |  |
| fusion-nightly | 16.5.0-p.12 | 2,435 | 2,520 | 2,419 | 1.3% |  |
| fusion-nightly-net11 | 16.5.0-p.12 | 2,375 | 2,467 | 2,360 | 1.6% |  |
| fusion | 16.4.0 | 2,212 | 2,288 | 2,190 | 1.4% |  |
| cosmo | 0.329.0 | 1,223 | 1,265 | 1,220 | 1.4% |  |
| hive-gateway-router-runtime | 2.10.2 | 561 | 574 | 558 | 0.9% |  |
| hive-gateway | 2.10.2 | 255 | 263 | 251 | 1.6% |  |
| apollo-gateway | 2.14.2 | 233 | 241 | 232 | 1.2% |  |
| apollo-router | v2.16.0 | — | — | — | — | non-compatible response (2928 across 9/9 runs) |
| feddi | — | — | — | — | — | not run |
| fusion-nightly-fed | — | — | — | — | — | not run |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (496868 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.78 | 2,402 | 2,564 | 2,392 | 2.5% |  |
| fusion-nightly-net11 | 16.5.0-p.12 | 2,344 | 2,426 | 2,334 | 1.3% |  |
| fusion-nightly | 16.5.0-p.12 | 2,279 | 2,373 | 2,262 | 1.7% |  |
| fusion | 16.4.0 | 2,220 | 2,305 | 2,209 | 1.4% |  |
| fusion-nightly-fed | 16.5.0-p.12 | 2,070 | 2,168 | 2,059 | 1.9% |  |
| cosmo | 0.329.0 | 1,158 | 1,195 | 1,154 | 1.2% |  |
| hive-gateway-router-runtime | 2.10.2 | 540 | 554 | 536 | 1.0% |  |
| hive-gateway | 2.10.2 | 237 | 243 | 236 | 0.9% |  |
| apollo-gateway | 2.14.2 | 230 | 237 | 230 | 1.0% |  |
| apollo-router | v2.16.0 | — | — | — | — | non-compatible response (21578 across 9/9 runs) |
| feddi | — | — | — | — | — | not run |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (371458 across 9/9 runs) |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.78)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 521742      ✗ 0     
     data_received..................: 15 GB   249 MB/s
     data_sent......................: 210 MB  3.4 MB/s
     http_req_blocked...............: avg=19.71µs min=872ns   med=2.08µs  max=77.49ms  p(90)=3.53µs   p(95)=4.66µs   p(99.9)=1.83ms  
     http_req_connecting............: avg=16.87µs min=0s      med=0s      max=77.28ms  p(90)=0s       p(95)=0s       p(99.9)=1.77ms  
     http_req_duration..............: avg=81.2ms  min=1.4ms   med=78.38ms max=316.43ms p(90)=154.39ms p(95)=169.64ms p(99.9)=225.81ms
       { expected_response:true }...: avg=81.2ms  min=1.4ms   med=78.38ms max=316.43ms p(90)=154.39ms p(95)=169.64ms p(99.9)=225.81ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 174914
     http_req_receiving.............: avg=139.2µs min=25.62µs med=48.99µs max=168.33ms p(90)=128.5µs  p(95)=321.74µs p(99.9)=17.75ms 
     http_req_sending...............: avg=66.22µs min=4.46µs  med=8.97µs  max=168.76ms p(90)=16.92µs  p(95)=111.25µs p(99.9)=9.01ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=80.99ms min=1.33ms  med=78.19ms max=315.9ms  p(90)=154.08ms p(95)=169.25ms p(99.9)=224.66ms
     http_reqs......................: 174914  2836.347632/s
     iteration_duration.............: avg=81.96ms min=2.28ms  med=79.16ms max=335.22ms p(90)=154.96ms p(95)=170.19ms p(99.9)=228.21ms
     iterations.....................: 173914  2820.131962/s
     success_rate...................: 100.00% ✓ 173914      ✗ 0     
     vus............................: 88      min=0         max=495 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (rust subgraphs) (16.5.0-p.12)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 452808      ✗ 0     
     data_received..................: 13 GB   214 MB/s
     data_sent......................: 183 MB  2.9 MB/s
     http_req_blocked...............: avg=15.61µs min=882ns   med=2.08µs  max=103.6ms  p(90)=3.47µs   p(95)=4.49µs   p(99.9)=1.89ms  
     http_req_connecting............: avg=12.84µs min=0s      med=0s      max=103.47ms p(90)=0s       p(95)=0s       p(99.9)=1.77ms  
     http_req_duration..............: avg=93.66ms min=1.96ms  med=81.23ms max=1.34s    p(90)=177.24ms p(95)=205.09ms p(99.9)=688.82ms
       { expected_response:true }...: avg=93.66ms min=1.96ms  med=81.23ms max=1.34s    p(90)=177.24ms p(95)=205.09ms p(99.9)=688.82ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 151936
     http_req_receiving.............: avg=1.79ms  min=52.03µs med=97.26µs max=683.57ms p(90)=1.89ms   p(95)=6.05ms   p(99.9)=107.99ms
     http_req_sending...............: avg=61.07µs min=4.64µs  med=8.96µs  max=61.67ms  p(90)=16.27µs  p(95)=98.37µs  p(99.9)=8.77ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=91.8ms  min=1.88ms  med=79.84ms max=1.34s    p(90)=175.16ms p(95)=202.27ms p(99.9)=641.64ms
     http_reqs......................: 151936  2435.829499/s
     iteration_duration.............: avg=94.52ms min=3.29ms  med=82.15ms max=1.34s    p(90)=177.8ms  p(95)=205.79ms p(99.9)=690.46ms
     iterations.....................: 150936  2419.797555/s
     success_rate...................: 100.00% ✓ 150936      ✗ 0     
     vus............................: 74      min=0         max=494 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (rust subgraphs) (16.5.0-p.12)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 441192      ✗ 0     
     data_received..................: 13 GB   208 MB/s
     data_sent......................: 178 MB  2.9 MB/s
     http_req_blocked...............: avg=11.78µs  min=902ns   med=2.2µs    max=44.54ms  p(90)=3.65µs   p(95)=4.64µs   p(99.9)=1.17ms  
     http_req_connecting............: avg=8.71µs   min=0s      med=0s       max=38.19ms  p(90)=0s       p(95)=0s       p(99.9)=1.07ms  
     http_req_duration..............: avg=96.07ms  min=1.88ms  med=92.01ms  max=368.5ms  p(90)=183.08ms p(95)=197.92ms p(99.9)=250.79ms
       { expected_response:true }...: avg=96.07ms  min=1.88ms  med=92.01ms  max=368.5ms  p(90)=183.08ms p(95)=197.92ms p(99.9)=250.79ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 148064
     http_req_receiving.............: avg=872.06µs min=53.59µs med=136.61µs max=106.2ms  p(90)=1.64ms   p(95)=2.87ms   p(99.9)=30.07ms 
     http_req_sending...............: avg=56.44µs  min=4.31µs  med=8.9µs    max=170.74ms p(90)=16.83µs  p(95)=107.05µs p(99.9)=7.39ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=95.14ms  min=1.81ms  med=91.03ms  max=368.3ms  p(90)=182.02ms p(95)=196.84ms p(99.9)=249.65ms
     http_reqs......................: 148064  2375.84372/s
     iteration_duration.............: avg=96.96ms  min=4.69ms  med=93.08ms  max=368.67ms p(90)=183.53ms p(95)=198.34ms p(99.9)=251.98ms
     iterations.....................: 147064  2359.797661/s
     success_rate...................: 100.00% ✓ 147064      ✗ 0     
     vus............................: 72      min=0         max=494 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (rust subgraphs) (16.4.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 411225      ✗ 0     
     data_received..................: 12 GB   194 MB/s
     data_sent......................: 166 MB  2.7 MB/s
     http_req_blocked...............: avg=15.22µs  min=1.05µs  med=2.59µs   max=55.49ms p(90)=4.1µs    p(95)=5.14µs   p(99.9)=888.1µs 
     http_req_connecting............: avg=11.71µs  min=0s      med=0s       max=55.3ms  p(90)=0s       p(95)=0s       p(99.9)=817.04µs
     http_req_duration..............: avg=103.19ms min=2.01ms  med=90.79ms  max=2.56s   p(90)=188.23ms p(95)=218.34ms p(99.9)=1.24s   
       { expected_response:true }...: avg=103.19ms min=2.01ms  med=90.79ms  max=2.56s   p(90)=188.23ms p(95)=218.34ms p(99.9)=1.24s   
     http_req_failed................: 0.00%   ✓ 0           ✗ 138075
     http_req_receiving.............: avg=1.65ms   min=54.48µs med=108.92µs max=1.18s   p(90)=1.77ms   p(95)=4.76ms   p(99.9)=108.65ms
     http_req_sending...............: avg=58.42µs  min=4.82µs  med=9.95µs   max=60.36ms p(90)=17.38µs  p(95)=99.67µs  p(99.9)=8.16ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=101.47ms min=1.92ms  med=89.36ms  max=2.55s   p(90)=186.27ms p(95)=215.18ms p(99.9)=1.22s   
     http_reqs......................: 138075  2212.676612/s
     iteration_duration.............: avg=104.18ms min=3.41ms  med=91.99ms  max=2.56s   p(90)=188.81ms p(95)=219.16ms p(99.9)=1.24s   
     iterations.....................: 137075  2196.651433/s
     success_rate...................: 100.00% ✓ 137075      ✗ 0     
     vus............................: 78      min=0         max=494 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (rust subgraphs) (0.329.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 226503     ✗ 0    
     data_received..................: 6.7 GB  107 MB/s
     data_sent......................: 92 MB   1.5 MB/s
     http_req_blocked...............: avg=6.5µs    min=1.05µs  med=2.6µs    max=14.54ms  p(90)=4.32µs   p(95)=5.28µs   p(99.9)=474.82µs
     http_req_connecting............: avg=3.18µs   min=0s      med=0s       max=14.46ms  p(90)=0s       p(95)=0s       p(99.9)=416.79µs
     http_req_duration..............: avg=186.48ms min=1.95ms  med=187.66ms max=482.54ms p(90)=346.58ms p(95)=369.15ms p(99.9)=435.87ms
       { expected_response:true }...: avg=186.48ms min=1.95ms  med=187.66ms max=482.54ms p(90)=346.58ms p(95)=369.15ms p(99.9)=435.87ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 76501
     http_req_receiving.............: avg=130.41µs min=28.76µs med=62.91µs  max=212.45ms p(90)=101.5µs  p(95)=117.73µs p(99.9)=3ms     
     http_req_sending...............: avg=28.25µs  min=5.04µs  med=11.54µs  max=54.45ms  p(90)=18.61µs  p(95)=22.85µs  p(99.9)=3.43ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=186.33ms min=1.89ms  med=187.36ms max=482.35ms p(90)=346.47ms p(95)=369ms    p(99.9)=435.8ms 
     http_reqs......................: 76501   1223.36267/s
     iteration_duration.............: avg=189.2ms  min=4.55ms  med=190.7ms  max=482.77ms p(90)=347.3ms  p(95)=369.78ms p(99.9)=436.15ms
     iterations.....................: 75501   1207.37121/s
     success_rate...................: 100.00% ✓ 75501      ✗ 0    
     vus............................: 82      min=0        max=494
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (rust subgraphs) (2.10.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 105273     ✗ 0    
     data_received..................: 3.2 GB  49 MB/s
     data_sent......................: 43 MB   674 kB/s
     http_req_blocked...............: avg=8.61µs   min=1.13µs  med=2.98µs   max=12.83ms  p(90)=4.67µs   p(95)=5.67µs   p(99.9)=1.64ms  
     http_req_connecting............: avg=4.56µs   min=0s      med=0s       max=12.77ms  p(90)=0s       p(95)=0s       p(99.9)=1.48ms  
     http_req_duration..............: avg=397.23ms min=3.56ms  med=371.73ms max=1.65s    p(90)=781.82ms p(95)=848.08ms p(99.9)=1.25s   
       { expected_response:true }...: avg=397.23ms min=3.56ms  med=371.73ms max=1.65s    p(90)=781.82ms p(95)=848.08ms p(99.9)=1.25s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 36091
     http_req_receiving.............: avg=78.4µs   min=30.32µs med=66.97µs  max=10.53ms  p(90)=105.87µs p(95)=120.9µs  p(99.9)=913.53µs
     http_req_sending...............: avg=36.39µs  min=5.19µs  med=12.88µs  max=255.29ms p(90)=20.04µs  p(95)=23.16µs  p(99.9)=2.49ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=397.12ms min=3.5ms   med=371.65ms max=1.65s    p(90)=781.75ms p(95)=848ms    p(99.9)=1.25s   
     http_reqs......................: 36091   561.596777/s
     iteration_duration.............: avg=408.8ms  min=8.02ms  med=386.04ms max=1.66s    p(90)=785.29ms p(95)=850.79ms p(99.9)=1.25s   
     iterations.....................: 35091   546.036201/s
     success_rate...................: 100.00% ✓ 35091      ✗ 0    
     vus............................: 67      min=0        max=496
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (rust subgraphs) (2.10.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 48729      ✗ 0    
     data_received..................: 1.5 GB  22 MB/s
     data_sent......................: 21 MB   307 kB/s
     http_req_blocked...............: avg=13.49µs  min=1.11µs  med=3.51µs   max=15.01ms p(90)=5.29µs   p(95)=6.62µs   p(99.9)=2ms   
     http_req_connecting............: avg=8.44µs   min=0s      med=0s       max=14.95ms p(90)=0s       p(95)=0s       p(99.9)=1.98ms
     http_req_duration..............: avg=826.03ms min=5.61ms  med=723.73ms max=17.77s  p(90)=1.43s    p(95)=1.63s    p(99.9)=17.12s
       { expected_response:true }...: avg=826.03ms min=5.61ms  med=723.73ms max=17.77s  p(90)=1.43s    p(95)=1.63s    p(99.9)=17.12s
     http_req_failed................: 0.00%   ✓ 0          ✗ 17243
     http_req_receiving.............: avg=104.23µs min=31.49µs med=93.11µs  max=31.55ms p(90)=130.01µs p(95)=145.57µs p(99.9)=2.31ms
     http_req_sending...............: avg=30.18µs  min=5.73µs  med=18.08µs  max=48.06ms p(90)=23.55µs  p(95)=27.63µs  p(99.9)=2.53ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=825.89ms min=5.48ms  med=723.63ms max=17.77s  p(90)=1.43s    p(95)=1.63s    p(99.9)=17.12s
     http_reqs......................: 17243   255.080455/s
     iteration_duration.............: avg=876.92ms min=29.34ms med=773.34ms max=17.77s  p(90)=1.45s    p(95)=1.63s    p(99.9)=17.37s
     iterations.....................: 16243   240.287179/s
     success_rate...................: 100.00% ✓ 16243      ✗ 0    
     vus............................: 91      min=0        max=500
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

     checks.........................: 100.00% ✓ 48132      ✗ 0    
     data_received..................: 1.5 GB  21 MB/s
     data_sent......................: 21 MB   286 kB/s
     http_req_blocked...............: avg=12.83µs  min=1.21µs  med=3.3µs    max=15.65ms  p(90)=4.91µs   p(95)=6.11µs   p(99.9)=1.68ms
     http_req_connecting............: avg=7.94µs   min=0s      med=0s       max=15.58ms  p(90)=0s       p(95)=0s       p(99.9)=1.65ms
     http_req_duration..............: avg=398.79ms min=7.44ms  med=437.06ms max=1.17s    p(90)=681.71ms p(95)=734.31ms p(99.9)=1.02s 
       { expected_response:true }...: avg=398.79ms min=7.44ms  med=437.06ms max=1.17s    p(90)=681.71ms p(95)=734.31ms p(99.9)=1.02s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 17044
     http_req_receiving.............: avg=96.25µs  min=30.35µs med=86.43µs  max=45.78ms  p(90)=126.73µs p(95)=141.01µs p(99.9)=1.06ms
     http_req_sending...............: avg=38.94µs  min=5.72µs  med=16.97µs  max=109.05ms p(90)=22.25µs  p(95)=26.2µs   p(99.9)=2.14ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=398.65ms min=7.35ms  med=436.96ms max=1.17s    p(90)=681.64ms p(95)=734.19ms p(99.9)=1.02s 
     http_reqs......................: 17044   233.108688/s
     iteration_duration.............: avg=423.7ms  min=13.5ms  med=466.84ms max=1.18s    p(90)=688.82ms p(95)=741ms    p(99.9)=1.02s 
     iterations.....................: 16044   219.431811/s
     success_rate...................: 100.00% ✓ 16044      ✗ 0    
     vus............................: 53      min=0        max=497
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.78)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 443055      ✗ 0     
     data_received..................: 13 GB   210 MB/s
     data_sent......................: 179 MB  2.9 MB/s
     http_req_blocked...............: avg=23.82µs  min=1.1µs   med=3.16µs  max=68.98ms  p(90)=5.2µs    p(95)=6.52µs   p(99.9)=2.05ms  
     http_req_connecting............: avg=19.73µs  min=0s      med=0s      max=68.93ms  p(90)=0s       p(95)=0s       p(99.9)=1.9ms   
     http_req_duration..............: avg=95.62ms  min=1.55ms  med=90.22ms max=304.03ms p(90)=184.95ms p(95)=202.9ms  p(99.9)=262.04ms
       { expected_response:true }...: avg=95.62ms  min=1.55ms  med=90.22ms max=304.03ms p(90)=184.95ms p(95)=202.9ms  p(99.9)=262.04ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 148685
     http_req_receiving.............: avg=165.28µs min=26.06µs med=57.83µs max=126.26ms p(90)=163.37µs p(95)=392.09µs p(99.9)=18.64ms 
     http_req_sending...............: avg=76.57µs  min=5.13µs  med=11.98µs max=107.23ms p(90)=23.03µs  p(95)=140.39µs p(99.9)=10.18ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=95.38ms  min=1.49ms  med=90.04ms max=303.94ms p(90)=184.64ms p(95)=202.54ms p(99.9)=259.83ms
     http_reqs......................: 148685  2402.00748/s
     iteration_duration.............: avg=96.56ms  min=4.33ms  med=91.31ms max=327.28ms p(90)=185.53ms p(95)=203.54ms p(99.9)=264ms   
     iterations.....................: 147685  2385.852471/s
     success_rate...................: 100.00% ✓ 147685      ✗ 0     
     vus............................: 52      min=0         max=499 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (.net subgraphs) (16.5.0-p.12)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 431925      ✗ 0     
     data_received..................: 13 GB   206 MB/s
     data_sent......................: 174 MB  2.8 MB/s
     http_req_blocked...............: avg=14.42µs  min=892ns   med=2.28µs   max=54.37ms  p(90)=4.23µs   p(95)=5.34µs   p(99.9)=1.1ms   
     http_req_connecting............: avg=11.31µs  min=0s      med=0s       max=53.6ms   p(90)=0s       p(95)=0s       p(99.9)=1.03ms  
     http_req_duration..............: avg=98.1ms   min=1.4ms   med=93.78ms  max=339.19ms p(90)=186ms    p(95)=202.63ms p(99.9)=265.38ms
       { expected_response:true }...: avg=98.1ms   min=1.4ms   med=93.78ms  max=339.19ms p(90)=186ms    p(95)=202.63ms p(99.9)=265.38ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 144975
     http_req_receiving.............: avg=891.21µs min=48.03µs med=120.95µs max=199.49ms p(90)=1.75ms   p(95)=3ms      p(99.9)=32.26ms 
     http_req_sending...............: avg=60.4µs   min=4.69µs  med=9.72µs   max=142.83ms p(90)=21.7µs   p(95)=109.06µs p(99.9)=7.9ms   
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=97.15ms  min=1.33ms  med=92.82ms  max=339.02ms p(90)=185.05ms p(95)=201.46ms p(99.9)=263.6ms 
     http_reqs......................: 144975  2344.088543/s
     iteration_duration.............: avg=99.04ms  min=3.57ms  med=94.94ms  max=339.4ms  p(90)=186.49ms p(95)=203.1ms  p(99.9)=266.96ms
     iterations.....................: 143975  2327.919628/s
     success_rate...................: 100.00% ✓ 143975      ✗ 0     
     vus............................: 95      min=0         max=500 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.5.0-p.12)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 420558      ✗ 0     
     data_received..................: 12 GB   200 MB/s
     data_sent......................: 170 MB  2.7 MB/s
     http_req_blocked...............: avg=15.24µs  min=821ns   med=2.2µs    max=80.58ms  p(90)=3.83µs   p(95)=4.97µs   p(99.9)=1.01ms  
     http_req_connecting............: avg=12.42µs  min=0s      med=0s       max=80.5ms   p(90)=0s       p(95)=0s       p(99.9)=994.98µs
     http_req_duration..............: avg=100.74ms min=1.53ms  med=84.96ms  max=1.81s    p(90)=191.12ms p(95)=221.01ms p(99.9)=850.73ms
       { expected_response:true }...: avg=100.74ms min=1.53ms  med=84.96ms  max=1.81s    p(90)=191.12ms p(95)=221.01ms p(99.9)=850.73ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 141186
     http_req_receiving.............: avg=1.76ms   min=51.42µs med=106.98µs max=1.05s    p(90)=2.03ms   p(95)=5.74ms   p(99.9)=98.3ms  
     http_req_sending...............: avg=60.65µs  min=4.65µs  med=9.33µs   max=111.59ms p(90)=18.65µs  p(95)=97.94µs  p(99.9)=8.16ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=98.92ms  min=1.46ms  med=83.36ms  max=1.81s    p(90)=188.91ms p(95)=217.3ms  p(99.9)=828.7ms 
     http_reqs......................: 141186  2279.908724/s
     iteration_duration.............: avg=101.77ms min=2.76ms  med=86.08ms  max=1.81s    p(90)=191.68ms p(95)=221.85ms p(99.9)=857.51ms
     iterations.....................: 140186  2263.76046/s
     success_rate...................: 100.00% ✓ 140186      ✗ 0     
     vus............................: 53      min=0         max=499 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (.net subgraphs) (16.4.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 409707      ✗ 0     
     data_received..................: 12 GB   195 MB/s
     data_sent......................: 165 MB  2.7 MB/s
     http_req_blocked...............: avg=19.98µs  min=990ns   med=2.84µs   max=77.34ms  p(90)=4.62µs   p(95)=5.81µs   p(99.9)=1.84ms  
     http_req_connecting............: avg=16.36µs  min=0s      med=0s       max=77.27ms  p(90)=0s       p(95)=0s       p(99.9)=1.77ms  
     http_req_duration..............: avg=103.43ms min=1.58ms  med=88.58ms  max=1.45s    p(90)=196.83ms p(95)=226.63ms p(99.9)=907.06ms
       { expected_response:true }...: avg=103.43ms min=1.58ms  med=88.58ms  max=1.45s    p(90)=196.83ms p(95)=226.63ms p(99.9)=907.06ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 137569
     http_req_receiving.............: avg=1.96ms   min=52.16µs med=108.31µs max=1.3s     p(90)=1.92ms   p(95)=5.61ms   p(99.9)=126.56ms
     http_req_sending...............: avg=72.09µs  min=4.93µs  med=10.74µs  max=272.97ms p(90)=20.75µs  p(95)=116.02µs p(99.9)=9.98ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=101.39ms min=1.49ms  med=87.17ms  max=1.45s    p(90)=194.1ms  p(95)=221.74ms p(99.9)=873.37ms
     http_reqs......................: 137569  2220.509076/s
     iteration_duration.............: avg=104.49ms min=3.31ms  med=89.77ms  max=1.45s    p(90)=197.44ms p(95)=227.42ms p(99.9)=912.95ms
     iterations.....................: 136569  2204.368019/s
     success_rate...................: 100.00% ✓ 136569      ✗ 0     
     vus............................: 55      min=0         max=499 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (.net subgraphs) (16.5.0-p.12)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 384249      ✗ 0     
     data_received..................: 11 GB   182 MB/s
     data_sent......................: 155 MB  2.5 MB/s
     http_req_blocked...............: avg=15.41µs  min=1.11µs  med=3.04µs   max=49.74ms  p(90)=4.91µs   p(95)=6.16µs   p(99.9)=1.06ms  
     http_req_connecting............: avg=11.3µs   min=0s      med=0s       max=49.53ms  p(90)=0s       p(95)=0s       p(99.9)=927.26µs
     http_req_duration..............: avg=110.35ms min=1.89ms  med=96.91ms  max=1.56s    p(90)=207.34ms p(95)=238.34ms p(99.9)=1.15s   
       { expected_response:true }...: avg=110.35ms min=1.89ms  med=96.91ms  max=1.56s    p(90)=207.34ms p(95)=238.34ms p(99.9)=1.15s   
     http_req_failed................: 0.00%   ✓ 0           ✗ 129083
     http_req_receiving.............: avg=2.01ms   min=54.12µs med=118.42µs max=1.08s    p(90)=2.16ms   p(95)=6.39ms   p(99.9)=139.3ms 
     http_req_sending...............: avg=66.05µs  min=5.1µs   med=11.32µs  max=150.29ms p(90)=21.65µs  p(95)=115.15µs p(99.9)=8.38ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=108.27ms min=1.8ms   med=95.42ms  max=1.56s    p(90)=204.01ms p(95)=232.9ms  p(99.9)=1.1s    
     http_reqs......................: 129083  2070.804512/s
     iteration_duration.............: avg=111.5ms  min=3.54ms  med=98.17ms  max=1.56s    p(90)=207.96ms p(95)=239.22ms p(99.9)=1.15s   
     iterations.....................: 128083  2054.762085/s
     success_rate...................: 100.00% ✓ 128083      ✗ 0     
     vus............................: 73      min=0         max=494 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (.net subgraphs) (0.329.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 214677      ✗ 0    
     data_received..................: 6.3 GB  101 MB/s
     data_sent......................: 87 MB   1.4 MB/s
     http_req_blocked...............: avg=5.77µs   min=1µs     med=2.44µs   max=5.49ms   p(90)=4.27µs   p(95)=5.24µs   p(99.9)=718.74µs
     http_req_connecting............: avg=2.63µs   min=0s      med=0s       max=5.42ms   p(90)=0s       p(95)=0s       p(99.9)=667.75µs
     http_req_duration..............: avg=196.66ms min=2.02ms  med=198.81ms max=547.08ms p(90)=364.41ms p(95)=392.17ms p(99.9)=481.49ms
       { expected_response:true }...: avg=196.66ms min=2.02ms  med=198.81ms max=547.08ms p(90)=364.41ms p(95)=392.17ms p(99.9)=481.49ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 72559
     http_req_receiving.............: avg=90.98µs  min=27.18µs med=64.39µs  max=140.88ms p(90)=106µs    p(95)=121.55µs p(99.9)=1.2ms   
     http_req_sending...............: avg=28.67µs  min=4.82µs  med=11.52µs  max=118.57ms p(90)=19.25µs  p(95)=23.09µs  p(99.9)=3.1ms   
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=196.54ms min=1.94ms  med=198.61ms max=547.02ms p(90)=364.31ms p(95)=392.07ms p(99.9)=481.39ms
     http_reqs......................: 72559   1158.836557/s
     iteration_duration.............: avg=199.64ms min=5.36ms  med=201.94ms max=547.26ms p(90)=365.26ms p(95)=392.92ms p(99.9)=481.87ms
     iterations.....................: 71559   1142.865602/s
     success_rate...................: 100.00% ✓ 71559       ✗ 0    
     vus............................: 87      min=0         max=497
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (.net subgraphs) (2.10.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 101850     ✗ 0    
     data_received..................: 3.1 GB  47 MB/s
     data_sent......................: 42 MB   649 kB/s
     http_req_blocked...............: avg=8.8µs    min=1.3µs   med=3.5µs    max=4.81ms  p(90)=5.35µs   p(95)=6.48µs   p(99.9)=1.25ms
     http_req_connecting............: avg=4.26µs   min=0s      med=0s       max=4.65ms  p(90)=0s       p(95)=0s       p(99.9)=1.21ms
     http_req_duration..............: avg=410.51ms min=3.78ms  med=379.21ms max=2.21s   p(90)=809.15ms p(95)=879.62ms p(99.9)=1.34s 
       { expected_response:true }...: avg=410.51ms min=3.78ms  med=379.21ms max=2.21s   p(90)=809.15ms p(95)=879.62ms p(99.9)=1.34s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 34950
     http_req_receiving.............: avg=216.39µs min=31.95µs med=76.5µs   max=261.9ms p(90)=116.07µs p(95)=131.68µs p(99.9)=4.1ms 
     http_req_sending...............: avg=26.21µs  min=5.66µs  med=15.64µs  max=16.14ms p(90)=22.85µs  p(95)=26.19µs  p(99.9)=2.42ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=410.27ms min=3.69ms  med=378.89ms max=2.21s   p(90)=809.04ms p(95)=879.49ms p(99.9)=1.34s 
     http_reqs......................: 34950   540.631115/s
     iteration_duration.............: avg=422.86ms min=5.85ms  med=395.87ms max=2.22s   p(90)=813.18ms p(95)=881.9ms  p(99.9)=1.34s 
     iterations.....................: 33950   525.162414/s
     success_rate...................: 100.00% ✓ 33950      ✗ 0    
     vus............................: 85      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (.net subgraphs) (2.10.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 45240      ✗ 0    
     data_received..................: 1.4 GB  21 MB/s
     data_sent......................: 19 MB   285 kB/s
     http_req_blocked...............: avg=13.81µs  min=1.16µs  med=3.16µs   max=8.34ms  p(90)=4.9µs    p(95)=6.46µs   p(99.9)=1.99ms  
     http_req_connecting............: avg=8.99µs   min=0s      med=0s       max=8.27ms  p(90)=0s       p(95)=0s       p(99.9)=1.96ms  
     http_req_duration..............: avg=905.54ms min=5.88ms  med=829.14ms max=5.14s   p(90)=1.82s    p(95)=1.98s    p(99.9)=4.51s   
       { expected_response:true }...: avg=905.54ms min=5.88ms  med=829.14ms max=5.14s   p(90)=1.82s    p(95)=1.98s    p(99.9)=4.51s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 16080
     http_req_receiving.............: avg=94.58µs  min=33.87µs med=88.6µs   max=9.06ms  p(90)=125.31µs p(95)=138.22µs p(99.9)=898.56µs
     http_req_sending...............: avg=26.31µs  min=5.75µs  med=16.94µs  max=13.92ms p(90)=22.53µs  p(95)=27.34µs  p(99.9)=2.31ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=905.42ms min=5.79ms  med=829.01ms max=5.14s   p(90)=1.82s    p(95)=1.98s    p(99.9)=4.51s   
     http_reqs......................: 16080   237.828223/s
     iteration_duration.............: avg=965.58ms min=68.86ms med=908.71ms max=5.14s   p(90)=1.85s    p(95)=2s       p(99.9)=4.54s   
     iterations.....................: 15080   223.03791/s
     success_rate...................: 100.00% ✓ 15080      ✗ 0    
     vus............................: 87      min=0        max=500
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

     checks.........................: 100.00% ✓ 44763      ✗ 0    
     data_received..................: 1.4 GB  20 MB/s
     data_sent......................: 19 MB   277 kB/s
     http_req_blocked...............: avg=14.45µs  min=1.1µs   med=3.5µs    max=11.43ms  p(90)=5.36µs   p(95)=6.88µs  p(99.9)=2.34ms
     http_req_connecting............: avg=9.22µs   min=0s      med=0s       max=11.35ms  p(90)=0s       p(95)=0s      p(99.9)=2.32ms
     http_req_duration..............: avg=913.06ms min=7.79ms  med=835.14ms max=3.11s    p(90)=1.85s    p(95)=1.96s   p(99.9)=2.88s 
       { expected_response:true }...: avg=913.06ms min=7.79ms  med=835.14ms max=3.11s    p(90)=1.85s    p(95)=1.96s   p(99.9)=2.88s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 15921
     http_req_receiving.............: avg=108.51µs min=33.26µs med=90.08µs  max=152.39ms p(90)=131.29µs p(95)=148.1µs p(99.9)=1.11ms
     http_req_sending...............: avg=36.63µs  min=5.35µs  med=17.84µs  max=137.96ms p(90)=23.87µs  p(95)=29.21µs p(99.9)=2ms   
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s    
     http_req_waiting...............: avg=912.92ms min=7.71ms  med=835.02ms max=3.11s    p(90)=1.85s    p(95)=1.96s   p(99.9)=2.88s 
     http_reqs......................: 15921   230.983855/s
     iteration_duration.............: avg=974.26ms min=12.6ms  med=918.02ms max=3.12s    p(90)=1.86s    p(95)=1.97s   p(99.9)=2.89s 
     iterations.....................: 14921   216.475731/s
     success_rate...................: 100.00% ✓ 14921      ✗ 0    
     vus............................: 27      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

