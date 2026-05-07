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
| hive-router | v0.0.49 | 2,820 | 2,895 | 2,777 | 1.4% |  |
| hotchocolate | 16.1.0-p.1.10 | 2,064 | 2,107 | 2,049 | 0.9% |  |
| cosmo | 0.307.0 | 1,169 | 1,169 | 1,152 | 1.0% | non-compatible response (15 across 7/9 runs) |
| hive-gateway-router-runtime | 2.5.25 | 493 | 499 | 491 | 0.5% |  |
| hive-gateway | 2.5.25 | 231 | 234 | 229 | 0.7% |  |
| apollo-gateway | 2.13.3 | 202 | 206 | 201 | 0.7% |  |
| apollo-router | v2.13.1 | — | — | — | — | non-compatible response (25702 across 9/9 runs) |
| grafbase | 0.53.3 | — | — | — | — | non-compatible response (508633 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.49 | 2,344 | 2,440 | 2,317 | 1.9% |  |
| hotchocolate | 16.1.0-p.1.10 | 1,856 | 1,903 | 1,849 | 1.2% |  |
| cosmo | 0.307.0 | 1,121 | 1,130 | 1,118 | 0.6% | non-compatible response (11 across 6/9 runs) |
| hive-gateway-router-runtime | 2.5.25 | 488 | 493 | 485 | 0.6% |  |
| hive-gateway | 2.5.25 | 224 | 227 | 222 | 0.7% |  |
| apollo-gateway | 2.13.3 | 207 | 210 | 206 | 0.6% |  |
| apollo-router | v2.13.1 | — | — | — | — | non-compatible response (10842 across 9/9 runs) |
| grafbase | 0.53.3 | — | — | — | — | non-compatible response (259525 across 9/9 runs) |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.49)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 520527      ✗ 0     
     data_received..................: 15 GB   247 MB/s
     data_sent......................: 210 MB  3.4 MB/s
     http_req_blocked...............: avg=30.05µs  min=982ns   med=2.41µs  max=99.19ms  p(90)=4µs      p(95)=5.14µs   p(99.9)=5.89ms  
     http_req_connecting............: avg=26.5µs   min=0s      med=0s      max=99.1ms   p(90)=0s       p(95)=0s       p(99.9)=5ms     
     http_req_duration..............: avg=81.38ms  min=1.5ms   med=75ms    max=308.75ms p(90)=157.17ms p(95)=174.22ms p(99.9)=233.47ms
       { expected_response:true }...: avg=81.38ms  min=1.5ms   med=75ms    max=308.75ms p(90)=157.17ms p(95)=174.22ms p(99.9)=233.47ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 174509
     http_req_receiving.............: avg=366.13µs min=28.61µs med=55.99µs max=183.76ms p(90)=256.07µs p(95)=420.42µs p(99.9)=36.55ms 
     http_req_sending...............: avg=89.03µs  min=5.34µs  med=10.07µs max=59.58ms  p(90)=19.35µs  p(95)=133.69µs p(99.9)=13.57ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=80.93ms  min=1.45ms  med=74.67ms max=304.22ms p(90)=156.53ms p(95)=172.82ms p(99.9)=230.65ms
     http_reqs......................: 174509  2820.389495/s
     iteration_duration.............: avg=82.16ms  min=2.52ms  med=75.88ms max=350.99ms p(90)=157.7ms  p(95)=174.94ms p(99.9)=237.85ms
     iterations.....................: 173509  2804.227638/s
     success_rate...................: 100.00% ✓ 173509      ✗ 0     
     vus............................: 51      min=0         max=499 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (rust subgraphs) (16.1.0-p.1.10)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 386286      ✗ 0     
     data_received..................: 11 GB   181 MB/s
     data_sent......................: 156 MB  2.5 MB/s
     http_req_blocked...............: avg=15.4µs   min=972ns   med=2.16µs   max=55.04ms  p(90)=3.48µs   p(95)=4.4µs    p(99.9)=1.38ms  
     http_req_connecting............: avg=12.58µs  min=0s      med=0s       max=54.87ms  p(90)=0s       p(95)=0s       p(99.9)=1.3ms   
     http_req_duration..............: avg=109.68ms min=2.42ms  med=100.36ms max=911.15ms p(90)=214.25ms p(95)=251.08ms p(99.9)=455.79ms
       { expected_response:true }...: avg=109.68ms min=2.42ms  med=100.36ms max=911.15ms p(90)=214.25ms p(95)=251.08ms p(99.9)=455.79ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 129762
     http_req_receiving.............: avg=2.22ms   min=51.96µs med=116.1µs  max=345.38ms p(90)=1.43ms   p(95)=4.86ms   p(99.9)=166.51ms
     http_req_sending...............: avg=63.69µs  min=5.27µs  med=9.58µs   max=185.95ms p(90)=16.93µs  p(95)=116.31µs p(99.9)=8.56ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=107.39ms min=2.32ms  med=99.38ms  max=910.29ms p(90)=210.64ms p(95)=241.91ms p(99.9)=403ms   
     http_reqs......................: 129762  2064.476941/s
     iteration_duration.............: avg=110.8ms  min=3.79ms  med=101.55ms max=911.35ms p(90)=214.95ms p(95)=252.05ms p(99.9)=456.24ms
     iterations.....................: 128762  2048.567222/s
     success_rate...................: 100.00% ✓ 128762      ✗ 0     
     vus............................: 8       min=0         max=500 
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

     checks.........................: 100.00% ✓ 216276      ✗ 0    
     data_received..................: 6.4 GB  103 MB/s
     data_sent......................: 88 MB   1.4 MB/s
     http_req_blocked...............: avg=6.3µs    min=1.03µs med=2.37µs   max=19.12ms  p(90)=3.81µs   p(95)=4.62µs   p(99.9)=508.18µs
     http_req_connecting............: avg=3.31µs   min=0s     med=0s       max=19.07ms  p(90)=0s       p(95)=0s       p(99.9)=450.26µs
     http_req_duration..............: avg=195.25ms min=2.05ms med=195.87ms max=606.01ms p(90)=362.73ms p(95)=390.95ms p(99.9)=499.55ms
       { expected_response:true }...: avg=195.25ms min=2.05ms med=195.87ms max=606.01ms p(90)=362.73ms p(95)=390.95ms p(99.9)=499.55ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 73092
     http_req_receiving.............: avg=74.71µs  min=29.5µs med=59.5µs   max=158.77ms p(90)=91.52µs  p(95)=103.66µs p(99.9)=1.6ms   
     http_req_sending...............: avg=29.39µs  min=5.48µs med=10.5µs   max=141.38ms p(90)=15.67µs  p(95)=18.85µs  p(99.9)=3.95ms  
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=195.14ms min=1.99ms med=195.77ms max=605.95ms p(90)=362.65ms p(95)=390.85ms p(99.9)=499.49ms
     http_reqs......................: 73092   1169.892933/s
     iteration_duration.............: avg=198.2ms  min=5.18ms med=199.18ms max=606.22ms p(90)=363.59ms p(95)=391.72ms p(99.9)=499.95ms
     iterations.....................: 72092   1153.887174/s
     success_rate...................: 100.00% ✓ 72092       ✗ 0    
     vus............................: 80      min=0         max=495
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

     checks.........................: 100.00% ✓ 93072      ✗ 0    
     data_received..................: 2.8 GB  43 MB/s
     data_sent......................: 38 MB   592 kB/s
     http_req_blocked...............: avg=11.09µs  min=1.09µs  med=3.03µs   max=46.05ms  p(90)=4.82µs   p(95)=5.99µs   p(99.9)=1.94ms 
     http_req_connecting............: avg=6.91µs   min=0s      med=0s       max=45.99ms  p(90)=0s       p(95)=0s       p(99.9)=1.78ms 
     http_req_duration..............: avg=448.38ms min=4.03ms  med=419.41ms max=2.15s    p(90)=880.43ms p(95)=959.77ms p(99.9)=1.41s  
       { expected_response:true }...: avg=448.38ms min=4.03ms  med=419.41ms max=2.15s    p(90)=880.43ms p(95)=959.77ms p(99.9)=1.41s  
     http_req_failed................: 0.00%   ✓ 0          ✗ 32024
     http_req_receiving.............: avg=186.72µs min=32.12µs med=76.9µs   max=173.01ms p(90)=113.81µs p(95)=127.44µs p(99.9)=36.08ms
     http_req_sending...............: avg=28.64µs  min=5.45µs  med=13.56µs  max=76.25ms  p(90)=20.84µs  p(95)=24.4µs   p(99.9)=2.74ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=448.17ms min=3.95ms  med=419.31ms max=2.15s    p(90)=880.29ms p(95)=959.67ms p(99.9)=1.41s  
     http_reqs......................: 32024   493.364464/s
     iteration_duration.............: avg=463.04ms min=9.23ms  med=435.86ms max=2.15s    p(90)=884.61ms p(95)=963.78ms p(99.9)=1.42s  
     iterations.....................: 31024   477.95838/s
     success_rate...................: 100.00% ✓ 31024      ✗ 0    
     vus............................: 53      min=0        max=499
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

     checks.........................: 100.00% ✓ 44346      ✗ 0    
     data_received..................: 1.4 GB  20 MB/s
     data_sent......................: 19 MB   279 kB/s
     http_req_blocked...............: avg=13.91µs  min=1.17µs  med=3.85µs   max=3.38ms  p(90)=5.83µs   p(95)=7.58µs   p(99.9)=2.22ms
     http_req_connecting............: avg=8.43µs   min=0s      med=0s       max=3.35ms  p(90)=0s       p(95)=0s       p(99.9)=2.19ms
     http_req_duration..............: avg=907.21ms min=6.1ms   med=775.11ms max=18.49s  p(90)=1.56s    p(95)=1.66s    p(99.9)=17.52s
       { expected_response:true }...: avg=907.21ms min=6.1ms   med=775.11ms max=18.49s  p(90)=1.56s    p(95)=1.66s    p(99.9)=17.52s
     http_req_failed................: 0.00%   ✓ 0          ✗ 15782
     http_req_receiving.............: avg=113.71µs min=33.14µs med=102.34µs max=40.33ms p(90)=141.51µs p(95)=154.26µs p(99.9)=1.03ms
     http_req_sending...............: avg=29.87µs  min=5.97µs  med=18.89µs  max=37.93ms p(90)=25.19µs  p(95)=29.9µs   p(99.9)=2.37ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=907.06ms min=6.01ms  med=774.99ms max=18.49s  p(90)=1.56s    p(95)=1.66s    p(99.9)=17.52s
     http_reqs......................: 15782   231.800249/s
     iteration_duration.............: avg=968.56ms min=13.73ms med=844.32ms max=18.5s   p(90)=1.57s    p(95)=1.67s    p(99.9)=17.6s 
     iterations.....................: 14782   217.112615/s
     success_rate...................: 100.00% ✓ 14782      ✗ 0    
     vus............................: 45      min=0        max=500
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

     checks.........................: 100.00% ✓ 42198      ✗ 0    
     data_received..................: 1.3 GB  18 MB/s
     data_sent......................: 19 MB   249 kB/s
     http_req_blocked...............: avg=18.27µs  min=1.21µs  med=3.44µs   max=38.65ms p(90)=5.11µs   p(95)=6.62µs   p(99.9)=2.65ms 
     http_req_connecting............: avg=12.93µs  min=0s      med=0s       max=38.59ms p(90)=0s       p(95)=0s       p(99.9)=2.61ms 
     http_req_duration..............: avg=418.19ms min=8.46ms  med=496.6ms  max=1.14s   p(90)=685.5ms  p(95)=736.05ms p(99.9)=1.02s  
       { expected_response:true }...: avg=418.19ms min=8.46ms  med=496.6ms  max=1.14s   p(90)=685.5ms  p(95)=736.05ms p(99.9)=1.02s  
     http_req_failed................: 0.00%   ✓ 0          ✗ 15066
     http_req_receiving.............: avg=104.88µs min=33.34µs med=93.31µs  max=47.45ms p(90)=134.43µs p(95)=148.12µs p(99.9)=914.4µs
     http_req_sending...............: avg=36.07µs  min=5.77µs  med=17.11µs  max=54.26ms p(90)=23.34µs  p(95)=28.34µs  p(99.9)=2.62ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=418.05ms min=8.37ms  med=496.41ms max=1.14s   p(90)=685.37ms p(95)=735.96ms p(99.9)=1.02s  
     http_reqs......................: 15066   202.534102/s
     iteration_duration.............: avg=447.78ms min=9.21ms  med=519.62ms max=1.15s   p(90)=690.93ms p(95)=742.25ms p(99.9)=1.04s  
     iterations.....................: 14066   189.090978/s
     success_rate...................: 100.00% ✓ 14066      ✗ 0    
     vus............................: 69      min=0        max=496
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

     checks.........................: 100.00% ✓ 433119      ✗ 0     
     data_received..................: 13 GB   205 MB/s
     data_sent......................: 175 MB  2.8 MB/s
     http_req_blocked...............: avg=24.21µs  min=982ns   med=2.48µs  max=68.82ms  p(90)=4.36µs   p(95)=5.68µs   p(99.9)=3.31ms  
     http_req_connecting............: avg=20.69µs  min=0s      med=0s      max=68.64ms  p(90)=0s       p(95)=0s       p(99.9)=3ms     
     http_req_duration..............: avg=97.8ms   min=1.65ms  med=91.62ms max=308.31ms p(90)=188.61ms p(95)=205.2ms  p(99.9)=256.34ms
       { expected_response:true }...: avg=97.8ms   min=1.65ms  med=91.62ms max=308.31ms p(90)=188.61ms p(95)=205.2ms  p(99.9)=256.34ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 145373
     http_req_receiving.............: avg=271.03µs min=27.55µs med=59.47µs max=46.39ms  p(90)=212.02µs p(95)=436.23µs p(99.9)=27.04ms 
     http_req_sending...............: avg=83.09µs  min=5.25µs  med=10.81µs max=205.19ms p(90)=21.99µs  p(95)=139.98µs p(99.9)=11.66ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=97.45ms  min=1.6ms   med=91.33ms max=286.47ms p(90)=188.15ms p(95)=204.52ms p(99.9)=254.63ms
     http_reqs......................: 145373  2344.017218/s
     iteration_duration.............: avg=98.77ms  min=3.99ms  med=92.7ms  max=339.7ms  p(90)=189.19ms p(95)=205.77ms p(99.9)=258.17ms
     iterations.....................: 144373  2327.89306/s
     success_rate...................: 100.00% ✓ 144373      ✗ 0     
     vus............................: 59      min=0         max=498 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (.net subgraphs) (16.1.0-p.1.10)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 343467      ✗ 0     
     data_received..................: 10 GB   163 MB/s
     data_sent......................: 139 MB  2.2 MB/s
     http_req_blocked...............: avg=12.89µs  min=982ns   med=2.27µs   max=46.97ms  p(90)=3.88µs   p(95)=4.9µs    p(99.9)=1.79ms  
     http_req_connecting............: avg=9.96µs   min=0s      med=0s       max=46.88ms  p(90)=0s       p(95)=0s       p(99.9)=1.75ms  
     http_req_duration..............: avg=123.35ms min=1.77ms  med=114.42ms max=660.16ms p(90)=236.49ms p(95)=273.91ms p(99.9)=507.13ms
       { expected_response:true }...: avg=123.35ms min=1.77ms  med=114.42ms max=660.16ms p(90)=236.49ms p(95)=273.91ms p(99.9)=507.13ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 115489
     http_req_receiving.............: avg=2ms      min=51.67µs med=118.31µs max=310.95ms p(90)=1.9ms    p(95)=5.6ms    p(99.9)=161.19ms
     http_req_sending...............: avg=61.99µs  min=5.15µs  med=9.86µs   max=258ms    p(90)=19.05µs  p(95)=118.81µs p(99.9)=7.63ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=121.29ms min=1.67ms  med=113.14ms max=651.53ms p(90)=233.46ms p(95)=267.68ms p(99.9)=499.73ms
     http_reqs......................: 115489  1856.523065/s
     iteration_duration.............: avg=124.7ms  min=3.12ms  med=115.85ms max=660.36ms p(90)=237.27ms p(95)=274.72ms p(99.9)=507.54ms
     iterations.....................: 114489  1840.447741/s
     success_rate...................: 100.00% ✓ 114489      ✗ 0     
     vus............................: 68      min=0         max=496 
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

     checks.........................: 100.00% ✓ 207942      ✗ 0    
     data_received..................: 6.2 GB  98 MB/s
     data_sent......................: 84 MB   1.3 MB/s
     http_req_blocked...............: avg=6.22µs   min=1.09µs  med=2.36µs   max=51.63ms  p(90)=4.07µs   p(95)=4.96µs   p(99.9)=464.27µs
     http_req_connecting............: avg=3.02µs   min=0s      med=0s       max=51.53ms  p(90)=0s       p(95)=0s       p(99.9)=379.7µs 
     http_req_duration..............: avg=202.96ms min=2.12ms  med=203.01ms max=550.52ms p(90)=376.19ms p(95)=404.25ms p(99.9)=491.87ms
       { expected_response:true }...: avg=202.96ms min=2.12ms  med=203.01ms max=550.52ms p(90)=376.19ms p(95)=404.25ms p(99.9)=491.87ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 70314
     http_req_receiving.............: avg=83.87µs  min=30.84µs med=64.83µs  max=117.87ms p(90)=102.01µs p(95)=118.56µs p(99.9)=1.38ms  
     http_req_sending...............: avg=32.23µs  min=5.51µs  med=11.06µs  max=165.22ms p(90)=17.77µs  p(95)=21.24µs  p(99.9)=3.53ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=202.84ms min=2.03ms  med=202.89ms max=550.45ms p(90)=376.1ms  p(95)=404.17ms p(99.9)=491.81ms
     http_reqs......................: 70314   1121.968318/s
     iteration_duration.............: avg=206.13ms min=4.95ms  med=206.5ms  max=550.67ms p(90)=377.24ms p(95)=405.07ms p(99.9)=494ms   
     iterations.....................: 69314   1106.011776/s
     success_rate...................: 100.00% ✓ 69314       ✗ 0    
     vus............................: 89      min=0         max=498
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

     checks.........................: 100.00% ✓ 92421      ✗ 0    
     data_received..................: 2.8 GB  43 MB/s
     data_sent......................: 38 MB   586 kB/s
     http_req_blocked...............: avg=10.33µs  min=1.17µs  med=3.25µs   max=10.74ms  p(90)=5.08µs   p(95)=6.2µs    p(99.9)=1.97ms
     http_req_connecting............: avg=6.05µs   min=0s      med=0s       max=10.67ms  p(90)=0s       p(95)=0s       p(99.9)=1.93ms
     http_req_duration..............: avg=451.63ms min=4.16ms  med=422.23ms max=1.68s    p(90)=886.62ms p(95)=970.14ms p(99.9)=1.46s 
       { expected_response:true }...: avg=451.63ms min=4.16ms  med=422.23ms max=1.68s    p(90)=886.62ms p(95)=970.14ms p(99.9)=1.46s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 31807
     http_req_receiving.............: avg=94.47µs  min=32.64µs med=81.38µs  max=105.14ms p(90)=118.23µs p(95)=133.52µs p(99.9)=1.04ms
     http_req_sending...............: avg=31.22µs  min=5.46µs  med=14.76µs  max=84.06ms  p(90)=21.99µs  p(95)=25.67µs  p(99.9)=3.27ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=451.51ms min=4.09ms  med=422.11ms max=1.68s    p(90)=886.53ms p(95)=970.05ms p(99.9)=1.46s 
     http_reqs......................: 31807   488.288899/s
     iteration_duration.............: avg=466.52ms min=22.32ms med=438.08ms max=1.68s    p(90)=891.7ms  p(95)=974.83ms p(99.9)=1.47s 
     iterations.....................: 30807   472.937281/s
     success_rate...................: 100.00% ✓ 30807      ✗ 0    
     vus............................: 62      min=0        max=497
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

     checks.........................: 100.00% ✓ 42803      ✗ 0    
     data_received..................: 1.3 GB  20 MB/s
     data_sent......................: 18 MB   269 kB/s
     http_req_blocked...............: avg=16.65µs  min=1.35µs  med=3.78µs   max=28.58ms p(90)=5.7µs    p(95)=7.41µs   p(99.9)=2.17ms  
     http_req_connecting............: avg=10.79µs  min=0s      med=0s       max=28.52ms p(90)=0s       p(95)=0s       p(99.9)=2.08ms  
     http_req_duration..............: avg=955.93ms min=6.25ms  med=864.23ms max=5.49s   p(90)=1.89s    p(95)=2.08s    p(99.9)=4.98s   
       { expected_response:true }...: avg=955.93ms min=6.25ms  med=864.23ms max=5.49s   p(90)=1.89s    p(95)=2.08s    p(99.9)=4.98s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 15268
     http_req_receiving.............: avg=121µs    min=34.44µs med=102.59µs max=94.16ms p(90)=144.23µs p(95)=157.08µs p(99.9)=972.34µs
     http_req_sending...............: avg=30.94µs  min=6.04µs  med=18.41µs  max=9.9ms   p(90)=24.67µs  p(95)=29.85µs  p(99.9)=3.16ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=955.78ms min=6.15ms  med=864.02ms max=5.49s   p(90)=1.89s    p(95)=2.08s    p(99.9)=4.98s   
     http_reqs......................: 15268   224.118406/s
     iteration_duration.............: avg=1.02s    min=51.93ms med=947.37ms max=5.49s   p(90)=1.91s    p(95)=2.09s    p(99.9)=4.98s   
     iterations.....................: 14267   209.424764/s
     success_rate...................: 100.00% ✓ 14267      ✗ 0    
     vus............................: 63      min=0        max=499
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

     checks.........................: 100.00% ✓ 40584      ✗ 0    
     data_received..................: 1.3 GB  18 MB/s
     data_sent......................: 17 MB   249 kB/s
     http_req_blocked...............: avg=13.81µs  min=1.23µs  med=3.51µs   max=2.98ms  p(90)=5.25µs   p(95)=6.88µs   p(99.9)=1.84ms  
     http_req_connecting............: avg=8.47µs   min=0s      med=0s       max=2.96ms  p(90)=0s       p(95)=0s       p(99.9)=1.81ms  
     http_req_duration..............: avg=1s       min=8.72ms  med=916.72ms max=4.34s   p(90)=2.06s    p(95)=2.2s     p(99.9)=3.78s   
       { expected_response:true }...: avg=1s       min=8.72ms  med=916.72ms max=4.34s   p(90)=2.06s    p(95)=2.2s     p(99.9)=3.78s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 14528
     http_req_receiving.............: avg=102.92µs min=33µs    med=93.62µs  max=35.4ms  p(90)=134.38µs p(95)=146.65µs p(99.9)=987.41µs
     http_req_sending...............: avg=40.54µs  min=5.78µs  med=16.87µs  max=68.39ms p(90)=22.54µs  p(95)=27.45µs  p(99.9)=4.73ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=1s       min=8.6ms   med=916.61ms max=4.34s   p(90)=2.06s    p(95)=2.2s     p(99.9)=3.78s   
     http_reqs......................: 14528   207.765992/s
     iteration_duration.............: avg=1.07s    min=49.17ms med=990.34ms max=4.35s   p(90)=2.08s    p(95)=2.21s    p(99.9)=3.8s    
     iterations.....................: 13528   193.464919/s
     success_rate...................: 100.00% ✓ 13528      ✗ 0    
     vus............................: 34      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-177-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

