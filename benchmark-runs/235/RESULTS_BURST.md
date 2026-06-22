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
| hive-router | v0.0.72 | 2,640 | 2,773 | 2,603 | 2.0% |  |
| fusion-nightly | 16.3.0-p.1 | 2,103 | 2,119 | 2,088 | 0.5% |  |
| fusion | 16.2.2 | 2,038 | 2,075 | 2,009 | 1.2% |  |
| cosmo | 0.324.0 | 1,092 | 1,111 | 1,084 | 0.8% |  |
| hive-gateway-router-runtime | 2.9.0 | 526 | 533 | 523 | 0.6% |  |
| hive-gateway | 2.9.0 | 217 | 219 | 215 | 0.7% |  |
| apollo-gateway | 2.14.1 | 200 | 204 | 199 | 0.8% |  |
| apollo-router | v2.15.1 | — | — | — | — | non-compatible response (8595 across 9/9 runs) |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (470398 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.72 | 2,135 | 2,249 | 2,100 | 2.2% |  |
| fusion | 16.2.2 | 1,981 | 2,035 | 1,965 | 1.2% |  |
| fusion-nightly | 16.3.0-p.1 | 1,966 | 2,008 | 1,960 | 0.9% |  |
| cosmo | 0.324.0 | 1,025 | 1,050 | 1,015 | 1.1% |  |
| hive-gateway-router-runtime | 2.9.0 | 481 | 492 | 476 | 1.2% |  |
| hive-gateway | 2.9.0 | 218 | 221 | 216 | 0.8% |  |
| apollo-gateway | 2.14.1 | 206 | 209 | 205 | 0.6% |  |
| apollo-router | v2.15.1 | — | — | — | — | non-compatible response (42429 across 9/9 runs) |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (236686 across 9/9 runs) |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.72)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 487470      ✗ 0     
     data_received..................: 14 GB   232 MB/s
     data_sent......................: 196 MB  3.2 MB/s
     http_req_blocked...............: avg=29.47µs  min=1.06µs med=2.63µs  max=82.63ms  p(90)=4.12µs   p(95)=5.15µs   p(99.9)=9.84ms  
     http_req_connecting............: avg=25.85µs  min=0s     med=0s      max=82.43ms  p(90)=0s       p(95)=0s       p(99.9)=9.73ms  
     http_req_duration..............: avg=86.9ms   min=1.64ms med=79.5ms  max=292.25ms p(90)=170.9ms  p(95)=184.97ms p(99.9)=245.32ms
       { expected_response:true }...: avg=86.9ms   min=1.64ms med=79.5ms  max=292.25ms p(90)=170.9ms  p(95)=184.97ms p(99.9)=245.32ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 163490
     http_req_receiving.............: avg=287.48µs min=30.7µs med=58.78µs max=114.58ms p(90)=198.96µs p(95)=415.77µs p(99.9)=30.48ms 
     http_req_sending...............: avg=85.14µs  min=5.51µs med=10.43µs max=161.71ms p(90)=18.92µs  p(95)=135.26µs p(99.9)=13.15ms 
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=86.53ms  min=1.59ms med=79.25ms max=271.88ms p(90)=170.4ms  p(95)=184.32ms p(99.9)=241.47ms
     http_reqs......................: 163490  2640.765323/s
     iteration_duration.............: avg=87.74ms  min=2.4ms  med=80.54ms max=337.02ms p(90)=171.38ms p(95)=185.5ms  p(99.9)=246.42ms
     iterations.....................: 162490  2624.612865/s
     success_rate...................: 100.00% ✓ 162490      ✗ 0     
     vus............................: 54      min=0         max=499 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (rust subgraphs) (16.3.0-p.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 391908      ✗ 0     
     data_received..................: 12 GB   184 MB/s
     data_sent......................: 158 MB  2.5 MB/s
     http_req_blocked...............: avg=17.12µs  min=1.05µs  med=2.6µs    max=54.95ms  p(90)=3.99µs   p(95)=5.06µs   p(99.9)=1.77ms  
     http_req_connecting............: avg=13.54µs  min=0s      med=0s       max=54.89ms  p(90)=0s       p(95)=0s       p(99.9)=1.69ms  
     http_req_duration..............: avg=108.07ms min=2.27ms  med=102.06ms max=497.34ms p(90)=207.46ms p(95)=232.45ms p(99.9)=398.09ms
       { expected_response:true }...: avg=108.07ms min=2.27ms  med=102.06ms max=497.34ms p(90)=207.46ms p(95)=232.45ms p(99.9)=398.09ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 131636
     http_req_receiving.............: avg=1.99ms   min=52.67µs med=283.71µs max=242.31ms p(90)=3.03ms   p(95)=6.92ms   p(99.9)=129.69ms
     http_req_sending...............: avg=67.23µs  min=5.56µs  med=9.95µs   max=215.33ms p(90)=18.56µs  p(95)=125.1µs  p(99.9)=9.42ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=106.01ms min=2.17ms  med=100.18ms max=487.05ms p(90)=204.72ms p(95)=228.8ms  p(99.9)=371.06ms
     http_reqs......................: 131636  2103.914576/s
     iteration_duration.............: avg=109.2ms  min=3.12ms  med=103.28ms max=497.57ms p(90)=208.08ms p(95)=233.05ms p(99.9)=399.52ms
     iterations.....................: 130636  2087.931756/s
     success_rate...................: 100.00% ✓ 130636      ✗ 0     
     vus............................: 83      min=0         max=492 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (rust subgraphs) (16.2.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 380172      ✗ 0     
     data_received..................: 11 GB   179 MB/s
     data_sent......................: 153 MB  2.4 MB/s
     http_req_blocked...............: avg=19.24µs  min=1.08µs  med=2.6µs    max=105.55ms p(90)=4.08µs   p(95)=5.08µs   p(99.9)=1.54ms  
     http_req_connecting............: avg=15.9µs   min=0s      med=0s       max=105.47ms p(90)=0s       p(95)=0s       p(99.9)=1.45ms  
     http_req_duration..............: avg=111.36ms min=2.37ms  med=98.65ms  max=860.23ms p(90)=224.69ms p(95)=266.56ms p(99.9)=557.24ms
       { expected_response:true }...: avg=111.36ms min=2.37ms  med=98.65ms  max=860.23ms p(90)=224.69ms p(95)=266.56ms p(99.9)=557.24ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 127724
     http_req_receiving.............: avg=3.35ms   min=53.53µs med=143.69µs max=490.33ms p(90)=4.57ms   p(95)=12.4ms   p(99.9)=151.47ms
     http_req_sending...............: avg=67.13µs  min=5.41µs  med=9.98µs   max=150.47ms p(90)=18.13µs  p(95)=118.7µs  p(99.9)=9.36ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=107.93ms min=2.27ms  med=96.74ms  max=859.2ms  p(90)=217.13ms p(95)=254.77ms p(99.9)=535.74ms
     http_reqs......................: 127724  2038.249371/s
     iteration_duration.............: avg=112.59ms min=3.39ms  med=100.06ms max=860.46ms p(90)=225.48ms p(95)=267.79ms p(99.9)=558.23ms
     iterations.....................: 126724  2022.291138/s
     success_rate...................: 100.00% ✓ 126724      ✗ 0     
     vus............................: 88      min=0         max=497 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (rust subgraphs) (0.324.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 201957      ✗ 0    
     data_received..................: 6.0 GB  96 MB/s
     data_sent......................: 82 MB   1.3 MB/s
     http_req_blocked...............: avg=8.34µs   min=1.14µs  med=2.61µs   max=53.78ms  p(90)=4.04µs   p(95)=4.85µs   p(99.9)=767.53µs
     http_req_connecting............: avg=4.94µs   min=0s      med=0s       max=53.71ms  p(90)=0s       p(95)=0s       p(99.9)=584.31µs
     http_req_duration..............: avg=208.92ms min=2.01ms  med=208.6ms  max=618.07ms p(90)=389.81ms p(95)=420.08ms p(99.9)=542.08ms
       { expected_response:true }...: avg=208.92ms min=2.01ms  med=208.6ms  max=618.07ms p(90)=389.81ms p(95)=420.08ms p(99.9)=542.08ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 68319
     http_req_receiving.............: avg=85.02µs  min=29.97µs med=64.76µs  max=118.29ms p(90)=98.7µs   p(95)=113.07µs p(99.9)=1.52ms  
     http_req_sending...............: avg=32.44µs  min=5.57µs  med=11.06µs  max=118.34ms p(90)=16.54µs  p(95)=20.06µs  p(99.9)=3.78ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=208.8ms  min=1.96ms  med=208.46ms max=618.01ms p(90)=389.71ms p(95)=419.99ms p(99.9)=541.94ms
     http_reqs......................: 68319   1092.32839/s
     iteration_duration.............: avg=212.26ms min=4.84ms  med=213ms    max=618.22ms p(90)=390.8ms  p(95)=420.87ms p(99.9)=542.51ms
     iterations.....................: 67319   1076.339743/s
     success_rate...................: 100.00% ✓ 67319       ✗ 0    
     vus............................: 83      min=0         max=496
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (rust subgraphs) (2.9.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 99339      ✗ 0    
     data_received..................: 3.0 GB  46 MB/s
     data_sent......................: 41 MB   633 kB/s
     http_req_blocked...............: avg=9.82µs   min=1.21µs  med=3.11µs   max=4.64ms   p(90)=5µs      p(95)=6.15µs   p(99.9)=1.7ms   
     http_req_connecting............: avg=5.57µs   min=0s      med=0s       max=4.59ms   p(90)=0s       p(95)=0s       p(99.9)=1.67ms  
     http_req_duration..............: avg=420.71ms min=3.84ms  med=392.98ms max=1.73s    p(90)=833.1ms  p(95)=901.35ms p(99.9)=1.29s   
       { expected_response:true }...: avg=420.71ms min=3.84ms  med=392.98ms max=1.73s    p(90)=833.1ms  p(95)=901.35ms p(99.9)=1.29s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 34113
     http_req_receiving.............: avg=96.72µs  min=31.11µs med=78.09µs  max=163.31ms p(90)=115.6µs  p(95)=130.45µs p(99.9)=866.42µs
     http_req_sending...............: avg=34.38µs  min=5.95µs  med=13.96µs  max=138.66ms p(90)=22.06µs  p(95)=25.67µs  p(99.9)=3.13ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=420.58ms min=3.71ms  med=392.91ms max=1.73s    p(90)=833ms    p(95)=901.27ms p(99.9)=1.29s   
     http_reqs......................: 34113   526.93346/s
     iteration_duration.............: avg=433.66ms min=18.85ms med=408.2ms  max=1.73s    p(90)=837.03ms p(95)=903.52ms p(99.9)=1.29s   
     iterations.....................: 33113   511.486755/s
     success_rate...................: 100.00% ✓ 33113      ✗ 0    
     vus............................: 93      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (rust subgraphs) (2.9.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 41832      ✗ 0    
     data_received..................: 1.3 GB  19 MB/s
     data_sent......................: 18 MB   262 kB/s
     http_req_blocked...............: avg=16.09µs  min=1.36µs  med=3.88µs   max=25.86ms p(90)=5.86µs   p(95)=7.62µs   p(99.9)=1.96ms  
     http_req_connecting............: avg=10.28µs  min=0s      med=0s       max=25.81ms p(90)=0s       p(95)=0s       p(99.9)=1.86ms  
     http_req_duration..............: avg=942.98ms min=6.45ms  med=804.83ms max=21.99s  p(90)=1.58s    p(95)=1.73s    p(99.9)=20.57s  
       { expected_response:true }...: avg=942.98ms min=6.45ms  med=804.83ms max=21.99s  p(90)=1.58s    p(95)=1.73s    p(99.9)=20.57s  
     http_req_failed................: 0.00%   ✓ 0          ✗ 14944
     http_req_receiving.............: avg=106.02µs min=34.45µs med=100.38µs max=4.48ms  p(90)=139.32µs p(95)=152.77µs p(99.9)=928.49µs
     http_req_sending...............: avg=29.65µs  min=6.52µs  med=18.94µs  max=8.13ms  p(90)=25.25µs  p(95)=30.77µs  p(99.9)=2.92ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=942.84ms min=6.32ms  med=804.71ms max=21.99s  p(90)=1.58s    p(95)=1.73s    p(99.9)=20.57s  
     http_reqs......................: 14944   217.169268/s
     iteration_duration.............: avg=1.01s    min=45.88ms med=890.8ms  max=21.99s  p(90)=1.6s     p(95)=1.75s    p(99.9)=20.74s  
     iterations.....................: 13944   202.637063/s
     success_rate...................: 100.00% ✓ 13944      ✗ 0    
     vus............................: 97      min=0        max=500
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

     checks.........................: 100.00% ✓ 41733      ✗ 0    
     data_received..................: 1.3 GB  18 MB/s
     data_sent......................: 18 MB   246 kB/s
     http_req_blocked...............: avg=17.37µs  min=1.13µs  med=3.43µs   max=28.42ms p(90)=5.19µs   p(95)=6.73µs   p(99.9)=2.54ms 
     http_req_connecting............: avg=11.91µs  min=0s      med=0s       max=28.34ms p(90)=0s       p(95)=0s       p(99.9)=2.41ms 
     http_req_duration..............: avg=491.93ms min=8.43ms  med=561.98ms max=1.46s   p(90)=881.43ms p(95)=936.85ms p(99.9)=1.29s  
       { expected_response:true }...: avg=491.93ms min=8.43ms  med=561.98ms max=1.46s   p(90)=881.43ms p(95)=936.85ms p(99.9)=1.29s  
     http_req_failed................: 0.00%   ✓ 0          ✗ 14911
     http_req_receiving.............: avg=98.94µs  min=31.36µs med=91.56µs  max=20.51ms p(90)=131.78µs p(95)=145.31µs p(99.9)=782.8µs
     http_req_sending...............: avg=26.5µs   min=6.02µs  med=16.84µs  max=7.68ms  p(90)=22.96µs  p(95)=27.5µs   p(99.9)=2.47ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=491.81ms min=8.33ms  med=561.87ms max=1.46s   p(90)=881.28ms p(95)=936.64ms p(99.9)=1.29s  
     http_reqs......................: 14911   200.693675/s
     iteration_duration.............: avg=527.12ms min=9.19ms  med=585.36ms max=1.47s   p(90)=890.33ms p(95)=943.9ms  p(99.9)=1.3s   
     iterations.....................: 13911   187.234238/s
     success_rate...................: 100.00% ✓ 13911      ✗ 0    
     vus............................: 56      min=0        max=495
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.72)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 395001      ✗ 0     
     data_received..................: 12 GB   187 MB/s
     data_sent......................: 159 MB  2.6 MB/s
     http_req_blocked...............: avg=19.78µs  min=1.15µs  med=2.87µs   max=58.92ms  p(90)=4.58µs   p(95)=5.73µs   p(99.9)=1.37ms  
     http_req_connecting............: avg=16.17µs  min=0s      med=0s       max=58.7ms   p(90)=0s       p(95)=0s       p(99.9)=1.32ms  
     http_req_duration..............: avg=107.23ms min=1.68ms  med=101.2ms  max=320.11ms p(90)=206.68ms p(95)=223.29ms p(99.9)=269.96ms
       { expected_response:true }...: avg=107.23ms min=1.68ms  med=101.2ms  max=320.11ms p(90)=206.68ms p(95)=223.29ms p(99.9)=269.96ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 132667
     http_req_receiving.............: avg=164.5µs  min=29.61µs med=63.74µs  max=192.26ms p(90)=170.33µs p(95)=420.16µs p(99.9)=15.65ms 
     http_req_sending...............: avg=73.06µs  min=5.48µs  med=11.36µs  max=246.74ms p(90)=21.08µs  p(95)=143.05µs p(99.9)=9.73ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=106.99ms min=1.62ms  med=100.98ms max=293.25ms p(90)=206.36ms p(95)=222.95ms p(99.9)=269.13ms
     http_reqs......................: 132667  2135.101626/s
     iteration_duration.............: avg=108.33ms min=5.08ms  med=102.44ms max=354.8ms  p(90)=207.24ms p(95)=223.83ms p(99.9)=271.45ms
     iterations.....................: 131667  2119.007935/s
     success_rate...................: 100.00% ✓ 131667      ✗ 0     
     vus............................: 63      min=0         max=497 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (.net subgraphs) (16.2.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 366423      ✗ 0     
     data_received..................: 11 GB   174 MB/s
     data_sent......................: 148 MB  2.4 MB/s
     http_req_blocked...............: avg=21.85µs  min=1.01µs  med=2.87µs   max=80.97ms  p(90)=4.67µs   p(95)=5.94µs   p(99.9)=2.72ms  
     http_req_connecting............: avg=18.17µs  min=0s      med=0s       max=80.77ms  p(90)=0s       p(95)=0s       p(99.9)=2.54ms  
     http_req_duration..............: avg=115.52ms min=1.75ms  med=103.49ms max=744.39ms p(90)=226.95ms p(95)=261.31ms p(99.9)=482.68ms
       { expected_response:true }...: avg=115.52ms min=1.75ms  med=103.49ms max=744.39ms p(90)=226.95ms p(95)=261.31ms p(99.9)=482.68ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 123141
     http_req_receiving.............: avg=2.7ms    min=52.51µs med=139.94µs max=463.96ms p(90)=3.64ms   p(95)=9.83ms   p(99.9)=138.94ms
     http_req_sending...............: avg=79.43µs  min=5.31µs  med=11.01µs  max=108.25ms p(90)=21.74µs  p(95)=129.68µs p(99.9)=11.27ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=112.73ms min=1.67ms  med=101.67ms max=744.29ms p(90)=221.8ms  p(95)=253.61ms p(99.9)=467.94ms
     http_reqs......................: 123141  1981.493411/s
     iteration_duration.............: avg=116.81ms min=2.89ms  med=104.97ms max=744.57ms p(90)=227.83ms p(95)=262.5ms  p(99.9)=483.18ms
     iterations.....................: 122141  1965.402155/s
     success_rate...................: 100.00% ✓ 122141      ✗ 0     
     vus............................: 63      min=0         max=496 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.3.0-p.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 363261      ✗ 0     
     data_received..................: 11 GB   172 MB/s
     data_sent......................: 147 MB  2.4 MB/s
     http_req_blocked...............: avg=24.05µs  min=1.07µs  med=2.78µs   max=94.02ms  p(90)=4.48µs   p(95)=5.68µs   p(99.9)=2.39ms  
     http_req_connecting............: avg=20.54µs  min=0s      med=0s       max=93.86ms  p(90)=0s       p(95)=0s       p(99.9)=2.24ms  
     http_req_duration..............: avg=116.55ms min=1.67ms  med=109.96ms max=482.89ms p(90)=223.06ms p(95)=245.74ms p(99.9)=368.56ms
       { expected_response:true }...: avg=116.55ms min=1.67ms  med=109.96ms max=482.89ms p(90)=223.06ms p(95)=245.74ms p(99.9)=368.56ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 122087
     http_req_receiving.............: avg=1.78ms   min=55.46µs med=314.44µs max=236.86ms p(90)=3.11ms   p(95)=6.05ms   p(99.9)=90.26ms 
     http_req_sending...............: avg=67.17µs  min=5.19µs  med=10.78µs  max=84.49ms  p(90)=20.85µs  p(95)=126.36µs p(99.9)=8.62ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=114.7ms  min=1.59ms  med=108.28ms max=462.35ms p(90)=220.68ms p(95)=242.67ms p(99.9)=361.13ms
     http_reqs......................: 122087  1966.946589/s
     iteration_duration.............: avg=117.81ms min=2.57ms  med=111.46ms max=483.09ms p(90)=223.71ms p(95)=246.49ms p(99.9)=371.55ms
     iterations.....................: 121087  1950.835565/s
     success_rate...................: 100.00% ✓ 121087      ✗ 0     
     vus............................: 61      min=0         max=497 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (.net subgraphs) (0.324.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 189969      ✗ 0    
     data_received..................: 5.6 GB  90 MB/s
     data_sent......................: 77 MB   1.2 MB/s
     http_req_blocked...............: avg=22.42µs  min=1.19µs med=2.82µs   max=81.24ms  p(90)=4.53µs   p(95)=5.49µs   p(99.9)=736.87µs
     http_req_connecting............: avg=18.77µs  min=0s     med=0s       max=81.15ms  p(90)=0s       p(95)=0s       p(99.9)=623.54µs
     http_req_duration..............: avg=221.94ms min=2.17ms med=223.49ms max=613.49ms p(90)=410.45ms p(95)=442.12ms p(99.9)=550.71ms
       { expected_response:true }...: avg=221.94ms min=2.17ms med=223.49ms max=613.49ms p(90)=410.45ms p(95)=442.12ms p(99.9)=550.71ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 64323
     http_req_receiving.............: avg=91.42µs  min=32.3µs med=74µs     max=99.02ms  p(90)=114.34µs p(95)=130.07µs p(99.9)=1.89ms  
     http_req_sending...............: avg=41.55µs  min=5.83µs med=12.24µs  max=114.85ms p(90)=19.13µs  p(95)=22.94µs  p(99.9)=5.43ms  
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=221.81ms min=2.1ms  med=223.36ms max=613.43ms p(90)=410.36ms p(95)=442ms    p(99.9)=550.6ms 
     http_reqs......................: 64323   1025.157306/s
     iteration_duration.............: avg=225.73ms min=5.72ms med=227.8ms  max=613.7ms  p(90)=411.5ms  p(95)=442.95ms p(99.9)=551.61ms
     iterations.....................: 63323   1009.219658/s
     success_rate...................: 100.00% ✓ 63323       ✗ 0    
     vus............................: 91      min=0         max=499
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (.net subgraphs) (2.9.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 91179      ✗ 0    
     data_received..................: 2.7 GB  42 MB/s
     data_sent......................: 38 MB   579 kB/s
     http_req_blocked...............: avg=10.48µs  min=1.2µs   med=3.24µs   max=39.65ms p(90)=5.07µs   p(95)=6.13µs   p(99.9)=1.41ms  
     http_req_connecting............: avg=6.17µs   min=0s      med=0s       max=39.58ms p(90)=0s       p(95)=0s       p(99.9)=1.37ms  
     http_req_duration..............: avg=457.76ms min=4.06ms  med=428.83ms max=1.88s   p(90)=907.37ms p(95)=982.98ms p(99.9)=1.54s   
       { expected_response:true }...: avg=457.76ms min=4.06ms  med=428.83ms max=1.88s   p(90)=907.37ms p(95)=982.98ms p(99.9)=1.54s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 31393
     http_req_receiving.............: avg=90.71µs  min=33.05µs med=81.95µs  max=9.13ms  p(90)=118.32µs p(95)=133.11µs p(99.9)=889.39µs
     http_req_sending...............: avg=25.85µs  min=6.11µs  med=14.48µs  max=8.06ms  p(90)=21.81µs  p(95)=25.4µs   p(99.9)=2.73ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=457.64ms min=4ms     med=428.74ms max=1.88s   p(90)=907.26ms p(95)=982.83ms p(99.9)=1.54s   
     http_reqs......................: 31393   481.958728/s
     iteration_duration.............: avg=473.05ms min=14.13ms med=444.76ms max=1.88s   p(90)=911.37ms p(95)=987.04ms p(99.9)=1.54s   
     iterations.....................: 30393   466.606301/s
     success_rate...................: 100.00% ✓ 30393      ✗ 0    
     vus............................: 64      min=0        max=497
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (.net subgraphs) (2.9.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 42048      ✗ 0    
     data_received..................: 1.3 GB  19 MB/s
     data_sent......................: 18 MB   262 kB/s
     http_req_blocked...............: avg=16.76µs  min=1.27µs  med=3.79µs   max=24.65ms p(90)=5.83µs   p(95)=7.63µs  p(99.9)=2.42ms
     http_req_connecting............: avg=11.17µs  min=0s      med=0s       max=24.58ms p(90)=0s       p(95)=0s      p(99.9)=2.38ms
     http_req_duration..............: avg=971.94ms min=6.88ms  med=866.27ms max=6.2s    p(90)=1.95s    p(95)=2.17s   p(99.9)=5.55s 
       { expected_response:true }...: avg=971.94ms min=6.88ms  med=866.27ms max=6.2s    p(90)=1.95s    p(95)=2.17s   p(99.9)=5.55s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 15016
     http_req_receiving.............: avg=112.67µs min=36.81µs med=101µs    max=38.21ms p(90)=140.34µs p(95)=152.7µs p(99.9)=1.21ms
     http_req_sending...............: avg=36.79µs  min=6.54µs  med=18.68µs  max=47.35ms p(90)=24.82µs  p(95)=30.8µs  p(99.9)=3.59ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s      p(99.9)=0s    
     http_req_waiting...............: avg=971.79ms min=6.75ms  med=865.94ms max=6.2s    p(90)=1.95s    p(95)=2.17s   p(99.9)=5.55s 
     http_reqs......................: 15016   218.292758/s
     iteration_duration.............: avg=1.04s    min=48.82ms med=947.14ms max=6.21s   p(90)=1.97s    p(95)=2.2s    p(99.9)=5.59s 
     iterations.....................: 14016   203.755414/s
     success_rate...................: 100.00% ✓ 14016      ✗ 0    
     vus............................: 101     min=0        max=500
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

     checks.........................: 100.00% ✓ 40311      ✗ 0    
     data_received..................: 1.3 GB  18 MB/s
     data_sent......................: 17 MB   247 kB/s
     http_req_blocked...............: avg=19.28µs  min=1.31µs  med=3.7µs    max=39.13ms  p(90)=5.61µs   p(95)=7.37µs   p(99.9)=2.6ms 
     http_req_connecting............: avg=13.54µs  min=0s      med=0s       max=39.06ms  p(90)=0s       p(95)=0s       p(99.9)=2.52ms
     http_req_duration..............: avg=1s       min=8.82ms  med=931.92ms max=4.16s    p(90)=2.06s    p(95)=2.16s    p(99.9)=3.68s 
       { expected_response:true }...: avg=1s       min=8.82ms  med=931.92ms max=4.16s    p(90)=2.06s    p(95)=2.16s    p(99.9)=3.68s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 14437
     http_req_receiving.............: avg=136.47µs min=40.14µs med=99.46µs  max=187.42ms p(90)=141.08µs p(95)=153.54µs p(99.9)=1.08ms
     http_req_sending...............: avg=31.98µs  min=6.16µs  med=18.61µs  max=57.69ms  p(90)=24.63µs  p(95)=30.09µs  p(99.9)=2.53ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=1s       min=8.71ms  med=931.8ms  max=4.16s    p(90)=2.06s    p(95)=2.16s    p(99.9)=3.68s 
     http_reqs......................: 14437   206.012272/s
     iteration_duration.............: avg=1.08s    min=81.68ms med=1.01s    max=4.17s    p(90)=2.07s    p(95)=2.18s    p(99.9)=3.7s  
     iterations.....................: 13437   191.742529/s
     success_rate...................: 100.00% ✓ 13437      ✗ 0    
     vus............................: 62      min=0        max=499
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-181-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

