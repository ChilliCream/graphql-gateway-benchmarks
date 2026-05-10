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
| hive-router | v0.0.49 | 2,681 | 2,799 | 2,644 | 2.1% |  |
| hotchocolate | 16.1.0-p.1.10 | 2,055 | 2,080 | 2,036 | 0.7% |  |
| cosmo | 0.307.0 | 1,197 | 1,197 | 1,197 | 0.0% | non-compatible response (16 across 8/9 runs) |
| hive-gateway-router-runtime | 2.5.25 | 490 | 501 | 488 | 0.9% |  |
| hive-gateway | 2.5.25 | 237 | 241 | 236 | 0.7% |  |
| apollo-gateway | 2.13.3 | 202 | 206 | 201 | 0.8% |  |
| apollo-router | v2.13.1 | — | — | — | — | non-compatible response (20639 across 9/9 runs) |
| grafbase | 0.53.3 | — | — | — | — | non-compatible response (469048 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.49 | 2,366 | 2,457 | 2,322 | 1.8% |  |
| hotchocolate | 16.1.0-p.1.10 | 1,855 | 1,894 | 1,833 | 1.0% |  |
| cosmo | 0.307.0 | 1,155 | 1,159 | 1,150 | 0.4% | non-compatible response (19 across 6/9 runs) |
| hive-gateway-router-runtime | 2.5.25 | 469 | 477 | 465 | 0.9% |  |
| hive-gateway | 2.5.25 | 229 | 234 | 226 | 1.1% |  |
| apollo-gateway | 2.13.3 | 202 | 204 | 201 | 0.6% |  |
| apollo-router | v2.13.1 | — | — | — | — | non-compatible response (9106 across 9/9 runs) |
| grafbase | 0.53.3 | — | — | — | — | non-compatible response (198260 across 9/9 runs) |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.49)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 494838      ✗ 0     
     data_received..................: 15 GB   235 MB/s
     data_sent......................: 199 MB  3.2 MB/s
     http_req_blocked...............: avg=23.85µs  min=1.01µs  med=2.17µs  max=64.62ms  p(90)=3.56µs   p(95)=4.61µs   p(99.9)=2.83ms  
     http_req_connecting............: avg=20.93µs  min=0s      med=0s      max=64.43ms  p(90)=0s       p(95)=0s       p(99.9)=2.64ms  
     http_req_duration..............: avg=85.59ms  min=1.58ms  med=79.34ms max=293.78ms p(90)=165.96ms p(95)=180.74ms p(99.9)=237.65ms
       { expected_response:true }...: avg=85.59ms  min=1.58ms  med=79.34ms max=293.78ms p(90)=165.96ms p(95)=180.74ms p(99.9)=237.65ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 165946
     http_req_receiving.............: avg=337.21µs min=28.49µs med=55.87µs max=122.17ms p(90)=212.04µs p(95)=400.81µs p(99.9)=39.14ms 
     http_req_sending...............: avg=81.11µs  min=5.02µs  med=9.69µs  max=200.37ms p(90)=18.31µs  p(95)=128.07µs p(99.9)=12.24ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=85.17ms  min=1.49ms  med=79.05ms max=282.42ms p(90)=165.38ms p(95)=179.88ms p(99.9)=233.04ms
     http_reqs......................: 165946  2681.812369/s
     iteration_duration.............: avg=86.42ms  min=2.45ms  med=80.2ms  max=339.81ms p(90)=166.59ms p(95)=181.39ms p(99.9)=240.07ms
     iterations.....................: 164946  2665.651615/s
     success_rate...................: 100.00% ✓ 164946      ✗ 0     
     vus............................: 52      min=0         max=499 
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

     checks.........................: 100.00% ✓ 383400      ✗ 0     
     data_received..................: 11 GB   180 MB/s
     data_sent......................: 155 MB  2.5 MB/s
     http_req_blocked...............: avg=18.74µs  min=982ns   med=2.59µs   max=64.06ms  p(90)=4.09µs   p(95)=5.12µs   p(99.9)=1.64ms  
     http_req_connecting............: avg=15.33µs  min=0s      med=0s       max=64.01ms  p(90)=0s       p(95)=0s       p(99.9)=1.5ms   
     http_req_duration..............: avg=110.49ms min=2.38ms  med=101.58ms max=675.73ms p(90)=216.34ms p(95)=253.33ms p(99.9)=486.52ms
       { expected_response:true }...: avg=110.49ms min=2.38ms  med=101.58ms max=675.73ms p(90)=216.34ms p(95)=253.33ms p(99.9)=486.52ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 128800
     http_req_receiving.............: avg=2.13ms   min=51.89µs med=116.76µs max=391.07ms p(90)=1.49ms   p(95)=5.06ms   p(99.9)=179.28ms
     http_req_sending...............: avg=68.78µs  min=5.29µs  med=10.27µs  max=205.68ms p(90)=18.86µs  p(95)=125.83µs p(99.9)=9.17ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=108.28ms min=2.29ms  med=100.34ms max=615.68ms p(90)=212.95ms p(95)=246.24ms p(99.9)=413.07ms
     http_reqs......................: 128800  2055.000005/s
     iteration_duration.............: avg=111.64ms min=3.71ms  med=103ms    max=675.98ms p(90)=217.17ms p(95)=254.14ms p(99.9)=487.91ms
     iterations.....................: 127800  2039.045036/s
     success_rate...................: 100.00% ✓ 127800      ✗ 0     
     vus............................: 89      min=0         max=500 
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

     checks.........................: 100.00% ✓ 221664      ✗ 0    
     data_received..................: 6.6 GB  105 MB/s
     data_sent......................: 90 MB   1.4 MB/s
     http_req_blocked...............: avg=7.5µs    min=1.13µs  med=2.63µs   max=28.66ms  p(90)=4.24µs   p(95)=5.17µs   p(99.9)=713.41µs
     http_req_connecting............: avg=4.16µs   min=0s      med=0s       max=28.6ms   p(90)=0s       p(95)=0s       p(99.9)=599.47µs
     http_req_duration..............: avg=190.51ms min=2.03ms  med=191.74ms max=559.65ms p(90)=352.33ms p(95)=377.14ms p(99.9)=483.61ms
       { expected_response:true }...: avg=190.51ms min=2.03ms  med=191.74ms max=559.65ms p(90)=352.33ms p(95)=377.14ms p(99.9)=483.61ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 74888
     http_req_receiving.............: avg=84.85µs  min=28.77µs med=62.94µs  max=119.09ms p(90)=99.8µs   p(95)=117.05µs p(99.9)=2ms     
     http_req_sending...............: avg=33.73µs  min=4.9µs   med=11.23µs  max=58.01ms  p(90)=18µs     p(95)=22.12µs  p(99.9)=4.12ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=190.39ms min=1.97ms  med=191.64ms max=559.59ms p(90)=352.19ms p(95)=377.02ms p(99.9)=483.54ms
     http_reqs......................: 74888   1197.812244/s
     iteration_duration.............: avg=193.33ms min=5.16ms  med=194.86ms max=559.81ms p(90)=353.18ms p(95)=377.82ms p(99.9)=484.34ms
     iterations.....................: 73888   1181.817529/s
     success_rate...................: 100.00% ✓ 73888       ✗ 0    
     vus............................: 81      min=0         max=493
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

     checks.........................: 100.00% ✓ 92562      ✗ 0    
     data_received..................: 2.8 GB  43 MB/s
     data_sent......................: 38 MB   589 kB/s
     http_req_blocked...............: avg=9.59µs   min=1.17µs  med=2.88µs   max=5.29ms   p(90)=4.65µs   p(95)=5.67µs   p(99.9)=1.84ms
     http_req_connecting............: avg=5.63µs   min=0s      med=0s       max=5.24ms   p(90)=0s       p(95)=0s       p(99.9)=1.8ms 
     http_req_duration..............: avg=450.84ms min=4.11ms  med=416.55ms max=1.75s    p(90)=888.69ms p(95)=965.27ms p(99.9)=1.44s 
       { expected_response:true }...: avg=450.84ms min=4.11ms  med=416.55ms max=1.75s    p(90)=888.69ms p(95)=965.27ms p(99.9)=1.44s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 31854
     http_req_receiving.............: avg=160.08µs min=29.44µs med=76.51µs  max=196.97ms p(90)=112.62µs p(95)=125.08µs p(99.9)=2ms   
     http_req_sending...............: avg=23.17µs  min=5.41µs  med=13.27µs  max=36.69ms  p(90)=20.3µs   p(95)=23.57µs  p(99.9)=2.07ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=450.66ms min=4.01ms  med=416.47ms max=1.75s    p(90)=888.6ms  p(95)=965.19ms p(99.9)=1.44s 
     http_reqs......................: 31854   490.216427/s
     iteration_duration.............: avg=465.68ms min=12.06ms med=434.5ms  max=1.75s    p(90)=893.34ms p(95)=968.17ms p(99.9)=1.45s 
     iterations.....................: 30854   474.826949/s
     success_rate...................: 100.00% ✓ 30854      ✗ 0    
     vus............................: 57      min=0        max=499
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

     checks.........................: 100.00% ✓ 45645      ✗ 0    
     data_received..................: 1.4 GB  21 MB/s
     data_sent......................: 20 MB   287 kB/s
     http_req_blocked...............: avg=14.67µs  min=1.36µs  med=3.81µs   max=5.23ms  p(90)=5.77µs   p(95)=7.52µs   p(99.9)=2.62ms
     http_req_connecting............: avg=9.05µs   min=0s      med=0s       max=5.16ms  p(90)=0s       p(95)=0s       p(99.9)=2.59ms
     http_req_duration..............: avg=879.77ms min=6.1ms   med=765.62ms max=21.01s  p(90)=1.46s    p(95)=1.58s    p(99.9)=19.72s
       { expected_response:true }...: avg=879.77ms min=6.1ms   med=765.62ms max=21.01s  p(90)=1.46s    p(95)=1.58s    p(99.9)=19.72s
     http_req_failed................: 0.00%   ✓ 0          ✗ 16215
     http_req_receiving.............: avg=109.27µs min=36.03µs med=101.39µs max=17.47ms p(90)=141.02µs p(95)=155.15µs p(99.9)=1.25ms
     http_req_sending...............: avg=29.61µs  min=6.32µs  med=18.71µs  max=9.02ms  p(90)=25.19µs  p(95)=30.43µs  p(99.9)=3.18ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=879.63ms min=6.01ms  med=765.52ms max=21.01s  p(90)=1.46s    p(95)=1.58s    p(99.9)=19.72s
     http_reqs......................: 16215   237.975813/s
     iteration_duration.............: avg=937.58ms min=35.26ms med=832.48ms max=21.02s  p(90)=1.48s    p(95)=1.59s    p(99.9)=19.73s
     iterations.....................: 15215   223.299538/s
     success_rate...................: 100.00% ✓ 15215      ✗ 0    
     vus............................: 54      min=0        max=499
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

     checks.........................: 100.00% ✓ 42060      ✗ 0    
     data_received..................: 1.3 GB  18 MB/s
     data_sent......................: 18 MB   248 kB/s
     http_req_blocked...............: avg=15.2µs   min=1.14µs  med=3.23µs   max=4.09ms   p(90)=4.85µs   p(95)=6.45µs   p(99.9)=2.61ms
     http_req_connecting............: avg=10.38µs  min=0s      med=0s       max=4.05ms   p(90)=0s       p(95)=0s       p(99.9)=2.58ms
     http_req_duration..............: avg=514.25ms min=8.43ms  med=582.41ms max=1.41s    p(90)=902.08ms p(95)=943.12ms p(99.9)=1.28s 
       { expected_response:true }...: avg=514.25ms min=8.43ms  med=582.41ms max=1.41s    p(90)=902.08ms p(95)=943.12ms p(99.9)=1.28s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 15020
     http_req_receiving.............: avg=149.65µs min=33.95µs med=87.86µs  max=174.37ms p(90)=126.32µs p(95)=140.42µs p(99.9)=1.63ms
     http_req_sending...............: avg=38.58µs  min=6.14µs  med=15.88µs  max=128.08ms p(90)=21.84µs  p(95)=27.01µs  p(99.9)=2.41ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=514.06ms min=8.31ms  med=582.33ms max=1.41s    p(90)=901.96ms p(95)=943.03ms p(99.9)=1.28s 
     http_reqs......................: 15020   202.204823/s
     iteration_duration.............: avg=550.84ms min=14.57ms med=613.5ms  max=1.41s    p(90)=906.42ms p(95)=950.02ms p(99.9)=1.29s 
     iterations.....................: 14020   188.742451/s
     success_rate...................: 100.00% ✓ 14020      ✗ 0    
     vus............................: 56      min=0        max=495
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

     checks.........................: 100.00% ✓ 436956      ✗ 0     
     data_received..................: 13 GB   207 MB/s
     data_sent......................: 176 MB  2.8 MB/s
     http_req_blocked...............: avg=31.37µs  min=1.02µs  med=2.97µs  max=73.48ms  p(90)=4.93µs   p(95)=6.31µs   p(99.9)=6.99ms  
     http_req_connecting............: avg=27.17µs  min=0s      med=0s      max=73.31ms  p(90)=0s       p(95)=0s       p(99.9)=6.93ms  
     http_req_duration..............: avg=96.84ms  min=1.58ms  med=89.78ms max=312.22ms p(90)=188.03ms p(95)=207.08ms p(99.9)=264.71ms
       { expected_response:true }...: avg=96.84ms  min=1.58ms  med=89.78ms max=312.22ms p(90)=188.03ms p(95)=207.08ms p(99.9)=264.71ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 146652
     http_req_receiving.............: avg=322.99µs min=29.83µs med=63.53µs max=167.37ms p(90)=215.51µs p(95)=455.81µs p(99.9)=35.14ms 
     http_req_sending...............: avg=96.81µs  min=5.55µs  med=11.62µs max=175.4ms  p(90)=23.17µs  p(95)=148.61µs p(99.9)=15.09ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=96.42ms  min=1.51ms  med=89.47ms max=312.02ms p(90)=187.46ms p(95)=206.25ms p(99.9)=260.12ms
     http_reqs......................: 146652  2366.813479/s
     iteration_duration.............: avg=97.89ms  min=4.18ms  med=90.94ms max=317.9ms  p(90)=188.83ms p(95)=207.8ms  p(99.9)=268.2ms 
     iterations.....................: 145652  2350.674501/s
     success_rate...................: 100.00% ✓ 145652      ✗ 0     
     vus............................: 55      min=0         max=498 
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

     checks.........................: 100.00% ✓ 343392      ✗ 0     
     data_received..................: 10 GB   163 MB/s
     data_sent......................: 139 MB  2.2 MB/s
     http_req_blocked...............: avg=25.68µs  min=1.03µs  med=2.75µs   max=87.43ms  p(90)=4.39µs   p(95)=5.49µs   p(99.9)=3ms     
     http_req_connecting............: avg=22.16µs  min=0s      med=0s       max=87.36ms  p(90)=0s       p(95)=0s       p(99.9)=2.74ms  
     http_req_duration..............: avg=123.35ms min=1.82ms  med=111.29ms max=902.56ms p(90)=236.39ms p(95)=270.96ms p(99.9)=568.08ms
       { expected_response:true }...: avg=123.35ms min=1.82ms  med=111.29ms max=902.56ms p(90)=236.39ms p(95)=270.96ms p(99.9)=568.08ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 115464
     http_req_receiving.............: avg=2.01ms   min=52.79µs med=121.41µs max=526.31ms p(90)=1.7ms    p(95)=4.6ms    p(99.9)=157.82ms
     http_req_sending...............: avg=82.43µs  min=5.41µs  med=10.74µs  max=253.76ms p(90)=19.7µs   p(95)=121.45µs p(99.9)=9.28ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=121.24ms min=1.73ms  med=109.84ms max=776.96ms p(90)=233.69ms p(95)=264.46ms p(99.9)=562.4ms 
     http_reqs......................: 115464  1855.286656/s
     iteration_duration.............: avg=124.7ms  min=2.93ms  med=112.85ms max=902.78ms p(90)=237.13ms p(95)=271.89ms p(99.9)=568.51ms
     iterations.....................: 114464  1839.21856/s
     success_rate...................: 100.00% ✓ 114464      ✗ 0     
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

     checks.........................: 100.00% ✓ 213915      ✗ 0    
     data_received..................: 6.3 GB  101 MB/s
     data_sent......................: 87 MB   1.4 MB/s
     http_req_blocked...............: avg=7.37µs   min=1.11µs  med=2.86µs   max=30.29ms  p(90)=4.7µs    p(95)=5.78µs   p(99.9)=653.83µs
     http_req_connecting............: avg=3.75µs   min=0s      med=0s       max=30.23ms  p(90)=0s       p(95)=0s       p(99.9)=557.29µs
     http_req_duration..............: avg=197.32ms min=2.12ms  med=197.95ms max=594.42ms p(90)=365.96ms p(95)=390.9ms  p(99.9)=486.14ms
       { expected_response:true }...: avg=197.32ms min=2.12ms  med=197.95ms max=594.42ms p(90)=365.96ms p(95)=390.9ms  p(99.9)=486.14ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 72305
     http_req_receiving.............: avg=115.99µs min=30.95µs med=68.24µs  max=167.22ms p(90)=106.78µs p(95)=123.85µs p(99.9)=3.18ms  
     http_req_sending...............: avg=30.66µs  min=5.59µs  med=12.33µs  max=66.22ms  p(90)=19.52µs  p(95)=23.36µs  p(99.9)=3.35ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=197.18ms min=2.05ms  med=197.7ms  max=594.31ms p(90)=365.82ms p(95)=390.82ms p(99.9)=486.06ms
     http_reqs......................: 72305   1155.179346/s
     iteration_duration.............: avg=200.34ms min=4.52ms  med=201.21ms max=594.56ms p(90)=366.82ms p(95)=391.64ms p(99.9)=486.99ms
     iterations.....................: 71305   1139.202866/s
     success_rate...................: 100.00% ✓ 71305       ✗ 0    
     vus............................: 84      min=0         max=497
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

     checks.........................: 100.00% ✓ 88938      ✗ 0    
     data_received..................: 2.7 GB  41 MB/s
     data_sent......................: 37 MB   564 kB/s
     http_req_blocked...............: avg=10.9µs   min=1.13µs  med=3.42µs   max=24.98ms p(90)=5.24µs   p(95)=6.35µs   p(99.9)=1.83ms  
     http_req_connecting............: avg=6.41µs   min=0s      med=0s       max=24.93ms p(90)=0s       p(95)=0s       p(99.9)=1.81ms  
     http_req_duration..............: avg=468.93ms min=4.19ms  med=437.77ms max=1.77s   p(90)=930.08ms p(95)=1.01s    p(99.9)=1.43s   
       { expected_response:true }...: avg=468.93ms min=4.19ms  med=437.77ms max=1.77s   p(90)=930.08ms p(95)=1.01s    p(99.9)=1.43s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 30646
     http_req_receiving.............: avg=94.67µs  min=31.53µs med=84.29µs  max=92.99ms p(90)=120.45µs p(95)=134.97µs p(99.9)=883.61µs
     http_req_sending...............: avg=31.84µs  min=5.99µs  med=15.17µs  max=67.76ms p(90)=22.35µs  p(95)=25.61µs  p(99.9)=3.36ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=468.81ms min=4.12ms  med=437.67ms max=1.77s   p(90)=929.9ms  p(95)=1.01s    p(99.9)=1.43s   
     http_reqs......................: 30646   469.54997/s
     iteration_duration.............: avg=484.99ms min=29.11ms med=458.22ms max=1.77s   p(90)=935.2ms  p(95)=1.01s    p(99.9)=1.44s   
     iterations.....................: 29646   454.228233/s
     success_rate...................: 100.00% ✓ 29646      ✗ 0    
     vus............................: 71      min=0        max=495
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

     checks.........................: 100.00% ✓ 43947      ✗ 0    
     data_received..................: 1.4 GB  20 MB/s
     data_sent......................: 19 MB   275 kB/s
     http_req_blocked...............: avg=15.9µs   min=1.28µs  med=3.76µs   max=29.73ms p(90)=5.72µs   p(95)=7.41µs   p(99.9)=1.68ms
     http_req_connecting............: avg=10.28µs  min=0s      med=0s       max=29.67ms p(90)=0s       p(95)=0s       p(99.9)=1.54ms
     http_req_duration..............: avg=932.39ms min=6.38ms  med=851.39ms max=5.78s   p(90)=1.85s    p(95)=2.06s    p(99.9)=4.92s 
       { expected_response:true }...: avg=932.39ms min=6.38ms  med=851.39ms max=5.78s   p(90)=1.85s    p(95)=2.06s    p(99.9)=4.92s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 15649
     http_req_receiving.............: avg=107.85µs min=35.52µs med=101.58µs max=8.82ms  p(90)=142.12µs p(95)=155.76µs p(99.9)=1.01ms
     http_req_sending...............: avg=38.41µs  min=6.04µs  med=18.43µs  max=73.62ms p(90)=24.5µs   p(95)=29.45µs  p(99.9)=4.49ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=932.24ms min=6.27ms  med=851.3ms  max=5.78s   p(90)=1.85s    p(95)=2.06s    p(99.9)=4.92s 
     http_reqs......................: 15649   229.323904/s
     iteration_duration.............: avg=996.05ms min=43.18ms med=925.39ms max=5.78s   p(90)=1.87s    p(95)=2.07s    p(99.9)=4.93s 
     iterations.....................: 14649   214.669683/s
     success_rate...................: 100.00% ✓ 14649      ✗ 0    
     vus............................: 70      min=0        max=500
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

     checks.........................: 100.00% ✓ 39582      ✗ 0    
     data_received..................: 1.2 GB  18 MB/s
     data_sent......................: 17 MB   243 kB/s
     http_req_blocked...............: avg=17.37µs  min=1.29µs  med=3.64µs   max=33.59ms p(90)=5.39µs   p(95)=7.06µs   p(99.9)=2.36ms  
     http_req_connecting............: avg=11.96µs  min=0s      med=0s       max=33.52ms p(90)=0s       p(95)=0s       p(99.9)=2.33ms  
     http_req_duration..............: avg=1.02s    min=8.69ms  med=939.61ms max=4.4s    p(90)=2.07s    p(95)=2.19s    p(99.9)=3.83s   
       { expected_response:true }...: avg=1.02s    min=8.69ms  med=939.61ms max=4.4s    p(90)=2.07s    p(95)=2.19s    p(99.9)=3.83s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 14194
     http_req_receiving.............: avg=102.44µs min=34.93µs med=96.1µs   max=18.02ms p(90)=136.64µs p(95)=149.51µs p(99.9)=648.06µs
     http_req_sending...............: avg=31.09µs  min=6µs     med=17.55µs  max=22.67ms p(90)=23.4µs   p(95)=28.4µs   p(99.9)=3.44ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=1.02s    min=8.58ms  med=939.47ms max=4.4s    p(90)=2.07s    p(95)=2.19s    p(99.9)=3.83s   
     http_reqs......................: 14194   202.53278/s
     iteration_duration.............: avg=1.1s     min=33.88ms med=1.05s    max=4.41s   p(90)=2.08s    p(95)=2.2s     p(99.9)=3.9s    
     iterations.....................: 13194   188.263879/s
     success_rate...................: 100.00% ✓ 13194      ✗ 0    
     vus............................: 61      min=0        max=499
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-177-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

