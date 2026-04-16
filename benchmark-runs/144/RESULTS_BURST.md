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
| hive-router | v0.0.43 | 2,704 | 2,834 | 2,655 | 2.3% |  |
| hotchocolate | 16.1.0-p.1.2 | 2,005 | 2,057 | 1,980 | 1.4% |  |
| cosmo | 0.298.0 | 1,202 | 1,220 | 1,198 | 0.8% | non-compatible response (8 across 4/9 runs) |
| hive-gateway-router-runtime | 2.5.14 | 571 | 576 | 566 | 0.7% |  |
| hive-gateway | 2.5.14 | 245 | 248 | 243 | 0.8% |  |
| apollo-gateway | 2.13.3 | 202 | 207 | 198 | 1.3% |  |
| apollo-router | v2.12.1 | — | — | — | — | non-compatible response (36181 across 9/9 runs) |
| grafbase | 0.53.2 | — | — | — | — | non-compatible response (461496 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.43 | 2,189 | 2,300 | 2,140 | 2.4% |  |
| hotchocolate | 16.1.0-p.1.2 | 1,913 | 1,948 | 1,901 | 0.8% |  |
| cosmo | 0.298.0 | 1,095 | 1,099 | 1,092 | 0.3% | non-compatible response (9 across 5/9 runs) |
| hive-gateway-router-runtime | 2.5.14 | 529 | 538 | 521 | 1.1% |  |
| hive-gateway | 2.5.14 | 237 | 241 | 234 | 1.0% |  |
| apollo-gateway | 2.13.3 | 206 | 210 | 205 | 0.8% |  |
| apollo-router | v2.12.1 | — | — | — | — | non-compatible response (35542 across 9/9 runs) |
| grafbase | 0.53.2 | — | — | — | — | non-compatible response (296821 across 9/9 runs) |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.43)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 498696      ✗ 0     
     data_received..................: 15 GB   237 MB/s
     data_sent......................: 201 MB  3.2 MB/s
     http_req_blocked...............: avg=34.08µs  min=1.03µs  med=2.71µs  max=84.22ms  p(90)=4.29µs   p(95)=5.44µs   p(99.9)=8.43ms  
     http_req_connecting............: avg=30.2µs   min=0s      med=0s      max=84.06ms  p(90)=0s       p(95)=0s       p(99.9)=6.96ms  
     http_req_duration..............: avg=84.92ms  min=1.62ms  med=78.37ms max=315.76ms p(90)=165.19ms p(95)=183.14ms p(99.9)=248.24ms
       { expected_response:true }...: avg=84.92ms  min=1.62ms  med=78.37ms max=315.76ms p(90)=165.19ms p(95)=183.14ms p(99.9)=248.24ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 167232
     http_req_receiving.............: avg=576.57µs min=29.96µs med=58.11µs max=138.71ms p(90)=280.82µs p(95)=456.39µs p(99.9)=53.64ms 
     http_req_sending...............: avg=100.43µs min=5.42µs  med=10.6µs  max=113.28ms p(90)=19.94µs  p(95)=139.71µs p(99.9)=16.44ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=84.25ms  min=1.56ms  med=77.92ms max=300.07ms p(90)=164.15ms p(95)=181.39ms p(99.9)=243.48ms
     http_reqs......................: 167232  2704.285448/s
     iteration_duration.............: avg=85.75ms  min=2.75ms  med=79.3ms  max=361.46ms p(90)=165.79ms p(95)=183.83ms p(99.9)=252.15ms
     iterations.....................: 166232  2688.114587/s
     success_rate...................: 100.00% ✓ 166232      ✗ 0     
     vus............................: 39      min=0         max=500 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (rust subgraphs) (16.1.0-p.1.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 374199      ✗ 0     
     data_received..................: 11 GB   176 MB/s
     data_sent......................: 151 MB  2.4 MB/s
     http_req_blocked...............: avg=12.28µs  min=1.04µs  med=2.18µs   max=50.57ms  p(90)=3.43µs   p(95)=4.34µs   p(99.9)=1.22ms  
     http_req_connecting............: avg=9.47µs   min=0s      med=0s       max=50.39ms  p(90)=0s       p(95)=0s       p(99.9)=1.19ms  
     http_req_duration..............: avg=113.21ms min=2.37ms  med=108.01ms max=556.32ms p(90)=214.26ms p(95)=237.81ms p(99.9)=373.9ms 
       { expected_response:true }...: avg=113.21ms min=2.37ms  med=108.01ms max=556.32ms p(90)=214.26ms p(95)=237.81ms p(99.9)=373.9ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 125733
     http_req_receiving.............: avg=1.32ms   min=51.53µs med=160.83µs max=203.95ms p(90)=1.46ms   p(95)=3.7ms    p(99.9)=109.18ms
     http_req_sending...............: avg=56.04µs  min=5.33µs  med=9.68µs   max=68.35ms  p(90)=17.4µs   p(95)=119.39µs p(99.9)=7.35ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=111.83ms min=2.28ms  med=106.73ms max=552.19ms p(90)=212.31ms p(95)=234.64ms p(99.9)=368.35ms
     http_reqs......................: 125733  2005.898878/s
     iteration_duration.............: avg=114.37ms min=3.61ms  med=109.44ms max=556.53ms p(90)=214.81ms p(95)=238.52ms p(99.9)=374.44ms
     iterations.....................: 124733  1989.945239/s
     success_rate...................: 100.00% ✓ 124733      ✗ 0     
     vus............................: 88      min=0         max=497 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (rust subgraphs) (0.298.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 222414      ✗ 0    
     data_received..................: 6.6 GB  106 MB/s
     data_sent......................: 90 MB   1.4 MB/s
     http_req_blocked...............: avg=8.59µs   min=1.07µs  med=2.46µs   max=71.42ms  p(90)=4.1µs    p(95)=5.03µs   p(99.9)=647.03µs
     http_req_connecting............: avg=5.45µs   min=0s      med=0s       max=71.33ms  p(90)=0s       p(95)=0s       p(99.9)=574.61µs
     http_req_duration..............: avg=189.86ms min=2.04ms  med=189.38ms max=630.6ms  p(90)=351.84ms p(95)=377.61ms p(99.9)=532.82ms
       { expected_response:true }...: avg=189.86ms min=2.04ms  med=189.38ms max=630.6ms  p(90)=351.84ms p(95)=377.61ms p(99.9)=532.82ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 75138
     http_req_receiving.............: avg=86.6µs   min=30.67µs med=61.3µs   max=142.92ms p(90)=97.47µs  p(95)=113.37µs p(99.9)=1.86ms  
     http_req_sending...............: avg=33.54µs  min=5.52µs  med=10.97µs  max=78.74ms  p(90)=17.66µs  p(95)=21.64µs  p(99.9)=3.98ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=189.74ms min=1.98ms  med=189.25ms max=630.54ms p(90)=351.74ms p(95)=377.51ms p(99.9)=532.75ms
     http_reqs......................: 75138   1202.644531/s
     iteration_duration.............: avg=192.68ms min=4.35ms  med=192.59ms max=630.87ms p(90)=352.66ms p(95)=378.28ms p(99.9)=533.56ms
     iterations.....................: 74138   1186.638721/s
     success_rate...................: 100.00% ✓ 74138       ✗ 0    
     vus............................: 81      min=0         max=494
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (rust subgraphs) (2.5.14)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 107445     ✗ 0    
     data_received..................: 3.2 GB  50 MB/s
     data_sent......................: 44 MB   686 kB/s
     http_req_blocked...............: avg=10.2µs   min=1.19µs  med=2.82µs   max=45.16ms  p(90)=4.55µs   p(95)=5.56µs   p(99.9)=1.43ms
     http_req_connecting............: avg=6.3µs    min=0s      med=0s       max=45.1ms   p(90)=0s       p(95)=0s       p(99.9)=1.22ms
     http_req_duration..............: avg=389.49ms min=3.6ms   med=359.88ms max=1.5s     p(90)=768.93ms p(95)=834.47ms p(99.9)=1.19s 
       { expected_response:true }...: avg=389.49ms min=3.6ms   med=359.88ms max=1.5s     p(90)=768.93ms p(95)=834.47ms p(99.9)=1.19s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 36815
     http_req_receiving.............: avg=101.92µs min=33.76µs med=75.34µs  max=177.04ms p(90)=111.54µs p(95)=125.08µs p(99.9)=1.19ms
     http_req_sending...............: avg=26.89µs  min=5.88µs  med=13.2µs   max=63.55ms  p(90)=20.63µs  p(95)=23.89µs  p(99.9)=2.6ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=389.36ms min=3.54ms  med=359.78ms max=1.5s     p(90)=768.84ms p(95)=834.38ms p(99.9)=1.19s 
     http_reqs......................: 36815   571.538135/s
     iteration_duration.............: avg=400.59ms min=20.84ms med=374.07ms max=1.51s    p(90)=772.31ms p(95)=836.43ms p(99.9)=1.2s  
     iterations.....................: 35815   556.013536/s
     success_rate...................: 100.00% ✓ 35815      ✗ 0    
     vus............................: 76      min=0        max=494
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (rust subgraphs) (2.5.14)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 46863      ✗ 0    
     data_received..................: 1.5 GB  22 MB/s
     data_sent......................: 20 MB   295 kB/s
     http_req_blocked...............: avg=13.78µs  min=1.23µs  med=3.37µs   max=8.92ms p(90)=5.18µs   p(95)=6.71µs   p(99.9)=2.17ms  
     http_req_connecting............: avg=8.81µs   min=0s      med=0s       max=8.86ms p(90)=0s       p(95)=0s       p(99.9)=2.14ms  
     http_req_duration..............: avg=860.4ms  min=5.75ms  med=747.91ms max=17.01s p(90)=1.5s     p(95)=1.68s    p(99.9)=15.46s  
       { expected_response:true }...: avg=860.4ms  min=5.75ms  med=747.91ms max=17.01s p(90)=1.5s     p(95)=1.68s    p(99.9)=15.46s  
     http_req_failed................: 0.00%   ✓ 0          ✗ 16621
     http_req_receiving.............: avg=101.85µs min=36.81µs med=94.61µs  max=15.6ms p(90)=134.41µs p(95)=147.57µs p(99.9)=758.34µs
     http_req_sending...............: avg=28.57µs  min=6.35µs  med=16.71µs  max=7.33ms p(90)=23.15µs  p(95)=27.17µs  p(99.9)=3.22ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s     p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=860.27ms min=5.64ms  med=747.81ms max=17.01s p(90)=1.5s     p(95)=1.68s    p(99.9)=15.46s  
     http_reqs......................: 16621   245.259703/s
     iteration_duration.............: avg=915.46ms min=30.11ms med=820.53ms max=17.01s p(90)=1.52s    p(95)=1.69s    p(99.9)=15.64s  
     iterations.....................: 15621   230.50369/s
     success_rate...................: 100.00% ✓ 15621      ✗ 0    
     vus............................: 93      min=0        max=500
     vus_max........................: 500     min=500      max=500
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

     checks.........................: 100.00% ✓ 42114      ✗ 0    
     data_received..................: 1.3 GB  18 MB/s
     data_sent......................: 19 MB   249 kB/s
     http_req_blocked...............: avg=13.77µs  min=1.15µs  med=3.15µs   max=6.77ms  p(90)=4.77µs   p(95)=6.24µs   p(99.9)=1.99ms  
     http_req_connecting............: avg=8.77µs   min=0s      med=0s       max=6.61ms  p(90)=0s       p(95)=0s       p(99.9)=1.88ms  
     http_req_duration..............: avg=443.61ms min=8.32ms  med=495.36ms max=1.42s   p(90)=784.18ms p(95)=906.74ms p(99.9)=1.27s   
       { expected_response:true }...: avg=443.61ms min=8.32ms  med=495.36ms max=1.42s   p(90)=784.18ms p(95)=906.74ms p(99.9)=1.27s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 15038
     http_req_receiving.............: avg=97.56µs  min=34.65µs med=87.95µs  max=43.89ms p(90)=127.27µs p(95)=140.95µs p(99.9)=878.08µs
     http_req_sending...............: avg=40.54µs  min=6.11µs  med=16.2µs   max=51.7ms  p(90)=22.19µs  p(95)=27.38µs  p(99.9)=4.46ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=443.47ms min=8.18ms  med=495.21ms max=1.42s   p(90)=784.02ms p(95)=906.61ms p(99.9)=1.27s   
     http_reqs......................: 15038   202.82017/s
     iteration_duration.............: avg=475.04ms min=8.83ms  med=524.24ms max=1.43s   p(90)=807.71ms p(95)=911.57ms p(99.9)=1.28s   
     iterations.....................: 14038   189.332993/s
     success_rate...................: 100.00% ✓ 14038      ✗ 0    
     vus............................: 59      min=0        max=496
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.43)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 404250      ✗ 0     
     data_received..................: 12 GB   191 MB/s
     data_sent......................: 163 MB  2.6 MB/s
     http_req_blocked...............: avg=25.25µs  min=1.11µs  med=2.93µs   max=71.27ms  p(90)=4.68µs   p(95)=5.96µs   p(99.9)=3.39ms  
     http_req_connecting............: avg=21.59µs  min=0s      med=0s       max=71.06ms  p(90)=0s       p(95)=0s       p(99.9)=3.32ms  
     http_req_duration..............: avg=104.76ms min=1.56ms  med=99.54ms  max=340.24ms p(90)=200.96ms p(95)=218.76ms p(99.9)=271.19ms
       { expected_response:true }...: avg=104.76ms min=1.56ms  med=99.54ms  max=340.24ms p(90)=200.96ms p(95)=218.76ms p(99.9)=271.19ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 135750
     http_req_receiving.............: avg=205.15µs min=30.62µs med=63.12µs  max=53.23ms  p(90)=178.22µs p(95)=428.59µs p(99.9)=21.68ms 
     http_req_sending...............: avg=79.49µs  min=5.51µs  med=11.7µs   max=130.26ms p(90)=21.67µs  p(95)=143.93µs p(99.9)=11.09ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=104.48ms min=1.51ms  med=99.28ms  max=339.45ms p(90)=200.52ms p(95)=218.19ms p(99.9)=269.84ms
     http_reqs......................: 135750  2189.326565/s
     iteration_duration.............: avg=105.84ms min=4.21ms  med=100.86ms max=377.41ms p(90)=201.65ms p(95)=219.28ms p(99.9)=272.4ms 
     iterations.....................: 134750  2173.198929/s
     success_rate...................: 100.00% ✓ 134750      ✗ 0     
     vus............................: 57      min=0         max=498 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (.net subgraphs) (16.1.0-p.1.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 354018      ✗ 0     
     data_received..................: 10 GB   168 MB/s
     data_sent......................: 143 MB  2.3 MB/s
     http_req_blocked...............: avg=14.59µs  min=1.06µs  med=2.79µs   max=53.25ms  p(90)=4.41µs   p(95)=5.48µs   p(99.9)=1.78ms  
     http_req_connecting............: avg=11.05µs  min=0s      med=0s       max=53.18ms  p(90)=0s       p(95)=0s       p(99.9)=1.68ms  
     http_req_duration..............: avg=119.6ms  min=1.8ms   med=111.29ms max=1.24s    p(90)=222.03ms p(95)=250.94ms p(99.9)=752.24ms
       { expected_response:true }...: avg=119.6ms  min=1.8ms   med=111.29ms max=1.24s    p(90)=222.03ms p(95)=250.94ms p(99.9)=752.24ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 119006
     http_req_receiving.............: avg=1.35ms   min=51.77µs med=141.24µs max=378.06ms p(90)=1.57ms   p(95)=3.54ms   p(99.9)=107.29ms
     http_req_sending...............: avg=63.76µs  min=5.38µs  med=10.91µs  max=154.61ms p(90)=20.69µs  p(95)=131.35µs p(99.9)=8.26ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=118.18ms min=1.68ms  med=109.84ms max=1.22s    p(90)=220.03ms p(95)=248.24ms p(99.9)=750.88ms
     http_reqs......................: 119006  1913.579381/s
     iteration_duration.............: avg=120.91ms min=3.12ms  med=112.79ms max=1.24s    p(90)=222.75ms p(95)=251.64ms p(99.9)=752.63ms
     iterations.....................: 118006  1897.499692/s
     success_rate...................: 100.00% ✓ 118006      ✗ 0     
     vus............................: 65      min=0         max=496 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (.net subgraphs) (0.298.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 202929      ✗ 0    
     data_received..................: 6.0 GB  96 MB/s
     data_sent......................: 82 MB   1.3 MB/s
     http_req_blocked...............: avg=6.98µs   min=1.15µs med=2.86µs   max=14.55ms  p(90)=4.62µs   p(95)=5.59µs   p(99.9)=555.07µs
     http_req_connecting............: avg=3.21µs   min=0s     med=0s       max=14.5ms   p(90)=0s       p(95)=0s       p(99.9)=467.86µs
     http_req_duration..............: avg=207.94ms min=2.09ms med=207.52ms max=674.09ms p(90)=383.19ms p(95)=413.52ms p(99.9)=587.62ms
       { expected_response:true }...: avg=207.94ms min=2.09ms med=207.52ms max=674.09ms p(90)=383.19ms p(95)=413.52ms p(99.9)=587.62ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 68643
     http_req_receiving.............: avg=86.28µs  min=30.2µs med=67.04µs  max=141.4ms  p(90)=104.62µs p(95)=120.55µs p(99.9)=1.98ms  
     http_req_sending...............: avg=32.6µs   min=5.55µs med=12.42µs  max=62.98ms  p(90)=19.18µs  p(95)=22.92µs  p(99.9)=4.02ms  
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=207.82ms min=2.02ms med=207.41ms max=674.02ms p(90)=383.09ms p(95)=413.4ms  p(99.9)=587.55ms
     http_reqs......................: 68643   1095.561357/s
     iteration_duration.............: avg=211.27ms min=5.92ms med=211.05ms max=674.28ms p(90)=384.23ms p(95)=414.38ms p(99.9)=588.09ms
     iterations.....................: 67643   1079.601079/s
     success_rate...................: 100.00% ✓ 67643       ✗ 0    
     vus............................: 88      min=0         max=498
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (.net subgraphs) (2.5.14)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 99849      ✗ 0    
     data_received..................: 3.0 GB  46 MB/s
     data_sent......................: 41 MB   635 kB/s
     http_req_blocked...............: avg=9.4µs    min=1.25µs  med=3.15µs   max=16.96ms  p(90)=4.89µs   p(95)=5.88µs   p(99.9)=1.16ms
     http_req_connecting............: avg=5.22µs   min=0s      med=0s       max=16.89ms  p(90)=0s       p(95)=0s       p(99.9)=1.1ms 
     http_req_duration..............: avg=418.66ms min=3.71ms  med=391.13ms max=1.79s    p(90)=830.32ms p(95)=908.86ms p(99.9)=1.31s 
       { expected_response:true }...: avg=418.66ms min=3.71ms  med=391.13ms max=1.79s    p(90)=830.32ms p(95)=908.86ms p(99.9)=1.31s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 34283
     http_req_receiving.............: avg=93.05µs  min=31.22µs med=80.47µs  max=86.36ms  p(90)=116.06µs p(95)=130.31µs p(99.9)=1.15ms
     http_req_sending...............: avg=33.78µs  min=5.92µs  med=14.39µs  max=120.67ms p(90)=21.31µs  p(95)=24.51µs  p(99.9)=3.29ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=418.53ms min=3.63ms  med=391.01ms max=1.79s    p(90)=830.22ms p(95)=908.77ms p(99.9)=1.31s 
     http_reqs......................: 34283   529.279814/s
     iteration_duration.............: avg=431.48ms min=13.38ms med=407.85ms max=1.79s    p(90)=834.8ms  p(95)=912.11ms p(99.9)=1.31s 
     iterations.....................: 33283   513.841264/s
     success_rate...................: 100.00% ✓ 33283      ✗ 0    
     vus............................: 91      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (.net subgraphs) (2.5.14)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 45345      ✗ 0    
     data_received..................: 1.4 GB  21 MB/s
     data_sent......................: 19 MB   286 kB/s
     http_req_blocked...............: avg=14.38µs  min=1.21µs  med=3.41µs   max=32.66ms p(90)=5.26µs   p(95)=7.08µs   p(99.9)=1.63ms  
     http_req_connecting............: avg=9.09µs   min=0s      med=0s       max=32.6ms  p(90)=0s       p(95)=0s       p(99.9)=1.45ms  
     http_req_duration..............: avg=904.31ms min=5.94ms  med=815.05ms max=4.66s   p(90)=1.81s    p(95)=1.99s    p(99.9)=4.17s   
       { expected_response:true }...: avg=904.31ms min=5.94ms  med=815.05ms max=4.66s   p(90)=1.81s    p(95)=1.99s    p(99.9)=4.17s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 16115
     http_req_receiving.............: avg=103.06µs min=34.99µs med=95.2µs   max=27.52ms p(90)=135.08µs p(95)=148.04µs p(99.9)=877.98µs
     http_req_sending...............: avg=28.87µs  min=5.97µs  med=16.66µs  max=36.62ms p(90)=23.11µs  p(95)=27.73µs  p(99.9)=2.39ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=904.18ms min=5.85ms  med=814.91ms max=4.66s   p(90)=1.81s    p(95)=1.99s    p(99.9)=4.17s   
     http_reqs......................: 16115   237.879858/s
     iteration_duration.............: avg=964.15ms min=53.87ms med=893.53ms max=4.67s   p(90)=1.83s    p(95)=2s       p(99.9)=4.19s   
     iterations.....................: 15115   223.118465/s
     success_rate...................: 100.00% ✓ 15115      ✗ 0    
     vus............................: 93      min=0        max=500
     vus_max........................: 500     min=500      max=500
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

     checks.........................: 100.00% ✓ 40263      ✗ 0    
     data_received..................: 1.3 GB  18 MB/s
     data_sent......................: 17 MB   248 kB/s
     http_req_blocked...............: avg=15.3µs   min=1.16µs  med=3.43µs   max=5.3ms   p(90)=5.13µs   p(95)=6.72µs  p(99.9)=2.52ms
     http_req_connecting............: avg=9.62µs   min=0s      med=0s       max=3.77ms  p(90)=0s       p(95)=0s      p(99.9)=2.39ms
     http_req_duration..............: avg=1.01s    min=8.75ms  med=917.27ms max=4.22s   p(90)=2.06s    p(95)=2.18s   p(99.9)=3.65s 
       { expected_response:true }...: avg=1.01s    min=8.75ms  med=917.27ms max=4.22s   p(90)=2.06s    p(95)=2.18s   p(99.9)=3.65s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 14421
     http_req_receiving.............: avg=110.67µs min=32.06µs med=93.83µs  max=44.99ms p(90)=135.26µs p(95)=147.9µs p(99.9)=1.07ms
     http_req_sending...............: avg=29.2µs   min=6.14µs  med=16.45µs  max=8.95ms  p(90)=22.45µs  p(95)=27.49µs p(99.9)=4.09ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s      p(99.9)=0s    
     http_req_waiting...............: avg=1.01s    min=8.61ms  med=917.14ms max=4.22s   p(90)=2.06s    p(95)=2.18s   p(99.9)=3.65s 
     http_reqs......................: 14421   206.431669/s
     iteration_duration.............: avg=1.08s    min=28.16ms med=1.01s    max=4.23s   p(90)=2.08s    p(95)=2.19s   p(99.9)=3.67s 
     iterations.....................: 13421   192.117012/s
     success_rate...................: 100.00% ✓ 13421      ✗ 0    
     vus............................: 2       min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-174-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

