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
| hive-router | v0.0.49 | 2,682 | 2,798 | 2,628 | 2.3% |  |
| hotchocolate | 16.1.0-p.1.9 | 2,080 | 2,127 | 2,069 | 1.0% |  |
| cosmo | 0.307.0 | 1,165 | 1,165 | 1,165 | 0.0% | non-compatible response (13 across 7/9 runs) |
| hive-gateway-router-runtime | 2.5.25 | 482 | 491 | 478 | 1.0% |  |
| hive-gateway | 2.5.25 | 228 | 230 | 225 | 0.8% |  |
| apollo-gateway | 2.13.3 | 203 | 207 | 201 | 0.9% |  |
| apollo-router | v2.13.1 | — | — | — | — | non-compatible response (14808 across 9/9 runs) |
| grafbase | 0.53.3 | — | — | — | — | non-compatible response (460454 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.49 | 2,362 | 2,462 | 2,330 | 1.9% |  |
| hotchocolate | 16.1.0-p.1.9 | 1,944 | 1,974 | 1,924 | 0.9% |  |
| cosmo | 0.307.0 | 1,102 | 1,110 | 1,102 | 0.4% | non-compatible response (10 across 6/9 runs) |
| hive-gateway-router-runtime | 2.5.25 | 472 | 481 | 466 | 1.1% |  |
| hive-gateway | 2.5.25 | 222 | 226 | 220 | 1.0% |  |
| apollo-gateway | 2.13.3 | 207 | 210 | 205 | 0.8% |  |
| apollo-router | v2.13.1 | — | — | — | — | non-compatible response (16434 across 9/9 runs) |
| grafbase | 0.53.3 | — | — | — | — | non-compatible response (218059 across 9/9 runs) |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.49)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 495018      ✗ 0     
     data_received..................: 15 GB   235 MB/s
     data_sent......................: 199 MB  3.2 MB/s
     http_req_blocked...............: avg=20.75µs  min=1.02µs  med=2.21µs  max=55.57ms  p(90)=3.56µs   p(95)=4.66µs   p(99.9)=1.89ms  
     http_req_connecting............: avg=17.35µs  min=0s      med=0s      max=55.48ms  p(90)=0s       p(95)=0s       p(99.9)=1.65ms  
     http_req_duration..............: avg=85.6ms   min=1.58ms  med=80.93ms max=298.58ms p(90)=165.86ms p(95)=179.02ms p(99.9)=222.31ms
       { expected_response:true }...: avg=85.6ms   min=1.58ms  med=80.93ms max=298.58ms p(90)=165.86ms p(95)=179.02ms p(99.9)=222.31ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 166006
     http_req_receiving.............: avg=289.35µs min=28.32µs med=55.13µs max=110.85ms p(90)=188.77µs p(95)=390.02µs p(99.9)=35.22ms 
     http_req_sending...............: avg=80.91µs  min=5.16µs  med=9.69µs  max=209.92ms p(90)=17.72µs  p(95)=126.03µs p(99.9)=11.35ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=85.23ms  min=1.51ms  med=80.55ms max=278.18ms p(90)=165.33ms p(95)=178.22ms p(99.9)=218.48ms
     http_reqs......................: 166006  2682.902003/s
     iteration_duration.............: avg=86.39ms  min=2.2ms   med=81.81ms max=343.61ms p(90)=166.32ms p(95)=179.48ms p(99.9)=223.57ms
     iterations.....................: 165006  2666.740527/s
     success_rate...................: 100.00% ✓ 165006      ✗ 0     
     vus............................: 51      min=0         max=500 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (rust subgraphs) (16.1.0-p.1.9)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 388707      ✗ 0     
     data_received..................: 11 GB   182 MB/s
     data_sent......................: 157 MB  2.5 MB/s
     http_req_blocked...............: avg=17.54µs  min=982ns   med=2.23µs   max=49.11ms  p(90)=3.62µs   p(95)=4.61µs   p(99.9)=2.62ms  
     http_req_connecting............: avg=14.71µs  min=0s      med=0s       max=49.06ms  p(90)=0s       p(95)=0s       p(99.9)=2.57ms  
     http_req_duration..............: avg=109ms    min=2.38ms  med=98.05ms  max=800.72ms p(90)=213.18ms p(95)=251.82ms p(99.9)=552.34ms
       { expected_response:true }...: avg=109ms    min=2.38ms  med=98.05ms  max=800.72ms p(90)=213.18ms p(95)=251.82ms p(99.9)=552.34ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 130569
     http_req_receiving.............: avg=2.56ms   min=50.63µs med=111.87µs max=340.19ms p(90)=1.43ms   p(95)=5.37ms   p(99.9)=212.72ms
     http_req_sending...............: avg=64.55µs  min=5.23µs  med=9.71µs   max=240.15ms p(90)=17.6µs   p(95)=115.41µs p(99.9)=9.09ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=106.37ms min=2.29ms  med=96.88ms  max=794.38ms p(90)=209.37ms p(95)=243.91ms p(99.9)=455.73ms
     http_reqs......................: 130569  2080.561432/s
     iteration_duration.............: avg=110.12ms min=3.5ms   med=99.26ms  max=800.97ms p(90)=214ms    p(95)=252.83ms p(99.9)=552.94ms
     iterations.....................: 129569  2064.626857/s
     success_rate...................: 100.00% ✓ 129569      ✗ 0     
     vus............................: 92      min=0         max=500 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (rust subgraphs) (0.307.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 215736      ✗ 0    
     data_received..................: 6.4 GB  102 MB/s
     data_sent......................: 88 MB   1.4 MB/s
     http_req_blocked...............: avg=9.99µs   min=1.11µs  med=2.6µs    max=12.39ms  p(90)=4.22µs   p(95)=5.17µs   p(99.9)=620.49µs
     http_req_connecting............: avg=6.63µs   min=0s      med=0s       max=12.35ms  p(90)=0s       p(95)=0s       p(99.9)=561.42µs
     http_req_duration..............: avg=195.74ms min=2.05ms  med=195.09ms max=562.99ms p(90)=362.66ms p(95)=388.86ms p(99.9)=483.03ms
       { expected_response:true }...: avg=195.74ms min=2.05ms  med=195.09ms max=562.99ms p(90)=362.66ms p(95)=388.86ms p(99.9)=483.03ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 72912
     http_req_receiving.............: avg=86.54µs  min=28.16µs med=63.03µs  max=243.57ms p(90)=97.88µs  p(95)=112.21µs p(99.9)=1.91ms  
     http_req_sending...............: avg=30.87µs  min=5.49µs  med=11.17µs  max=17.87ms  p(90)=17.36µs  p(95)=21.02µs  p(99.9)=4.17ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=195.63ms min=1.99ms  med=194.98ms max=562.92ms p(90)=362.54ms p(95)=388.69ms p(99.9)=482.93ms
     http_reqs......................: 72912   1165.908723/s
     iteration_duration.............: avg=198.71ms min=5.15ms  med=198.39ms max=563.15ms p(90)=363.6ms  p(95)=389.58ms p(99.9)=483.61ms
     iterations.....................: 71912   1149.918094/s
     success_rate...................: 100.00% ✓ 71912       ✗ 0    
     vus............................: 82      min=0         max=494
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (rust subgraphs) (2.5.25)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 90969      ✗ 0    
     data_received..................: 2.8 GB  42 MB/s
     data_sent......................: 38 MB   579 kB/s
     http_req_blocked...............: avg=9.84µs   min=1.15µs  med=2.92µs   max=28.88ms  p(90)=4.77µs   p(95)=5.88µs   p(99.9)=1.17ms  
     http_req_connecting............: avg=5.81µs   min=0s      med=0s       max=28.83ms  p(90)=0s       p(95)=0s       p(99.9)=1.11ms  
     http_req_duration..............: avg=458.7ms  min=4.06ms  med=426.76ms max=1.82s    p(90)=909.54ms p(95)=983.4ms  p(99.9)=1.42s   
       { expected_response:true }...: avg=458.7ms  min=4.06ms  med=426.76ms max=1.82s    p(90)=909.54ms p(95)=983.4ms  p(99.9)=1.42s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 31323
     http_req_receiving.............: avg=94.93µs  min=29.84µs med=76.12µs  max=200.3ms  p(90)=111.61µs p(95)=123.82µs p(99.9)=879.19µs
     http_req_sending...............: avg=36.93µs  min=5.45µs  med=13.26µs  max=178.88ms p(90)=20.55µs  p(95)=23.95µs  p(99.9)=3.55ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=458.56ms min=3.97ms  med=426.68ms max=1.82s    p(90)=909.46ms p(95)=983.27ms p(99.9)=1.42s   
     http_reqs......................: 31323   482.06859/s
     iteration_duration.............: avg=474.06ms min=18.71ms med=446.01ms max=1.84s    p(90)=913.21ms p(95)=987.19ms p(99.9)=1.45s   
     iterations.....................: 30323   466.678347/s
     success_rate...................: 100.00% ✓ 30323      ✗ 0    
     vus............................: 55      min=0        max=499
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (rust subgraphs) (2.5.25)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 43872      ✗ 0    
     data_received..................: 1.4 GB  20 MB/s
     data_sent......................: 19 MB   275 kB/s
     http_req_blocked...............: avg=17.16µs  min=1.17µs  med=3.56µs   max=56.67ms  p(90)=5.38µs   p(95)=7.05µs   p(99.9)=1.99ms
     http_req_connecting............: avg=12.01µs  min=0s      med=0s       max=56.58ms  p(90)=0s       p(95)=0s       p(99.9)=1.96ms
     http_req_duration..............: avg=920.88ms min=6.16ms  med=797.76ms max=16.85s   p(90)=1.62s    p(95)=1.79s    p(99.9)=14.43s
       { expected_response:true }...: avg=920.88ms min=6.16ms  med=797.76ms max=16.85s   p(90)=1.62s    p(95)=1.79s    p(99.9)=14.43s
     http_req_failed................: 0.00%   ✓ 0          ✗ 15624
     http_req_receiving.............: avg=108.57µs min=37.29µs med=93.68µs  max=93.67ms  p(90)=134.84µs p(95)=148.11µs p(99.9)=1ms   
     http_req_sending...............: avg=36.28µs  min=5.85µs  med=17.44µs  max=139.78ms p(90)=23.92µs  p(95)=28.65µs  p(99.9)=2.75ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=920.73ms min=6.06ms  med=797.61ms max=16.85s   p(90)=1.62s    p(95)=1.79s    p(99.9)=14.43s
     http_reqs......................: 15624   228.960737/s
     iteration_duration.............: avg=983.95ms min=27.01ms med=878.67ms max=16.85s   p(90)=1.65s    p(95)=1.8s     p(99.9)=14.48s
     iterations.....................: 14624   214.306312/s
     success_rate...................: 100.00% ✓ 14624      ✗ 0    
     vus............................: 60      min=0        max=499
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

     checks.........................: 100.00% ✓ 42381      ✗ 0    
     data_received..................: 1.3 GB  18 MB/s
     data_sent......................: 19 MB   250 kB/s
     http_req_blocked...............: avg=14.89µs  min=1.28µs  med=3.19µs   max=3.57ms  p(90)=4.83µs   p(95)=6.21µs   p(99.9)=2.8ms   
     http_req_connecting............: avg=10µs     min=0s      med=0s       max=3.55ms  p(90)=0s       p(95)=0s       p(99.9)=2.78ms  
     http_req_duration..............: avg=486.66ms min=8.4ms   med=520.09ms max=1.45s   p(90)=915.84ms p(95)=976.72ms p(99.9)=1.34s   
       { expected_response:true }...: avg=486.66ms min=8.4ms   med=520.09ms max=1.45s   p(90)=915.84ms p(95)=976.72ms p(99.9)=1.34s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 15127
     http_req_receiving.............: avg=91.14µs  min=33.7µs  med=85.26µs  max=3.36ms  p(90)=123.88µs p(95)=137.55µs p(99.9)=814.61µs
     http_req_sending...............: avg=29.59µs  min=6.06µs  med=15.34µs  max=16.95ms p(90)=21.48µs  p(95)=26.21µs  p(99.9)=3.75ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=486.54ms min=8.26ms  med=520.02ms max=1.45s   p(90)=915.72ms p(95)=976.55ms p(99.9)=1.34s   
     http_reqs......................: 15127   203.79638/s
     iteration_duration.............: avg=520.92ms min=12.64ms med=555.31ms max=1.46s   p(90)=923.81ms p(95)=983.08ms p(99.9)=1.36s   
     iterations.....................: 14127   190.324021/s
     success_rate...................: 100.00% ✓ 14127      ✗ 0    
     vus............................: 58      min=0        max=495
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.49)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 437748      ✗ 0     
     data_received..................: 13 GB   207 MB/s
     data_sent......................: 177 MB  2.8 MB/s
     http_req_blocked...............: avg=23.88µs  min=911ns   med=2.52µs  max=75.44ms  p(90)=4.49µs   p(95)=5.87µs   p(99.9)=2.93ms  
     http_req_connecting............: avg=20.41µs  min=0s      med=0s      max=75.34ms  p(90)=0s       p(95)=0s       p(99.9)=2.87ms  
     http_req_duration..............: avg=96.76ms  min=1.71ms  med=91.09ms max=367.47ms p(90)=186.15ms p(95)=202.71ms p(99.9)=250.56ms
       { expected_response:true }...: avg=96.76ms  min=1.71ms  med=91.09ms max=367.47ms p(90)=186.15ms p(95)=202.71ms p(99.9)=250.56ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 146916
     http_req_receiving.............: avg=290.32µs min=29.18µs med=60.32µs max=161.75ms p(90)=200.08µs p(95)=428.89µs p(99.9)=33.65ms 
     http_req_sending...............: avg=81.93µs  min=5.3µs   med=10.91µs max=227.31ms p(90)=22.59µs  p(95)=139.75µs p(99.9)=11.46ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=96.39ms  min=1.66ms  med=90.79ms max=367.11ms p(90)=185.56ms p(95)=201.91ms p(99.9)=246.02ms
     http_reqs......................: 146916  2362.640545/s
     iteration_duration.............: avg=97.72ms  min=3.56ms  med=92.23ms max=378.57ms p(90)=186.63ms p(95)=203.29ms p(99.9)=251.91ms
     iterations.....................: 145916  2346.558971/s
     success_rate...................: 100.00% ✓ 145916      ✗ 0     
     vus............................: 66      min=0         max=496 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (.net subgraphs) (16.1.0-p.1.9)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 359817      ✗ 0     
     data_received..................: 11 GB   171 MB/s
     data_sent......................: 145 MB  2.3 MB/s
     http_req_blocked...............: avg=14.41µs  min=1.01µs  med=2.34µs   max=43.92ms  p(90)=4.06µs   p(95)=5.22µs   p(99.9)=1.75ms  
     http_req_connecting............: avg=11.19µs  min=0s      med=0s       max=43.86ms  p(90)=0s       p(95)=0s       p(99.9)=1.57ms  
     http_req_duration..............: avg=117.72ms min=1.75ms  med=107.51ms max=918.81ms p(90)=228.54ms p(95)=259.56ms p(99.9)=645.72ms
       { expected_response:true }...: avg=117.72ms min=1.75ms  med=107.51ms max=918.81ms p(90)=228.54ms p(95)=259.56ms p(99.9)=645.72ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 120939
     http_req_receiving.............: avg=1.47ms   min=51.14µs med=113.77µs max=257.47ms p(90)=1.58ms   p(95)=4.02ms   p(99.9)=124.15ms
     http_req_sending...............: avg=60.71µs  min=5.53µs  med=10.19µs  max=176.56ms p(90)=19.62µs  p(95)=117.52µs p(99.9)=8.15ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=116.18ms min=1.67ms  med=106.18ms max=918.73ms p(90)=226.2ms  p(95)=256.02ms p(99.9)=645.46ms
     http_reqs......................: 120939  1944.915611/s
     iteration_duration.............: avg=118.97ms min=2.99ms  med=108.83ms max=919.02ms p(90)=229.31ms p(95)=260.19ms p(99.9)=646.08ms
     iterations.....................: 119939  1928.83382/s
     success_rate...................: 100.00% ✓ 119939      ✗ 0     
     vus............................: 66      min=0         max=496 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (.net subgraphs) (0.307.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 211428      ✗ 0    
     data_received..................: 6.3 GB  96 MB/s
     data_sent......................: 86 MB   1.3 MB/s
     http_req_blocked...............: avg=7.22µs   min=1.1µs   med=2.43µs   max=49.75ms  p(90)=4.27µs   p(95)=5.34µs   p(99.9)=645.09µs
     http_req_connecting............: avg=3.99µs   min=0s      med=0s       max=49.65ms  p(90)=0s       p(95)=0s       p(99.9)=543.44µs
     http_req_duration..............: avg=199.21ms min=2.1ms   med=203.44ms max=582.8ms  p(90)=366.42ms p(95)=394.8ms  p(99.9)=490.5ms 
       { expected_response:true }...: avg=199.21ms min=2.1ms   med=203.44ms max=582.8ms  p(90)=366.42ms p(95)=394.8ms  p(99.9)=490.5ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 71476
     http_req_receiving.............: avg=83.28µs  min=29.91µs med=66.01µs  max=145.32ms p(90)=104.33µs p(95)=119.63µs p(99.9)=1.41ms  
     http_req_sending...............: avg=32.06µs  min=5.24µs  med=11.56µs  max=164.22ms p(90)=18.74µs  p(95)=22.27µs  p(99.9)=3.72ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=199.1ms  min=2.04ms  med=203.3ms  max=582.73ms p(90)=366.32ms p(95)=394.68ms p(99.9)=490.43ms
     http_reqs......................: 71476   1102.391255/s
     iteration_duration.............: avg=202.29ms min=5.63ms  med=206.52ms max=582.96ms p(90)=367.32ms p(95)=395.42ms p(99.9)=490.8ms 
     iterations.....................: 70476   1086.968019/s
     success_rate...................: 100.00% ✓ 70476       ✗ 0    
     vus............................: 1       min=0         max=500
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (.net subgraphs) (2.5.25)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 89583      ✗ 0    
     data_received..................: 2.7 GB  41 MB/s
     data_sent......................: 37 MB   567 kB/s
     http_req_blocked...............: avg=8.32µs   min=1.2µs   med=3µs      max=6.15ms   p(90)=4.83µs   p(95)=5.82µs   p(99.9)=885.45µs
     http_req_connecting............: avg=4.33µs   min=0s      med=0s       max=6.09ms   p(90)=0s       p(95)=0s       p(99.9)=862.99µs
     http_req_duration..............: avg=465.55ms min=4.23ms  med=437.52ms max=1.93s    p(90)=922.96ms p(95)=995.2ms  p(99.9)=1.45s   
       { expected_response:true }...: avg=465.55ms min=4.23ms  med=437.52ms max=1.93s    p(90)=922.96ms p(95)=995.2ms  p(99.9)=1.45s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 30861
     http_req_receiving.............: avg=99.96µs  min=32.68µs med=80.28µs  max=130.62ms p(90)=117.2µs  p(95)=131.07µs p(99.9)=861.84µs
     http_req_sending...............: avg=34.02µs  min=6.12µs  med=14.1µs   max=135.62ms p(90)=21.4µs   p(95)=24.56µs  p(99.9)=3.16ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=465.42ms min=4.13ms  med=437.46ms max=1.93s    p(90)=922.86ms p(95)=995.09ms p(99.9)=1.45s   
     http_reqs......................: 30861   472.146695/s
     iteration_duration.............: avg=481.38ms min=25.97ms med=455.33ms max=1.93s    p(90)=927.04ms p(95)=998.25ms p(99.9)=1.46s   
     iterations.....................: 29861   456.847557/s
     success_rate...................: 100.00% ✓ 29861      ✗ 0    
     vus............................: 75      min=0        max=495
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (.net subgraphs) (2.5.25)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 42630      ✗ 0    
     data_received..................: 1.3 GB  20 MB/s
     data_sent......................: 18 MB   267 kB/s
     http_req_blocked...............: avg=15.22µs  min=1.43µs  med=3.73µs   max=3.91ms  p(90)=5.63µs   p(95)=7.31µs   p(99.9)=2.51ms  
     http_req_connecting............: avg=9.37µs   min=0s      med=0s       max=3.88ms  p(90)=0s       p(95)=0s       p(99.9)=2.41ms  
     http_req_duration..............: avg=960.43ms min=6.34ms  med=872.18ms max=5.63s   p(90)=1.91s    p(95)=2.14s    p(99.9)=5.19s   
       { expected_response:true }...: avg=960.43ms min=6.34ms  med=872.18ms max=5.63s   p(90)=1.91s    p(95)=2.14s    p(99.9)=5.19s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 15210
     http_req_receiving.............: avg=105.8µs  min=37.21µs med=99.85µs  max=11.23ms p(90)=139.86µs p(95)=152.47µs p(99.9)=714.23µs
     http_req_sending...............: avg=29.69µs  min=6.61µs  med=18.57µs  max=21.04ms p(90)=24.73µs  p(95)=29.46µs  p(99.9)=2.74ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=960.3ms  min=6.24ms  med=872.07ms max=5.63s   p(90)=1.91s    p(95)=2.13s    p(99.9)=5.19s   
     http_reqs......................: 15210   222.685846/s
     iteration_duration.............: avg=1.02s    min=42.42ms med=940.67ms max=5.64s   p(90)=1.92s    p(95)=2.16s    p(99.9)=5.23s   
     iterations.....................: 14210   208.045093/s
     success_rate...................: 100.00% ✓ 14210      ✗ 0    
     vus............................: 69      min=0        max=500
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

     checks.........................: 100.00% ✓ 40431      ✗ 0    
     data_received..................: 1.3 GB  18 MB/s
     data_sent......................: 17 MB   249 kB/s
     http_req_blocked...............: avg=17.36µs  min=1.21µs  med=3.74µs   max=27.32ms p(90)=5.59µs   p(95)=7.18µs   p(99.9)=2.72ms
     http_req_connecting............: avg=11.85µs  min=0s      med=0s       max=27.26ms p(90)=0s       p(95)=0s       p(99.9)=2.7ms 
     http_req_duration..............: avg=1s       min=8.61ms  med=906.48ms max=4s      p(90)=2.05s    p(95)=2.19s    p(99.9)=3.61s 
       { expected_response:true }...: avg=1s       min=8.61ms  med=906.48ms max=4s      p(90)=2.05s    p(95)=2.19s    p(99.9)=3.61s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 14477
     http_req_receiving.............: avg=105.88µs min=33.57µs med=98.91µs  max=1.7ms   p(90)=140.98µs p(95)=154.76µs p(99.9)=1.12ms
     http_req_sending...............: avg=34.21µs  min=6.46µs  med=18.47µs  max=19.35ms p(90)=24.49µs  p(95)=29.72µs  p(99.9)=4.09ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=1s       min=8.51ms  med=906.34ms max=4s      p(90)=2.05s    p(95)=2.19s    p(99.9)=3.61s 
     http_reqs......................: 14477   207.37919/s
     iteration_duration.............: avg=1.08s    min=45.01ms med=1.01s    max=4.01s   p(90)=2.07s    p(95)=2.19s    p(99.9)=3.62s 
     iterations.....................: 13477   193.054455/s
     success_rate...................: 100.00% ✓ 13477      ✗ 0    
     vus............................: 100     min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-176-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

