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
| hive-router | v0.0.65 | 2,667 | 2,793 | 2,640 | 2.0% |  |
| fusion | 16.1.4 | 2,048 | 2,096 | 2,032 | 1.0% |  |
| fusion-nightly | 16.2.0-p.4 | 2,033 | 2,102 | 1,962 | 2.0% |  |
| cosmo | 0.321.1 | 1,135 | 1,141 | 1,118 | 1.1% | non-compatible response (12 across 6/9 runs) |
| hive-gateway-router-runtime | 2.8.2 | 516 | 520 | 512 | 0.6% |  |
| hive-gateway | 2.8.2 | 218 | 221 | 215 | 1.1% |  |
| apollo-gateway | 2.14.1 | 203 | 207 | 202 | 0.7% |  |
| apollo-router | v2.15.0 | — | — | — | — | non-compatible response (9046 across 9/9 runs) |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (515380 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.65 | 2,255 | 2,318 | 2,229 | 1.6% |  |
| fusion-nightly | 16.2.0-p.4 | 1,908 | 1,945 | 1,882 | 1.1% |  |
| fusion | 16.1.4 | 1,892 | 1,914 | 1,668 | 4.1% |  |
| hive-gateway-router-runtime | 2.8.2 | 484 | 490 | 477 | 0.9% |  |
| hive-gateway | 2.8.2 | 218 | 219 | 216 | 0.6% |  |
| apollo-gateway | 2.14.1 | 205 | 209 | 204 | 0.8% |  |
| apollo-router | v2.15.0 | — | — | — | — | non-compatible response (22039 across 9/9 runs) |
| cosmo | 0.321.1 | — | — | — | — | non-compatible response (23 across 9/9 runs) |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (247166 across 9/9 runs) |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.65)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 492135      ✗ 0     
     data_received..................: 15 GB   234 MB/s
     data_sent......................: 198 MB  3.2 MB/s
     http_req_blocked...............: avg=30.75µs  min=1.04µs  med=2.73µs  max=95.23ms  p(90)=4.34µs   p(95)=5.46µs   p(99.9)=5.28ms  
     http_req_connecting............: avg=27.32µs  min=0s      med=0s      max=95.18ms  p(90)=0s       p(95)=0s       p(99.9)=5.19ms  
     http_req_duration..............: avg=85.98ms  min=1.61ms  med=78.89ms max=364.45ms p(90)=166.74ms p(95)=184.53ms p(99.9)=261.94ms
       { expected_response:true }...: avg=85.98ms  min=1.61ms  med=78.89ms max=364.45ms p(90)=166.74ms p(95)=184.53ms p(99.9)=261.94ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 165045
     http_req_receiving.............: avg=456.37µs min=27.87µs med=58.25µs max=62.92ms  p(90)=254.43µs p(95)=445.68µs p(99.9)=42.64ms 
     http_req_sending...............: avg=92.6µs   min=5.37µs  med=10.33µs max=283.5ms  p(90)=19.76µs  p(95)=139.43µs p(99.9)=14.41ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=85.43ms  min=1.56ms  med=78.6ms  max=363.73ms p(90)=165.96ms p(95)=182.42ms p(99.9)=260.31ms
     http_reqs......................: 165045  2667.921248/s
     iteration_duration.............: avg=86.9ms   min=2.6ms   med=79.89ms max=402.93ms p(90)=167.34ms p(95)=185.33ms p(99.9)=271.96ms
     iterations.....................: 164045  2651.756437/s
     success_rate...................: 100.00% ✓ 164045      ✗ 0     
     vus............................: 52      min=0         max=499 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (rust subgraphs) (16.1.4)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 381996      ✗ 0     
     data_received..................: 11 GB   180 MB/s
     data_sent......................: 154 MB  2.5 MB/s
     http_req_blocked...............: avg=17.64µs  min=1.02µs  med=2.59µs   max=82.2ms   p(90)=3.98µs   p(95)=4.91µs   p(99.9)=1.83ms  
     http_req_connecting............: avg=14.4µs   min=0s      med=0s       max=81.99ms  p(90)=0s       p(95)=0s       p(99.9)=1.77ms  
     http_req_duration..............: avg=110.89ms min=2.33ms  med=102.06ms max=664.22ms p(90)=214.1ms  p(95)=250.29ms p(99.9)=448.52ms
       { expected_response:true }...: avg=110.89ms min=2.33ms  med=102.06ms max=664.22ms p(90)=214.1ms  p(95)=250.29ms p(99.9)=448.52ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 128332
     http_req_receiving.............: avg=2.06ms   min=51.75µs med=119.16µs max=406.73ms p(90)=1.34ms   p(95)=4.63ms   p(99.9)=169.29ms
     http_req_sending...............: avg=65.6µs   min=5.39µs  med=10.15µs  max=289.64ms p(90)=18.45µs  p(95)=125.62µs p(99.9)=8.39ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=108.76ms min=2.25ms  med=100.87ms max=648.89ms p(90)=210.99ms p(95)=242.36ms p(99.9)=409.31ms
     http_reqs......................: 128332  2048.263071/s
     iteration_duration.............: avg=112.04ms min=3.74ms  med=103.33ms max=664.47ms p(90)=214.79ms p(95)=251.23ms p(99.9)=449.27ms
     iterations.....................: 127332  2032.302414/s
     success_rate...................: 100.00% ✓ 127332      ✗ 0     
     vus............................: 87      min=0         max=496 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (rust subgraphs) (16.2.0-p.4)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 379497      ✗ 0     
     data_received..................: 11 GB   178 MB/s
     data_sent......................: 153 MB  2.4 MB/s
     http_req_blocked...............: avg=23.77µs  min=1.04µs  med=2.71µs   max=99.23ms  p(90)=4.3µs    p(95)=5.3µs    p(99.9)=2.42ms  
     http_req_connecting............: avg=19.69µs  min=0s      med=0s       max=99.17ms  p(90)=0s       p(95)=0s       p(99.9)=2.2ms   
     http_req_duration..............: avg=111.57ms min=2.34ms  med=98.98ms  max=791.65ms p(90)=226.49ms p(95)=269.47ms p(99.9)=482.29ms
       { expected_response:true }...: avg=111.57ms min=2.34ms  med=98.98ms  max=791.65ms p(90)=226.49ms p(95)=269.47ms p(99.9)=482.29ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 127499
     http_req_receiving.............: avg=3.68ms   min=53.15µs med=145.63µs max=580.61ms p(90)=4.98ms   p(95)=15.34ms  p(99.9)=181.78ms
     http_req_sending...............: avg=77.59µs  min=5.26µs  med=10.39µs  max=167.47ms p(90)=19.64µs  p(95)=126.09µs p(99.9)=11.23ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=107.81ms min=2.24ms  med=96.67ms  max=781.4ms  p(90)=218.11ms p(95)=255.3ms  p(99.9)=453.46ms
     http_reqs......................: 127499  2033.404442/s
     iteration_duration.............: avg=112.79ms min=3.24ms  med=100.39ms max=791.89ms p(90)=227.49ms p(95)=270.54ms p(99.9)=485.5ms 
     iterations.....................: 126499  2017.456047/s
     success_rate...................: 100.00% ✓ 126499      ✗ 0     
     vus............................: 91      min=0         max=500 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (rust subgraphs) (0.321.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 210096      ✗ 0    
     data_received..................: 6.2 GB  100 MB/s
     data_sent......................: 85 MB   1.4 MB/s
     http_req_blocked...............: avg=7.31µs   min=1.22µs  med=2.66µs   max=28.19ms  p(90)=4.16µs   p(95)=4.99µs   p(99.9)=599.89µs
     http_req_connecting............: avg=3.97µs   min=0s      med=0s       max=27.52ms  p(90)=0s       p(95)=0s       p(99.9)=513.85µs
     http_req_duration..............: avg=200.93ms min=2.09ms  med=201.4ms  max=649.56ms p(90)=370.64ms p(95)=397.63ms p(99.9)=556.51ms
       { expected_response:true }...: avg=200.93ms min=2.09ms  med=201.4ms  max=649.56ms p(90)=370.64ms p(95)=397.63ms p(99.9)=556.51ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 71032
     http_req_receiving.............: avg=85.41µs  min=30.21µs med=62.71µs  max=211.05ms p(90)=96.97µs  p(95)=110.13µs p(99.9)=1.61ms  
     http_req_sending...............: avg=32.28µs  min=5.55µs  med=11.04µs  max=128.57ms p(90)=16.95µs  p(95)=20.4µs   p(99.9)=3.84ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=200.81ms min=2.02ms  med=201.27ms max=649.49ms p(90)=370.53ms p(95)=397.55ms p(99.9)=556.44ms
     http_reqs......................: 71032   1135.484005/s
     iteration_duration.............: avg=204.04ms min=4.14ms  med=204.83ms max=649.73ms p(90)=371.48ms p(95)=398.51ms p(99.9)=557.32ms
     iterations.....................: 70032   1119.498477/s
     success_rate...................: 100.00% ✓ 70032       ✗ 0    
     vus............................: 82      min=0         max=493
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (rust subgraphs) (2.8.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 97416      ✗ 0    
     data_received..................: 2.9 GB  45 MB/s
     data_sent......................: 40 MB   620 kB/s
     http_req_blocked...............: avg=9.23µs   min=1.17µs  med=3.2µs    max=33.39ms  p(90)=5.01µs   p(95)=6.15µs   p(99.9)=926.11µs
     http_req_connecting............: avg=5.03µs   min=0s      med=0s       max=33.32ms  p(90)=0s       p(95)=0s       p(99.9)=885.41µs
     http_req_duration..............: avg=428.9ms  min=3.92ms  med=403.34ms max=1.61s    p(90)=845.58ms p(95)=920.87ms p(99.9)=1.38s   
       { expected_response:true }...: avg=428.9ms  min=3.92ms  med=403.34ms max=1.61s    p(90)=845.58ms p(95)=920.87ms p(99.9)=1.38s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 33472
     http_req_receiving.............: avg=99.99µs  min=32.81µs med=78.85µs  max=118.99ms p(90)=115.86µs p(95)=129.9µs  p(99.9)=1ms     
     http_req_sending...............: avg=34.19µs  min=5.86µs  med=14.08µs  max=183.49ms p(90)=21.99µs  p(95)=25.43µs  p(99.9)=2.54ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=428.77ms min=3.82ms  med=403.25ms max=1.61s    p(90)=845.43ms p(95)=920.76ms p(99.9)=1.38s   
     http_reqs......................: 33472   516.693784/s
     iteration_duration.............: avg=442.35ms min=16.55ms med=419.8ms  max=1.62s    p(90)=849.93ms p(95)=924.46ms p(99.9)=1.38s   
     iterations.....................: 32472   501.257186/s
     success_rate...................: 100.00% ✓ 32472      ✗ 0    
     vus............................: 92      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (rust subgraphs) (2.8.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 42225      ✗ 0    
     data_received..................: 1.3 GB  19 MB/s
     data_sent......................: 18 MB   264 kB/s
     http_req_blocked...............: avg=13.74µs  min=1.26µs  med=3.81µs   max=17.93ms  p(90)=5.75µs   p(95)=7.48µs   p(99.9)=1.35ms  
     http_req_connecting............: avg=8µs      min=0s      med=0s       max=17.74ms  p(90)=0s       p(95)=0s       p(99.9)=1.24ms  
     http_req_duration..............: avg=938.45ms min=6.46ms  med=807.62ms max=20.34s   p(90)=1.64s    p(95)=1.79s    p(99.9)=18s     
       { expected_response:true }...: avg=938.45ms min=6.46ms  med=807.62ms max=20.34s   p(90)=1.64s    p(95)=1.79s    p(99.9)=18s     
     http_req_failed................: 0.00%   ✓ 0          ✗ 15075
     http_req_receiving.............: avg=107.26µs min=39.08µs med=100.84µs max=6.19ms   p(90)=141.49µs p(95)=154.64µs p(99.9)=928.66µs
     http_req_sending...............: avg=43.61µs  min=6.37µs  med=18.78µs  max=109.59ms p(90)=25.06µs  p(95)=30.35µs  p(99.9)=3.7ms   
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=938.3ms  min=6.32ms  med=807.49ms max=20.34s   p(90)=1.64s    p(95)=1.79s    p(99.9)=18s     
     http_reqs......................: 15075   218.941842/s
     iteration_duration.............: avg=1s       min=40.21ms med=889.84ms max=20.35s   p(90)=1.66s    p(95)=1.81s    p(99.9)=18.01s  
     iterations.....................: 14075   204.418337/s
     success_rate...................: 100.00% ✓ 14075      ✗ 0    
     vus............................: 5       min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-gateway (rust subgraphs) (2.14.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 42303      ✗ 0    
     data_received..................: 1.3 GB  18 MB/s
     data_sent......................: 19 MB   249 kB/s
     http_req_blocked...............: avg=15.18µs  min=1.38µs  med=3.64µs   max=14.67ms p(90)=5.31µs   p(95)=6.8µs    p(99.9)=2.28ms  
     http_req_connecting............: avg=9.81µs   min=0s      med=0s       max=14.51ms p(90)=0s       p(95)=0s       p(99.9)=2.26ms  
     http_req_duration..............: avg=467.3ms  min=8.42ms  med=525.53ms max=1.39s   p(90)=832.79ms p(95)=884.57ms p(99.9)=1.24s   
       { expected_response:true }...: avg=467.3ms  min=8.42ms  med=525.53ms max=1.39s   p(90)=832.79ms p(95)=884.57ms p(99.9)=1.24s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 15101
     http_req_receiving.............: avg=99.38µs  min=33.55µs med=92.84µs  max=3.71ms  p(90)=132.4µs  p(95)=145.31µs p(99.9)=839.87µs
     http_req_sending...............: avg=27.86µs  min=6.54µs  med=17.74µs  max=20.72ms p(90)=23.4µs   p(95)=28.22µs  p(99.9)=2.48ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=467.17ms min=8.32ms  med=525.41ms max=1.39s   p(90)=832.64ms p(95)=884.42ms p(99.9)=1.24s   
     http_reqs......................: 15101   203.295212/s
     iteration_duration.............: avg=500.28ms min=14.71ms med=544.68ms max=1.4s    p(90)=842.23ms p(95)=888.33ms p(99.9)=1.25s   
     iterations.....................: 14101   189.832844/s
     success_rate...................: 100.00% ✓ 14101      ✗ 0    
     vus............................: 60      min=0        max=496
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.65)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 416256      ✗ 0     
     data_received..................: 12 GB   197 MB/s
     data_sent......................: 168 MB  2.7 MB/s
     http_req_blocked...............: avg=25.67µs  min=992ns   med=2.72µs  max=78.96ms  p(90)=4.54µs   p(95)=5.82µs   p(99.9)=3ms     
     http_req_connecting............: avg=22.15µs  min=0s      med=0s      max=78.78ms  p(90)=0s       p(95)=0s       p(99.9)=2.7ms   
     http_req_duration..............: avg=101.74ms min=1.56ms  med=97.18ms max=330.67ms p(90)=196.66ms p(95)=215.88ms p(99.9)=274.49ms
       { expected_response:true }...: avg=101.74ms min=1.56ms  med=97.18ms max=330.67ms p(90)=196.66ms p(95)=215.88ms p(99.9)=274.49ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 139752
     http_req_receiving.............: avg=258.69µs min=29.15µs med=61.84µs max=77.12ms  p(90)=187.9µs  p(95)=430.31µs p(99.9)=31.9ms  
     http_req_sending...............: avg=85.7µs   min=5.21µs  med=11.17µs max=201.14ms p(90)=21.82µs  p(95)=141.31µs p(99.9)=12.02ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=101.4ms  min=1.51ms  med=96.91ms max=322.62ms p(90)=196.06ms p(95)=215.12ms p(99.9)=271.68ms
     http_reqs......................: 139752  2255.229541/s
     iteration_duration.............: avg=102.77ms min=3.66ms  med=98.23ms max=365.37ms p(90)=197.3ms  p(95)=216.52ms p(99.9)=276.63ms
     iterations.....................: 138752  2239.092172/s
     success_rate...................: 100.00% ✓ 138752      ✗ 0     
     vus............................: 55      min=0         max=498 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.2.0-p.4)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 352410      ✗ 0     
     data_received..................: 10 GB   167 MB/s
     data_sent......................: 142 MB  2.3 MB/s
     http_req_blocked...............: avg=15.08µs  min=990ns   med=2.76µs   max=66.66ms  p(90)=4.37µs   p(95)=5.45µs   p(99.9)=1.51ms  
     http_req_connecting............: avg=11.54µs  min=0s      med=0s       max=53.1ms   p(90)=0s       p(95)=0s       p(99.9)=1.39ms  
     http_req_duration..............: avg=120.15ms min=1.73ms  med=110.16ms max=1.59s    p(90)=231.86ms p(95)=264.84ms p(99.9)=1.2s    
       { expected_response:true }...: avg=120.15ms min=1.73ms  med=110.16ms max=1.59s    p(90)=231.86ms p(95)=264.84ms p(99.9)=1.2s    
     http_req_failed................: 0.00%   ✓ 0           ✗ 118470
     http_req_receiving.............: avg=2.2ms    min=53.46µs med=145.57µs max=340.34ms p(90)=3.32ms   p(95)=7.5ms    p(99.9)=120.55ms
     http_req_sending...............: avg=63.88µs  min=5.29µs  med=10.64µs  max=163.48ms p(90)=19.9µs   p(95)=119.42µs p(99.9)=8.21ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=117.88ms min=1.63ms  med=108.42ms max=1.59s    p(90)=228.16ms p(95)=259.05ms p(99.9)=1.2s    
     http_reqs......................: 118470  1908.290678/s
     iteration_duration.............: avg=121.44ms min=2.83ms  med=111.51ms max=1.59s    p(90)=232.62ms p(95)=265.56ms p(99.9)=1.2s    
     iterations.....................: 117470  1892.182881/s
     success_rate...................: 100.00% ✓ 117470      ✗ 0     
     vus............................: 62      min=0         max=497 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (.net subgraphs) (16.1.4)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 350319      ✗ 0     
     data_received..................: 10 GB   166 MB/s
     data_sent......................: 141 MB  2.3 MB/s
     http_req_blocked...............: avg=14.58µs  min=1.04µs  med=2.79µs   max=90.98ms  p(90)=4.38µs   p(95)=5.46µs   p(99.9)=1.16ms  
     http_req_connecting............: avg=11.01µs  min=0s      med=0s       max=90.75ms  p(90)=0s       p(95)=0s       p(99.9)=1.09ms  
     http_req_duration..............: avg=120.86ms min=1.75ms  med=112.52ms max=816.29ms p(90)=235.77ms p(95)=269.64ms p(99.9)=523.55ms
       { expected_response:true }...: avg=120.86ms min=1.75ms  med=112.52ms max=816.29ms p(90)=235.77ms p(95)=269.64ms p(99.9)=523.55ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 117773
     http_req_receiving.............: avg=1.88ms   min=51.36µs med=117.11µs max=321.68ms p(90)=1.63ms   p(95)=4.49ms   p(99.9)=141.94ms
     http_req_sending...............: avg=60.74µs  min=5.28µs  med=10.66µs  max=36.72ms  p(90)=19.57µs  p(95)=121.61µs p(99.9)=8.42ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=118.91ms min=1.67ms  med=111.27ms max=814.44ms p(90)=232.36ms p(95)=263.9ms  p(99.9)=519.98ms
     http_reqs......................: 117773  1892.649166/s
     iteration_duration.............: avg=122.18ms min=2.76ms  med=114.04ms max=816.53ms p(90)=236.72ms p(95)=270.49ms p(99.9)=524.57ms
     iterations.....................: 116773  1876.578851/s
     success_rate...................: 100.00% ✓ 116773      ✗ 0     
     vus............................: 67      min=0         max=496 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (.net subgraphs) (2.8.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 91566      ✗ 0    
     data_received..................: 2.8 GB  42 MB/s
     data_sent......................: 38 MB   581 kB/s
     http_req_blocked...............: avg=9.69µs   min=1.25µs  med=3.39µs   max=3.97ms   p(90)=5.19µs   p(95)=6.21µs   p(99.9)=1.68ms  
     http_req_connecting............: avg=5.13µs   min=0s      med=0s       max=3.93ms   p(90)=0s       p(95)=0s       p(99.9)=1.51ms  
     http_req_duration..............: avg=455.69ms min=4.07ms  med=423.75ms max=1.74s    p(90)=896.52ms p(95)=973.7ms  p(99.9)=1.44s   
       { expected_response:true }...: avg=455.69ms min=4.07ms  med=423.75ms max=1.74s    p(90)=896.52ms p(95)=973.7ms  p(99.9)=1.44s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 31522
     http_req_receiving.............: avg=109.01µs min=31.96µs med=82.79µs  max=154.92ms p(90)=120.06µs p(95)=134.79µs p(99.9)=869.29µs
     http_req_sending...............: avg=29µs     min=5.8µs   med=15.11µs  max=106.34ms p(90)=22.66µs  p(95)=25.87µs  p(99.9)=2.28ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=455.55ms min=3.96ms  med=423.62ms max=1.74s    p(90)=896.43ms p(95)=973.62ms p(99.9)=1.44s   
     http_reqs......................: 31522   484.207208/s
     iteration_duration.............: avg=470.88ms min=18.09ms med=443.76ms max=1.74s    p(90)=900.82ms p(95)=977.43ms p(99.9)=1.45s   
     iterations.....................: 30522   468.846278/s
     success_rate...................: 100.00% ✓ 30522      ✗ 0    
     vus............................: 61      min=0        max=497
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (.net subgraphs) (2.8.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 41808      ✗ 0    
     data_received..................: 1.3 GB  19 MB/s
     data_sent......................: 18 MB   262 kB/s
     http_req_blocked...............: avg=19.15µs  min=1.29µs  med=3.83µs   max=45.07ms p(90)=5.77µs   p(95)=7.58µs   p(99.9)=2.18ms  
     http_req_connecting............: avg=13.54µs  min=0s      med=0s       max=45.01ms p(90)=0s       p(95)=0s       p(99.9)=2.14ms  
     http_req_duration..............: avg=977.62ms min=6.38ms  med=873.93ms max=6.22s   p(90)=1.94s    p(95)=2.19s    p(99.9)=5.46s   
       { expected_response:true }...: avg=977.62ms min=6.38ms  med=873.93ms max=6.22s   p(90)=1.94s    p(95)=2.19s    p(99.9)=5.46s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 14936
     http_req_receiving.............: avg=107.29µs min=37.06µs med=100.51µs max=9.7ms   p(90)=138.55µs p(95)=150.89µs p(99.9)=903.72µs
     http_req_sending...............: avg=33.4µs   min=5.99µs  med=19.14µs  max=10.79ms p(90)=25.37µs  p(95)=30.79µs  p(99.9)=3.63ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=977.48ms min=6.28ms  med=873.83ms max=6.22s   p(90)=1.94s    p(95)=2.19s    p(99.9)=5.46s   
     http_reqs......................: 14936   218.022023/s
     iteration_duration.............: avg=1.04s    min=59.14ms med=960.4ms  max=6.22s   p(90)=1.96s    p(95)=2.2s     p(99.9)=5.47s   
     iterations.....................: 13936   203.42494/s
     success_rate...................: 100.00% ✓ 13936      ✗ 0    
     vus............................: 79      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-gateway (.net subgraphs) (2.14.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 40116      ✗ 0    
     data_received..................: 1.3 GB  18 MB/s
     data_sent......................: 17 MB   247 kB/s
     http_req_blocked...............: avg=16.81µs min=1.31µs  med=3.72µs   max=40.29ms  p(90)=5.42µs   p(95)=7.21µs   p(99.9)=1.77ms
     http_req_connecting............: avg=11.1µs  min=0s      med=0s       max=40.23ms  p(90)=0s       p(95)=0s       p(99.9)=1.72ms
     http_req_duration..............: avg=1.01s   min=8.67ms  med=924.87ms max=4.27s    p(90)=2.07s    p(95)=2.19s    p(99.9)=3.77s 
       { expected_response:true }...: avg=1.01s   min=8.67ms  med=924.87ms max=4.27s    p(90)=2.07s    p(95)=2.19s    p(99.9)=3.77s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 14372
     http_req_receiving.............: avg=109.9µs min=34.41µs med=96.16µs  max=104.55ms p(90)=136.82µs p(95)=148.74µs p(99.9)=1ms   
     http_req_sending...............: avg=43.25µs min=6.29µs  med=18.37µs  max=146.47ms p(90)=24.15µs  p(95)=29.72µs  p(99.9)=2.7ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=1.01s   min=8.56ms  med=924.76ms max=4.27s    p(90)=2.07s    p(95)=2.19s    p(99.9)=3.77s 
     http_reqs......................: 14372   205.557802/s
     iteration_duration.............: avg=1.09s   min=74.07ms med=1.03s    max=4.28s    p(90)=2.09s    p(95)=2.2s     p(99.9)=3.8s  
     iterations.....................: 13372   191.255144/s
     success_rate...................: 100.00% ✓ 13372      ✗ 0    
     vus............................: 34      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-181-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

