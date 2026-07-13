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
| hive-router | v0.0.78 | 2,917 | 3,069 | 2,890 | 2.2% |  |
| fusion-nightly-net11 | 16.5.0-p.18 | 2,486 | 2,575 | 2,472 | 1.4% |  |
| fusion-nightly | 16.5.0-p.18 | 2,373 | 2,481 | 2,360 | 1.8% |  |
| fusion | 16.4.0 | 2,199 | 2,285 | 2,192 | 1.5% |  |
| cosmo | 0.329.0 | 1,227 | 1,262 | 1,217 | 1.3% |  |
| hive-gateway-router-runtime | 2.10.2 | 567 | 578 | 563 | 0.9% |  |
| hive-gateway | 2.10.2 | 257 | 263 | 255 | 1.0% |  |
| apollo-gateway | 2.14.2 | 233 | 240 | 231 | 1.1% |  |
| apollo-router | v2.16.0 | — | — | — | — | non-compatible response (26756 across 9/9 runs) |
| feddi | — | — | — | — | — | not run |
| fusion-nightly-fed | — | — | — | — | — | not run |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (453998 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| fusion-nightly-net11 | 16.5.0-p.18 | 2,353 | 2,449 | 2,341 | 1.6% |  |
| hive-router | v0.0.78 | 2,253 | 2,358 | 2,189 | 2.6% |  |
| fusion-nightly | 16.5.0-p.18 | 2,244 | 2,339 | 2,232 | 1.6% |  |
| fusion | 16.4.0 | 2,199 | 2,285 | 2,193 | 1.5% |  |
| fusion-nightly-fed | 16.5.0-p.18 | 2,066 | 2,160 | 2,060 | 1.8% |  |
| cosmo | 0.329.0 | 1,144 | 1,181 | 1,141 | 1.4% |  |
| hive-gateway-router-runtime | 2.10.2 | 541 | 554 | 538 | 1.0% |  |
| hive-gateway | 2.10.2 | 245 | 253 | 243 | 1.3% |  |
| apollo-gateway | 2.14.2 | 227 | 234 | 227 | 1.0% |  |
| apollo-router | v2.16.0 | — | — | — | — | non-compatible response (43760 across 9/9 runs) |
| feddi | — | — | — | — | — | not run |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (284177 across 9/9 runs) |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.78)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 536922      ✗ 0     
     data_received..................: 16 GB   256 MB/s
     data_sent......................: 216 MB  3.5 MB/s
     http_req_blocked...............: avg=17.09µs  min=832ns   med=2.08µs  max=63.04ms  p(90)=3.58µs   p(95)=4.73µs   p(99.9)=1.05ms  
     http_req_connecting............: avg=14.27µs  min=0s      med=0s      max=62.97ms  p(90)=0s       p(95)=0s       p(99.9)=958.94µs
     http_req_duration..............: avg=78.94ms  min=1.38ms  med=74.04ms max=301.45ms p(90)=152.2ms  p(95)=165.16ms p(99.9)=213.95ms
       { expected_response:true }...: avg=78.94ms  min=1.38ms  med=74.04ms max=301.45ms p(90)=152.2ms  p(95)=165.16ms p(99.9)=213.95ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 179974
     http_req_receiving.............: avg=142.69µs min=24.84µs med=49.91µs max=256.84ms p(90)=133.32µs p(95)=324.04µs p(99.9)=16.91ms 
     http_req_sending...............: avg=66.56µs  min=4.48µs  med=8.97µs  max=49.61ms  p(90)=17.45µs  p(95)=110.19µs p(99.9)=8.84ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=78.73ms  min=1.34ms  med=73.87ms max=281.66ms p(90)=151.98ms p(95)=164.84ms p(99.9)=212.12ms
     http_reqs......................: 179974  2917.073598/s
     iteration_duration.............: avg=79.64ms  min=2.16ms  med=74.82ms max=329.14ms p(90)=152.67ms p(95)=165.59ms p(99.9)=214.8ms 
     iterations.....................: 178974  2900.865292/s
     success_rate...................: 100.00% ✓ 178974      ✗ 0     
     vus............................: 89      min=0         max=498 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (rust subgraphs) (16.5.0-p.18)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 460470      ✗ 0     
     data_received..................: 14 GB   218 MB/s
     data_sent......................: 186 MB  3.0 MB/s
     http_req_blocked...............: avg=15.01µs  min=882ns   med=2.12µs   max=59.34ms  p(90)=3.76µs   p(95)=4.84µs   p(99.9)=1.27ms  
     http_req_connecting............: avg=11.97µs  min=0s      med=0s       max=59.29ms  p(90)=0s       p(95)=0s       p(99.9)=1.19ms  
     http_req_duration..............: avg=92.06ms  min=1.91ms  med=87.92ms  max=467.75ms p(90)=176.22ms p(95)=191.38ms p(99.9)=247.12ms
       { expected_response:true }...: avg=92.06ms  min=1.91ms  med=87.92ms  max=467.75ms p(90)=176.22ms p(95)=191.38ms p(99.9)=247.12ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 154490
     http_req_receiving.............: avg=828.64µs min=50.44µs med=120.11µs max=228.32ms p(90)=1.62ms   p(95)=2.86ms   p(99.9)=28.23ms 
     http_req_sending...............: avg=62.24µs  min=4.05µs  med=8.71µs   max=243.96ms p(90)=18.26µs  p(95)=104.42µs p(99.9)=7.92ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=91.17ms  min=1.83ms  med=87.02ms  max=466.45ms p(90)=175.23ms p(95)=190.47ms p(99.9)=245.66ms
     http_reqs......................: 154490  2486.309983/s
     iteration_duration.............: avg=92.9ms   min=4.2ms   med=88.8ms   max=467.94ms p(90)=176.69ms p(95)=191.82ms p(99.9)=248.27ms
     iterations.....................: 153490  2470.21632/s
     success_rate...................: 100.00% ✓ 153490      ✗ 0     
     vus............................: 62      min=0         max=497 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (rust subgraphs) (16.5.0-p.18)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 441438      ✗ 0     
     data_received..................: 13 GB   208 MB/s
     data_sent......................: 178 MB  2.9 MB/s
     http_req_blocked...............: avg=13.99µs min=912ns   med=2.04µs   max=85.74ms  p(90)=3.32µs   p(95)=4.28µs   p(99.9)=633.95µs
     http_req_connecting............: avg=11.41µs min=0s      med=0s       max=85.69ms  p(90)=0s       p(95)=0s       p(99.9)=600.52µs
     http_req_duration..............: avg=96.04ms min=1.99ms  med=84.29ms  max=1.23s    p(90)=180.66ms p(95)=206.85ms p(99.9)=918.88ms
       { expected_response:true }...: avg=96.04ms min=1.99ms  med=84.29ms  max=1.23s    p(90)=180.66ms p(95)=206.85ms p(99.9)=918.88ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 148146
     http_req_receiving.............: avg=1.85ms  min=52.54µs med=100.13µs max=902.25ms p(90)=1.97ms   p(95)=5.45ms   p(99.9)=160.93ms
     http_req_sending...............: avg=57.53µs min=4.49µs  med=8.63µs   max=282.71ms p(90)=15.19µs  p(95)=94.88µs  p(99.9)=7.61ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=94.13ms min=1.91ms  med=82.83ms  max=1.23s    p(90)=178.32ms p(95)=202.55ms p(99.9)=867.87ms
     http_reqs......................: 148146  2373.453161/s
     iteration_duration.............: avg=96.94ms min=3.33ms  med=85.23ms  max=1.23s    p(90)=181.19ms p(95)=207.44ms p(99.9)=919.58ms
     iterations.....................: 147146  2357.43212/s
     success_rate...................: 100.00% ✓ 147146      ✗ 0     
     vus............................: 76      min=0         max=493 
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

     checks.........................: 100.00% ✓ 409731      ✗ 0     
     data_received..................: 12 GB   193 MB/s
     data_sent......................: 165 MB  2.6 MB/s
     http_req_blocked...............: avg=13.5µs   min=1.03µs  med=2.56µs   max=63.36ms  p(90)=3.98µs   p(95)=4.95µs   p(99.9)=957.16µs
     http_req_connecting............: avg=10.22µs  min=0s      med=0s       max=60.12ms  p(90)=0s       p(95)=0s       p(99.9)=893.24µs
     http_req_duration..............: avg=103.45ms min=2.03ms  med=93.11ms  max=1.4s     p(90)=194.99ms p(95)=219.73ms p(99.9)=707.84ms
       { expected_response:true }...: avg=103.45ms min=2.03ms  med=93.11ms  max=1.4s     p(90)=194.99ms p(95)=219.73ms p(99.9)=707.84ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 137577
     http_req_receiving.............: avg=1.69ms   min=52.07µs med=107.44µs max=911.53ms p(90)=1.84ms   p(95)=5.07ms   p(99.9)=134.37ms
     http_req_sending...............: avg=61.74µs  min=4.67µs  med=9.46µs   max=201.78ms p(90)=16.89µs  p(95)=104.6µs  p(99.9)=7.79ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=101.69ms min=1.95ms  med=91.71ms  max=1.28s    p(90)=192.71ms p(95)=215.79ms p(99.9)=687.99ms
     http_reqs......................: 137577  2199.733764/s
     iteration_duration.............: avg=104.47ms min=3.62ms  med=94.21ms  max=1.4s     p(90)=195.69ms p(95)=220.41ms p(99.9)=708.89ms
     iterations.....................: 136577  2183.744654/s
     success_rate...................: 100.00% ✓ 136577      ✗ 0     
     vus............................: 83      min=0         max=492 
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

     checks.........................: 100.00% ✓ 227016      ✗ 0    
     data_received..................: 6.7 GB  108 MB/s
     data_sent......................: 92 MB   1.5 MB/s
     http_req_blocked...............: avg=6.02µs   min=982ns  med=2.67µs   max=36.93ms  p(90)=4.32µs   p(95)=5.22µs   p(99.9)=356.07µs
     http_req_connecting............: avg=2.64µs   min=0s     med=0s       max=36.77ms  p(90)=0s       p(95)=0s       p(99.9)=251.26µs
     http_req_duration..............: avg=186.1ms  min=1.94ms med=188.32ms max=548.1ms  p(90)=344.13ms p(95)=369.57ms p(99.9)=463.84ms
       { expected_response:true }...: avg=186.1ms  min=1.94ms med=188.32ms max=548.1ms  p(90)=344.13ms p(95)=369.57ms p(99.9)=463.84ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 76672
     http_req_receiving.............: avg=76.26µs  min=27.6µs med=61.47µs  max=69.06ms  p(90)=99.25µs  p(95)=114.14µs p(99.9)=1.47ms  
     http_req_sending...............: avg=30.07µs  min=4.97µs med=11.48µs  max=97.69ms  p(90)=18.41µs  p(95)=22.39µs  p(99.9)=3.58ms  
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=186ms    min=1.88ms med=188.22ms max=548ms    p(90)=344ms    p(95)=369.49ms p(99.9)=463.74ms
     http_reqs......................: 76672   1227.047762/s
     iteration_duration.............: avg=188.79ms min=4.41ms med=191.26ms max=548.32ms p(90)=344.91ms p(95)=370.3ms  p(99.9)=464.43ms
     iterations.....................: 75672   1211.043905/s
     success_rate...................: 100.00% ✓ 75672       ✗ 0    
     vus............................: 79      min=0         max=494
     vus_max........................: 500     min=500       max=500
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

     checks.........................: 100.00% ✓ 106449     ✗ 0    
     data_received..................: 3.2 GB  50 MB/s
     data_sent......................: 44 MB   682 kB/s
     http_req_blocked...............: avg=8.77µs   min=1.21µs  med=3.33µs   max=7.11ms   p(90)=5.2µs    p(95)=6.24µs   p(99.9)=1.41ms  
     http_req_connecting............: avg=4.47µs   min=0s      med=0s       max=7.04ms   p(90)=0s       p(95)=0s       p(99.9)=1.37ms  
     http_req_duration..............: avg=393.03ms min=3.5ms   med=365.46ms max=1.61s    p(90)=770.46ms p(95)=836.53ms p(99.9)=1.26s   
       { expected_response:true }...: avg=393.03ms min=3.5ms   med=365.46ms max=1.61s    p(90)=770.46ms p(95)=836.53ms p(99.9)=1.26s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 36483
     http_req_receiving.............: avg=81.46µs  min=31.58µs med=69.75µs  max=25.63ms  p(90)=107.99µs p(95)=122.44µs p(99.9)=878.83µs
     http_req_sending...............: avg=27.94µs  min=5.73µs  med=13.94µs  max=105.72ms p(90)=21.13µs  p(95)=24.28µs  p(99.9)=2.22ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=392.92ms min=3.42ms  med=365.36ms max=1.61s    p(90)=770.35ms p(95)=836.42ms p(99.9)=1.26s   
     http_reqs......................: 36483   567.968671/s
     iteration_duration.............: avg=404.34ms min=16.35ms med=378.54ms max=1.63s    p(90)=773.93ms p(95)=839.86ms p(99.9)=1.26s   
     iterations.....................: 35483   552.400634/s
     success_rate...................: 100.00% ✓ 35483      ✗ 0    
     vus............................: 66      min=0        max=496
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

     checks.........................: 100.00% ✓ 48915      ✗ 0    
     data_received..................: 1.5 GB  23 MB/s
     data_sent......................: 21 MB   310 kB/s
     http_req_blocked...............: avg=13.24µs  min=1.1µs   med=3.2µs    max=8.74ms  p(90)=4.85µs   p(95)=6.35µs   p(99.9)=1.96ms
     http_req_connecting............: avg=8.46µs   min=0s      med=0s       max=8.68ms  p(90)=0s       p(95)=0s       p(99.9)=1.95ms
     http_req_duration..............: avg=817.63ms min=5.53ms  med=674.22ms max=20.48s  p(90)=1.35s    p(95)=1.53s    p(99.9)=18.5s 
       { expected_response:true }...: avg=817.63ms min=5.53ms  med=674.22ms max=20.48s  p(90)=1.35s    p(95)=1.53s    p(99.9)=18.5s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 17305
     http_req_receiving.............: avg=97.99µs  min=30.48µs med=88.88µs  max=31.14ms p(90)=126.06µs p(95)=142.16µs p(99.9)=1.19ms
     http_req_sending...............: avg=33.51µs  min=5.46µs  med=17.25µs  max=98.78ms p(90)=22.86µs  p(95)=26.89µs  p(99.9)=2.55ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=817.49ms min=5.45ms  med=674.11ms max=20.48s  p(90)=1.35s    p(95)=1.53s    p(99.9)=18.5s 
     http_reqs......................: 17305   257.424304/s
     iteration_duration.............: avg=867.79ms min=44.86ms med=727.86ms max=20.48s  p(90)=1.37s    p(95)=1.54s    p(99.9)=18.51s
     iterations.....................: 16305   242.548586/s
     success_rate...................: 100.00% ✓ 16305      ✗ 0    
     vus............................: 60      min=0        max=499
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

     checks.........................: 100.00% ✓ 48255      ✗ 0    
     data_received..................: 1.5 GB  21 MB/s
     data_sent......................: 21 MB   286 kB/s
     http_req_blocked...............: avg=13.28µs  min=1.05µs  med=2.99µs   max=17.32ms p(90)=4.64µs   p(95)=6.04µs   p(99.9)=2.08ms  
     http_req_connecting............: avg=8.75µs   min=0s      med=0s       max=17.26ms p(90)=0s       p(95)=0s       p(99.9)=2.06ms  
     http_req_duration..............: avg=379.43ms min=7.42ms  med=440.85ms max=1.04s   p(90)=627.02ms p(95)=668.35ms p(99.9)=943.92ms
       { expected_response:true }...: avg=379.43ms min=7.42ms  med=440.85ms max=1.04s   p(90)=627.02ms p(95)=668.35ms p(99.9)=943.92ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 17085
     http_req_receiving.............: avg=271.54µs min=30.79µs med=85.31µs  max=225ms   p(90)=122.46µs p(95)=136.74µs p(99.9)=87.37ms 
     http_req_sending...............: avg=26.37µs  min=5.22µs  med=16.58µs  max=15.95ms p(90)=21.57µs  p(95)=26.13µs  p(99.9)=2.31ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=379.13ms min=7.34ms  med=440.76ms max=1.04s   p(90)=626.88ms p(95)=668.26ms p(99.9)=943.81ms
     http_reqs......................: 17085   233.636703/s
     iteration_duration.............: avg=403.04ms min=12.25ms med=462.63ms max=1.05s   p(90)=629.34ms p(95)=673.2ms  p(99.9)=951.83ms
     iterations.....................: 16085   219.961742/s
     success_rate...................: 100.00% ✓ 16085      ✗ 0    
     vus............................: 55      min=0        max=496
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (.net subgraphs) (16.5.0-p.18)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 433719      ✗ 0     
     data_received..................: 13 GB   206 MB/s
     data_sent......................: 175 MB  2.8 MB/s
     http_req_blocked...............: avg=23.69µs  min=1.06µs  med=3.02µs   max=100.69ms p(90)=4.89µs   p(95)=6.11µs   p(99.9)=2.49ms  
     http_req_connecting............: avg=19.7µs   min=0s      med=0s       max=100.63ms p(90)=0s       p(95)=0s       p(99.9)=2.34ms  
     http_req_duration..............: avg=97.68ms  min=1.41ms  med=92.16ms  max=377.49ms p(90)=187.32ms p(95)=205.03ms p(99.9)=285.46ms
       { expected_response:true }...: avg=97.68ms  min=1.41ms  med=92.16ms  max=377.49ms p(90)=187.32ms p(95)=205.03ms p(99.9)=285.46ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 145573
     http_req_receiving.............: avg=888.39µs min=51.85µs med=119.59µs max=136.6ms  p(90)=1.7ms    p(95)=3.04ms   p(99.9)=37.08ms 
     http_req_sending...............: avg=76.67µs  min=4.65µs  med=11.51µs  max=161.17ms p(90)=23.79µs  p(95)=129.85µs p(99.9)=10ms    
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=96.72ms  min=1.33ms  med=91.12ms  max=376.86ms p(90)=186.34ms p(95)=203.75ms p(99.9)=282.37ms
     http_reqs......................: 145573  2353.810722/s
     iteration_duration.............: avg=98.64ms  min=3.68ms  med=93.14ms  max=377.74ms p(90)=187.84ms p(95)=205.6ms  p(99.9)=286.12ms
     iterations.....................: 144573  2337.641441/s
     success_rate...................: 100.00% ✓ 144573      ✗ 0     
     vus............................: 95      min=0         max=500 
     vus_max........................: 500     min=500       max=500
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

     checks.........................: 100.00% ✓ 416055      ✗ 0     
     data_received..................: 12 GB   197 MB/s
     data_sent......................: 168 MB  2.7 MB/s
     http_req_blocked...............: avg=6.97µs   min=841ns   med=2.2µs   max=19.9ms   p(90)=3.69µs   p(95)=4.78µs   p(99.9)=393.41µs
     http_req_connecting............: avg=4.16µs   min=0s      med=0s      max=19.83ms  p(90)=0s       p(95)=0s       p(99.9)=295.42µs
     http_req_duration..............: avg=101.87ms min=1.56ms  med=98ms    max=335.73ms p(90)=195.41ms p(95)=209.24ms p(99.9)=241.81ms
       { expected_response:true }...: avg=101.87ms min=1.56ms  med=98ms    max=335.73ms p(90)=195.41ms p(95)=209.24ms p(99.9)=241.81ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 139685
     http_req_receiving.............: avg=92.78µs  min=27.71µs med=54.96µs max=172.13ms p(90)=100.28µs p(95)=255.97µs p(99.9)=4.77ms  
     http_req_sending...............: avg=47.76µs  min=4.5µs   med=9.75µs  max=154.31ms p(90)=16.46µs  p(95)=93µs     p(99.9)=6.44ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=101.73ms min=1.51ms  med=97.85ms max=326.55ms p(90)=195.28ms p(95)=209.07ms p(99.9)=241.37ms
     http_reqs......................: 139685  2253.400275/s
     iteration_duration.............: avg=102.83ms min=4.08ms  med=99.12ms max=346.28ms p(90)=195.82ms p(95)=209.61ms p(99.9)=242.22ms
     iterations.....................: 138685  2237.268262/s
     success_rate...................: 100.00% ✓ 138685      ✗ 0     
     vus............................: 56      min=0         max=498 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.5.0-p.18)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 413667      ✗ 0     
     data_received..................: 12 GB   197 MB/s
     data_sent......................: 167 MB  2.7 MB/s
     http_req_blocked...............: avg=10.76µs  min=861ns   med=2.17µs   max=66.86ms  p(90)=3.73µs   p(95)=4.83µs   p(99.9)=666.56µs
     http_req_connecting............: avg=7.94µs   min=0s      med=0s       max=66.79ms  p(90)=0s       p(95)=0s       p(99.9)=597.04µs
     http_req_duration..............: avg=102.51ms min=1.51ms  med=88.58ms  max=1.74s    p(90)=189.71ms p(95)=219.58ms p(99.9)=833.39ms
       { expected_response:true }...: avg=102.51ms min=1.51ms  med=88.58ms  max=1.74s    p(90)=189.71ms p(95)=219.58ms p(99.9)=833.39ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 138889
     http_req_receiving.............: avg=1.78ms   min=52.45µs med=110.13µs max=1.19s    p(90)=2.04ms   p(95)=5.84ms   p(99.9)=95.46ms 
     http_req_sending...............: avg=51.33µs  min=4.75µs  med=9.15µs   max=135.73ms p(90)=17.37µs  p(95)=95.73µs  p(99.9)=6.9ms   
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=100.67ms min=1.4ms   med=87.14ms  max=1.74s    p(90)=187.16ms p(95)=214.94ms p(99.9)=803.67ms
     http_reqs......................: 138889  2244.268526/s
     iteration_duration.............: avg=103.49ms min=2.82ms  med=89.84ms  max=1.74s    p(90)=190.24ms p(95)=220.29ms p(99.9)=835.73ms
     iterations.....................: 137889  2228.109806/s
     success_rate...................: 100.00% ✓ 137889      ✗ 0     
     vus............................: 51      min=0         max=499 
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

     checks.........................: 100.00% ✓ 405936      ✗ 0     
     data_received..................: 12 GB   193 MB/s
     data_sent......................: 164 MB  2.6 MB/s
     http_req_blocked...............: avg=19.68µs  min=882ns   med=2.85µs   max=66.22ms  p(90)=4.63µs   p(95)=5.87µs   p(99.9)=3ms     
     http_req_connecting............: avg=15.98µs  min=0s      med=0s       max=66.06ms  p(90)=0s       p(95)=0s       p(99.9)=2.84ms  
     http_req_duration..............: avg=104.39ms min=1.53ms  med=86.59ms  max=1.67s    p(90)=202.03ms p(95)=236.57ms p(99.9)=1.01s   
       { expected_response:true }...: avg=104.39ms min=1.53ms  med=86.59ms  max=1.67s    p(90)=202.03ms p(95)=236.57ms p(99.9)=1.01s   
     http_req_failed................: 0.00%   ✓ 0           ✗ 136312
     http_req_receiving.............: avg=2.12ms   min=53.88µs med=112.05µs max=997.31ms p(90)=1.75ms   p(95)=4.87ms   p(99.9)=200.78ms
     http_req_sending...............: avg=74.89µs  min=4.57µs  med=10.87µs  max=225.69ms p(90)=21.28µs  p(95)=120µs    p(99.9)=9.09ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=102.19ms min=1.45ms  med=85.05ms  max=1.65s    p(90)=199.54ms p(95)=231.56ms p(99.9)=855.62ms
     http_reqs......................: 136312  2199.636802/s
     iteration_duration.............: avg=105.45ms min=3.04ms  med=87.65ms  max=1.67s    p(90)=202.65ms p(95)=237.54ms p(99.9)=1.01s   
     iterations.....................: 135312  2183.500022/s
     success_rate...................: 100.00% ✓ 135312      ✗ 0     
     vus............................: 55      min=0         max=498 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (.net subgraphs) (16.5.0-p.18)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 383553      ✗ 0     
     data_received..................: 11 GB   181 MB/s
     data_sent......................: 155 MB  2.5 MB/s
     http_req_blocked...............: avg=16.77µs  min=942ns   med=3.03µs   max=46.27ms  p(90)=4.91µs   p(95)=6.11µs   p(99.9)=1.63ms
     http_req_connecting............: avg=12.87µs  min=0s      med=0s       max=46.03ms  p(90)=0s       p(95)=0s       p(99.9)=1.45ms
     http_req_duration..............: avg=110.51ms min=1.88ms  med=98.67ms  max=1.84s    p(90)=206.44ms p(95)=236.09ms p(99.9)=1.06s 
       { expected_response:true }...: avg=110.51ms min=1.88ms  med=98.67ms  max=1.84s    p(90)=206.44ms p(95)=236.09ms p(99.9)=1.06s 
     http_req_failed................: 0.00%   ✓ 0           ✗ 128851
     http_req_receiving.............: avg=1.47ms   min=56.23µs med=119.63µs max=1.02s    p(90)=1.75ms   p(95)=4.59ms   p(99.9)=83.1ms
     http_req_sending...............: avg=70.09µs  min=5.28µs  med=11.88µs  max=124.23ms p(90)=22.81µs  p(95)=125.11µs p(99.9)=8.83ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=108.97ms min=1.79ms  med=97.42ms  max=1.84s    p(90)=204.78ms p(95)=233.27ms p(99.9)=1.03s 
     http_reqs......................: 128851  2066.074999/s
     iteration_duration.............: avg=111.64ms min=3.34ms  med=99.92ms  max=1.84s    p(90)=207.06ms p(95)=236.96ms p(99.9)=1.06s 
     iterations.....................: 127851  2050.040393/s
     success_rate...................: 100.00% ✓ 127851      ✗ 0     
     vus............................: 72      min=0         max=494 
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

     checks.........................: 100.00% ✓ 212124      ✗ 0    
     data_received..................: 6.3 GB  100 MB/s
     data_sent......................: 86 MB   1.4 MB/s
     http_req_blocked...............: avg=6.68µs   min=1.13µs  med=3.08µs   max=12.32ms  p(90)=4.95µs   p(95)=5.98µs   p(99.9)=538.75µs
     http_req_connecting............: avg=2.91µs   min=0s      med=0s       max=12.25ms  p(90)=0s       p(95)=0s       p(99.9)=498.23µs
     http_req_duration..............: avg=199.01ms min=2.06ms  med=199.86ms max=621.54ms p(90)=367.79ms p(95)=394.3ms  p(99.9)=561.14ms
       { expected_response:true }...: avg=199.01ms min=2.06ms  med=199.86ms max=621.54ms p(90)=367.79ms p(95)=394.3ms  p(99.9)=561.14ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 71708
     http_req_receiving.............: avg=80.45µs  min=25.72µs med=66.84µs  max=37.51ms  p(90)=107.99µs p(95)=122.93µs p(99.9)=1.32ms  
     http_req_sending...............: avg=33.33µs  min=5.11µs  med=12.91µs  max=196.13ms p(90)=20.32µs  p(95)=24.31µs  p(99.9)=3.31ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=198.89ms min=1.94ms  med=199.74ms max=621.49ms p(90)=367.7ms  p(95)=394.22ms p(99.9)=561.05ms
     http_reqs......................: 71708   1144.857152/s
     iteration_duration.............: avg=202.07ms min=4.43ms  med=203.24ms max=621.79ms p(90)=368.62ms p(95)=394.96ms p(99.9)=561.64ms
     iterations.....................: 70708   1128.891609/s
     success_rate...................: 100.00% ✓ 70708       ✗ 0    
     vus............................: 86      min=0         max=496
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

     checks.........................: 100.00% ✓ 102009     ✗ 0    
     data_received..................: 3.1 GB  47 MB/s
     data_sent......................: 42 MB   650 kB/s
     http_req_blocked...............: avg=8.13µs   min=1.11µs  med=2.87µs   max=5.38ms  p(90)=4.69µs   p(95)=5.72µs   p(99.9)=1.32ms
     http_req_connecting............: avg=4.32µs   min=0s      med=0s       max=5.32ms  p(90)=0s       p(95)=0s       p(99.9)=1.3ms 
     http_req_duration..............: avg=409.79ms min=3.83ms  med=377.96ms max=1.65s   p(90)=807.61ms p(95)=874.06ms p(99.9)=1.28s 
       { expected_response:true }...: avg=409.79ms min=3.83ms  med=377.96ms max=1.65s   p(90)=807.61ms p(95)=874.06ms p(99.9)=1.28s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 35003
     http_req_receiving.............: avg=87.19µs  min=27.94µs med=72.25µs  max=76.07ms p(90)=112µs    p(95)=127.22µs p(99.9)=1.87ms
     http_req_sending...............: avg=30.26µs  min=4.93µs  med=13.71µs  max=91.72ms p(90)=21.21µs  p(95)=24.42µs  p(99.9)=2.61ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=409.67ms min=3.73ms  med=377.87ms max=1.65s   p(90)=807.53ms p(95)=873.83ms p(99.9)=1.28s 
     http_reqs......................: 35003   541.6095/s
     iteration_duration.............: avg=422.06ms min=21.26ms med=394.86ms max=1.66s   p(90)=810.57ms p(95)=877.23ms p(99.9)=1.29s 
     iterations.....................: 34003   526.136269/s
     success_rate...................: 100.00% ✓ 34003      ✗ 0    
     vus............................: 84      min=0        max=499
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

     checks.........................: 100.00% ✓ 46794      ✗ 0    
     data_received..................: 1.5 GB  22 MB/s
     data_sent......................: 20 MB   295 kB/s
     http_req_blocked...............: avg=14.28µs  min=1.26µs  med=3.93µs   max=3.73ms p(90)=5.95µs   p(95)=7.71µs   p(99.9)=1.98ms  
     http_req_connecting............: avg=8.53µs   min=0s      med=0s       max=3.69ms p(90)=0s       p(95)=0s       p(99.9)=1.95ms  
     http_req_duration..............: avg=876.62ms min=5.9ms   med=788.83ms max=4.86s  p(90)=1.73s    p(95)=1.95s    p(99.9)=3.96s   
       { expected_response:true }...: avg=876.62ms min=5.9ms   med=788.83ms max=4.86s  p(90)=1.73s    p(95)=1.95s    p(99.9)=3.96s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 16598
     http_req_receiving.............: avg=105.26µs min=35.13µs med=98.72µs  max=8.13ms p(90)=138.57µs p(95)=154.58µs p(99.9)=875.29µs
     http_req_sending...............: avg=33.58µs  min=5.62µs  med=19.33µs  max=27ms   p(90)=25.55µs  p(95)=30.87µs  p(99.9)=3.53ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s     p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=876.49ms min=5.82ms  med=788.68ms max=4.86s  p(90)=1.73s    p(95)=1.95s    p(99.9)=3.96s   
     http_reqs......................: 16598   245.654152/s
     iteration_duration.............: avg=932.86ms min=27.65ms med=855.39ms max=4.86s  p(90)=1.76s    p(95)=1.97s    p(99.9)=4.02s   
     iterations.....................: 15598   230.853926/s
     success_rate...................: 100.00% ✓ 15598      ✗ 0    
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

     checks.........................: 100.00% ✓ 44076      ✗ 0    
     data_received..................: 1.4 GB  20 MB/s
     data_sent......................: 19 MB   273 kB/s
     http_req_blocked...............: avg=15.06µs  min=1.42µs  med=3.68µs   max=6.64ms  p(90)=5.49µs   p(95)=7.23µs   p(99.9)=2.17ms
     http_req_connecting............: avg=9.52µs   min=0s      med=0s       max=6.47ms  p(90)=0s       p(95)=0s       p(99.9)=2.15ms
     http_req_duration..............: avg=925.74ms min=7.88ms  med=828.5ms  max=3.47s   p(90)=1.89s    p(95)=2.03s    p(99.9)=3.03s 
       { expected_response:true }...: avg=925.74ms min=7.88ms  med=828.5ms  max=3.47s   p(90)=1.89s    p(95)=2.03s    p(99.9)=3.03s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 15692
     http_req_receiving.............: avg=106.77µs min=36.41µs med=92.97µs  max=49.71ms p(90)=134.13µs p(95)=150.87µs p(99.9)=1.16ms
     http_req_sending...............: avg=38.24µs  min=6.53µs  med=18.32µs  max=92.67ms p(90)=24.07µs  p(95)=29.6µs   p(99.9)=2.73ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=925.6ms  min=7.78ms  med=828.37ms max=3.47s   p(90)=1.89s    p(95)=2.03s    p(99.9)=3.03s 
     http_reqs......................: 15692   227.650479/s
     iteration_duration.............: avg=988.72ms min=44.34ms med=925.81ms max=3.47s   p(90)=1.91s    p(95)=2.04s    p(99.9)=3.04s 
     iterations.....................: 14692   213.143056/s
     success_rate...................: 100.00% ✓ 14692      ✗ 0    
     vus............................: 31      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

