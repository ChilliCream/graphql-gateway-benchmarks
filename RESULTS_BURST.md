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
| hive-router | v0.0.43 | 2,841 | 2,951 | 2,800 | 1.8% |  |
| hotchocolate | 16.0.0-rc.1.25 | 1,964 | 1,999 | 1,943 | 1.0% |  |
| hive-gateway-router-runtime | 2.5.14 | 570 | 575 | 560 | 0.8% |  |
| hive-gateway | 2.5.14 | 248 | 251 | 245 | 0.9% |  |
| apollo-gateway | 2.13.3 | 200 | 205 | 195 | 1.5% |  |
| apollo-router | v2.12.1 | — | — | — | — | non-compatible response (36392 across 9/9 runs) |
| cosmo | 0.298.0 | — | — | — | — | non-compatible response (14 across 9/9 runs) |
| grafbase | 0.53.2 | — | — | — | — | non-compatible response (508997 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.43 | 2,228 | 2,333 | 2,182 | 2.2% | non-compatible response (6 across 1/9 runs) |
| hotchocolate | 16.0.0-rc.1.25 | 1,856 | 1,895 | 1,835 | 1.2% |  |
| cosmo | 0.298.0 | 1,115 | 1,125 | 1,105 | 0.9% | non-compatible response (16 across 6/9 runs) |
| hive-gateway-router-runtime | 2.5.14 | 533 | 538 | 522 | 1.0% |  |
| hive-gateway | 2.5.14 | 243 | 247 | 242 | 0.6% |  |
| apollo-gateway | 2.13.3 | 208 | 211 | 206 | 0.8% |  |
| apollo-router | v2.12.1 | — | — | — | — | non-compatible response (28095 across 9/9 runs) |
| grafbase | 0.53.2 | — | — | — | — | non-compatible response (274746 across 9/9 runs) |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.43)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 523584      ✗ 0     
     data_received..................: 15 GB   249 MB/s
     data_sent......................: 211 MB  3.4 MB/s
     http_req_blocked...............: avg=33.91µs  min=1.05µs  med=2.73µs  max=94.24ms  p(90)=4.35µs   p(95)=5.54µs   p(99.9)=6.33ms  
     http_req_connecting............: avg=30.18µs  min=0s      med=0s      max=94.15ms  p(90)=0s       p(95)=0s       p(99.9)=5.96ms  
     http_req_duration..............: avg=80.74ms  min=1.55ms  med=75.22ms max=375.27ms p(90)=156.9ms  p(95)=175.46ms p(99.9)=239.81ms
       { expected_response:true }...: avg=80.74ms  min=1.55ms  med=75.22ms max=375.27ms p(90)=156.9ms  p(95)=175.46ms p(99.9)=239.81ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 175528
     http_req_receiving.............: avg=535.36µs min=28.88µs med=57.5µs  max=106.77ms p(90)=272.89µs p(95)=445.06µs p(99.9)=53.13ms 
     http_req_sending...............: avg=99.31µs  min=5.42µs  med=10.34µs max=90.23ms  p(90)=19.76µs  p(95)=137.98µs p(99.9)=16.46ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=80.1ms   min=1.49ms  med=74.88ms max=374.51ms p(90)=155.79ms p(95)=173.26ms p(99.9)=229.45ms
     http_reqs......................: 175528  2841.393242/s
     iteration_duration.............: avg=81.67ms  min=2.1ms   med=76.32ms max=389.96ms p(90)=157.66ms p(95)=176.44ms p(99.9)=243.19ms
     iterations.....................: 174528  2825.20555/s
     success_rate...................: 100.00% ✓ 174528      ✗ 0     
     vus............................: 93      min=0         max=500 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (rust subgraphs) (16.0.0-rc.1.25)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 367452      ✗ 0     
     data_received..................: 11 GB   172 MB/s
     data_sent......................: 148 MB  2.4 MB/s
     http_req_blocked...............: avg=14.1µs   min=1.04µs  med=2.66µs   max=50.19ms  p(90)=4.06µs   p(95)=5.01µs   p(99.9)=1.64ms  
     http_req_connecting............: avg=10.79µs  min=0s      med=0s       max=50.05ms  p(90)=0s       p(95)=0s       p(99.9)=1.58ms  
     http_req_duration..............: avg=115.26ms min=2.42ms  med=111.26ms max=586.91ms p(90)=219.9ms  p(95)=243.2ms  p(99.9)=376.65ms
       { expected_response:true }...: avg=115.26ms min=2.42ms  med=111.26ms max=586.91ms p(90)=219.9ms  p(95)=243.2ms  p(99.9)=376.65ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 123484
     http_req_receiving.............: avg=1.38ms   min=53.33µs med=164.9µs  max=228.5ms  p(90)=1.34ms   p(95)=3.16ms   p(99.9)=122.53ms
     http_req_sending...............: avg=63.14µs  min=5.37µs  med=10.38µs  max=73.72ms  p(90)=18.75µs  p(95)=125.27µs p(99.9)=8.37ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=113.82ms min=2.33ms  med=109.72ms max=586.81ms p(90)=217.89ms p(95)=240.43ms p(99.9)=369.67ms
     http_reqs......................: 123484  1964.865265/s
     iteration_duration.............: avg=116.47ms min=3.94ms  med=112.81ms max=587.07ms p(90)=220.5ms  p(95)=243.76ms p(99.9)=377.67ms
     iterations.....................: 122484  1948.953364/s
     success_rate...................: 100.00% ✓ 122484      ✗ 0     
     vus............................: 36      min=0         max=500 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (rust subgraphs) (2.5.14)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 107163     ✗ 0    
     data_received..................: 3.2 GB  50 MB/s
     data_sent......................: 44 MB   685 kB/s
     http_req_blocked...............: avg=7.69µs   min=1.22µs  med=3.07µs   max=8.14ms   p(90)=4.83µs   p(95)=5.85µs   p(99.9)=756.94µs
     http_req_connecting............: avg=3.56µs   min=0s      med=0s       max=8ms      p(90)=0s       p(95)=0s       p(99.9)=690.41µs
     http_req_duration..............: avg=390.4ms  min=3.65ms  med=357.11ms max=1.48s    p(90)=770.04ms p(95)=841.41ms p(99.9)=1.25s   
       { expected_response:true }...: avg=390.4ms  min=3.65ms  med=357.11ms max=1.48s    p(90)=770.04ms p(95)=841.41ms p(99.9)=1.25s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 36721
     http_req_receiving.............: avg=87.17µs  min=30.64µs med=75.91µs  max=67.94ms  p(90)=110.9µs  p(95)=124.06µs p(99.9)=905.58µs
     http_req_sending...............: avg=32.32µs  min=6.03µs  med=13.54µs  max=143.38ms p(90)=20.92µs  p(95)=24.24µs  p(99.9)=3.04ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=390.28ms min=3.59ms  med=357ms    max=1.48s    p(90)=769.85ms p(95)=841.3ms  p(99.9)=1.25s   
     http_reqs......................: 36721   570.313273/s
     iteration_duration.............: avg=401.59ms min=15.44ms med=372.25ms max=1.48s    p(90)=773.09ms p(95)=844.09ms p(99.9)=1.26s   
     iterations.....................: 35721   554.782289/s
     success_rate...................: 100.00% ✓ 35721      ✗ 0    
     vus............................: 75      min=0        max=497
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (rust subgraphs) (2.5.14)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 47250      ✗ 0    
     data_received..................: 1.5 GB  22 MB/s
     data_sent......................: 20 MB   299 kB/s
     http_req_blocked...............: avg=14.66µs  min=1.33µs  med=3.64µs   max=4.09ms  p(90)=5.47µs   p(95)=7.04µs   p(99.9)=2.58ms
     http_req_connecting............: avg=9.38µs   min=0s      med=0s       max=4.04ms  p(90)=0s       p(95)=0s       p(99.9)=2.55ms
     http_req_duration..............: avg=855.92ms min=5.62ms  med=761.44ms max=17.08s  p(90)=1.5s     p(95)=1.63s    p(99.9)=14.95s
       { expected_response:true }...: avg=855.92ms min=5.62ms  med=761.44ms max=17.08s  p(90)=1.5s     p(95)=1.63s    p(99.9)=14.95s
     http_req_failed................: 0.00%   ✓ 0          ✗ 16750
     http_req_receiving.............: avg=111.54µs min=35.91µs med=95.98µs  max=78.26ms p(90)=135.37µs p(95)=148.66µs p(99.9)=1.14ms
     http_req_sending...............: avg=36.08µs  min=6.24µs  med=17.77µs  max=61.45ms p(90)=23.92µs  p(95)=28.3µs   p(99.9)=2ms   
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=855.78ms min=5.53ms  med=761.27ms max=17.08s  p(90)=1.5s     p(95)=1.63s    p(99.9)=14.95s
     http_reqs......................: 16750   248.753161/s
     iteration_duration.............: avg=910.35ms min=60.58ms med=818.77ms max=17.08s  p(90)=1.52s    p(95)=1.64s    p(99.9)=14.99s
     iterations.....................: 15750   233.902226/s
     success_rate...................: 100.00% ✓ 15750      ✗ 0    
     vus............................: 74      min=0        max=498
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

     checks.........................: 100.00% ✓ 41664      ✗ 0    
     data_received..................: 1.3 GB  18 MB/s
     data_sent......................: 18 MB   246 kB/s
     http_req_blocked...............: avg=15.01µs  min=1.25µs  med=3.46µs   max=4.16ms  p(90)=5.2µs    p(95)=6.74µs   p(99.9)=2.36ms
     http_req_connecting............: avg=9.77µs   min=0s      med=0s       max=4.1ms   p(90)=0s       p(95)=0s       p(99.9)=2.33ms
     http_req_duration..............: avg=468.91ms min=8.34ms  med=478.87ms max=1.44s   p(90)=847.8ms  p(95)=885.51ms p(99.9)=1.21s 
       { expected_response:true }...: avg=468.91ms min=8.34ms  med=478.87ms max=1.44s   p(90)=847.8ms  p(95)=885.51ms p(99.9)=1.21s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 14888
     http_req_receiving.............: avg=109.02µs min=33.35µs med=92.18µs  max=37.99ms p(90)=132.71µs p(95)=145.59µs p(99.9)=1.51ms
     http_req_sending...............: avg=30.74µs  min=6.11µs  med=17.05µs  max=31.75ms p(90)=22.93µs  p(95)=27.71µs  p(99.9)=3.32ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=468.77ms min=8.24ms  med=478.77ms max=1.44s   p(90)=847.67ms p(95)=885.42ms p(99.9)=1.21s 
     http_reqs......................: 14888   200.173064/s
     iteration_duration.............: avg=502.47ms min=9.14ms  med=507.86ms max=1.44s   p(90)=851.94ms p(95)=890.82ms p(99.9)=1.22s 
     iterations.....................: 13888   186.727802/s
     success_rate...................: 100.00% ✓ 13888      ✗ 0    
     vus............................: 64      min=0        max=497
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.43)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 411108      ✗ 0     
     data_received..................: 12 GB   195 MB/s
     data_sent......................: 166 MB  2.7 MB/s
     http_req_blocked...............: avg=22.38µs  min=1.02µs med=2.43µs  max=99.41ms  p(90)=4.09µs   p(95)=5.31µs   p(99.9)=4.85ms  
     http_req_connecting............: avg=19.07µs  min=0s     med=0s      max=99.18ms  p(90)=0s       p(95)=0s       p(99.9)=4.5ms   
     http_req_duration..............: avg=103.05ms min=1.57ms med=98.11ms max=313.31ms p(90)=195.7ms  p(95)=213.52ms p(99.9)=265.09ms
       { expected_response:true }...: avg=103.05ms min=1.57ms med=98.11ms max=313.31ms p(90)=195.7ms  p(95)=213.52ms p(99.9)=265.09ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 138036
     http_req_receiving.............: avg=161.36µs min=29.2µs med=60.43µs max=75.99ms  p(90)=154.84µs p(95)=395.84µs p(99.9)=16.38ms 
     http_req_sending...............: avg=70.65µs  min=5.28µs med=10.63µs max=69.69ms  p(90)=19.96µs  p(95)=133.55µs p(99.9)=9.7ms   
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=102.82ms min=1.51ms med=97.91ms max=310.96ms p(90)=195.43ms p(95)=213.16ms p(99.9)=263.86ms
     http_reqs......................: 138036  2228.436934/s
     iteration_duration.............: avg=104.07ms min=4.98ms med=99.22ms max=340.88ms p(90)=196.19ms p(95)=214.06ms p(99.9)=266.51ms
     iterations.....................: 137036  2212.293052/s
     success_rate...................: 100.00% ✓ 137036      ✗ 0     
     vus............................: 54      min=0         max=499 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (.net subgraphs) (16.0.0-rc.1.25)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 343770      ✗ 0     
     data_received..................: 10 GB   163 MB/s
     data_sent......................: 139 MB  2.2 MB/s
     http_req_blocked...............: avg=13.27µs  min=1.03µs  med=2.58µs   max=38.19ms  p(90)=4.14µs   p(95)=5.13µs   p(99.9)=1.37ms  
     http_req_connecting............: avg=9.82µs   min=0s      med=0s       max=38.14ms  p(90)=0s       p(95)=0s       p(99.9)=1.22ms  
     http_req_duration..............: avg=123.21ms min=1.79ms  med=118.18ms max=731.26ms p(90)=233.67ms p(95)=257.91ms p(99.9)=548.85ms
       { expected_response:true }...: avg=123.21ms min=1.79ms  med=118.18ms max=731.26ms p(90)=233.67ms p(95)=257.91ms p(99.9)=548.85ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 115590
     http_req_receiving.............: avg=1.29ms   min=52.16µs med=159.79µs max=367.66ms p(90)=1.6ms    p(95)=3.53ms   p(99.9)=97.77ms 
     http_req_sending...............: avg=56.46µs  min=5.34µs  med=10.26µs  max=116.02ms p(90)=18.89µs  p(95)=119.98µs p(99.9)=7.33ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=121.86ms min=1.71ms  med=116.78ms max=731ms    p(90)=232.02ms p(95)=255.31ms p(99.9)=547.78ms
     http_reqs......................: 115590  1856.440003/s
     iteration_duration.............: avg=124.57ms min=2.95ms  med=119.81ms max=731.57ms p(90)=234.35ms p(95)=258.66ms p(99.9)=549.24ms
     iterations.....................: 114590  1840.379444/s
     success_rate...................: 100.00% ✓ 114590      ✗ 0     
     vus............................: 70      min=0         max=495 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (.net subgraphs) (0.298.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 206616      ✗ 0    
     data_received..................: 6.1 GB  98 MB/s
     data_sent......................: 84 MB   1.3 MB/s
     http_req_blocked...............: avg=7.95µs   min=1.1µs   med=2.85µs   max=54.13ms  p(90)=4.6µs    p(95)=5.57µs   p(99.9)=643.76µs
     http_req_connecting............: avg=4.28µs   min=0s      med=0s       max=54.07ms  p(90)=0s       p(95)=0s       p(99.9)=495.9µs 
     http_req_duration..............: avg=204.28ms min=2.07ms  med=205.61ms max=617.82ms p(90)=376.61ms p(95)=405.98ms p(99.9)=525.14ms
       { expected_response:true }...: avg=204.28ms min=2.07ms  med=205.61ms max=617.82ms p(90)=376.61ms p(95)=405.98ms p(99.9)=525.14ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 69872
     http_req_receiving.............: avg=89.59µs  min=30.55µs med=67.12µs  max=262.68ms p(90)=105.48µs p(95)=123.22µs p(99.9)=1.93ms  
     http_req_sending...............: avg=34.19µs  min=5.53µs  med=11.85µs  max=119.89ms p(90)=18.93µs  p(95)=22.96µs  p(99.9)=3.85ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=204.15ms min=2.01ms  med=205.51ms max=617.74ms p(90)=376.49ms p(95)=405.84ms p(99.9)=525.07ms
     http_reqs......................: 69872   1115.907483/s
     iteration_duration.............: avg=207.5ms  min=4.62ms  med=208.99ms max=617.98ms p(90)=377.63ms p(95)=406.71ms p(99.9)=525.93ms
     iterations.....................: 68872   1099.936744/s
     success_rate...................: 100.00% ✓ 68872       ✗ 0    
     vus............................: 85      min=0         max=498
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (.net subgraphs) (2.5.14)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 100530     ✗ 0    
     data_received..................: 3.0 GB  47 MB/s
     data_sent......................: 41 MB   640 kB/s
     http_req_blocked...............: avg=16.59µs  min=1.16µs  med=3.3µs    max=10.62ms  p(90)=5.15µs   p(95)=6.19µs   p(99.9)=5.7ms   
     http_req_connecting............: avg=11.98µs  min=0s      med=0s       max=10.56ms  p(90)=0s       p(95)=0s       p(99.9)=5.46ms  
     http_req_duration..............: avg=415.74ms min=3.8ms   med=381.9ms  max=1.69s    p(90)=818.72ms p(95)=891.4ms  p(99.9)=1.28s   
       { expected_response:true }...: avg=415.74ms min=3.8ms   med=381.9ms  max=1.69s    p(90)=818.72ms p(95)=891.4ms  p(99.9)=1.28s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 34510
     http_req_receiving.............: avg=90.68µs  min=32.04µs med=81.41µs  max=44.14ms  p(90)=117.41µs p(95)=130.55µs p(99.9)=970.67µs
     http_req_sending...............: avg=39.3µs   min=6.03µs  med=14.71µs  max=193.67ms p(90)=22.06µs  p(95)=25.51µs  p(99.9)=2.88ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=415.61ms min=3.7ms   med=381.8ms  max=1.69s    p(90)=818.56ms p(95)=891.23ms p(99.9)=1.28s   
     http_reqs......................: 34510   533.035403/s
     iteration_duration.............: avg=428.4ms  min=17.96ms med=398.96ms max=1.69s    p(90)=822.68ms p(95)=894.58ms p(99.9)=1.29s   
     iterations.....................: 33510   517.589578/s
     success_rate...................: 100.00% ✓ 33510      ✗ 0    
     vus............................: 91      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (.net subgraphs) (2.5.14)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 46455      ✗ 0    
     data_received..................: 1.4 GB  21 MB/s
     data_sent......................: 20 MB   293 kB/s
     http_req_blocked...............: avg=17.12µs  min=1.35µs  med=3.89µs   max=55.82ms p(90)=5.82µs   p(95)=7.37µs   p(99.9)=1.44ms
     http_req_connecting............: avg=11.29µs  min=0s      med=0s       max=55.75ms p(90)=0s       p(95)=0s       p(99.9)=1.39ms
     http_req_duration..............: avg=884.13ms min=5.92ms  med=791.35ms max=4.83s   p(90)=1.76s    p(95)=1.99s    p(99.9)=4.25s 
       { expected_response:true }...: avg=884.13ms min=5.92ms  med=791.35ms max=4.83s   p(90)=1.76s    p(95)=1.99s    p(99.9)=4.25s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 16485
     http_req_receiving.............: avg=108.61µs min=38.63µs med=101.05µs max=8.89ms  p(90)=141.95µs p(95)=155.02µs p(99.9)=1.28ms
     http_req_sending...............: avg=31.72µs  min=6.4µs   med=18.69µs  max=36.12ms p(90)=24.93µs  p(95)=29.86µs  p(99.9)=2.55ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=883.99ms min=5.8ms   med=791.21ms max=4.83s   p(90)=1.76s    p(95)=1.99s    p(99.9)=4.25s 
     http_reqs......................: 16485   243.878763/s
     iteration_duration.............: avg=941.26ms min=74.83ms med=866.43ms max=4.83s   p(90)=1.78s    p(95)=2.01s    p(99.9)=4.29s 
     iterations.....................: 15485   229.084782/s
     success_rate...................: 100.00% ✓ 15485      ✗ 0    
     vus............................: 83      min=0        max=500
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

     checks.........................: 100.00% ✓ 40608      ✗ 0    
     data_received..................: 1.3 GB  18 MB/s
     data_sent......................: 17 MB   250 kB/s
     http_req_blocked...............: avg=17.93µs  min=1.34µs  med=3.67µs   max=21.43ms  p(90)=5.52µs   p(95)=7.33µs   p(99.9)=2.7ms 
     http_req_connecting............: avg=12.45µs  min=0s      med=0s       max=21.35ms  p(90)=0s       p(95)=0s       p(99.9)=2.68ms
     http_req_duration..............: avg=1s       min=8.62ms  med=906.23ms max=4.45s    p(90)=2.03s    p(95)=2.17s    p(99.9)=3.64s 
       { expected_response:true }...: avg=1s       min=8.62ms  med=906.23ms max=4.45s    p(90)=2.03s    p(95)=2.17s    p(99.9)=3.64s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 14536
     http_req_receiving.............: avg=130.77µs min=38.53µs med=95.62µs  max=140.07ms p(90)=136.66µs p(95)=149.82µs p(99.9)=1.18ms
     http_req_sending...............: avg=38.87µs  min=6.17µs  med=17.7µs   max=67.41ms  p(90)=23.57µs  p(95)=28.7µs   p(99.9)=2.89ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=1s       min=8.51ms  med=906.09ms max=4.45s    p(90)=2.03s    p(95)=2.17s    p(99.9)=3.64s 
     http_reqs......................: 14536   208.089045/s
     iteration_duration.............: avg=1.07s    min=72.36ms med=1s       max=4.45s    p(90)=2.04s    p(95)=2.18s    p(99.9)=3.67s 
     iterations.....................: 13536   193.773618/s
     success_rate...................: 100.00% ✓ 13536      ✗ 0    
     vus............................: 2       min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-173-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

