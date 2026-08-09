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
| hive-router | v0.0.84 | 3,109 | 3,329 | 3,066 | 2.9% |  |
| fusion | 16.6.0 | 2,629 | 2,750 | 2,588 | 1.9% |  |
| grafbase | 0.53.5 | 2,189 | 2,311 | 2,171 | 2.1% |  |
| cosmo | 0.334.0 | 1,323 | 1,365 | 1,316 | 1.3% |  |
| hive-gateway-router-runtime | 2.10.8 | 622 | 641 | 619 | 1.3% |  |
| apollo-router | v2.16.1 | 488 | 506 | 485 | 1.4% |  |
| hive-gateway | 2.10.8 | 285 | 292 | 284 | 1.0% |  |
| apollo-gateway | 2.14.3 | 281 | 283 | 279 | 0.4% |  |
| feddi | 5ff8b6165878 | — | — | — | — | non-compatible response (877 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.84 | 2,531 | 2,705 | 2,510 | 3.0% |  |
| fusion | 16.6.0 | 2,409 | 2,516 | 2,386 | 1.8% |  |
| grafbase | 0.53.5 | 1,643 | 1,699 | 1,638 | 1.2% |  |
| cosmo | 0.334.0 | 1,229 | 1,275 | 1,215 | 1.6% |  |
| hive-gateway-router-runtime | 2.10.8 | 580 | 600 | 578 | 1.3% |  |
| apollo-router | v2.16.1 | 448 | 467 | 446 | 1.5% |  |
| apollo-gateway | 2.14.3 | 266 | 271 | 264 | 0.8% |  |
| hive-gateway | 2.10.8 | 264 | 271 | 262 | 1.1% |  |
| feddi | 5ff8b6165878 | 17 | 18 | 17 | 2.9% |  |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.84)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 1120677     ✗ 0     
     data_received..................: 33 GB   273 MB/s
     data_sent......................: 449 MB  3.7 MB/s
     http_req_blocked...............: avg=2.6µs   min=842ns   med=1.88µs  max=19.89ms  p(90)=3.11µs  p(95)=3.72µs   p(99.9)=30.35µs
     http_req_connecting............: avg=238ns   min=0s      med=0s      max=3.65ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=15.85ms min=1.4ms   med=15.12ms max=280.25ms p(90)=23.36ms p(95)=26.51ms  p(99.9)=46.65ms
       { expected_response:true }...: avg=15.85ms min=1.4ms   med=15.12ms max=280.25ms p(90)=23.36ms p(95)=26.51ms  p(99.9)=46.65ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 373659
     http_req_receiving.............: avg=86.15µs min=23.22µs med=43.27µs max=166.9ms  p(90)=82.5µs  p(95)=155.23µs p(99.9)=7.45ms 
     http_req_sending...............: avg=48.12µs min=4.38µs  med=8.25µs  max=207.4ms  p(90)=14.66µs p(95)=91.96µs  p(99.9)=6.77ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=15.72ms min=1.35ms  med=15.01ms max=280.09ms p(90)=23.18ms p(95)=26.26ms  p(99.9)=45.62ms
     http_reqs......................: 373659  3109.106118/s
     iteration_duration.............: avg=16.05ms min=1.93ms  med=15.31ms max=289.47ms p(90)=23.56ms p(95)=26.74ms  p(99.9)=47.49ms
     iterations.....................: 373559  3108.274047/s
     success_rate...................: 100.00% ✓ 373559      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (rust subgraphs) (16.6.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 948204      ✗ 0     
     data_received..................: 28 GB   231 MB/s
     data_sent......................: 380 MB  3.2 MB/s
     http_req_blocked...............: avg=3µs      min=902ns   med=1.99µs  max=21.96ms  p(90)=3.19µs  p(95)=3.78µs  p(99.9)=27.82µs 
     http_req_connecting............: avg=391ns    min=0s      med=0s      max=5.52ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=18.77ms  min=1.91ms  med=16.19ms max=272.23ms p(90)=30.43ms p(95)=36.73ms p(99.9)=116.99ms
       { expected_response:true }...: avg=18.77ms  min=1.91ms  med=16.19ms max=272.23ms p(90)=30.43ms p(95)=36.73ms p(99.9)=116.99ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 316168
     http_req_receiving.............: avg=536.08µs min=51.14µs med=87.95µs max=195.61ms p(90)=1.04ms  p(95)=1.85ms  p(99.9)=24.67ms 
     http_req_sending...............: avg=42.32µs  min=4.6µs   med=8.2µs   max=141.79ms p(90)=13.84µs p(95)=77.46µs p(99.9)=3.92ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=18.19ms  min=1.84ms  med=15.69ms max=271.84ms p(90)=29.53ms p(95)=35.69ms p(99.9)=115.24ms
     http_reqs......................: 316168  2629.372203/s
     iteration_duration.............: avg=18.97ms  min=3.24ms  med=16.38ms max=300.74ms p(90)=30.64ms p(95)=36.96ms p(99.9)=117.22ms
     iterations.....................: 316068  2628.540565/s
     success_rate...................: 100.00% ✓ 316068      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: grafbase (rust subgraphs) (0.53.5)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 789342      ✗ 0     
     data_received..................: 23 GB   192 MB/s
     data_sent......................: 316 MB  2.6 MB/s
     http_req_blocked...............: avg=2.7µs   min=992ns   med=2.12µs  max=5.16ms   p(90)=3.56µs  p(95)=4.29µs   p(99.9)=30.9µs 
     http_req_connecting............: avg=164ns   min=0s      med=0s      max=2.14ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=22.58ms min=1.73ms  med=22.35ms max=272.68ms p(90)=26.8ms  p(95)=28.52ms  p(99.9)=47.33ms
       { expected_response:true }...: avg=22.58ms min=1.73ms  med=22.35ms max=272.68ms p(90)=26.8ms  p(95)=28.52ms  p(99.9)=47.33ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 263214
     http_req_receiving.............: avg=85.5µs  min=26.63µs med=52.38µs max=170.12ms p(90)=88.83µs p(95)=114.09µs p(99.9)=5.66ms 
     http_req_sending...............: avg=33.85µs min=4.82µs  med=9.33µs  max=136.44ms p(90)=15.79µs p(95)=24.83µs  p(99.9)=1.72ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=22.46ms min=1.64ms  med=22.26ms max=263.91ms p(90)=26.67ms p(95)=28.35ms  p(99.9)=46.59ms
     http_reqs......................: 263214  2189.192267/s
     iteration_duration.............: avg=22.79ms min=4.07ms  med=22.54ms max=303ms    p(90)=27ms    p(95)=28.73ms  p(99.9)=47.7ms 
     iterations.....................: 263114  2188.360551/s
     success_rate...................: 100.00% ✓ 263114      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
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

     checks.........................: 100.00% ✓ 477105      ✗ 0     
     data_received..................: 14 GB   116 MB/s
     data_sent......................: 191 MB  1.6 MB/s
     http_req_blocked...............: avg=2.91µs  min=922ns   med=1.99µs  max=4.37ms   p(90)=3.37µs  p(95)=4.01µs   p(99.9)=34.73µs 
     http_req_connecting............: avg=564ns   min=0s      med=0s      max=3.46ms   p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=37.49ms min=2.05ms  med=37.11ms max=300.74ms p(90)=52.36ms p(95)=57ms     p(99.9)=79.04ms 
       { expected_response:true }...: avg=37.49ms min=2.05ms  med=37.11ms max=300.74ms p(90)=52.36ms p(95)=57ms     p(99.9)=79.04ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 159135
     http_req_receiving.............: avg=67.63µs min=24.76µs med=55.36µs max=123.73ms p(90)=90.07µs p(95)=104.51µs p(99.9)=869.92µs
     http_req_sending...............: avg=24.45µs min=4.89µs  med=9.77µs  max=136.96ms p(90)=16.35µs p(95)=20.26µs  p(99.9)=934.23µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=37.4ms  min=1.96ms  med=37.03ms max=288.01ms p(90)=52.27ms p(95)=56.9ms   p(99.9)=78.84ms 
     http_reqs......................: 159135  1323.044353/s
     iteration_duration.............: avg=37.72ms min=3.57ms  med=37.31ms max=309.94ms p(90)=52.56ms p(95)=57.2ms   p(99.9)=79.37ms 
     iterations.....................: 159035  1322.212956/s
     success_rate...................: 100.00% ✓ 159035      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
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

     checks.........................: 100.00% ✓ 224808     ✗ 0    
     data_received..................: 6.6 GB  55 MB/s
     data_sent......................: 90 MB   748 kB/s
     http_req_blocked...............: avg=3.92µs  min=981ns   med=2.34µs  max=4ms      p(90)=3.86µs   p(95)=4.49µs   p(99.9)=42.5µs  
     http_req_connecting............: avg=1.25µs  min=0s      med=0s      max=3.96ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=79.74ms min=3.56ms  med=77.9ms  max=308.67ms p(90)=100.07ms p(95)=110.02ms p(99.9)=195.15ms
       { expected_response:true }...: avg=79.74ms min=3.56ms  med=77.9ms  max=308.67ms p(90)=100.07ms p(95)=110.02ms p(99.9)=195.15ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 75036
     http_req_receiving.............: avg=76.6µs  min=27.72µs med=63.92µs max=129.8ms  p(90)=101.6µs  p(95)=115.09µs p(99.9)=602.01µs
     http_req_sending...............: avg=22.61µs min=4.88µs  med=12.19µs max=112.68ms p(90)=19.57µs  p(95)=21.78µs  p(99.9)=600.67µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=79.64ms min=3.47ms  med=77.81ms max=307.8ms  p(90)=99.97ms  p(95)=109.92ms p(99.9)=194.07ms
     http_reqs......................: 75036   622.852071/s
     iteration_duration.............: avg=80.07ms min=20.45ms med=78.13ms max=332.67ms p(90)=100.31ms p(95)=110.3ms  p(99.9)=196.25ms
     iterations.....................: 74936   622.022/s
     success_rate...................: 100.00% ✓ 74936      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-router (rust subgraphs) (v2.16.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 176283     ✗ 0    
     data_received..................: 5.2 GB  43 MB/s
     data_sent......................: 71 MB   586 kB/s
     http_req_blocked...............: avg=5.16µs   min=1.24µs  med=3.48µs   max=3.76ms   p(90)=4.9µs    p(95)=5.49µs   p(99.9)=95.55µs 
     http_req_connecting............: avg=1.44µs   min=0s      med=0s       max=3.72ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=101.68ms min=4.58ms  med=101.44ms max=326.59ms p(90)=122.7ms  p(95)=128.99ms p(99.9)=158.04ms
       { expected_response:true }...: avg=101.68ms min=4.58ms  med=101.44ms max=326.59ms p(90)=122.7ms  p(95)=128.99ms p(99.9)=158.04ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 58861
     http_req_receiving.............: avg=83.76µs  min=30.73µs med=78.03µs  max=33.92ms  p(90)=109.58µs p(95)=122.36µs p(99.9)=550.07µs
     http_req_sending...............: avg=27.96µs  min=5.5µs   med=16.11µs  max=110.85ms p(90)=21.87µs  p(95)=23.77µs  p(99.9)=606.64µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=101.57ms min=4.51ms  med=101.33ms max=325.14ms p(90)=122.59ms p(95)=128.89ms p(99.9)=157.63ms
     http_reqs......................: 58861   488.160697/s
     iteration_duration.............: avg=102.12ms min=29.33ms med=101.72ms max=336.88ms p(90)=122.96ms p(95)=129.29ms p(99.9)=163.15ms
     iterations.....................: 58761   487.331352/s
     success_rate...................: 100.00% ✓ 58761      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
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

     checks.........................: 100.00% ✓ 103128     ✗ 0    
     data_received..................: 3.0 GB  25 MB/s
     data_sent......................: 41 MB   342 kB/s
     http_req_blocked...............: avg=4.76µs   min=1.11µs  med=3.15µs   max=2.37ms   p(90)=4.57µs   p(95)=5.15µs   p(99.9)=523.64µs
     http_req_connecting............: avg=1.4µs    min=0s      med=0s       max=2.33ms   p(90)=0s       p(95)=0s       p(99.9)=503.76µs
     http_req_duration..............: avg=173.85ms min=5.58ms  med=159.29ms max=656.11ms p(90)=200.95ms p(95)=240.31ms p(99.9)=544.53ms
       { expected_response:true }...: avg=173.85ms min=5.58ms  med=159.29ms max=656.11ms p(90)=200.95ms p(95)=240.31ms p(99.9)=544.53ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 34476
     http_req_receiving.............: avg=98.35µs  min=32.78µs med=90.53µs  max=55.8ms   p(90)=120.69µs p(95)=132.66µs p(99.9)=627.59µs
     http_req_sending...............: avg=27.66µs  min=5.59µs  med=17.87µs  max=59.87ms  p(90)=22.37µs  p(95)=24.1µs   p(99.9)=572.97µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=173.72ms min=5.43ms  med=159.17ms max=656.04ms p(90)=200.82ms p(95)=240.2ms  p(99.9)=544.41ms
     http_reqs......................: 34476   285.215281/s
     iteration_duration.............: avg=174.61ms min=44.9ms  med=159.64ms max=656.35ms p(90)=201.29ms p(95)=241.47ms p(99.9)=544.83ms
     iterations.....................: 34376   284.387994/s
     success_rate...................: 100.00% ✓ 34376      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
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

     checks.........................: 100.00% ✓ 101928     ✗ 0    
     data_received..................: 3.0 GB  25 MB/s
     data_sent......................: 41 MB   338 kB/s
     http_req_blocked...............: avg=6.05µs   min=1.3µs   med=3.14µs   max=3.36ms   p(90)=4.38µs   p(95)=4.91µs   p(99.9)=1.46ms  
     http_req_connecting............: avg=2.66µs   min=0s      med=0s       max=3.32ms   p(90)=0s       p(95)=0s       p(99.9)=1.31ms  
     http_req_duration..............: avg=175.92ms min=7.52ms  med=174.8ms  max=369.85ms p(90)=200.6ms  p(95)=206.61ms p(99.9)=270.99ms
       { expected_response:true }...: avg=175.92ms min=7.52ms  med=174.8ms  max=369.85ms p(90)=200.6ms  p(95)=206.61ms p(99.9)=270.99ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 34076
     http_req_receiving.............: avg=88.55µs  min=30.94µs med=78.24µs  max=83.01ms  p(90)=109.31µs p(95)=120.32µs p(99.9)=455.21µs
     http_req_sending...............: avg=28.58µs  min=5.93µs  med=15.26µs  max=142.05ms p(90)=20.1µs   p(95)=21.89µs  p(99.9)=515.68µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=175.81ms min=7.42ms  med=174.7ms  max=360.54ms p(90)=200.51ms p(95)=206.52ms p(99.9)=270.73ms
     http_reqs......................: 34076   281.700196/s
     iteration_duration.............: avg=176.7ms  min=38.91ms med=175.11ms max=385.41ms p(90)=200.91ms p(95)=206.89ms p(99.9)=276.78ms
     iterations.....................: 33976   280.873514/s
     success_rate...................: 100.00% ✓ 33976      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
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

     checks.........................: 100.00% ✓ 912804      ✗ 0     
     data_received..................: 27 GB   221 MB/s
     data_sent......................: 366 MB  3.0 MB/s
     http_req_blocked...............: avg=3.29µs  min=891ns   med=2.57µs  max=6.13ms   p(90)=4.25µs  p(95)=5.03µs  p(99.9)=37.57µs
     http_req_connecting............: avg=301ns   min=0s      med=0s      max=4.04ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=19.49ms min=1.87ms  med=19.14ms max=301.57ms p(90)=27.13ms p(95)=29.67ms p(99.9)=49.13ms
       { expected_response:true }...: avg=19.49ms min=1.87ms  med=19.14ms max=301.57ms p(90)=27.13ms p(95)=29.67ms p(99.9)=49.13ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 304368
     http_req_receiving.............: avg=93.3µs  min=24.66µs med=51.85µs max=177.17ms p(90)=94.88µs p(95)=148.6µs p(99.9)=7.04ms 
     http_req_sending...............: avg=44.83µs min=4.8µs   med=10.33µs max=84.5ms   p(90)=18.3µs  p(95)=98.09µs p(99.9)=3.82ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=19.35ms min=1.77ms  med=19.02ms max=285.78ms p(90)=26.97ms p(95)=29.46ms p(99.9)=47.83ms
     http_reqs......................: 304368  2531.218288/s
     iteration_duration.............: avg=19.71ms min=3.2ms   med=19.34ms max=310.39ms p(90)=27.33ms p(95)=29.89ms p(99.9)=49.68ms
     iterations.....................: 304268  2530.386657/s
     success_rate...................: 100.00% ✓ 304268      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (.net subgraphs) (16.6.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 868830      ✗ 0     
     data_received..................: 25 GB   211 MB/s
     data_sent......................: 348 MB  2.9 MB/s
     http_req_blocked...............: avg=2.75µs   min=841ns   med=1.99µs  max=17.65ms  p(90)=3.36µs  p(95)=4.04µs  p(99.9)=28.5µs  
     http_req_connecting............: avg=285ns    min=0s      med=0s      max=3.31ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=20.49ms  min=1.62ms  med=17.11ms max=314.75ms p(90)=33.59ms p(95)=41.37ms p(99.9)=147.64ms
       { expected_response:true }...: avg=20.49ms  min=1.62ms  med=17.11ms max=314.75ms p(90)=33.59ms p(95)=41.37ms p(99.9)=147.64ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 289710
     http_req_receiving.............: avg=600.71µs min=52.08µs med=96.88µs max=264.5ms  p(90)=1.12ms  p(95)=1.93ms  p(99.9)=27.13ms 
     http_req_sending...............: avg=37.65µs  min=4.27µs  med=8.38µs  max=75.59ms  p(90)=15.69µs p(95)=68.82µs p(99.9)=2.54ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=19.85ms  min=1.5ms   med=16.55ms max=310.49ms p(90)=32.56ms p(95)=40.19ms p(99.9)=145.1ms 
     http_reqs......................: 289710  2409.900206/s
     iteration_duration.............: avg=20.7ms   min=2.59ms  med=17.3ms  max=314.94ms p(90)=33.81ms p(95)=41.6ms  p(99.9)=148.91ms
     iterations.....................: 289610  2409.068374/s
     success_rate...................: 100.00% ✓ 289610      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: grafbase (.net subgraphs) (0.53.5)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 592815      ✗ 0     
     data_received..................: 17 GB   144 MB/s
     data_sent......................: 238 MB  2.0 MB/s
     http_req_blocked...............: avg=3.25µs  min=831ns   med=2.16µs  max=3.94ms   p(90)=4.34µs   p(95)=5.46µs   p(99.9)=43.28µs
     http_req_connecting............: avg=493ns   min=0s      med=0s      max=3.91ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=30.11ms min=2.26ms  med=29.64ms max=296.54ms p(90)=40.01ms  p(95)=43.4ms   p(99.9)=66.1ms 
       { expected_response:true }...: avg=30.11ms min=2.26ms  med=29.64ms max=296.54ms p(90)=40.01ms  p(95)=43.4ms   p(99.9)=66.1ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 197705
     http_req_receiving.............: avg=92.21µs min=26.53µs med=52.96µs max=109.76ms p(90)=122.69µs p(95)=204.48µs p(99.9)=3.79ms 
     http_req_sending...............: avg=39.82µs min=4.64µs  med=9.18µs  max=128.77ms p(90)=23.5µs   p(95)=107.21µs p(99.9)=3.27ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=29.98ms min=2.15ms  med=29.52ms max=296.03ms p(90)=39.87ms  p(95)=43.24ms  p(99.9)=65.49ms
     http_reqs......................: 197705  1643.489142/s
     iteration_duration.............: avg=30.35ms min=7ms     med=29.86ms max=308.66ms p(90)=40.22ms  p(95)=43.62ms  p(99.9)=66.48ms
     iterations.....................: 197605  1642.657858/s
     success_rate...................: 100.00% ✓ 197605      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
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

     checks.........................: 100.00% ✓ 443451      ✗ 0     
     data_received..................: 13 GB   108 MB/s
     data_sent......................: 178 MB  1.5 MB/s
     http_req_blocked...............: avg=3.47µs  min=932ns   med=2.31µs  max=28.01ms  p(90)=3.9µs    p(95)=4.58µs   p(99.9)=34.93µs 
     http_req_connecting............: avg=624ns   min=0s      med=0s      max=3.93ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=40.34ms min=2.1ms   med=39.92ms max=293.43ms p(90)=55.99ms  p(95)=60.89ms  p(99.9)=84.47ms 
       { expected_response:true }...: avg=40.34ms min=2.1ms   med=39.92ms max=293.43ms p(90)=55.99ms  p(95)=60.89ms  p(99.9)=84.47ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 147917
     http_req_receiving.............: avg=74.21µs min=25.65µs med=62.2µs  max=51.18ms  p(90)=100.66µs p(95)=116.79µs p(99.9)=810.44µs
     http_req_sending...............: avg=23.98µs min=4.69µs  med=11.53µs max=129.01ms p(90)=18.48µs  p(95)=21.77µs  p(99.9)=987.47µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=40.24ms min=1.98ms  med=39.83ms max=281.27ms p(90)=55.88ms  p(95)=60.78ms  p(99.9)=83.97ms 
     http_reqs......................: 147917  1229.744571/s
     iteration_duration.............: avg=40.58ms min=3.88ms  med=40.13ms max=313.47ms p(90)=56.19ms  p(95)=61.09ms  p(99.9)=85.05ms 
     iterations.....................: 147817  1228.913196/s
     success_rate...................: 100.00% ✓ 147817      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
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

     checks.........................: 100.00% ✓ 209415     ✗ 0    
     data_received..................: 6.1 GB  51 MB/s
     data_sent......................: 84 MB   697 kB/s
     http_req_blocked...............: avg=4.08µs  min=990ns   med=2.61µs  max=3.42ms   p(90)=4.13µs   p(95)=4.75µs   p(99.9)=42.83µs 
     http_req_connecting............: avg=1.21µs  min=0s      med=0s      max=3.38ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=85.61ms min=3.86ms  med=83.58ms max=302.98ms p(90)=103.66ms p(95)=113.66ms p(99.9)=200.65ms
       { expected_response:true }...: avg=85.61ms min=3.86ms  med=83.58ms max=302.98ms p(90)=103.66ms p(95)=113.66ms p(99.9)=200.65ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 69905
     http_req_receiving.............: avg=81.21µs min=28µs    med=69.52µs max=106.46ms p(90)=105.32µs p(95)=118.9µs  p(99.9)=707.35µs
     http_req_sending...............: avg=22.7µs  min=5.09µs  med=12.66µs max=81.76ms  p(90)=19.38µs  p(95)=21.37µs  p(99.9)=594.61µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=85.51ms min=3.74ms  med=83.48ms max=302.36ms p(90)=103.56ms p(95)=113.54ms p(99.9)=200.38ms
     http_reqs......................: 69905   580.055187/s
     iteration_duration.............: avg=85.97ms min=22.84ms med=83.81ms max=331.14ms p(90)=103.91ms p(95)=113.94ms p(99.9)=203.04ms
     iterations.....................: 69805   579.225411/s
     success_rate...................: 100.00% ✓ 69805      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-router (.net subgraphs) (v2.16.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 162126     ✗ 0    
     data_received..................: 4.7 GB  39 MB/s
     data_sent......................: 65 MB   539 kB/s
     http_req_blocked...............: avg=5.89µs   min=1.08µs  med=3.12µs   max=6.51ms   p(90)=4.58µs   p(95)=5.14µs   p(99.9)=60.43µs 
     http_req_connecting............: avg=2.48µs   min=0s      med=0s       max=6.36ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=110.59ms min=5.11ms  med=108.54ms max=298.18ms p(90)=145.98ms p(95)=157.14ms p(99.9)=199.24ms
       { expected_response:true }...: avg=110.59ms min=5.11ms  med=108.54ms max=298.18ms p(90)=145.98ms p(95)=157.14ms p(99.9)=199.24ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 54142
     http_req_receiving.............: avg=83.32µs  min=28.75µs med=80.52µs  max=42.08ms  p(90)=110.81µs p(95)=123.01µs p(99.9)=493.62µs
     http_req_sending...............: avg=23.12µs  min=5.22µs  med=16.2µs   max=77.35ms  p(90)=21.42µs  p(95)=23.2µs   p(99.9)=640.8µs 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=110.48ms min=4.94ms  med=108.44ms max=296.88ms p(90)=145.87ms p(95)=157.04ms p(99.9)=199.04ms
     http_reqs......................: 54142   448.746762/s
     iteration_duration.............: avg=111.05ms min=26.81ms med=108.84ms max=308.44ms p(90)=146.27ms p(95)=157.47ms p(99.9)=200.71ms
     iterations.....................: 54042   447.917929/s
     success_rate...................: 100.00% ✓ 54042      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
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

     checks.........................: 100.00% ✓ 96522      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 39 MB   320 kB/s
     http_req_blocked...............: avg=6.64µs   min=1.46µs  med=3.51µs   max=3.35ms   p(90)=4.85µs   p(95)=5.43µs   p(99.9)=1.6ms   
     http_req_connecting............: avg=2.86µs   min=0s      med=0s       max=3.31ms   p(90)=0s       p(95)=0s       p(99.9)=1.58ms  
     http_req_duration..............: avg=185.73ms min=7.94ms  med=188.13ms max=395.36ms p(90)=200.31ms p(95)=205.67ms p(99.9)=283.14ms
       { expected_response:true }...: avg=185.73ms min=7.94ms  med=188.13ms max=395.36ms p(90)=200.31ms p(95)=205.67ms p(99.9)=283.14ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32274
     http_req_receiving.............: avg=101.34µs min=35.68µs med=88.54µs  max=90.97ms  p(90)=119.45µs p(95)=130.84µs p(99.9)=662.62µs
     http_req_sending...............: avg=29.73µs  min=6.24µs  med=17.76µs  max=87.71ms  p(90)=22.43µs  p(95)=24.31µs  p(99.9)=478.81µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=185.6ms  min=7.84ms  med=188.02ms max=395.3ms  p(90)=200.19ms p(95)=205.55ms p(99.9)=282.21ms
     http_reqs......................: 32274   266.739225/s
     iteration_duration.............: avg=186.59ms min=59.39ms med=188.42ms max=403.77ms p(90)=200.59ms p(95)=206.02ms p(99.9)=285.07ms
     iterations.....................: 32174   265.912742/s
     success_rate...................: 100.00% ✓ 32174      ✗ 0    
     vus............................: 5       min=5        max=50 
     vus_max........................: 50      min=50       max=50
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

     checks.........................: 100.00% ✓ 95502      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 38 MB   317 kB/s
     http_req_blocked...............: avg=6.3µs    min=1.11µs  med=3.14µs   max=3.96ms   p(90)=4.46µs   p(95)=4.98µs   p(99.9)=1.39ms  
     http_req_connecting............: avg=2.95µs   min=0s      med=0s       max=3.93ms   p(90)=0s       p(95)=0s       p(99.9)=1.36ms  
     http_req_duration..............: avg=187.74ms min=6.14ms  med=174.24ms max=662.6ms  p(90)=227.53ms p(95)=278.12ms p(99.9)=570.29ms
       { expected_response:true }...: avg=187.74ms min=6.14ms  med=174.24ms max=662.6ms  p(90)=227.53ms p(95)=278.12ms p(99.9)=570.29ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 31934
     http_req_receiving.............: avg=90.42µs  min=31.53µs med=87.55µs  max=11.97ms  p(90)=116.88µs p(95)=128.38µs p(99.9)=671.9µs 
     http_req_sending...............: avg=20.32µs  min=4.97µs  med=16.79µs  max=27.6ms   p(90)=21.27µs  p(95)=23.06µs  p(99.9)=526.94µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=187.63ms min=6ms     med=174.13ms max=662.53ms p(90)=227.4ms  p(95)=278.02ms p(99.9)=570.19ms
     http_reqs......................: 31934   264.242009/s
     iteration_duration.............: avg=188.57ms min=73.59ms med=174.64ms max=662.82ms p(90)=227.94ms p(95)=280.01ms p(99.9)=570.57ms
     iterations.....................: 31834   263.414546/s
     success_rate...................: 100.00% ✓ 31834      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: feddi (.net subgraphs) (5ff8b6165878)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 6363      ✗ 0   
     data_received..................: 213 MB  1.7 MB/s
     data_sent......................: 2.7 MB  21 kB/s
     http_req_blocked...............: avg=74.93µs min=1.6µs   med=3.73µs  max=7.23ms   p(90)=5.3µs    p(95)=6.16µs   p(99.9)=6.75ms  
     http_req_connecting............: avg=68.8µs  min=0s      med=0s      max=7.19ms   p(90)=0s       p(95)=0s       p(99.9)=6.71ms  
     http_req_duration..............: avg=2.72s   min=34.92ms med=2.8s    max=5.16s    p(90)=3.64s    p(95)=3.85s    p(99.9)=5.09s   
       { expected_response:true }...: avg=2.72s   min=34.92ms med=2.8s    max=5.16s    p(90)=3.64s    p(95)=3.85s    p(99.9)=5.09s   
     http_req_failed................: 0.00%   ✓ 0         ✗ 2221
     http_req_receiving.............: avg=98.07µs min=40.18µs med=93.3µs  max=465.73µs p(90)=134.57µs p(95)=151.48µs p(99.9)=379.96µs
     http_req_sending...............: avg=64.91µs min=7.35µs  med=19.32µs max=16.33ms  p(90)=24.54µs  p(95)=29.89µs  p(99.9)=4.91ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=2.72s   min=34.8ms  med=2.8s    max=5.16s    p(90)=3.64s    p(95)=3.85s    p(99.9)=5.09s   
     http_reqs......................: 2221    17.538225/s
     iteration_duration.............: avg=2.85s   min=1.09s   med=2.84s   max=5.16s    p(90)=3.66s    p(95)=3.87s    p(99.9)=5.09s   
     iterations.....................: 2121    16.748571/s
     success_rate...................: 100.00% ✓ 2121      ✗ 0   
     vus............................: 30      min=0       max=50
     vus_max........................: 50      min=50      max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

