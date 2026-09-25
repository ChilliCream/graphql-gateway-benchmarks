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
| hive-router | v0.0.84 | 2,880 | 3,021 | 2,863 | 1.9% |  |
| fusion-nightly-net11 | 16.7.0-p.10 | 2,582 | 2,679 | 2,561 | 1.5% |  |
| fusion | 16.6.6 | 2,546 | 2,638 | 2,531 | 1.6% |  |
| fusion-nightly | 16.7.0-p.10 | 2,446 | 2,553 | 2,422 | 1.9% |  |
| cosmo | 0.334.0 | 1,194 | 1,238 | 1,187 | 1.6% |  |
| hive-gateway-router-runtime | 2.10.8 | 563 | 577 | 560 | 1.0% |  |
| hive-gateway | 2.10.8 | 248 | 257 | 247 | 1.3% |  |
| apollo-gateway | — | — | — | — | — | benchmark run failed |
| apollo-router | v2.16.1 | — | — | — | — | non-compatible response (7968 across 9/9 runs) |
| feddi | — | — | — | — | — | not run |
| fusion-nightly-fed | — | — | — | — | — | benchmark run failed |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (537736 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| fusion-nightly-net11 | 16.7.0-p.10 | 2,461 | 2,553 | 2,452 | 1.4% |  |
| fusion | 16.6.6 | 2,328 | 2,423 | 2,316 | 1.6% |  |
| hive-router | v0.0.84 | 2,165 | 2,334 | 2,145 | 3.0% |  |
| fusion-nightly-fed | 16.7.0-p.10 | 2,128 | 2,228 | 2,122 | 1.7% |  |
| cosmo | 0.334.0 | 1,159 | 1,194 | 1,152 | 1.2% |  |
| hive-gateway-router-runtime | 2.10.8 | 528 | 545 | 526 | 1.2% |  |
| hive-gateway | 2.10.8 | 243 | 250 | 241 | 1.1% |  |
| apollo-gateway | 2.14.3 | 232 | 237 | 231 | 0.8% |  |
| apollo-router | v2.16.1 | — | — | — | — | non-compatible response (31907 across 9/9 runs) |
| feddi | — | — | — | — | — | not run |
| fusion-nightly | — | — | — | — | — | benchmark run failed |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (260923 across 9/9 runs) |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.84)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 529491      ✗ 0     
     data_received..................: 16 GB   253 MB/s
     data_sent......................: 213 MB  3.5 MB/s
     http_req_blocked...............: avg=18.86µs  min=912ns   med=2.15µs  max=66.38ms  p(90)=3.7µs    p(95)=4.86µs   p(99.9)=1.94ms  
     http_req_connecting............: avg=15.75µs  min=0s      med=0s      max=49.73ms  p(90)=0s       p(95)=0s       p(99.9)=1.84ms  
     http_req_duration..............: avg=80.04ms  min=1.36ms  med=75.33ms max=315.8ms  p(90)=153.4ms  p(95)=167.78ms p(99.9)=224.86ms
       { expected_response:true }...: avg=80.04ms  min=1.36ms  med=75.33ms max=315.8ms  p(90)=153.4ms  p(95)=167.78ms p(99.9)=224.86ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 177497
     http_req_receiving.............: avg=140.09µs min=25.15µs med=49.66µs max=92.48ms  p(90)=137.4µs  p(95)=324.52µs p(99.9)=16.66ms 
     http_req_sending...............: avg=65.38µs  min=4.51µs  med=8.97µs  max=110.22ms p(90)=17.42µs  p(95)=113.15µs p(99.9)=8.58ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=79.83ms  min=1.31ms  med=75.15ms max=311.84ms p(90)=153.13ms p(95)=167.44ms p(99.9)=223.79ms
     http_reqs......................: 177497  2880.975556/s
     iteration_duration.............: avg=80.76ms  min=2.29ms  med=76.11ms max=365.77ms p(90)=153.84ms p(95)=168.22ms p(99.9)=228.16ms
     iterations.....................: 176497  2864.744433/s
     success_rate...................: 100.00% ✓ 176497      ✗ 0     
     vus............................: 85      min=0         max=492 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (rust subgraphs) (16.7.0-p.10)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 478311      ✗ 0     
     data_received..................: 14 GB   226 MB/s
     data_sent......................: 193 MB  3.1 MB/s
     http_req_blocked...............: avg=17.87µs min=901ns   med=2.14µs   max=61.28ms  p(90)=3.71µs   p(95)=4.83µs   p(99.9)=1.97ms  
     http_req_connecting............: avg=14.76µs min=0s      med=0s       max=61.22ms  p(90)=0s       p(95)=0s       p(99.9)=1.87ms  
     http_req_duration..............: avg=88.61ms min=1.87ms  med=84.18ms  max=329.56ms p(90)=169.13ms p(95)=186.57ms p(99.9)=253.98ms
       { expected_response:true }...: avg=88.61ms min=1.87ms  med=84.18ms  max=329.56ms p(90)=169.13ms p(95)=186.57ms p(99.9)=253.98ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 160437
     http_req_receiving.............: avg=1.41ms  min=52.26µs med=166.39µs max=210.13ms p(90)=3.45ms   p(95)=5.19ms   p(99.9)=34.27ms 
     http_req_sending...............: avg=65.65µs min=4.56µs  med=8.99µs   max=70.44ms  p(90)=19.56µs  p(95)=108.41µs p(99.9)=9.25ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=87.13ms min=1.8ms   med=82.52ms  max=328.38ms p(90)=167.43ms p(95)=184.7ms  p(99.9)=250.73ms
     http_reqs......................: 160437  2582.666748/s
     iteration_duration.............: avg=89.43ms min=3.4ms   med=85.06ms  max=353.04ms p(90)=169.58ms p(95)=187.07ms p(99.9)=254.98ms
     iterations.....................: 159437  2566.569048/s
     success_rate...................: 100.00% ✓ 159437      ✗ 0     
     vus............................: 61      min=0         max=497 
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

     checks.........................: 100.00% ✓ 473508      ✗ 0     
     data_received..................: 14 GB   223 MB/s
     data_sent......................: 191 MB  3.1 MB/s
     http_req_blocked...............: avg=16.42µs min=811ns   med=2.07µs  max=79.06ms  p(90)=3.5µs    p(95)=4.57µs   p(99.9)=1.89ms  
     http_req_connecting............: avg=13.43µs min=0s      med=0s      max=78.96ms  p(90)=0s       p(95)=0s       p(99.9)=1.82ms  
     http_req_duration..............: avg=89.55ms min=1.95ms  med=78.44ms max=954.25ms p(90)=170.36ms p(95)=193.32ms p(99.9)=563.6ms 
       { expected_response:true }...: avg=89.55ms min=1.95ms  med=78.44ms max=954.25ms p(90)=170.36ms p(95)=193.32ms p(99.9)=563.6ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 158836
     http_req_receiving.............: avg=1.2ms   min=50.92µs med=94.42µs max=527.7ms  p(90)=1.49ms   p(95)=3.95ms   p(99.9)=67.32ms 
     http_req_sending...............: avg=63.48µs min=4.5µs   med=8.74µs  max=81.11ms  p(90)=16.84µs  p(95)=101.26µs p(99.9)=9.12ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=88.28ms min=1.84ms  med=77.13ms max=954.17ms p(90)=168.92ms p(95)=191.36ms p(99.9)=543.81ms
     http_reqs......................: 158836  2546.627708/s
     iteration_duration.............: avg=90.36ms min=3.13ms  med=79.46ms max=954.44ms p(90)=170.86ms p(95)=193.82ms p(99.9)=564.55ms
     iterations.....................: 157836  2530.594644/s
     success_rate...................: 100.00% ✓ 157836      ✗ 0     
     vus............................: 74      min=0         max=494 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (rust subgraphs) (16.7.0-p.10)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 455076      ✗ 0     
     data_received..................: 13 GB   214 MB/s
     data_sent......................: 183 MB  2.9 MB/s
     http_req_blocked...............: avg=15.79µs min=882ns   med=2.08µs  max=57.27ms  p(90)=3.41µs   p(95)=4.45µs   p(99.9)=1.54ms  
     http_req_connecting............: avg=13.12µs min=0s      med=0s      max=57.15ms  p(90)=0s       p(95)=0s       p(99.9)=1.45ms  
     http_req_duration..............: avg=93.13ms min=1.96ms  med=82.18ms max=1.56s    p(90)=177.36ms p(95)=206.03ms p(99.9)=696.06ms
       { expected_response:true }...: avg=93.13ms min=1.96ms  med=82.18ms max=1.56s    p(90)=177.36ms p(95)=206.03ms p(99.9)=696.06ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 152692
     http_req_receiving.............: avg=1.38ms  min=53.19µs med=99.45µs max=698.46ms p(90)=1.72ms   p(95)=4.52ms   p(99.9)=92.38ms 
     http_req_sending...............: avg=62.11µs min=4.32µs  med=8.68µs  max=169.08ms p(90)=15.36µs  p(95)=96.91µs  p(99.9)=8.42ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=91.69ms min=1.88ms  med=81.09ms max=1.56s    p(90)=175.51ms p(95)=202.78ms p(99.9)=673.03ms
     http_reqs......................: 152692  2446.297581/s
     iteration_duration.............: avg=94.03ms min=3.51ms  med=83.18ms max=1.56s    p(90)=178.02ms p(95)=206.65ms p(99.9)=697.07ms
     iterations.....................: 151692  2430.276456/s
     success_rate...................: 100.00% ✓ 151692      ✗ 0     
     vus............................: 77      min=0         max=494 
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

     checks.........................: 100.00% ✓ 220899      ✗ 0    
     data_received..................: 6.5 GB  105 MB/s
     data_sent......................: 90 MB   1.4 MB/s
     http_req_blocked...............: avg=5.37µs   min=992ns   med=2.03µs   max=11.42ms  p(90)=3.48µs   p(95)=4.37µs   p(99.9)=366.94µs
     http_req_connecting............: avg=2.56µs   min=0s      med=0s       max=11.39ms  p(90)=0s       p(95)=0s       p(99.9)=251.87µs
     http_req_duration..............: avg=191.24ms min=1.95ms  med=191.3ms  max=540.84ms p(90)=354.78ms p(95)=381.08ms p(99.9)=471.16ms
       { expected_response:true }...: avg=191.24ms min=1.95ms  med=191.3ms  max=540.84ms p(90)=354.78ms p(95)=381.08ms p(99.9)=471.16ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 74633
     http_req_receiving.............: avg=69.42µs  min=28.41µs med=56.8µs   max=191.51ms p(90)=91.19µs  p(95)=105.06µs p(99.9)=716.62µs
     http_req_sending...............: avg=27.95µs  min=4.7µs   med=9.52µs   max=132.35ms p(90)=14.96µs  p(95)=18.75µs  p(99.9)=3.36ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=191.14ms min=1.89ms  med=191.19ms max=540.78ms p(90)=354.65ms p(95)=380.94ms p(99.9)=471.09ms
     http_reqs......................: 74633   1194.393194/s
     iteration_duration.............: avg=194.06ms min=5.27ms  med=194.42ms max=541ms    p(90)=355.6ms  p(95)=381.65ms p(99.9)=471.6ms 
     iterations.....................: 73633   1178.38964/s
     success_rate...................: 100.00% ✓ 73633       ✗ 0    
     vus............................: 80      min=0         max=493
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

     checks.........................: 100.00% ✓ 105642     ✗ 0    
     data_received..................: 3.2 GB  50 MB/s
     data_sent......................: 44 MB   677 kB/s
     http_req_blocked...............: avg=7.38µs   min=1.24µs med=3.11µs   max=12.52ms  p(90)=4.87µs   p(95)=5.97µs   p(99.9)=693.07µs
     http_req_connecting............: avg=3.31µs   min=0s     med=0s       max=12.45ms  p(90)=0s       p(95)=0s       p(99.9)=662.07µs
     http_req_duration..............: avg=396.19ms min=3.57ms med=371.96ms max=1.51s    p(90)=775.68ms p(95)=845.54ms p(99.9)=1.21s   
       { expected_response:true }...: avg=396.19ms min=3.57ms med=371.96ms max=1.51s    p(90)=775.68ms p(95)=845.54ms p(99.9)=1.21s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 36214
     http_req_receiving.............: avg=89.03µs  min=30.8µs med=69.7µs   max=162.41ms p(90)=109.15µs p(95)=123.63µs p(99.9)=997.24µs
     http_req_sending...............: avg=32.21µs  min=5.34µs med=13.83µs  max=128.21ms p(90)=21.47µs  p(95)=24.58µs  p(99.9)=2.13ms  
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=396.07ms min=3.48ms med=371.88ms max=1.51s    p(90)=775.6ms  p(95)=845.44ms p(99.9)=1.21s   
     http_reqs......................: 36214   563.747404/s
     iteration_duration.............: avg=407.67ms min=20ms   med=385.71ms max=1.51s    p(90)=778.52ms p(95)=848.33ms p(99.9)=1.22s   
     iterations.....................: 35214   548.180292/s
     success_rate...................: 100.00% ✓ 35214      ✗ 0    
     vus............................: 69      min=0        max=496
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

     checks.........................: 100.00% ✓ 47390      ✗ 0    
     data_received..................: 1.5 GB  22 MB/s
     data_sent......................: 20 MB   299 kB/s
     http_req_blocked...............: avg=13.4µs   min=1.05µs  med=3.16µs   max=7.04ms  p(90)=4.81µs   p(95)=6.31µs   p(99.9)=2.04ms
     http_req_connecting............: avg=8.72µs   min=0s      med=0s       max=6.92ms  p(90)=0s       p(95)=0s       p(99.9)=2.02ms
     http_req_duration..............: avg=855.51ms min=5.83ms  med=761.27ms max=17.81s  p(90)=1.53s    p(95)=1.72s    p(99.9)=14.38s
       { expected_response:true }...: avg=855.51ms min=5.83ms  med=761.27ms max=17.81s  p(90)=1.53s    p(95)=1.72s    p(99.9)=14.38s
     http_req_failed................: 0.00%   ✓ 0          ✗ 16797
     http_req_receiving.............: avg=95.25µs  min=32.58µs med=86.2µs   max=42.34ms p(90)=121.11µs p(95)=134.07µs p(99.9)=1.27ms
     http_req_sending...............: avg=28.95µs  min=5.49µs  med=16.6µs   max=27.81ms p(90)=21.83µs  p(95)=26.22µs  p(99.9)=2.74ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=855.38ms min=5.72ms  med=761.18ms max=17.81s  p(90)=1.53s    p(95)=1.72s    p(99.9)=14.38s
     http_reqs......................: 16797   248.640814/s
     iteration_duration.............: avg=908.65ms min=58.95ms med=822.02ms max=17.81s  p(90)=1.54s    p(95)=1.73s    p(99.9)=14.38s
     iterations.....................: 15796   233.823319/s
     success_rate...................: 100.00% ✓ 15796      ✗ 0    
     vus............................: 84      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (.net subgraphs) (16.7.0-p.10)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 453114      ✗ 0     
     data_received..................: 13 GB   216 MB/s
     data_sent......................: 183 MB  3.0 MB/s
     http_req_blocked...............: avg=20.13µs min=881ns   med=2.39µs   max=55.65ms  p(90)=4.36µs   p(95)=5.59µs   p(99.9)=2.16ms  
     http_req_connecting............: avg=17.02µs min=0s      med=0s       max=55.42ms  p(90)=0s       p(95)=0s       p(99.9)=2.1ms   
     http_req_duration..............: avg=93.52ms min=1.43ms  med=88.59ms  max=404.31ms p(90)=179.95ms p(95)=197.14ms p(99.9)=293.19ms
       { expected_response:true }...: avg=93.52ms min=1.43ms  med=88.59ms  max=404.31ms p(90)=179.95ms p(95)=197.14ms p(99.9)=293.19ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 152038
     http_req_receiving.............: avg=1.45ms  min=54.23µs med=138.19µs max=284.08ms p(90)=3.31ms   p(95)=5.24ms   p(99.9)=47.98ms 
     http_req_sending...............: avg=68.87µs min=4.85µs  med=9.53µs   max=135.71ms p(90)=21.61µs  p(95)=112.48µs p(99.9)=9.01ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=92ms    min=1.36ms  med=87.07ms  max=404.22ms p(90)=178.34ms p(95)=195.22ms p(99.9)=280.38ms
     http_reqs......................: 152038  2461.109369/s
     iteration_duration.............: avg=94.41ms min=4.2ms   med=89.7ms   max=404.46ms p(90)=180.38ms p(95)=197.61ms p(99.9)=294.11ms
     iterations.....................: 151038  2444.921907/s
     success_rate...................: 100.00% ✓ 151038      ✗ 0     
     vus............................: 92      min=0         max=500 
     vus_max........................: 500     min=500       max=500
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

     checks.........................: 100.00% ✓ 429294      ✗ 0     
     data_received..................: 13 GB   204 MB/s
     data_sent......................: 173 MB  2.8 MB/s
     http_req_blocked...............: avg=31.06µs min=1.05µs  med=2.85µs   max=71.43ms  p(90)=4.64µs   p(95)=5.8µs    p(99.9)=3.11ms  
     http_req_connecting............: avg=27.45µs min=0s      med=0s       max=71.3ms   p(90)=0s       p(95)=0s       p(99.9)=3.05ms  
     http_req_duration..............: avg=98.67ms min=1.48ms  med=85.33ms  max=1.22s    p(90)=188.02ms p(95)=219.59ms p(99.9)=647.18ms
       { expected_response:true }...: avg=98.67ms min=1.48ms  med=85.33ms  max=1.22s    p(90)=188.02ms p(95)=219.59ms p(99.9)=647.18ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 144098
     http_req_receiving.............: avg=1.57ms  min=53.13µs med=110.85µs max=548.18ms p(90)=1.76ms   p(95)=4.69ms   p(99.9)=114.01ms
     http_req_sending...............: avg=72.25µs min=4.79µs  med=10.49µs  max=64.9ms   p(90)=20.14µs  p(95)=119.81µs p(99.9)=9.87ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=97.03ms min=1.4ms   med=84.07ms  max=1.18s    p(90)=186.02ms p(95)=215.65ms p(99.9)=632.88ms
     http_reqs......................: 144098  2328.386728/s
     iteration_duration.............: avg=99.67ms min=2.75ms  med=86.49ms  max=1.22s    p(90)=188.7ms  p(95)=220.47ms p(99.9)=647.9ms 
     iterations.....................: 143098  2312.228372/s
     success_rate...................: 100.00% ✓ 143098      ✗ 0     
     vus............................: 54      min=0         max=499 
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

     checks.........................: 100.00% ✓ 400593      ✗ 0     
     data_received..................: 12 GB   189 MB/s
     data_sent......................: 162 MB  2.6 MB/s
     http_req_blocked...............: avg=14.58µs  min=1.01µs  med=2.96µs   max=55.61ms  p(90)=4.75µs   p(95)=5.99µs   p(99.9)=1.41ms  
     http_req_connecting............: avg=10.92µs  min=0s      med=0s       max=55.43ms  p(90)=0s       p(95)=0s       p(99.9)=1.35ms  
     http_req_duration..............: avg=105.77ms min=1.65ms  med=100.22ms max=341.93ms p(90)=205.18ms p(95)=221.46ms p(99.9)=261.91ms
       { expected_response:true }...: avg=105.77ms min=1.65ms  med=100.22ms max=341.93ms p(90)=205.18ms p(95)=221.46ms p(99.9)=261.91ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 134531
     http_req_receiving.............: avg=121.84µs min=26.64µs med=59.09µs  max=185.56ms p(90)=130.61µs p(95)=355.03µs p(99.9)=8.66ms  
     http_req_sending...............: avg=68.12µs  min=5.09µs  med=11.85µs  max=166.65ms p(90)=21.59µs  p(95)=130.51µs p(99.9)=8.15ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=105.58ms min=1.61ms  med=99.99ms  max=333.32ms p(90)=204.97ms p(95)=221.23ms p(99.9)=261.36ms
     http_reqs......................: 134531  2165.817265/s
     iteration_duration.............: avg=106.82ms min=3.83ms  med=101.44ms max=351.8ms  p(90)=205.66ms p(95)=221.92ms p(99.9)=263.38ms
     iterations.....................: 133531  2149.718245/s
     success_rate...................: 100.00% ✓ 133531      ✗ 0     
     vus............................: 62      min=0         max=497 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (.net subgraphs) (16.7.0-p.10)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 394332      ✗ 0     
     data_received..................: 12 GB   187 MB/s
     data_sent......................: 159 MB  2.6 MB/s
     http_req_blocked...............: avg=12.78µs  min=902ns   med=2.34µs   max=67.64ms  p(90)=4.16µs   p(95)=5.29µs   p(99.9)=1.33ms  
     http_req_connecting............: avg=9.68µs   min=0s      med=0s       max=67.55ms  p(90)=0s       p(95)=0s       p(99.9)=1.24ms  
     http_req_duration..............: avg=107.54ms min=1.76ms  med=95.5ms   max=1.7s     p(90)=202.62ms p(95)=236.07ms p(99.9)=680.52ms
       { expected_response:true }...: avg=107.54ms min=1.76ms  med=95.5ms   max=1.7s     p(90)=202.62ms p(95)=236.07ms p(99.9)=680.52ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 132444
     http_req_receiving.............: avg=1.69ms   min=53.42µs med=115.56µs max=914.71ms p(90)=2.07ms   p(95)=5.54ms   p(99.9)=90.35ms 
     http_req_sending...............: avg=53.41µs  min=4.6µs   med=9.87µs   max=72.34ms  p(90)=20.83µs  p(95)=96.94µs  p(99.9)=7.29ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=105.79ms min=1.68ms  med=93.99ms  max=1.7s     p(90)=200.49ms p(95)=232.02ms p(99.9)=672.36ms
     http_reqs......................: 132444  2128.30271/s
     iteration_duration.............: avg=108.6ms  min=3.03ms  med=96.83ms  max=1.7s     p(90)=203.28ms p(95)=236.82ms p(99.9)=682.73ms
     iterations.....................: 131444  2112.233257/s
     success_rate...................: 100.00% ✓ 131444      ✗ 0     
     vus............................: 69      min=0         max=496 
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

     checks.........................: 100.00% ✓ 214713      ✗ 0    
     data_received..................: 6.3 GB  101 MB/s
     data_sent......................: 87 MB   1.4 MB/s
     http_req_blocked...............: avg=5.61µs   min=952ns   med=2.68µs   max=11.96ms  p(90)=4.54µs   p(95)=5.49µs   p(99.9)=354.86µs
     http_req_connecting............: avg=2.07µs   min=0s      med=0s       max=11.72ms  p(90)=0s       p(95)=0s       p(99.9)=284.17µs
     http_req_duration..............: avg=196.61ms min=1.87ms  med=201.29ms max=600.18ms p(90)=359.53ms p(95)=383.95ms p(99.9)=498.91ms
       { expected_response:true }...: avg=196.61ms min=1.87ms  med=201.29ms max=600.18ms p(90)=359.53ms p(95)=383.95ms p(99.9)=498.91ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 72571
     http_req_receiving.............: avg=78.63µs  min=27.43µs med=63.07µs  max=84.54ms  p(90)=104.11µs p(95)=120.73µs p(99.9)=1.34ms  
     http_req_sending...............: avg=30.25µs  min=4.97µs  med=12.07µs  max=93.89ms  p(90)=19.62µs  p(95)=23.58µs  p(99.9)=3.37ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=196.5ms  min=1.79ms  med=201.15ms max=600.03ms p(90)=359.41ms p(95)=383.87ms p(99.9)=498.84ms
     http_reqs......................: 72571   1159.191906/s
     iteration_duration.............: avg=199.6ms  min=4.26ms  med=204.25ms max=600.44ms p(90)=360.41ms p(95)=384.56ms p(99.9)=500.93ms
     iterations.....................: 71571   1143.218694/s
     success_rate...................: 100.00% ✓ 71571       ✗ 0    
     vus............................: 84      min=0         max=497
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

     checks.........................: 100.00% ✓ 99552      ✗ 0    
     data_received..................: 3.0 GB  46 MB/s
     data_sent......................: 41 MB   635 kB/s
     http_req_blocked...............: avg=9.43µs   min=1.25µs  med=3.32µs   max=12.62ms  p(90)=5.07µs   p(95)=6.13µs   p(99.9)=1.37ms
     http_req_connecting............: avg=5.04µs   min=0s      med=0s       max=12.55ms  p(90)=0s       p(95)=0s       p(99.9)=1.34ms
     http_req_duration..............: avg=419.86ms min=3.86ms  med=390.79ms max=1.94s    p(90)=835.69ms p(95)=904.86ms p(99.9)=1.32s 
       { expected_response:true }...: avg=419.86ms min=3.86ms  med=390.79ms max=1.94s    p(90)=835.69ms p(95)=904.86ms p(99.9)=1.32s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 34184
     http_req_receiving.............: avg=89.78µs  min=31.96µs med=77.47µs  max=24.62ms  p(90)=115.28µs p(95)=129.99µs p(99.9)=1.33ms
     http_req_sending...............: avg=27.22µs  min=5.57µs  med=15.1µs   max=105.16ms p(90)=22.21µs  p(95)=25.31µs  p(99.9)=2ms   
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=419.75ms min=3.78ms  med=390.7ms  max=1.94s    p(90)=835.62ms p(95)=904.76ms p(99.9)=1.32s 
     http_reqs......................: 34184   528.799691/s
     iteration_duration.............: avg=432.76ms min=13.4ms  med=405.38ms max=1.95s    p(90)=839.38ms p(95)=907.57ms p(99.9)=1.33s 
     iterations.....................: 33184   513.330475/s
     success_rate...................: 100.00% ✓ 33184      ✗ 0    
     vus............................: 87      min=0        max=500
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

     checks.........................: 100.00% ✓ 46329      ✗ 0    
     data_received..................: 1.4 GB  21 MB/s
     data_sent......................: 20 MB   292 kB/s
     http_req_blocked...............: avg=15.05µs  min=1.41µs  med=3.75µs   max=8.28ms  p(90)=5.57µs   p(95)=7.2µs    p(99.9)=2.19ms
     http_req_connecting............: avg=9.44µs   min=0s      med=0s       max=8.21ms  p(90)=0s       p(95)=0s       p(99.9)=2.17ms
     http_req_duration..............: avg=885.19ms min=5.71ms  med=780.85ms max=4.9s    p(90)=1.79s    p(95)=1.99s    p(99.9)=4.15s 
       { expected_response:true }...: avg=885.19ms min=5.71ms  med=780.85ms max=4.9s    p(90)=1.79s    p(95)=1.99s    p(99.9)=4.15s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 16443
     http_req_receiving.............: avg=103.64µs min=36.73µs med=94.58µs  max=13.68ms p(90)=135.25µs p(95)=152.08µs p(99.9)=1.24ms
     http_req_sending...............: avg=44.54µs  min=6.78µs  med=18.29µs  max=120ms   p(90)=24.12µs  p(95)=29.08µs  p(99.9)=2.93ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=885.04ms min=5.57ms  med=780.74ms max=4.9s    p(90)=1.79s    p(95)=1.99s    p(99.9)=4.15s 
     http_reqs......................: 16443   243.265781/s
     iteration_duration.............: avg=942.61ms min=20.22ms med=843.86ms max=4.9s    p(90)=1.81s    p(95)=2.01s    p(99.9)=4.18s 
     iterations.....................: 15443   228.471292/s
     success_rate...................: 100.00% ✓ 15443      ✗ 0    
     vus............................: 78      min=0        max=500
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

     checks.........................: 100.00% ✓ 45006      ✗ 0    
     data_received..................: 1.4 GB  20 MB/s
     data_sent......................: 19 MB   279 kB/s
     http_req_blocked...............: avg=21.74µs  min=1.07µs  med=3.37µs   max=9.59ms  p(90)=5.11µs   p(95)=6.53µs   p(99.9)=5.12ms
     http_req_connecting............: avg=16.28µs  min=0s      med=0s       max=9.52ms  p(90)=0s       p(95)=0s       p(99.9)=5.07ms
     http_req_duration..............: avg=907.05ms min=7.81ms  med=820.01ms max=3.3s    p(90)=1.83s    p(95)=1.95s    p(99.9)=2.84s 
       { expected_response:true }...: avg=907.05ms min=7.81ms  med=820.01ms max=3.3s    p(90)=1.83s    p(95)=1.95s    p(99.9)=2.84s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 16002
     http_req_receiving.............: avg=98.33µs  min=32.73µs med=86.74µs  max=30.44ms p(90)=125.94µs p(95)=142.37µs p(99.9)=1.09ms
     http_req_sending...............: avg=29.79µs  min=5.2µs   med=17.27µs  max=26.87ms p(90)=23.13µs  p(95)=27.99µs  p(99.9)=2.66ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=906.92ms min=7.72ms  med=819.91ms max=3.3s    p(90)=1.83s    p(95)=1.95s    p(99.9)=2.84s 
     http_reqs......................: 16002   232.654841/s
     iteration_duration.............: avg=967.44ms min=32.81ms med=898.15ms max=3.31s   p(90)=1.85s    p(95)=1.96s    p(99.9)=2.86s 
     iterations.....................: 15002   218.115731/s
     success_rate...................: 100.00% ✓ 15002      ✗ 0    
     vus............................: 96      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

