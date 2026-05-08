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
| hive-router | v0.0.49 | 2,779 | 2,869 | 2,712 | 2.0% |  |
| hotchocolate | 16.1.0-p.1.10 | 2,088 | 2,110 | 2,056 | 0.9% |  |
| cosmo | 0.307.0 | 1,192 | 1,196 | 1,185 | 0.5% | non-compatible response (19 across 6/9 runs) |
| hive-gateway-router-runtime | 2.5.25 | 489 | 492 | 483 | 0.7% |  |
| hive-gateway | 2.5.25 | 227 | 229 | 217 | 1.7% |  |
| apollo-gateway | 2.13.3 | 203 | 206 | 200 | 0.8% |  |
| apollo-router | v2.13.1 | — | — | — | — | non-compatible response (17895 across 9/9 runs) |
| grafbase | 0.53.3 | — | — | — | — | non-compatible response (521229 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.49 | 2,206 | 2,293 | 2,138 | 2.4% | non-compatible response (4 across 1/9 runs) |
| hotchocolate | 16.1.0-p.1.10 | 1,897 | 1,919 | 1,860 | 1.0% |  |
| cosmo | 0.307.0 | 1,147 | 1,147 | 1,136 | 0.7% | non-compatible response (13 across 7/9 runs) |
| hive-gateway-router-runtime | 2.5.25 | 466 | 475 | 462 | 0.9% |  |
| hive-gateway | 2.5.25 | 227 | 231 | 224 | 1.0% |  |
| apollo-gateway | 2.13.3 | 209 | 211 | 208 | 0.4% |  |
| apollo-router | v2.13.1 | — | — | — | — | non-compatible response (17006 across 9/9 runs) |
| grafbase | 0.53.3 | — | — | — | — | non-compatible response (294840 across 9/9 runs) |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.49)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 512772      ✗ 0     
     data_received..................: 15 GB   244 MB/s
     data_sent......................: 207 MB  3.3 MB/s
     http_req_blocked...............: avg=38.53µs  min=1.02µs  med=2.7µs   max=101.12ms p(90)=4.33µs   p(95)=5.53µs   p(99.9)=9.67ms  
     http_req_connecting............: avg=34.81µs  min=0s      med=0s      max=100.95ms p(90)=0s       p(95)=0s       p(99.9)=8.92ms  
     http_req_duration..............: avg=82.51ms  min=1.65ms  med=75.42ms max=424.69ms p(90)=161.63ms p(95)=185.63ms p(99.9)=261.06ms
       { expected_response:true }...: avg=82.51ms  min=1.65ms  med=75.42ms max=424.69ms p(90)=161.63ms p(95)=185.63ms p(99.9)=261.06ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 171924
     http_req_receiving.............: avg=616.41µs min=29.74µs med=58.42µs max=271.31ms p(90)=287.7µs  p(95)=460.6µs  p(99.9)=61.81ms 
     http_req_sending...............: avg=101.45µs min=5.54µs  med=10.62µs max=227.93ms p(90)=20.32µs  p(95)=142.86µs p(99.9)=17.21ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=81.79ms  min=1.6ms   med=75.01ms max=289.53ms p(90)=160.47ms p(95)=183ms    p(99.9)=253.92ms
     http_reqs......................: 171924  2779.084785/s
     iteration_duration.............: avg=83.4ms   min=2.55ms  med=76.31ms max=434.98ms p(90)=162.36ms p(95)=186.76ms p(99.9)=264.88ms
     iterations.....................: 170924  2762.920173/s
     success_rate...................: 100.00% ✓ 170924      ✗ 0     
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

     checks.........................: 100.00% ✓ 390726      ✗ 0     
     data_received..................: 12 GB   183 MB/s
     data_sent......................: 158 MB  2.5 MB/s
     http_req_blocked...............: avg=16.71µs  min=982ns  med=2.51µs   max=77.63ms  p(90)=3.91µs   p(95)=4.85µs   p(99.9)=2.08ms  
     http_req_connecting............: avg=13.31µs  min=0s     med=0s       max=77.54ms  p(90)=0s       p(95)=0s       p(99.9)=1.99ms  
     http_req_duration..............: avg=108.45ms min=2.41ms med=99.76ms  max=914.55ms p(90)=207.78ms p(95)=244.12ms p(99.9)=530.11ms
       { expected_response:true }...: avg=108.45ms min=2.41ms med=99.76ms  max=914.55ms p(90)=207.78ms p(95)=244.12ms p(99.9)=530.11ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 131242
     http_req_receiving.............: avg=2.3ms    min=52.2µs med=115.61µs max=341.63ms p(90)=1.38ms   p(95)=5.02ms   p(99.9)=186.68ms
     http_req_sending...............: avg=69.1µs   min=5.43µs med=10.08µs  max=80.54ms  p(90)=18.5µs   p(95)=128.61µs p(99.9)=9.7ms   
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=106.07ms min=2.32ms med=98.7ms   max=900.06ms p(90)=204.1ms  p(95)=236.8ms  p(99.9)=433.49ms
     http_reqs......................: 131242  2088.877655/s
     iteration_duration.............: avg=109.55ms min=3.27ms med=101.14ms max=914.78ms p(90)=208.47ms p(95)=245.01ms p(99.9)=530.97ms
     iterations.....................: 130242  2072.961426/s
     success_rate...................: 100.00% ✓ 130242      ✗ 0     
     vus............................: 97      min=0         max=500 
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

     checks.........................: 100.00% ✓ 220473      ✗ 0    
     data_received..................: 6.5 GB  105 MB/s
     data_sent......................: 89 MB   1.4 MB/s
     http_req_blocked...............: avg=13.86µs  min=1.1µs   med=2.31µs   max=26.06ms  p(90)=3.84µs   p(95)=4.76µs   p(99.9)=659.99µs
     http_req_connecting............: avg=10.76µs  min=0s      med=0s       max=26.02ms  p(90)=0s       p(95)=0s       p(99.9)=568.14µs
     http_req_duration..............: avg=191.55ms min=2.03ms  med=193.62ms max=540.56ms p(90)=354.95ms p(95)=380.84ms p(99.9)=468.69ms
       { expected_response:true }...: avg=191.55ms min=2.03ms  med=193.62ms max=540.56ms p(90)=354.95ms p(95)=380.84ms p(99.9)=468.69ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 74491
     http_req_receiving.............: avg=89.88µs  min=29.76µs med=60.98µs  max=38.71ms  p(90)=95.02µs  p(95)=109.78µs p(99.9)=2.22ms  
     http_req_sending...............: avg=36.8µs   min=5.35µs  med=10.6µs   max=141.1ms  p(90)=16.64µs  p(95)=20.3µs   p(99.9)=4.45ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=191.42ms min=1.97ms  med=193.44ms max=540.51ms p(90)=354.83ms p(95)=380.75ms p(99.9)=468.59ms
     http_reqs......................: 74491   1192.182717/s
     iteration_duration.............: avg=194.42ms min=3.06ms  med=196.62ms max=540.71ms p(90)=355.91ms p(95)=381.43ms p(99.9)=469.2ms 
     iterations.....................: 73491   1176.178331/s
     success_rate...................: 100.00% ✓ 73491       ✗ 0    
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

     checks.........................: 100.00% ✓ 92394      ✗ 0    
     data_received..................: 2.8 GB  43 MB/s
     data_sent......................: 38 MB   588 kB/s
     http_req_blocked...............: avg=10.13µs  min=1.19µs  med=3.1µs    max=7.98ms   p(90)=4.94µs   p(95)=6.03µs   p(99.9)=2.15ms 
     http_req_connecting............: avg=5.93µs   min=0s      med=0s       max=7.74ms   p(90)=0s       p(95)=0s       p(99.9)=2.12ms 
     http_req_duration..............: avg=451.46ms min=4.09ms  med=416.76ms max=1.76s    p(90)=893.01ms p(95)=969.71ms p(99.9)=1.38s  
       { expected_response:true }...: avg=451.46ms min=4.09ms  med=416.76ms max=1.76s    p(90)=893.01ms p(95)=969.71ms p(99.9)=1.38s  
     http_req_failed................: 0.00%   ✓ 0          ✗ 31798
     http_req_receiving.............: avg=169.14µs min=33.32µs med=79.47µs  max=193.86ms p(90)=116.85µs p(95)=132.03µs p(99.9)=16.43ms
     http_req_sending...............: avg=25.97µs  min=5.76µs  med=14.23µs  max=15.52ms  p(90)=21.64µs  p(95)=25.04µs  p(99.9)=2.78ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=451.27ms min=4.02ms  med=416.65ms max=1.76s    p(90)=892.83ms p(95)=969.59ms p(99.9)=1.38s  
     http_reqs......................: 31798   489.469686/s
     iteration_duration.............: avg=466.36ms min=7.28ms  med=434.04ms max=1.77s    p(90)=896.71ms p(95)=972.84ms p(99.9)=1.38s  
     iterations.....................: 30798   474.07659/s
     success_rate...................: 100.00% ✓ 30798      ✗ 0    
     vus............................: 56      min=0        max=499
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

     checks.........................: 100.00% ✓ 43692      ✗ 0    
     data_received..................: 1.4 GB  20 MB/s
     data_sent......................: 19 MB   274 kB/s
     http_req_blocked...............: avg=12.62µs  min=1.38µs  med=3.81µs   max=3.95ms  p(90)=5.72µs   p(95)=7.47µs   p(99.9)=1.47ms  
     http_req_connecting............: avg=6.83µs   min=0s      med=0s       max=2.68ms  p(90)=0s       p(95)=0s       p(99.9)=1.39ms  
     http_req_duration..............: avg=907.19ms min=6.2ms   med=789.54ms max=21.02s  p(90)=1.48s    p(95)=1.63s    p(99.9)=19.99s  
       { expected_response:true }...: avg=907.19ms min=6.2ms   med=789.54ms max=21.02s  p(90)=1.48s    p(95)=1.63s    p(99.9)=19.99s  
     http_req_failed................: 0.00%   ✓ 0          ✗ 15564
     http_req_receiving.............: avg=110.04µs min=39.29µs med=101.4µs  max=40.91ms p(90)=141.54µs p(95)=154.56µs p(99.9)=940.28µs
     http_req_sending...............: avg=31.82µs  min=6.3µs   med=18.36µs  max=41.82ms p(90)=24.6µs   p(95)=29.51µs  p(99.9)=2.54ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=907.04ms min=6.07ms  med=789.42ms max=21.02s  p(90)=1.48s    p(95)=1.63s    p(99.9)=19.99s  
     http_reqs......................: 15564   227.793556/s
     iteration_duration.............: avg=969.47ms min=60.08ms med=847.06ms max=21.02s  p(90)=1.5s     p(95)=1.64s    p(99.9)=20.06s  
     iterations.....................: 14564   213.15763/s
     success_rate...................: 100.00% ✓ 14564      ✗ 0    
     vus............................: 67      min=0        max=498
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

     checks.........................: 100.00% ✓ 42348      ✗ 0    
     data_received..................: 1.3 GB  18 MB/s
     data_sent......................: 19 MB   250 kB/s
     http_req_blocked...............: avg=15.88µs  min=1.11µs  med=3.6µs    max=5.77ms   p(90)=5.34µs   p(95)=7.01µs   p(99.9)=2.82ms 
     http_req_connecting............: avg=10.42µs  min=0s      med=0s       max=5.52ms   p(90)=0s       p(95)=0s       p(99.9)=2.8ms  
     http_req_duration..............: avg=464.7ms  min=8.36ms  med=533.66ms max=1.31s    p(90)=790.64ms p(95)=861.84ms p(99.9)=1.2s   
       { expected_response:true }...: avg=464.7ms  min=8.36ms  med=533.66ms max=1.31s    p(90)=790.64ms p(95)=861.84ms p(99.9)=1.2s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 15116
     http_req_receiving.............: avg=262.74µs min=33.29µs med=96.17µs  max=189.06ms p(90)=136.81µs p(95)=150.36µs p(99.9)=77.56ms
     http_req_sending...............: avg=29.31µs  min=5.79µs  med=17.61µs  max=9.12ms   p(90)=23.4µs   p(95)=28.6µs   p(99.9)=3.11ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=464.41ms min=8.24ms  med=533.52ms max=1.31s    p(90)=790.52ms p(95)=861.72ms p(99.9)=1.2s   
     http_reqs......................: 15116   203.371412/s
     iteration_duration.............: avg=497.53ms min=14.49ms med=559.74ms max=1.32s    p(90)=796.32ms p(95)=869.32ms p(99.9)=1.21s  
     iterations.....................: 14116   189.917362/s
     success_rate...................: 100.00% ✓ 14116      ✗ 0    
     vus............................: 63      min=0        max=496
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

     checks.........................: 100.00% ✓ 408060      ✗ 0     
     data_received..................: 12 GB   193 MB/s
     data_sent......................: 165 MB  2.6 MB/s
     http_req_blocked...............: avg=21.49µs  min=992ns   med=2.41µs  max=58.87ms  p(90)=3.98µs   p(95)=5.18µs   p(99.9)=2.58ms  
     http_req_connecting............: avg=18.23µs  min=0s      med=0s      max=58.71ms  p(90)=0s       p(95)=0s       p(99.9)=2.51ms  
     http_req_duration..............: avg=103.82ms min=1.61ms  med=97.77ms max=359.92ms p(90)=200.58ms p(95)=218.77ms p(99.9)=275.99ms
       { expected_response:true }...: avg=103.82ms min=1.61ms  med=97.77ms max=359.92ms p(90)=200.58ms p(95)=218.77ms p(99.9)=275.99ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 137020
     http_req_receiving.............: avg=218.1µs  min=29.65µs med=60.93µs max=104.72ms p(90)=167.41µs p(95)=406.38µs p(99.9)=27.63ms 
     http_req_sending...............: avg=72.9µs   min=5.5µs   med=10.73µs max=104.27ms p(90)=20.38µs  p(95)=135.03µs p(99.9)=10.04ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=103.53ms min=1.56ms  med=97.55ms max=359.24ms p(90)=199.97ms p(95)=218ms    p(99.9)=274.15ms
     http_reqs......................: 137020  2206.329696/s
     iteration_duration.............: avg=104.86ms min=3.96ms  med=98.89ms max=401.84ms p(90)=201.17ms p(95)=219.24ms p(99.9)=276.48ms
     iterations.....................: 136020  2190.227451/s
     success_rate...................: 100.00% ✓ 136020      ✗ 0     
     vus............................: 61      min=0         max=497 
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

     checks.........................: 100.00% ✓ 350844      ✗ 0     
     data_received..................: 10 GB   166 MB/s
     data_sent......................: 142 MB  2.3 MB/s
     http_req_blocked...............: avg=21.57µs  min=972ns   med=2.61µs   max=125.64ms p(90)=4.14µs   p(95)=5.21µs   p(99.9)=1.78ms  
     http_req_connecting............: avg=18.23µs  min=0s      med=0s       max=125.55ms p(90)=0s       p(95)=0s       p(99.9)=1.6ms   
     http_req_duration..............: avg=120.65ms min=1.73ms  med=110.86ms max=877.38ms p(90)=229.61ms p(95)=260.44ms p(99.9)=608.71ms
       { expected_response:true }...: avg=120.65ms min=1.73ms  med=110.86ms max=877.38ms p(90)=229.61ms p(95)=260.44ms p(99.9)=608.71ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 117948
     http_req_receiving.............: avg=1.51ms   min=51.55µs med=116.06µs max=271.54ms p(90)=1.65ms   p(95)=4.41ms   p(99.9)=106.33ms
     http_req_sending...............: avg=62.1µs   min=5.27µs  med=10.46µs  max=53.75ms  p(90)=19.15µs  p(95)=118.43µs p(99.9)=8.36ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=119.07ms min=1.65ms  med=109.68ms max=877.29ms p(90)=227.51ms p(95)=256.36ms p(99.9)=607.07ms
     http_reqs......................: 117948  1897.238093/s
     iteration_duration.............: avg=122.02ms min=3.1ms   med=112.45ms max=877.59ms p(90)=230.3ms  p(95)=261.13ms p(99.9)=608.94ms
     iterations.....................: 116948  1881.152716/s
     success_rate...................: 100.00% ✓ 116948      ✗ 0     
     vus............................: 64      min=0         max=496 
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

     checks.........................: 100.00% ✓ 212292      ✗ 0    
     data_received..................: 6.3 GB  100 MB/s
     data_sent......................: 86 MB   1.4 MB/s
     http_req_blocked...............: avg=7.18µs   min=1.1µs   med=2.75µs   max=13.78ms  p(90)=4.53µs   p(95)=5.51µs   p(99.9)=1.06ms  
     http_req_connecting............: avg=3.68µs   min=0s      med=0s       max=13.72ms  p(90)=0s       p(95)=0s       p(99.9)=869.37µs
     http_req_duration..............: avg=198.84ms min=2.12ms  med=200.08ms max=631.5ms  p(90)=365.09ms p(95)=394.43ms p(99.9)=531.68ms
       { expected_response:true }...: avg=198.84ms min=2.12ms  med=200.08ms max=631.5ms  p(90)=365.09ms p(95)=394.43ms p(99.9)=531.68ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 71764
     http_req_receiving.............: avg=81.59µs  min=30.22µs med=66.5µs   max=41.93ms  p(90)=103.85µs p(95)=118.87µs p(99.9)=1.51ms  
     http_req_sending...............: avg=31.09µs  min=5.51µs  med=12.03µs  max=211.78ms p(90)=18.9µs   p(95)=22.5µs   p(99.9)=3.15ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=198.73ms min=2.04ms  med=199.98ms max=631.41ms p(90)=364.99ms p(95)=394.31ms p(99.9)=531.63ms
     http_reqs......................: 71764   1147.061704/s
     iteration_duration.............: avg=201.91ms min=4.64ms  med=203.39ms max=631.68ms p(90)=366.08ms p(95)=395.41ms p(99.9)=532.11ms
     iterations.....................: 70764   1131.0779/s
     success_rate...................: 100.00% ✓ 70764       ✗ 0    
     vus............................: 83      min=0         max=495
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

     checks.........................: 100.00% ✓ 88389      ✗ 0    
     data_received..................: 2.7 GB  41 MB/s
     data_sent......................: 37 MB   560 kB/s
     http_req_blocked...............: avg=10.97µs  min=1.12µs  med=3.3µs    max=28.2ms  p(90)=5.15µs   p(95)=6.25µs   p(99.9)=1.23ms
     http_req_connecting............: avg=6.59µs   min=0s      med=0s       max=28.13ms p(90)=0s       p(95)=0s       p(99.9)=1.18ms
     http_req_duration..............: avg=471.49ms min=4.21ms  med=437.79ms max=2.2s    p(90)=932.66ms p(95)=1.01s    p(99.9)=1.53s 
       { expected_response:true }...: avg=471.49ms min=4.21ms  med=437.79ms max=2.2s    p(90)=932.66ms p(95)=1.01s    p(99.9)=1.53s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 30463
     http_req_receiving.............: avg=98.6µs   min=31.95µs med=82.72µs  max=110.2ms p(90)=119.58µs p(95)=134.79µs p(99.9)=1.22ms
     http_req_sending...............: avg=27.83µs  min=5.71µs  med=15.18µs  max=24.96ms p(90)=22.29µs  p(95)=25.67µs  p(99.9)=3.44ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=471.36ms min=4.13ms  med=437.65ms max=2.2s    p(90)=932.58ms p(95)=1.01s    p(99.9)=1.53s 
     http_reqs......................: 30463   466.386447/s
     iteration_duration.............: avg=487.7ms  min=27.29ms med=456.21ms max=2.2s    p(90)=937.87ms p(95)=1.01s    p(99.9)=1.54s 
     iterations.....................: 29463   451.076516/s
     success_rate...................: 100.00% ✓ 29463      ✗ 0    
     vus............................: 72      min=0        max=497
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

     checks.........................: 100.00% ✓ 43779      ✗ 0    
     data_received..................: 1.4 GB  20 MB/s
     data_sent......................: 19 MB   274 kB/s
     http_req_blocked...............: avg=13.26µs  min=1.3µs   med=3.91µs   max=4.72ms  p(90)=5.97µs   p(95)=7.82µs   p(99.9)=1.41ms
     http_req_connecting............: avg=7.5µs    min=0s      med=0s       max=4.66ms  p(90)=0s       p(95)=0s       p(99.9)=1.39ms
     http_req_duration..............: avg=935.29ms min=6.4ms   med=857.13ms max=5.27s   p(90)=1.84s    p(95)=2.05s    p(99.9)=4.76s 
       { expected_response:true }...: avg=935.29ms min=6.4ms   med=857.13ms max=5.27s   p(90)=1.84s    p(95)=2.05s    p(99.9)=4.76s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 15593
     http_req_receiving.............: avg=113.35µs min=37.88µs med=103.17µs max=26.76ms p(90)=144.37µs p(95)=157.57µs p(99.9)=1.25ms
     http_req_sending...............: avg=32.9µs   min=6.18µs  med=19.23µs  max=18.12ms p(90)=25.41µs  p(95)=31.11µs  p(99.9)=3.3ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=935.14ms min=6.3ms   med=856.91ms max=5.27s   p(90)=1.84s    p(95)=2.05s    p(99.9)=4.76s 
     http_reqs......................: 15593   227.881886/s
     iteration_duration.............: avg=999.41ms min=28.38ms med=934.93ms max=5.28s   p(90)=1.85s    p(95)=2.07s    p(99.9)=4.8s  
     iterations.....................: 14593   213.267515/s
     success_rate...................: 100.00% ✓ 14593      ✗ 0    
     vus............................: 78      min=0        max=500
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

     checks.........................: 100.00% ✓ 40881      ✗ 0    
     data_received..................: 1.3 GB  18 MB/s
     data_sent......................: 18 MB   251 kB/s
     http_req_blocked...............: avg=15.11µs  min=1.33µs  med=3.72µs   max=20.53ms p(90)=5.56µs   p(95)=7.36µs   p(99.9)=1.71ms  
     http_req_connecting............: avg=9.33µs   min=0s      med=0s       max=20.47ms p(90)=0s       p(95)=0s       p(99.9)=1.57ms  
     http_req_duration..............: avg=996.9ms  min=8.68ms  med=913.36ms max=4.21s   p(90)=2.02s    p(95)=2.15s    p(99.9)=3.64s   
       { expected_response:true }...: avg=996.9ms  min=8.68ms  med=913.36ms max=4.21s   p(90)=2.02s    p(95)=2.15s    p(99.9)=3.64s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 14627
     http_req_receiving.............: avg=112.56µs min=33.73µs med=97.91µs  max=83.09ms p(90)=138.26µs p(95)=151.87µs p(99.9)=999.75µs
     http_req_sending...............: avg=39.95µs  min=5.87µs  med=18.64µs  max=92.07ms p(90)=24.63µs  p(95)=30.4µs   p(99.9)=2.66ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=996.75ms min=8.57ms  med=913.21ms max=4.21s   p(90)=2.02s    p(95)=2.15s    p(99.9)=3.64s   
     http_reqs......................: 14627   209.092325/s
     iteration_duration.............: avg=1.06s    min=81.62ms med=998.97ms max=4.21s   p(90)=2.04s    p(95)=2.16s    p(99.9)=3.65s   
     iterations.....................: 13627   194.797369/s
     success_rate...................: 100.00% ✓ 13627      ✗ 0    
     vus............................: 35      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-177-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

