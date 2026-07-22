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
| hive-router | v0.0.83 | 2,715 | 2,894 | 2,693 | 2.6% |  |
| fusion | 16.5.1 | 2,401 | 2,490 | 2,386 | 1.5% |  |
| cosmo | 0.331.1 | 1,198 | 1,243 | 1,187 | 1.7% |  |
| hive-gateway-router-runtime | 2.10.4 | 573 | 587 | 570 | 1.0% |  |
| hive-gateway | 2.10.4 | 261 | 269 | 259 | 1.1% |  |
| apollo-gateway | 2.14.2 | 232 | 237 | 231 | 0.9% | 3 failed requests across 1/9 runs |
| apollo-router | v2.16.0 | — | — | — | — | non-compatible response (7874 across 9/9 runs) |
| feddi | — | — | — | — | — | not run |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (517132 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| fusion | 16.5.1 | 2,355 | 2,444 | 2,343 | 1.4% |  |
| hive-router | v0.0.83 | 2,204 | 2,360 | 2,180 | 3.0% |  |
| cosmo | 0.331.1 | 1,168 | 1,209 | 1,162 | 1.5% |  |
| hive-gateway-router-runtime | 2.10.4 | 541 | 552 | 536 | 0.9% |  |
| hive-gateway | 2.10.4 | 247 | 252 | 246 | 0.7% |  |
| apollo-gateway | 2.14.2 | 233 | 239 | 231 | 1.0% |  |
| apollo-router | v2.16.0 | — | — | — | — | non-compatible response (36506 across 9/9 runs) |
| feddi | — | — | — | — | — | not run |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (451078 across 9/9 runs) |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.83)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 500031      ✗ 0     
     data_received..................: 15 GB   238 MB/s
     data_sent......................: 201 MB  3.3 MB/s
     http_req_blocked...............: avg=30.58µs  min=1.06µs  med=2.63µs  max=137.49ms p(90)=4.24µs   p(95)=5.38µs   p(99.9)=3.92ms  
     http_req_connecting............: avg=26.87µs  min=0s      med=0s      max=137.37ms p(90)=0s       p(95)=0s       p(99.9)=3.55ms  
     http_req_duration..............: avg=84.75ms  min=1.44ms  med=78.66ms max=266.35ms p(90)=163.51ms p(95)=177.38ms p(99.9)=230.96ms
       { expected_response:true }...: avg=84.75ms  min=1.44ms  med=78.66ms max=266.35ms p(90)=163.51ms p(95)=177.38ms p(99.9)=230.96ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 167677
     http_req_receiving.............: avg=136.99µs min=27.57µs med=53.9µs  max=67.13ms  p(90)=141.44µs p(95)=347.01µs p(99.9)=14.56ms 
     http_req_sending...............: avg=73.58µs  min=4.57µs  med=9.89µs  max=79.85ms  p(90)=18.74µs  p(95)=123.4µs  p(99.9)=9.97ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=84.54ms  min=1.39ms  med=78.44ms max=266.29ms p(90)=163.29ms p(95)=177.07ms p(99.9)=230.33ms
     http_reqs......................: 167677  2715.392681/s
     iteration_duration.............: avg=85.52ms  min=2.25ms  med=79.5ms  max=291.64ms p(90)=163.95ms p(95)=177.88ms p(99.9)=232.77ms
     iterations.....................: 166677  2699.198494/s
     success_rate...................: 100.00% ✓ 166677      ✗ 0     
     vus............................: 91      min=0         max=499 
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

     checks.........................: 100.00% ✓ 445911      ✗ 0     
     data_received..................: 13 GB   211 MB/s
     data_sent......................: 180 MB  2.9 MB/s
     http_req_blocked...............: avg=16.34µs min=952ns   med=2.52µs   max=58.89ms  p(90)=3.97µs   p(95)=4.96µs   p(99.9)=1.23ms  
     http_req_connecting............: avg=13.05µs min=0s      med=0s       max=58.82ms  p(90)=0s       p(95)=0s       p(99.9)=1.17ms  
     http_req_duration..............: avg=95.13ms min=1.92ms  med=85.48ms  max=1.73s    p(90)=179.47ms p(95)=204.04ms p(99.9)=601.32ms
       { expected_response:true }...: avg=95.13ms min=1.92ms  med=85.48ms  max=1.73s    p(90)=179.47ms p(95)=204.04ms p(99.9)=601.32ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 149637
     http_req_receiving.............: avg=1.45ms  min=51.87µs med=100.79µs max=648.77ms p(90)=1.65ms   p(95)=4.26ms   p(99.9)=86.19ms 
     http_req_sending...............: avg=63µs    min=4.49µs  med=9.32µs   max=191.2ms  p(90)=16.6µs   p(95)=110.3µs  p(99.9)=8.21ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=93.62ms min=1.85ms  med=84.34ms  max=1.69s    p(90)=177.36ms p(95)=201.46ms p(99.9)=577.85ms
     http_reqs......................: 149637  2401.399468/s
     iteration_duration.............: avg=96.01ms min=2.79ms  med=86.42ms  max=1.73s    p(90)=180.01ms p(95)=204.63ms p(99.9)=602.42ms
     iterations.....................: 148637  2385.351301/s
     success_rate...................: 100.00% ✓ 148637      ✗ 0     
     vus............................: 73      min=0         max=494 
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

     checks.........................: 100.00% ✓ 221877      ✗ 0    
     data_received..................: 6.6 GB  105 MB/s
     data_sent......................: 90 MB   1.4 MB/s
     http_req_blocked...............: avg=5.59µs   min=1.08µs  med=2.51µs   max=12.31ms  p(90)=4.12µs   p(95)=5.01µs   p(99.9)=425.94µs
     http_req_connecting............: avg=2.36µs   min=0s      med=0s       max=12.16ms  p(90)=0s       p(95)=0s       p(99.9)=349.49µs
     http_req_duration..............: avg=190.37ms min=1.89ms  med=192.5ms  max=520.63ms p(90)=351.01ms p(95)=374.39ms p(99.9)=452.86ms
       { expected_response:true }...: avg=190.37ms min=1.89ms  med=192.5ms  max=520.63ms p(90)=351.01ms p(95)=374.39ms p(99.9)=452.86ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 74959
     http_req_receiving.............: avg=88.44µs  min=27.39µs med=59.11µs  max=207.54ms p(90)=95.81µs  p(95)=110.67µs p(99.9)=1.29ms  
     http_req_sending...............: avg=29.14µs  min=5.15µs  med=10.69µs  max=184.19ms p(90)=16.69µs  p(95)=20.22µs  p(99.9)=3.03ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=190.25ms min=1.84ms  med=192.34ms max=520.53ms p(90)=350.92ms p(95)=374.29ms p(99.9)=452.78ms
     http_reqs......................: 74959   1198.796803/s
     iteration_duration.............: avg=193.18ms min=3.74ms  med=195.52ms max=520.78ms p(90)=351.93ms p(95)=374.93ms p(99.9)=453.52ms
     iterations.....................: 73959   1182.804103/s
     success_rate...................: 100.00% ✓ 73959       ✗ 0    
     vus............................: 82      min=0         max=495
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

     checks.........................: 100.00% ✓ 107550     ✗ 0    
     data_received..................: 3.2 GB  50 MB/s
     data_sent......................: 44 MB   688 kB/s
     http_req_blocked...............: avg=6.26µs   min=1µs     med=2.61µs   max=3.72ms   p(90)=4.34µs   p(95)=5.33µs   p(99.9)=557.91µs
     http_req_connecting............: avg=2.68µs   min=0s      med=0s       max=3.66ms   p(90)=0s       p(95)=0s       p(99.9)=479.12µs
     http_req_duration..............: avg=389.18ms min=3.57ms  med=362.23ms max=1.52s    p(90)=765.7ms  p(95)=824.77ms p(99.9)=1.19s   
       { expected_response:true }...: avg=389.18ms min=3.57ms  med=362.23ms max=1.52s    p(90)=765.7ms  p(95)=824.77ms p(99.9)=1.19s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 36850
     http_req_receiving.............: avg=84.63µs  min=29.48µs med=67µs     max=135.93ms p(90)=107.98µs p(95)=123.09µs p(99.9)=751.7µs 
     http_req_sending...............: avg=30.15µs  min=5.33µs  med=12.48µs  max=128.94ms p(90)=20.55µs  p(95)=23.66µs  p(99.9)=2.05ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=389.07ms min=3.49ms  med=362.06ms max=1.52s    p(90)=765.57ms p(95)=824.66ms p(99.9)=1.19s   
     http_reqs......................: 36850   573.005841/s
     iteration_duration.............: avg=400.26ms min=19.21ms med=373.95ms max=1.53s    p(90)=768.39ms p(95)=826.98ms p(99.9)=1.2s    
     iterations.....................: 35850   557.456158/s
     success_rate...................: 100.00% ✓ 35850      ✗ 0    
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

     checks.........................: 100.00% ✓ 49602      ✗ 0    
     data_received..................: 1.5 GB  23 MB/s
     data_sent......................: 21 MB   314 kB/s
     http_req_blocked...............: avg=13.81µs  min=1.16µs  med=3.94µs   max=8.47ms  p(90)=5.82µs   p(95)=7.41µs   p(99.9)=2.02ms
     http_req_connecting............: avg=7.88µs   min=0s      med=0s       max=8.41ms  p(90)=0s       p(95)=0s       p(99.9)=1.79ms
     http_req_duration..............: avg=825.37ms min=5.4ms   med=745ms    max=11.21s  p(90)=1.5s     p(95)=1.68s    p(99.9)=9.91s 
       { expected_response:true }...: avg=825.37ms min=5.4ms   med=745ms    max=11.21s  p(90)=1.5s     p(95)=1.68s    p(99.9)=9.91s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 17534
     http_req_receiving.............: avg=144.86µs min=34.08µs med=94.46µs  max=64.14ms p(90)=133.65µs p(95)=149.89µs p(99.9)=11.8ms
     http_req_sending...............: avg=33.66µs  min=6.77µs  med=18.99µs  max=56.32ms p(90)=24.97µs  p(95)=29.76µs  p(99.9)=2.62ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=825.19ms min=5.3ms   med=744.89ms max=11.21s  p(90)=1.5s     p(95)=1.68s    p(99.9)=9.91s 
     http_reqs......................: 17534   261.440828/s
     iteration_duration.............: avg=875.35ms min=48.5ms  med=802.94ms max=11.21s  p(90)=1.53s    p(95)=1.69s    p(99.9)=9.94s 
     iterations.....................: 16534   246.530321/s
     success_rate...................: 100.00% ✓ 16534      ✗ 0    
     vus............................: 31      min=0        max=500
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

     checks.........................: 100.00% ✓ 47859      ✗ 0    
     data_received..................: 1.5 GB  20 MB/s
     data_sent......................: 21 MB   285 kB/s
     http_req_blocked...............: avg=14.17µs  min=1.14µs  med=3µs      max=16.62ms p(90)=4.56µs   p(95)=5.79µs   p(99.9)=2.21ms  
     http_req_connecting............: avg=9.59µs   min=0s      med=0s       max=16.51ms p(90)=0s       p(95)=0s       p(99.9)=2.19ms  
     http_req_duration..............: avg=398.67ms min=7.36ms  med=451.6ms  max=1.16s   p(90)=691.3ms  p(95)=750.47ms p(99.9)=1.06s   
       { expected_response:true }...: avg=398.67ms min=7.36ms  med=451.6ms  max=1.16s   p(90)=691.3ms  p(95)=750.47ms p(99.9)=1.06s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 16953
     http_req_receiving.............: avg=92.81µs  min=33.7µs  med=80.83µs  max=88.49ms p(90)=120.25µs p(95)=134.82µs p(99.9)=666.19µs
     http_req_sending...............: avg=31.75µs  min=5.62µs  med=15.31µs  max=65.47ms p(90)=20.72µs  p(95)=25.09µs  p(99.9)=2.97ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=398.54ms min=7.26ms  med=451.36ms max=1.16s   p(90)=691.2ms  p(95)=750.36ms p(99.9)=1.06s   
     http_reqs......................: 16953   232.218103/s
     iteration_duration.............: avg=423.63ms min=12.84ms med=476.5ms  max=1.17s   p(90)=695.59ms p(95)=756.1ms  p(99.9)=1.07s   
     iterations.....................: 15953   218.520344/s
     success_rate...................: 100.00% ✓ 15953      ✗ 0    
     vus............................: 49      min=0        max=498
     vus_max........................: 500     min=500      max=500
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

     checks.........................: 100.00% ✓ 434202     ✗ 0     
     data_received..................: 13 GB   206 MB/s
     data_sent......................: 175 MB  2.8 MB/s
     http_req_blocked...............: avg=22.51µs min=1.02µs med=2.85µs   max=84.94ms  p(90)=4.64µs   p(95)=5.86µs   p(99.9)=2.48ms  
     http_req_connecting............: avg=18.87µs min=0s     med=0s       max=84.82ms  p(90)=0s       p(95)=0s       p(99.9)=2.44ms  
     http_req_duration..............: avg=97.63ms min=1.48ms med=82.56ms  max=1.54s    p(90)=185.28ms p(95)=214.12ms p(99.9)=797.54ms
       { expected_response:true }...: avg=97.63ms min=1.48ms med=82.56ms  max=1.54s    p(90)=185.28ms p(95)=214.12ms p(99.9)=797.54ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 145734
     http_req_receiving.............: avg=1.59ms  min=51.7µs med=106.77µs max=1.09s    p(90)=1.69ms   p(95)=4.49ms   p(99.9)=126ms   
     http_req_sending...............: avg=72.8µs  min=4.74µs med=10.66µs  max=134.71ms p(90)=21.07µs  p(95)=119.64µs p(99.9)=10.14ms 
     http_req_tls_handshaking.......: avg=0s      min=0s     med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=95.96ms min=1.4ms  med=81.38ms  max=1.52s    p(90)=183.58ms p(95)=211.4ms  p(99.9)=771.68ms
     http_reqs......................: 145734  2355.21151/s
     iteration_duration.............: avg=98.61ms min=2.86ms med=83.52ms  max=1.54s    p(90)=186.04ms p(95)=215.12ms p(99.9)=804.7ms 
     iterations.....................: 144734  2339.05048/s
     success_rate...................: 100.00% ✓ 144734     ✗ 0     
     vus............................: 51      min=0        max=499 
     vus_max........................: 500     min=500      max=500
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

     checks.........................: 100.00% ✓ 407478      ✗ 0     
     data_received..................: 12 GB   193 MB/s
     data_sent......................: 164 MB  2.6 MB/s
     http_req_blocked...............: avg=13.62µs  min=982ns   med=2.93µs   max=40.6ms   p(90)=4.82µs   p(95)=6.03µs   p(99.9)=939.03µs
     http_req_connecting............: avg=9.92µs   min=0s      med=0s       max=40.53ms  p(90)=0s       p(95)=0s       p(99.9)=857.29µs
     http_req_duration..............: avg=104ms    min=1.63ms  med=100.11ms max=305.86ms p(90)=199.51ms p(95)=219.11ms p(99.9)=268.2ms 
       { expected_response:true }...: avg=104ms    min=1.63ms  med=100.11ms max=305.86ms p(90)=199.51ms p(95)=219.11ms p(99.9)=268.2ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 136826
     http_req_receiving.............: avg=123.53µs min=27.91µs med=59.14µs  max=168.5ms  p(90)=134.91µs p(95)=363.55µs p(99.9)=8.52ms  
     http_req_sending...............: avg=62.37µs  min=5.04µs  med=11.56µs  max=35.99ms  p(90)=21.69µs  p(95)=130.91µs p(99.9)=8.22ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=103.81ms min=1.58ms  med=99.92ms  max=303.22ms p(90)=199.29ms p(95)=218.85ms p(99.9)=266.87ms
     http_reqs......................: 136826  2204.113464/s
     iteration_duration.............: avg=105.01ms min=4ms     med=101.37ms max=332.28ms p(90)=200.1ms  p(95)=219.65ms p(99.9)=269.07ms
     iterations.....................: 135826  2188.004585/s
     success_rate...................: 100.00% ✓ 135826      ✗ 0     
     vus............................: 61      min=0         max=497 
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

     checks.........................: 100.00% ✓ 216279      ✗ 0    
     data_received..................: 6.4 GB  102 MB/s
     data_sent......................: 88 MB   1.4 MB/s
     http_req_blocked...............: avg=5.65µs   min=922ns   med=2.33µs   max=12.32ms  p(90)=4.09µs   p(95)=5.07µs   p(99.9)=616.68µs
     http_req_connecting............: avg=2.64µs   min=0s      med=0s       max=12.25ms  p(90)=0s       p(95)=0s       p(99.9)=541.76µs
     http_req_duration..............: avg=195.29ms min=1.87ms  med=196.58ms max=495.93ms p(90)=362.68ms p(95)=387.15ms p(99.9)=459.19ms
       { expected_response:true }...: avg=195.29ms min=1.87ms  med=196.58ms max=495.93ms p(90)=362.68ms p(95)=387.15ms p(99.9)=459.19ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 73093
     http_req_receiving.............: avg=77.47µs  min=28.72µs med=64.17µs  max=93.45ms  p(90)=104.83µs p(95)=120.07µs p(99.9)=934.6µs 
     http_req_sending...............: avg=27.59µs  min=4.9µs   med=11.29µs  max=58.41ms  p(90)=18.65µs  p(95)=22.43µs  p(99.9)=3.12ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=195.18ms min=1.82ms  med=196.47ms max=495.87ms p(90)=362.59ms p(95)=387.05ms p(99.9)=459.1ms 
     http_reqs......................: 73093   1168.180181/s
     iteration_duration.............: avg=198.23ms min=4.58ms  med=199.8ms  max=496.08ms p(90)=363.51ms p(95)=387.77ms p(99.9)=459.51ms
     iterations.....................: 72093   1152.198073/s
     success_rate...................: 100.00% ✓ 72093       ✗ 0    
     vus............................: 84      min=0         max=494
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

     checks.........................: 100.00% ✓ 102144     ✗ 0    
     data_received..................: 3.1 GB  47 MB/s
     data_sent......................: 42 MB   650 kB/s
     http_req_blocked...............: avg=8.9µs    min=1.01µs  med=3.29µs   max=8.04ms   p(90)=5.13µs   p(95)=6.24µs   p(99.9)=1.33ms
     http_req_connecting............: avg=4.49µs   min=0s      med=0s       max=7.99ms   p(90)=0s       p(95)=0s       p(99.9)=1.27ms
     http_req_duration..............: avg=409.48ms min=3.86ms  med=380.39ms max=1.59s    p(90)=801.75ms p(95)=873.67ms p(99.9)=1.25s 
       { expected_response:true }...: avg=409.48ms min=3.86ms  med=380.39ms max=1.59s    p(90)=801.75ms p(95)=873.67ms p(99.9)=1.25s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 35048
     http_req_receiving.............: avg=91.44µs  min=27.44µs med=75.46µs  max=156.41ms p(90)=115.85µs p(95)=131.84µs p(99.9)=1.08ms
     http_req_sending...............: avg=43.54µs  min=5.32µs  med=14.97µs  max=192.61ms p(90)=22.49µs  p(95)=25.8µs   p(99.9)=3.26ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=409.34ms min=3.75ms  med=380.31ms max=1.59s    p(90)=801.68ms p(95)=873.53ms p(99.9)=1.25s 
     http_reqs......................: 35048   541.228627/s
     iteration_duration.............: avg=421.73ms min=17.62ms med=394.12ms max=1.6s     p(90)=805.92ms p(95)=875.6ms  p(99.9)=1.26s 
     iterations.....................: 34048   525.78613/s
     success_rate...................: 100.00% ✓ 34048      ✗ 0    
     vus............................: 91      min=0        max=500
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

     checks.........................: 100.00% ✓ 47316      ✗ 0    
     data_received..................: 1.5 GB  22 MB/s
     data_sent......................: 20 MB   297 kB/s
     http_req_blocked...............: avg=14.23µs  min=1.12µs  med=3.33µs   max=12.09ms  p(90)=5.14µs   p(95)=6.58µs   p(99.9)=2.31ms
     http_req_connecting............: avg=9.16µs   min=0s      med=0s       max=12.02ms  p(90)=0s       p(95)=0s       p(99.9)=2.28ms
     http_req_duration..............: avg=867.14ms min=6ms     med=795.53ms max=4.56s    p(90)=1.73s    p(95)=1.94s    p(99.9)=4s    
       { expected_response:true }...: avg=867.14ms min=6ms     med=795.53ms max=4.56s    p(90)=1.73s    p(95)=1.94s    p(99.9)=4s    
     http_req_failed................: 0.00%   ✓ 0          ✗ 16772
     http_req_receiving.............: avg=101.83µs min=33.26µs med=91.93µs  max=36.77ms  p(90)=128.54µs p(95)=144.66µs p(99.9)=1.19ms
     http_req_sending...............: avg=53.08µs  min=5.66µs  med=17.96µs  max=139.47ms p(90)=23.59µs  p(95)=28.34µs  p(99.9)=4.78ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=866.99ms min=5.91ms  med=795.41ms max=4.56s    p(90)=1.73s    p(95)=1.94s    p(99.9)=4s    
     http_reqs......................: 16772   247.605492/s
     iteration_duration.............: avg=922.14ms min=30.85ms med=855.06ms max=4.57s    p(90)=1.74s    p(95)=1.96s    p(99.9)=4.02s 
     iterations.....................: 15772   232.842465/s
     success_rate...................: 100.00% ✓ 15772      ✗ 0    
     vus............................: 93      min=0        max=500
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

     checks.........................: 100.00% ✓ 45090      ✗ 0    
     data_received..................: 1.4 GB  21 MB/s
     data_sent......................: 19 MB   281 kB/s
     http_req_blocked...............: avg=14.76µs  min=1.15µs  med=3.23µs   max=10.41ms p(90)=4.94µs   p(95)=6.49µs   p(99.9)=2.4ms 
     http_req_connecting............: avg=9.74µs   min=0s      med=0s       max=10.34ms p(90)=0s       p(95)=0s       p(99.9)=2.37ms
     http_req_duration..............: avg=906.42ms min=7.65ms  med=824.02ms max=3.21s   p(90)=1.85s    p(95)=1.97s    p(99.9)=2.85s 
       { expected_response:true }...: avg=906.42ms min=7.65ms  med=824.02ms max=3.21s   p(90)=1.85s    p(95)=1.97s    p(99.9)=2.85s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 16030
     http_req_receiving.............: avg=98.96µs  min=31.69µs med=90.7µs   max=8.35ms  p(90)=130.26µs p(95)=146.22µs p(99.9)=1.15ms
     http_req_sending...............: avg=30.59µs  min=5.29µs  med=17.58µs  max=61.57ms p(90)=22.96µs  p(95)=28.04µs  p(99.9)=2.28ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=906.29ms min=7.51ms  med=823.93ms max=3.21s   p(90)=1.85s    p(95)=1.97s    p(99.9)=2.85s 
     http_reqs......................: 16030   233.698145/s
     iteration_duration.............: avg=966.69ms min=34.94ms med=908.53ms max=3.22s   p(90)=1.87s    p(95)=1.98s    p(99.9)=2.86s 
     iterations.....................: 15030   219.119346/s
     success_rate...................: 100.00% ✓ 15030      ✗ 0    
     vus............................: 85      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

