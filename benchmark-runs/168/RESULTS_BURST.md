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
| hive-router | v0.0.49 | 2,670 | 2,794 | 2,633 | 2.1% |  |
| hotchocolate | 16.1.0-p.1.9 | 2,049 | 2,097 | 2,032 | 1.0% |  |
| cosmo | 0.307.0 | 1,175 | 1,175 | 1,171 | 0.2% | non-compatible response (13 across 7/9 runs) |
| hive-gateway-router-runtime | 2.5.25 | 493 | 495 | 491 | 0.3% |  |
| hive-gateway | 2.5.25 | 237 | 240 | 235 | 0.7% |  |
| apollo-gateway | 2.13.3 | 202 | 208 | 201 | 1.0% |  |
| apollo-router | v2.13.1 | — | — | — | — | non-compatible response (31422 across 9/9 runs) |
| grafbase | 0.53.3 | — | — | — | — | non-compatible response (481803 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.49 | 2,214 | 2,318 | 2,170 | 2.2% |  |
| hotchocolate | 16.1.0-p.1.9 | 1,923 | 1,956 | 1,906 | 0.9% |  |
| cosmo | 0.307.0 | 1,114 | 1,130 | 1,108 | 0.8% | non-compatible response (8 across 4/9 runs) |
| hive-gateway-router-runtime | 2.5.25 | 471 | 478 | 467 | 0.9% |  |
| hive-gateway | 2.5.25 | 225 | 229 | 223 | 0.8% |  |
| apollo-gateway | 2.13.3 | 205 | 208 | 202 | 0.9% |  |
| apollo-router | — | — | — | — | — | benchmark run failed |
| grafbase | 0.53.3 | — | — | — | — | non-compatible response (278159 across 9/9 runs) |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.49)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 492864      ✗ 0     
     data_received..................: 15 GB   234 MB/s
     data_sent......................: 199 MB  3.2 MB/s
     http_req_blocked...............: avg=29.54µs  min=1.09µs  med=2.69µs  max=72.54ms  p(90)=4.28µs   p(95)=5.41µs   p(99.9)=5.68ms  
     http_req_connecting............: avg=26.05µs  min=0s      med=0s      max=72.35ms  p(90)=0s       p(95)=0s       p(99.9)=5.57ms  
     http_req_duration..............: avg=85.92ms  min=1.62ms  med=80.17ms max=277.15ms p(90)=167.94ms p(95)=184.42ms p(99.9)=236.97ms
       { expected_response:true }...: avg=85.92ms  min=1.62ms  med=80.17ms max=277.15ms p(90)=167.94ms p(95)=184.42ms p(99.9)=236.97ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 165288
     http_req_receiving.............: avg=330.53µs min=28.24µs med=58.97µs max=132.21ms p(90)=250.65µs p(95)=433.32µs p(99.9)=34.12ms 
     http_req_sending...............: avg=91.62µs  min=5.34µs  med=10.45µs max=110.05ms p(90)=19.6µs   p(95)=138.99µs p(99.9)=13.67ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=85.49ms  min=1.56ms  med=79.89ms max=270.44ms p(90)=167.27ms p(95)=183.59ms p(99.9)=232.31ms
     http_reqs......................: 165288  2670.736654/s
     iteration_duration.............: avg=86.77ms  min=2.1ms   med=81.14ms max=391.11ms p(90)=168.47ms p(95)=185.04ms p(99.9)=240.08ms
     iterations.....................: 164288  2654.578574/s
     success_rate...................: 100.00% ✓ 164288      ✗ 0     
     vus............................: 51      min=0         max=499 
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

     checks.........................: 100.00% ✓ 382905      ✗ 0     
     data_received..................: 11 GB   180 MB/s
     data_sent......................: 155 MB  2.5 MB/s
     http_req_blocked...............: avg=17.95µs  min=1.07µs  med=2.59µs   max=74.3ms   p(90)=3.99µs   p(95)=4.93µs   p(99.9)=1.74ms  
     http_req_connecting............: avg=14.77µs  min=0s      med=0s       max=74.1ms   p(90)=0s       p(95)=0s       p(99.9)=1.7ms   
     http_req_duration..............: avg=110.63ms min=2.4ms   med=102.65ms max=631.9ms  p(90)=214.42ms p(95)=250.91ms p(99.9)=428.97ms
       { expected_response:true }...: avg=110.63ms min=2.4ms   med=102.65ms max=631.9ms  p(90)=214.42ms p(95)=250.91ms p(99.9)=428.97ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 128635
     http_req_receiving.............: avg=2.09ms   min=53.58µs med=118.74µs max=321.67ms p(90)=1.74ms   p(95)=6.33ms   p(99.9)=131.51ms
     http_req_sending...............: avg=66.28µs  min=5.49µs  med=10.19µs  max=179.41ms p(90)=18.03µs  p(95)=123.47µs p(99.9)=8.93ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=108.47ms min=2.29ms  med=101.22ms max=595.99ms p(90)=211.17ms p(95)=243.93ms p(99.9)=404.6ms 
     http_reqs......................: 128635  2049.092448/s
     iteration_duration.............: avg=111.79ms min=3.63ms  med=104ms    max=632.16ms p(90)=215.09ms p(95)=251.85ms p(99.9)=429.82ms
     iterations.....................: 127635  2033.162938/s
     success_rate...................: 100.00% ✓ 127635      ✗ 0     
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

     checks.........................: 100.00% ✓ 217326      ✗ 0    
     data_received..................: 6.4 GB  103 MB/s
     data_sent......................: 88 MB   1.4 MB/s
     http_req_blocked...............: avg=7.33µs   min=1.13µs  med=2.55µs   max=18.08ms  p(90)=4.01µs   p(95)=4.82µs   p(99.9)=629.71µs
     http_req_connecting............: avg=4.07µs   min=0s      med=0s       max=18.03ms  p(90)=0s       p(95)=0s       p(99.9)=574.36µs
     http_req_duration..............: avg=194.3ms  min=2.07ms  med=193.95ms max=666.24ms p(90)=358.61ms p(95)=385.78ms p(99.9)=518.82ms
       { expected_response:true }...: avg=194.3ms  min=2.07ms  med=193.95ms max=666.24ms p(90)=358.61ms p(95)=385.78ms p(99.9)=518.82ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 73442
     http_req_receiving.............: avg=84.24µs  min=30.36µs med=60.95µs  max=72.39ms  p(90)=93.59µs  p(95)=106.6µs  p(99.9)=2.07ms  
     http_req_sending...............: avg=33.95µs  min=5.52µs  med=10.84µs  max=189.72ms p(90)=16.51µs  p(95)=20µs     p(99.9)=3.57ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=194.18ms min=2.02ms  med=193.8ms  max=666.18ms p(90)=358.52ms p(95)=385.69ms p(99.9)=518.75ms
     http_reqs......................: 73442   1175.731552/s
     iteration_duration.............: avg=197.22ms min=4.64ms  med=197.34ms max=666.4ms  p(90)=359.49ms p(95)=386.52ms p(99.9)=519.96ms
     iterations.....................: 72442   1159.722571/s
     success_rate...................: 100.00% ✓ 72442       ✗ 0    
     vus............................: 80      min=0         max=493
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

     checks.........................: 100.00% ✓ 93051      ✗ 0    
     data_received..................: 2.8 GB  43 MB/s
     data_sent......................: 38 MB   593 kB/s
     http_req_blocked...............: avg=9.75µs   min=1.22µs  med=2.99µs   max=6.96ms   p(90)=4.77µs   p(95)=5.86µs   p(99.9)=1.97ms  
     http_req_connecting............: avg=5.72µs   min=0s      med=0s       max=6.89ms   p(90)=0s       p(95)=0s       p(99.9)=1.94ms  
     http_req_duration..............: avg=448.63ms min=3.99ms  med=416.78ms max=3.51s    p(90)=883.73ms p(95)=955.69ms p(99.9)=1.51s   
       { expected_response:true }...: avg=448.63ms min=3.99ms  med=416.78ms max=3.51s    p(90)=883.73ms p(95)=955.69ms p(99.9)=1.51s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 32017
     http_req_receiving.............: avg=86.3µs   min=31.09µs med=76.77µs  max=21.18ms  p(90)=113.56µs p(95)=126.98µs p(99.9)=769.96µs
     http_req_sending...............: avg=31.22µs  min=5.89µs  med=13.88µs  max=137.71ms p(90)=21.4µs   p(95)=24.8µs   p(99.9)=2.68ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=448.52ms min=3.92ms  med=416.68ms max=3.51s    p(90)=883.64ms p(95)=955.57ms p(99.9)=1.51s   
     http_reqs......................: 32017   493.700793/s
     iteration_duration.............: avg=463.32ms min=28.36ms med=435.39ms max=3.51s    p(90)=887.98ms p(95)=958.73ms p(99.9)=1.51s   
     iterations.....................: 31017   478.280836/s
     success_rate...................: 100.00% ✓ 31017      ✗ 0    
     vus............................: 31      min=0        max=500
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

     checks.........................: 100.00% ✓ 45666      ✗ 0    
     data_received..................: 1.4 GB  21 MB/s
     data_sent......................: 20 MB   287 kB/s
     http_req_blocked...............: avg=15.62µs  min=1.33µs  med=3.84µs   max=5.04ms   p(90)=5.78µs  p(95)=7.41µs  p(99.9)=2.57ms 
     http_req_connecting............: avg=10.06µs  min=0s      med=0s       max=4.96ms   p(90)=0s      p(95)=0s      p(99.9)=2.42ms 
     http_req_duration..............: avg=883.66ms min=6.19ms  med=767.58ms max=18.72s   p(90)=1.52s   p(95)=1.73s   p(99.9)=17.4s  
       { expected_response:true }...: avg=883.66ms min=6.19ms  med=767.58ms max=18.72s   p(90)=1.52s   p(95)=1.73s   p(99.9)=17.4s  
     http_req_failed................: 0.00%   ✓ 0          ✗ 16222
     http_req_receiving.............: avg=257.93µs min=37.18µs med=97.89µs  max=187.71ms p(90)=136.1µs p(95)=150.2µs p(99.9)=64.34ms
     http_req_sending...............: avg=30.86µs  min=6.03µs  med=18.87µs  max=32.59ms  p(90)=25.05µs p(95)=29.94µs p(99.9)=3.6ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=883.37ms min=6.08ms  med=767.44ms max=18.72s   p(90)=1.52s   p(95)=1.73s   p(99.9)=17.4s  
     http_reqs......................: 16222   237.958363/s
     iteration_duration.............: avg=941.76ms min=7.91ms  med=829.98ms max=18.72s   p(90)=1.54s   p(95)=1.74s   p(99.9)=17.47s 
     iterations.....................: 15222   223.289496/s
     success_rate...................: 100.00% ✓ 15222      ✗ 0    
     vus............................: 57      min=0        max=499
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

     checks.........................: 100.00% ✓ 42309      ✗ 0    
     data_received..................: 1.3 GB  18 MB/s
     data_sent......................: 19 MB   249 kB/s
     http_req_blocked...............: avg=14.56µs  min=1.29µs  med=3.46µs   max=3.8ms   p(90)=5.11µs   p(95)=6.63µs   p(99.9)=2.52ms  
     http_req_connecting............: avg=9.28µs   min=0s      med=0s       max=3.77ms  p(90)=0s       p(95)=0s       p(99.9)=2.32ms  
     http_req_duration..............: avg=466.5ms  min=8.48ms  med=553.33ms max=1.29s   p(90)=781.33ms p(95)=826.94ms p(99.9)=1.16s   
       { expected_response:true }...: avg=466.5ms  min=8.48ms  med=553.33ms max=1.29s   p(90)=781.33ms p(95)=826.94ms p(99.9)=1.16s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 15103
     http_req_receiving.............: avg=97.33µs  min=34.16µs med=90.01µs  max=16.09ms p(90)=128.87µs p(95)=141.24µs p(99.9)=866.68µs
     http_req_sending...............: avg=27.7µs   min=5.7µs   med=17.13µs  max=11.86ms p(90)=22.89µs  p(95)=27.75µs  p(99.9)=2.88ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=466.37ms min=8.34ms  med=553.14ms max=1.29s   p(90)=781.13ms p(95)=826.84ms p(99.9)=1.16s   
     http_reqs......................: 15103   202.898181/s
     iteration_duration.............: avg=499.4ms  min=14.78ms med=589ms    max=1.29s   p(90)=787.01ms p(95)=831.95ms p(99.9)=1.17s   
     iterations.....................: 14103   189.463884/s
     success_rate...................: 100.00% ✓ 14103      ✗ 0    
     vus............................: 68      min=0        max=499
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

     checks.........................: 100.00% ✓ 409536      ✗ 0     
     data_received..................: 12 GB   194 MB/s
     data_sent......................: 165 MB  2.7 MB/s
     http_req_blocked...............: avg=21.36µs  min=1.09µs  med=2.96µs  max=63.92ms  p(90)=4.78µs   p(95)=6.04µs   p(99.9)=2.35ms  
     http_req_connecting............: avg=17.48µs  min=0s      med=0s      max=63.86ms  p(90)=0s       p(95)=0s       p(99.9)=2.25ms  
     http_req_duration..............: avg=103.43ms min=1.67ms  med=98.13ms max=380.14ms p(90)=199.75ms p(95)=216.93ms p(99.9)=267.4ms 
       { expected_response:true }...: avg=103.43ms min=1.67ms  med=98.13ms max=380.14ms p(90)=199.75ms p(95)=216.93ms p(99.9)=267.4ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 137512
     http_req_receiving.............: avg=246µs    min=28.46µs med=63.4µs  max=279.36ms p(90)=195.39µs p(95)=435.35µs p(99.9)=25.03ms 
     http_req_sending...............: avg=83.2µs   min=5.41µs  med=11.55µs max=104.27ms p(90)=22.43µs  p(95)=144.78µs p(99.9)=11.61ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=103.1ms  min=1.59ms  med=97.88ms max=295.21ms p(90)=199.24ms p(95)=216.4ms  p(99.9)=265.39ms
     http_reqs......................: 137512  2214.144652/s
     iteration_duration.............: avg=104.47ms min=2.88ms  med=99.27ms max=391.02ms p(90)=200.29ms p(95)=217.46ms p(99.9)=268.83ms
     iterations.....................: 136512  2198.043187/s
     success_rate...................: 100.00% ✓ 136512      ✗ 0     
     vus............................: 61      min=0         max=497 
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

     checks.........................: 100.00% ✓ 355863      ✗ 0     
     data_received..................: 11 GB   169 MB/s
     data_sent......................: 144 MB  2.3 MB/s
     http_req_blocked...............: avg=16.14µs  min=1.06µs  med=2.8µs    max=53.37ms  p(90)=4.39µs   p(95)=5.43µs   p(99.9)=2.17ms  
     http_req_connecting............: avg=12.51µs  min=0s      med=0s       max=53.32ms  p(90)=0s       p(95)=0s       p(99.9)=1.85ms  
     http_req_duration..............: avg=118.99ms min=1.74ms  med=110.81ms max=985.19ms p(90)=225.99ms p(95)=259.53ms p(99.9)=650.68ms
       { expected_response:true }...: avg=118.99ms min=1.74ms  med=110.81ms max=985.19ms p(90)=225.99ms p(95)=259.53ms p(99.9)=650.68ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 119621
     http_req_receiving.............: avg=1.63ms   min=52.28µs med=117.56µs max=304.65ms p(90)=1.67ms   p(95)=4.36ms   p(99.9)=133.09ms
     http_req_sending...............: avg=59.95µs  min=5.19µs  med=10.63µs  max=72.99ms  p(90)=19.49µs  p(95)=124.41µs p(99.9)=7.73ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=117.29ms min=1.66ms  med=109.72ms max=983.58ms p(90)=223.56ms p(95)=254.38ms p(99.9)=640.8ms 
     http_reqs......................: 119621  1923.181979/s
     iteration_duration.............: avg=120.27ms min=2.74ms  med=112.15ms max=985.42ms p(90)=226.66ms p(95)=260.24ms p(99.9)=652.86ms
     iterations.....................: 118621  1907.104685/s
     success_rate...................: 100.00% ✓ 118621      ✗ 0     
     vus............................: 67      min=0         max=496 
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

     checks.........................: 100.00% ✓ 206379      ✗ 0    
     data_received..................: 6.1 GB  98 MB/s
     data_sent......................: 84 MB   1.3 MB/s
     http_req_blocked...............: avg=7.57µs   min=1.08µs  med=2.78µs   max=52.17ms  p(90)=4.46µs   p(95)=5.42µs   p(99.9)=516.96µs
     http_req_connecting............: avg=4.07µs   min=0s      med=0s       max=52.1ms   p(90)=0s       p(95)=0s       p(99.9)=448.22µs
     http_req_duration..............: avg=204.5ms  min=2.11ms  med=203.8ms  max=821.83ms p(90)=377.95ms p(95)=407.41ms p(99.9)=561.48ms
       { expected_response:true }...: avg=204.5ms  min=2.11ms  med=203.8ms  max=821.83ms p(90)=377.95ms p(95)=407.41ms p(99.9)=561.48ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 69793
     http_req_receiving.............: avg=84.7µs   min=30.58µs med=67.91µs  max=24.6ms   p(90)=104.67µs p(95)=120.17µs p(99.9)=2.15ms  
     http_req_sending...............: avg=36.27µs  min=5.66µs  med=11.72µs  max=260.58ms p(90)=18.36µs  p(95)=22.25µs  p(99.9)=3.93ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=204.38ms min=2.05ms  med=203.69ms max=821.74ms p(90)=377.84ms p(95)=407.29ms p(99.9)=561.4ms 
     http_reqs......................: 69793   1114.883396/s
     iteration_duration.............: avg=207.73ms min=4.84ms  med=207.23ms max=822.06ms p(90)=378.9ms  p(95)=408.14ms p(99.9)=562ms   
     iterations.....................: 68793   1098.909253/s
     success_rate...................: 100.00% ✓ 68793       ✗ 0    
     vus............................: 86      min=0         max=497
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

     checks.........................: 100.00% ✓ 89280      ✗ 0    
     data_received..................: 2.7 GB  41 MB/s
     data_sent......................: 37 MB   567 kB/s
     http_req_blocked...............: avg=11.22µs  min=1.18µs  med=3.25µs   max=37.5ms  p(90)=5.05µs   p(95)=6.04µs   p(99.9)=1.93ms  
     http_req_connecting............: avg=6.78µs   min=0s      med=0s       max=37.44ms p(90)=0s       p(95)=0s       p(99.9)=1.85ms  
     http_req_duration..............: avg=466.87ms min=4.09ms  med=436.94ms max=1.87s   p(90)=923.49ms p(95)=998ms    p(99.9)=1.46s   
       { expected_response:true }...: avg=466.87ms min=4.09ms  med=436.94ms max=1.87s   p(90)=923.49ms p(95)=998ms    p(99.9)=1.46s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 30760
     http_req_receiving.............: avg=92.25µs  min=31.5µs  med=81.59µs  max=62.34ms p(90)=117.48µs p(95)=131.53µs p(99.9)=833.57µs
     http_req_sending...............: avg=29.64µs  min=5.52µs  med=14.6µs   max=70.62ms p(90)=21.72µs  p(95)=25.13µs  p(99.9)=2.98ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=466.75ms min=3.99ms  med=436.8ms  max=1.87s   p(90)=923.31ms p(95)=997.87ms p(99.9)=1.46s   
     http_reqs......................: 30760   471.966439/s
     iteration_duration.............: avg=482.78ms min=33.93ms med=456.79ms max=1.88s   p(90)=928.26ms p(95)=1s       p(99.9)=1.46s   
     iterations.....................: 29760   456.622927/s
     success_rate...................: 100.00% ✓ 29760      ✗ 0    
     vus............................: 65      min=0        max=497
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

     checks.........................: 100.00% ✓ 43086      ✗ 0    
     data_received..................: 1.3 GB  20 MB/s
     data_sent......................: 18 MB   270 kB/s
     http_req_blocked...............: avg=13.28µs  min=1.18µs  med=3.73µs   max=3.91ms  p(90)=5.59µs   p(95)=7.38µs   p(99.9)=1.61ms  
     http_req_connecting............: avg=7.73µs   min=0s      med=0s       max=3.84ms  p(90)=0s       p(95)=0s       p(99.9)=1.59ms  
     http_req_duration..............: avg=949.35ms min=6.4ms   med=874.56ms max=5.41s   p(90)=1.87s    p(95)=2.1s     p(99.9)=4.99s   
       { expected_response:true }...: avg=949.35ms min=6.4ms   med=874.56ms max=5.41s   p(90)=1.87s    p(95)=2.1s     p(99.9)=4.99s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 15362
     http_req_receiving.............: avg=109.78µs min=34.66µs med=97.99µs  max=75.96ms p(90)=137.62µs p(95)=150.13µs p(99.9)=780.31µs
     http_req_sending...............: avg=37.07µs  min=6.08µs  med=18.47µs  max=42.91ms p(90)=24.48µs  p(95)=29.99µs  p(99.9)=5.49ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=949.21ms min=6.29ms  med=874.42ms max=5.41s   p(90)=1.87s    p(95)=2.1s     p(99.9)=4.99s   
     http_reqs......................: 15362   225.194275/s
     iteration_duration.............: avg=1.01s    min=56.5ms  med=949.23ms max=5.42s   p(90)=1.89s    p(95)=2.12s    p(99.9)=5s      
     iterations.....................: 14362   210.535098/s
     success_rate...................: 100.00% ✓ 14362      ✗ 0    
     vus............................: 64      min=0        max=500
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

     checks.........................: 100.00% ✓ 40101      ✗ 0    
     data_received..................: 1.3 GB  18 MB/s
     data_sent......................: 17 MB   247 kB/s
     http_req_blocked...............: avg=16.96µs  min=1.36µs  med=3.61µs   max=5.95ms  p(90)=5.32µs   p(95)=6.98µs   p(99.9)=2.85ms  
     http_req_connecting............: avg=11.48µs  min=0s      med=0s       max=5.87ms  p(90)=0s       p(95)=0s       p(99.9)=2.7ms   
     http_req_duration..............: avg=1.01s    min=8.64ms  med=921.08ms max=4.17s   p(90)=2.07s    p(95)=2.18s    p(99.9)=3.74s   
       { expected_response:true }...: avg=1.01s    min=8.64ms  med=921.08ms max=4.17s   p(90)=2.07s    p(95)=2.18s    p(99.9)=3.74s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 14367
     http_req_receiving.............: avg=102.05µs min=33.52µs med=95.66µs  max=4.74ms  p(90)=135.98µs p(95)=148.03µs p(99.9)=928.82µs
     http_req_sending...............: avg=32.84µs  min=6.34µs  med=18.18µs  max=73.01ms p(90)=24.01µs  p(95)=29.2µs   p(99.9)=2.84ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=1.01s    min=8.53ms  med=920.99ms max=4.17s   p(90)=2.07s    p(95)=2.18s    p(99.9)=3.74s   
     http_reqs......................: 14367   205.855544/s
     iteration_duration.............: avg=1.09s    min=52.37ms med=1.03s    max=4.17s   p(90)=2.07s    p(95)=2.19s    p(99.9)=3.77s   
     iterations.....................: 13367   191.527184/s
     success_rate...................: 100.00% ✓ 13367      ✗ 0    
     vus............................: 94      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-176-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

