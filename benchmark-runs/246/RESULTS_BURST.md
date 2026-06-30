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
| hive-router | v0.0.74 | 2,750 | 2,838 | 2,689 | 1.7% |  |
| fusion-nightly | 16.4.0-p.9 | 2,168 | 2,216 | 2,152 | 0.9% |  |
| fusion | 16.3.0 | 2,066 | 2,101 | 2,027 | 1.2% |  |
| cosmo | 0.326.1 | 1,124 | 1,135 | 1,115 | 0.6% |  |
| hive-gateway-router-runtime | 2.10.0 | 504 | 509 | 501 | 0.6% |  |
| hive-gateway | 2.10.0 | 222 | 226 | 212 | 2.0% |  |
| apollo-gateway | 2.14.2 | 204 | 208 | 203 | 0.7% |  |
| apollo-router | v2.15.1 | — | — | — | — | non-compatible response (13144 across 9/9 runs) |
| feddi | 77271dc84a06 | — | — | — | — | non-compatible response (5366801 across 9/9 runs) |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (506891 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.74 | 2,170 | 2,267 | 2,120 | 2.4% |  |
| fusion-nightly | 16.4.0-p.9 | 2,067 | 2,079 | 2,053 | 0.4% |  |
| fusion | 16.3.0 | 1,910 | 1,949 | 1,885 | 1.1% |  |
| cosmo | 0.326.1 | 1,051 | 1,067 | 1,036 | 0.9% |  |
| hive-gateway-router-runtime | 2.10.0 | 482 | 494 | 477 | 1.2% |  |
| hive-gateway | 2.10.0 | 221 | 223 | 218 | 0.7% |  |
| apollo-gateway | 2.14.2 | 203 | 207 | 201 | 0.9% |  |
| feddi | 77271dc84a06 | 0 | 0 | 0 | 0.0% |  |
| apollo-router | v2.15.1 | — | — | — | — | non-compatible response (24057 across 9/9 runs) |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (251029 across 9/9 runs) |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.74)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 507573      ✗ 0     
     data_received..................: 15 GB   241 MB/s
     data_sent......................: 204 MB  3.3 MB/s
     http_req_blocked...............: avg=46.64µs  min=1.15µs  med=2.81µs  max=166.8ms  p(90)=4.48µs   p(95)=5.65µs   p(99.9)=15.04ms 
     http_req_connecting............: avg=42.2µs   min=0s      med=0s      max=166.71ms p(90)=0s       p(95)=0s       p(99.9)=14.58ms 
     http_req_duration..............: avg=83.2ms   min=1.59ms  med=75.77ms max=344.18ms p(90)=162.25ms p(95)=188.66ms p(99.9)=279.54ms
       { expected_response:true }...: avg=83.2ms   min=1.59ms  med=75.77ms max=344.18ms p(90)=162.25ms p(95)=188.66ms p(99.9)=279.54ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 170191
     http_req_receiving.............: avg=508.54µs min=28.66µs med=57.23µs max=141.02ms p(90)=261.69µs p(95)=455.35µs p(99.9)=53.32ms 
     http_req_sending...............: avg=118.52µs min=5.42µs  med=10.73µs max=128.86ms p(90)=20.48µs  p(95)=145.27µs p(99.9)=20.57ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=82.57ms  min=1.51ms  med=75.3ms  max=344.09ms p(90)=161.26ms p(95)=187.29ms p(99.9)=266.97ms
     http_reqs......................: 170191  2750.838307/s
     iteration_duration.............: avg=84.26ms  min=2.53ms  med=76.95ms max=369.91ms p(90)=163.45ms p(95)=190.35ms p(99.9)=283.4ms 
     iterations.....................: 169191  2734.675065/s
     success_rate...................: 100.00% ✓ 169191      ✗ 0     
     vus............................: 47      min=0         max=499 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (rust subgraphs) (16.4.0-p.9)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 403950      ✗ 0     
     data_received..................: 12 GB   190 MB/s
     data_sent......................: 163 MB  2.6 MB/s
     http_req_blocked...............: avg=16.02µs  min=982ns   med=2.21µs  max=47.69ms  p(90)=3.65µs   p(95)=4.87µs   p(99.9)=2.05ms  
     http_req_connecting............: avg=12.75µs  min=0s      med=0s      max=47.47ms  p(90)=0s       p(95)=0s       p(99.9)=1.84ms  
     http_req_duration..............: avg=104.87ms min=2.24ms  med=97.78ms max=537.75ms p(90)=203.98ms p(95)=227.24ms p(99.9)=370.85ms
       { expected_response:true }...: avg=104.87ms min=2.24ms  med=97.78ms max=537.75ms p(90)=203.98ms p(95)=227.24ms p(99.9)=370.85ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 135650
     http_req_receiving.............: avg=1.93ms   min=52.45µs med=270.8µs max=238.78ms p(90)=3.04ms   p(95)=7.02ms   p(99.9)=90.69ms 
     http_req_sending...............: avg=67.09µs  min=5.2µs   med=9.69µs  max=152.21ms p(90)=18.61µs  p(95)=120.27µs p(99.9)=9.09ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=102.87ms min=2.14ms  med=95.95ms max=537.66ms p(90)=201.4ms  p(95)=223.03ms p(99.9)=367.62ms
     http_reqs......................: 135650  2168.372471/s
     iteration_duration.............: avg=105.92ms min=3.69ms  med=98.97ms max=537.98ms p(90)=204.59ms p(95)=227.86ms p(99.9)=371.77ms
     iterations.....................: 134650  2152.387418/s
     success_rate...................: 100.00% ✓ 134650      ✗ 0     
     vus............................: 82      min=0         max=492 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (rust subgraphs) (16.3.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 385527      ✗ 0     
     data_received..................: 11 GB   181 MB/s
     data_sent......................: 156 MB  2.5 MB/s
     http_req_blocked...............: avg=21.67µs  min=1.03µs  med=2.61µs   max=95.63ms  p(90)=4.24µs   p(95)=5.42µs   p(99.9)=1.7ms   
     http_req_connecting............: avg=18.27µs  min=0s      med=0s       max=95.36ms  p(90)=0s       p(95)=0s       p(99.9)=1.52ms  
     http_req_duration..............: avg=109.86ms min=2.37ms  med=98.91ms  max=710.55ms p(90)=220.71ms p(95)=259.28ms p(99.9)=448.95ms
       { expected_response:true }...: avg=109.86ms min=2.37ms  med=98.91ms  max=710.55ms p(90)=220.71ms p(95)=259.28ms p(99.9)=448.95ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 129509
     http_req_receiving.............: avg=3.78ms   min=52.89µs med=143.84µs max=402.43ms p(90)=4.96ms   p(95)=14.84ms  p(99.9)=179.07ms
     http_req_sending...............: avg=76.2µs   min=5.29µs  med=10.41µs  max=114.16ms p(90)=19.95µs  p(95)=125.28µs p(99.9)=10.46ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=106.01ms min=2.24ms  med=96.22ms  max=692.91ms p(90)=212.26ms p(95)=246.38ms p(99.9)=409.03ms
     http_reqs......................: 129509  2066.334286/s
     iteration_duration.............: avg=111.03ms min=3.28ms  med=100.26ms max=710.78ms p(90)=221.5ms  p(95)=260.18ms p(99.9)=449.32ms
     iterations.....................: 128509  2050.379145/s
     success_rate...................: 100.00% ✓ 128509      ✗ 0     
     vus............................: 89      min=0         max=497 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (rust subgraphs) (0.326.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 207867      ✗ 0    
     data_received..................: 6.2 GB  99 MB/s
     data_sent......................: 84 MB   1.4 MB/s
     http_req_blocked...............: avg=6.23µs   min=1.04µs  med=2.57µs   max=17.08ms  p(90)=4.14µs   p(95)=5.02µs   p(99.9)=489.88µs
     http_req_connecting............: avg=2.95µs   min=0s      med=0s       max=16.91ms  p(90)=0s       p(95)=0s       p(99.9)=437.59µs
     http_req_duration..............: avg=203.12ms min=2.03ms  med=199.43ms max=672.53ms p(90)=381.66ms p(95)=408.56ms p(99.9)=578.62ms
       { expected_response:true }...: avg=203.12ms min=2.03ms  med=199.43ms max=672.53ms p(90)=381.66ms p(95)=408.56ms p(99.9)=578.62ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 70289
     http_req_receiving.............: avg=85.13µs  min=29.31µs med=65.16µs  max=146.35ms p(90)=101.07µs p(95)=116.09µs p(99.9)=1.63ms  
     http_req_sending...............: avg=30.97µs  min=5.45µs  med=11.29µs  max=63.1ms   p(90)=17.53µs  p(95)=21.16µs  p(99.9)=3.97ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=203.01ms min=1.96ms  med=199.32ms max=672.45ms p(90)=381.56ms p(95)=408.46ms p(99.9)=578.55ms
     http_reqs......................: 70289   1124.796051/s
     iteration_duration.............: avg=206.3ms  min=4.6ms   med=203.36ms max=672.76ms p(90)=382.59ms p(95)=409.39ms p(99.9)=579.23ms
     iterations.....................: 69289   1108.793603/s
     success_rate...................: 100.00% ✓ 69289       ✗ 0    
     vus............................: 81      min=0         max=493
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (rust subgraphs) (2.10.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 95112      ✗ 0    
     data_received..................: 2.9 GB  44 MB/s
     data_sent......................: 39 MB   605 kB/s
     http_req_blocked...............: avg=9.75µs   min=1.2µs   med=3.01µs   max=40.52ms  p(90)=4.77µs   p(95)=5.81µs   p(99.9)=1.18ms
     http_req_connecting............: avg=5.69µs   min=0s      med=0s       max=40.47ms  p(90)=0s       p(95)=0s       p(99.9)=1.09ms
     http_req_duration..............: avg=438.8ms  min=3.97ms  med=412.61ms max=1.8s     p(90)=859.11ms p(95)=934.65ms p(99.9)=1.4s  
       { expected_response:true }...: avg=438.8ms  min=3.97ms  med=412.61ms max=1.8s     p(90)=859.11ms p(95)=934.65ms p(99.9)=1.4s  
     http_req_failed................: 0.00%   ✓ 0          ✗ 32704
     http_req_receiving.............: avg=166.3µs  min=35.28µs med=77.76µs  max=155.47ms p(90)=114.97µs p(95)=128.38µs p(99.9)=2.37ms
     http_req_sending...............: avg=26.54µs  min=5.8µs   med=13.64µs  max=37.4ms   p(90)=20.54µs  p(95)=23.8µs   p(99.9)=2.73ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=438.61ms min=3.88ms  med=412.5ms  max=1.8s     p(90)=859.04ms p(95)=934.58ms p(99.9)=1.4s  
     http_reqs......................: 32704   504.144345/s
     iteration_duration.............: avg=452.86ms min=20.42ms med=429.24ms max=1.81s    p(90)=862.55ms p(95)=937.86ms p(99.9)=1.4s  
     iterations.....................: 31704   488.728973/s
     success_rate...................: 100.00% ✓ 31704      ✗ 0    
     vus............................: 24      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (rust subgraphs) (2.10.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 42867      ✗ 0    
     data_received..................: 1.3 GB  20 MB/s
     data_sent......................: 18 MB   268 kB/s
     http_req_blocked...............: avg=12.44µs  min=1.34µs  med=3.7µs    max=6.49ms  p(90)=5.59µs  p(95)=7.23µs   p(99.9)=1.28ms  
     http_req_connecting............: avg=7.09µs   min=0s      med=0s       max=6.34ms  p(90)=0s      p(95)=0s       p(99.9)=1.25ms  
     http_req_duration..............: avg=922.88ms min=6.66ms  med=822.57ms max=19.68s  p(90)=1.65s   p(95)=1.82s    p(99.9)=17.42s  
       { expected_response:true }...: avg=922.88ms min=6.66ms  med=822.57ms max=19.68s  p(90)=1.65s   p(95)=1.82s    p(99.9)=17.42s  
     http_req_failed................: 0.00%   ✓ 0          ✗ 15289
     http_req_receiving.............: avg=112.09µs min=36.31µs med=99.41µs  max=46.29ms p(90)=138.9µs p(95)=152.16µs p(99.9)=967.06µs
     http_req_sending...............: avg=32.29µs  min=6.56µs  med=18.05µs  max=36.08ms p(90)=24.42µs p(95)=29.44µs  p(99.9)=2.91ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=922.74ms min=6.57ms  med=822.48ms max=19.68s  p(90)=1.65s   p(95)=1.81s    p(99.9)=17.42s  
     http_reqs......................: 15289   222.579149/s
     iteration_duration.............: avg=987.39ms min=35.85ms med=893.37ms max=19.69s  p(90)=1.67s   p(95)=1.83s    p(99.9)=17.54s  
     iterations.....................: 14289   208.021025/s
     success_rate...................: 100.00% ✓ 14289      ✗ 0    
     vus............................: 87      min=0        max=500
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

     checks.........................: 100.00% ✓ 42633      ✗ 0    
     data_received..................: 1.3 GB  18 MB/s
     data_sent......................: 19 MB   251 kB/s
     http_req_blocked...............: avg=17.54µs  min=1.23µs  med=3.45µs   max=17.73ms  p(90)=5.15µs   p(95)=6.72µs   p(99.9)=2.68ms  
     http_req_connecting............: avg=11.79µs  min=0s      med=0s       max=17.65ms  p(90)=0s       p(95)=0s       p(99.9)=2.58ms  
     http_req_duration..............: avg=471.15ms min=8.42ms  med=514.88ms max=1.35s    p(90)=823.06ms p(95)=888.55ms p(99.9)=1.25s   
       { expected_response:true }...: avg=471.15ms min=8.42ms  med=514.88ms max=1.35s    p(90)=823.06ms p(95)=888.55ms p(99.9)=1.25s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 15211
     http_req_receiving.............: avg=122.11µs min=33.48µs med=94.62µs  max=227.89ms p(90)=134.92µs p(95)=147.21µs p(99.9)=875.55µs
     http_req_sending...............: avg=35.53µs  min=5.85µs  med=17.06µs  max=61.16ms  p(90)=23.02µs  p(95)=28.02µs  p(99.9)=2.99ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=471ms    min=8.33ms  med=514.75ms max=1.35s    p(90)=822.93ms p(95)=888.42ms p(99.9)=1.25s   
     http_reqs......................: 15211   204.521809/s
     iteration_duration.............: avg=504.22ms min=9.41ms  med=551.1ms  max=1.36s    p(90)=830.51ms p(95)=895.91ms p(99.9)=1.27s   
     iterations.....................: 14211   191.076157/s
     success_rate...................: 100.00% ✓ 14211      ✗ 0    
     vus............................: 65      min=0        max=495
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.74)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 401592      ✗ 0     
     data_received..................: 12 GB   190 MB/s
     data_sent......................: 162 MB  2.6 MB/s
     http_req_blocked...............: avg=24.63µs  min=1.01µs  med=2.89µs   max=74.67ms  p(90)=4.69µs   p(95)=5.93µs   p(99.9)=2.62ms  
     http_req_connecting............: avg=20.91µs  min=0s      med=0s       max=74.44ms  p(90)=0s       p(95)=0s       p(99.9)=2.45ms  
     http_req_duration..............: avg=105.45ms min=1.67ms  med=99.25ms  max=314.21ms p(90)=203.17ms p(95)=217.62ms p(99.9)=263.25ms
       { expected_response:true }...: avg=105.45ms min=1.67ms  med=99.25ms  max=314.21ms p(90)=203.17ms p(95)=217.62ms p(99.9)=263.25ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 134864
     http_req_receiving.............: avg=185.65µs min=28.68µs med=63.87µs  max=83.11ms  p(90)=177.64µs p(95)=433.75µs p(99.9)=19.55ms 
     http_req_sending...............: avg=85.08µs  min=5.29µs  med=11.75µs  max=45.02ms  p(90)=22.74µs  p(95)=145.67µs p(99.9)=12.49ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=105.18ms min=1.61ms  med=99.01ms  max=290.76ms p(90)=202.78ms p(95)=217.21ms p(99.9)=262.33ms
     http_reqs......................: 134864  2170.585307/s
     iteration_duration.............: avg=106.53ms min=4.18ms  med=100.58ms max=323.7ms  p(90)=203.74ms p(95)=218.13ms p(99.9)=265ms   
     iterations.....................: 133864  2154.490683/s
     success_rate...................: 100.00% ✓ 133864      ✗ 0     
     vus............................: 63      min=0         max=496 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.4.0-p.9)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 382227      ✗ 0     
     data_received..................: 11 GB   181 MB/s
     data_sent......................: 154 MB  2.5 MB/s
     http_req_blocked...............: avg=19.04µs  min=1.02µs  med=2.35µs   max=53.09ms  p(90)=4.1µs    p(95)=5.33µs   p(99.9)=2.52ms  
     http_req_connecting............: avg=15.93µs  min=0s      med=0s       max=53ms     p(90)=0s       p(95)=0s       p(99.9)=2.47ms  
     http_req_duration..............: avg=110.82ms min=1.7ms   med=105.19ms max=540.83ms p(90)=212.64ms p(95)=231.91ms p(99.9)=365.77ms
       { expected_response:true }...: avg=110.82ms min=1.7ms   med=105.19ms max=540.83ms p(90)=212.64ms p(95)=231.91ms p(99.9)=365.77ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 128409
     http_req_receiving.............: avg=1.74ms   min=54.37µs med=311.74µs max=227.35ms p(90)=2.98ms   p(95)=5.76ms   p(99.9)=80.89ms 
     http_req_sending...............: avg=71.04µs  min=5.35µs  med=10.09µs  max=200.91ms p(90)=21.54µs  p(95)=128.48µs p(99.9)=9.47ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=109ms    min=1.62ms  med=103.52ms max=540.67ms p(90)=210.35ms p(95)=229.05ms p(99.9)=345.2ms 
     http_reqs......................: 128409  2067.496525/s
     iteration_duration.............: avg=111.97ms min=3.39ms  med=106.43ms max=541.07ms p(90)=213.26ms p(95)=232.5ms  p(99.9)=366.43ms
     iterations.....................: 127409  2051.395656/s
     success_rate...................: 100.00% ✓ 127409      ✗ 0     
     vus............................: 61      min=0         max=497 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (.net subgraphs) (16.3.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 353385      ✗ 0     
     data_received..................: 10 GB   168 MB/s
     data_sent......................: 143 MB  2.3 MB/s
     http_req_blocked...............: avg=14.62µs  min=962ns   med=2.25µs   max=77.85ms  p(90)=3.91µs   p(95)=5.03µs   p(99.9)=1.59ms  
     http_req_connecting............: avg=11.67µs  min=0s      med=0s       max=77.69ms  p(90)=0s       p(95)=0s       p(99.9)=1.46ms  
     http_req_duration..............: avg=119.83ms min=1.77ms  med=108.63ms max=710.38ms p(90)=234.31ms p(95)=268.61ms p(99.9)=456.42ms
       { expected_response:true }...: avg=119.83ms min=1.77ms  med=108.63ms max=710.38ms p(90)=234.31ms p(95)=268.61ms p(99.9)=456.42ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 118795
     http_req_receiving.............: avg=2.84ms   min=52.98µs med=154.84µs max=257.6ms  p(90)=3.87ms   p(95)=9.51ms   p(99.9)=115.79ms
     http_req_sending...............: avg=59.76µs  min=5.22µs  med=9.91µs   max=146.23ms p(90)=19.52µs  p(95)=115.43µs p(99.9)=8.24ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=116.93ms min=1.69ms  med=106.72ms max=655.44ms p(90)=229.28ms p(95)=259.42ms p(99.9)=429.55ms
     http_reqs......................: 118795  1910.98896/s
     iteration_duration.............: avg=121.13ms min=2.81ms  med=110ms    max=710.58ms p(90)=235.08ms p(95)=269.42ms p(99.9)=457.4ms 
     iterations.....................: 117795  1894.902517/s
     success_rate...................: 100.00% ✓ 117795      ✗ 0     
     vus............................: 65      min=0         max=496 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (.net subgraphs) (0.326.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 194889      ✗ 0    
     data_received..................: 5.8 GB  92 MB/s
     data_sent......................: 79 MB   1.3 MB/s
     http_req_blocked...............: avg=7.66µs   min=1.08µs  med=2.85µs   max=33ms     p(90)=4.68µs   p(95)=5.74µs   p(99.9)=580.57µs
     http_req_connecting............: avg=4.05µs   min=0s      med=0s       max=32.94ms  p(90)=0s       p(95)=0s       p(99.9)=525.51µs
     http_req_duration..............: avg=216.43ms min=2.15ms  med=219.3ms  max=606.19ms p(90)=393.07ms p(95)=421.7ms  p(99.9)=508.12ms
       { expected_response:true }...: avg=216.43ms min=2.15ms  med=219.3ms  max=606.19ms p(90)=393.07ms p(95)=421.7ms  p(99.9)=508.12ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 65963
     http_req_receiving.............: avg=94.36µs  min=30.61µs med=73.5µs   max=174.19ms p(90)=113.84µs p(95)=130.24µs p(99.9)=1.99ms  
     http_req_sending...............: avg=34.76µs  min=5.38µs  med=12.71µs  max=190.39ms p(90)=20.12µs  p(95)=24.17µs  p(99.9)=3.64ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=216.3ms  min=2.08ms  med=219.15ms max=606.13ms p(90)=392.98ms p(95)=421.55ms p(99.9)=507.95ms
     http_reqs......................: 65963   1051.003723/s
     iteration_duration.............: avg=220.03ms min=4.39ms  med=223.39ms max=606.38ms p(90)=394.16ms p(95)=422.55ms p(99.9)=508.34ms
     iterations.....................: 64963   1035.070492/s
     success_rate...................: 100.00% ✓ 64963       ✗ 0    
     vus............................: 94      min=0         max=500
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (.net subgraphs) (2.10.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 91548      ✗ 0    
     data_received..................: 2.8 GB  42 MB/s
     data_sent......................: 38 MB   579 kB/s
     http_req_blocked...............: avg=10.12µs  min=1.16µs  med=3.24µs   max=40.7ms   p(90)=5.09µs   p(95)=6.13µs   p(99.9)=1.28ms 
     http_req_connecting............: avg=5.77µs   min=0s      med=0s       max=40.64ms  p(90)=0s       p(95)=0s       p(99.9)=1.08ms 
     http_req_duration..............: avg=455.72ms min=4.14ms  med=432.48ms max=2.1s     p(90)=897.51ms p(95)=970.44ms p(99.9)=1.47s  
       { expected_response:true }...: avg=455.72ms min=4.14ms  med=432.48ms max=2.1s     p(90)=897.51ms p(95)=970.44ms p(99.9)=1.47s  
     http_req_failed................: 0.00%   ✓ 0          ✗ 31516
     http_req_receiving.............: avg=154.08µs min=31.77µs med=83.26µs  max=118.66ms p(90)=121.08µs p(95)=136.58µs p(99.9)=13.97ms
     http_req_sending...............: avg=24.49µs  min=5.39µs  med=14.74µs  max=16.55ms  p(90)=22.02µs  p(95)=25.55µs  p(99.9)=2.18ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=455.55ms min=4.07ms  med=432.35ms max=2.1s     p(90)=897.41ms p(95)=970.34ms p(99.9)=1.47s  
     http_reqs......................: 31516   482.58716/s
     iteration_duration.............: avg=470.87ms min=8.8ms   med=448.57ms max=2.11s    p(90)=902.03ms p(95)=975.13ms p(99.9)=1.48s  
     iterations.....................: 30516   467.274711/s
     success_rate...................: 100.00% ✓ 30516      ✗ 0    
     vus............................: 74      min=0        max=495
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (.net subgraphs) (2.10.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 42516      ✗ 0    
     data_received..................: 1.3 GB  19 MB/s
     data_sent......................: 18 MB   266 kB/s
     http_req_blocked...............: avg=13.26µs  min=1.28µs  med=3.74µs   max=3.36ms  p(90)=5.66µs  p(95)=7.28µs   p(99.9)=1.59ms
     http_req_connecting............: avg=7.47µs   min=0s      med=0s       max=3.07ms  p(90)=0s      p(95)=0s       p(99.9)=1.52ms
     http_req_duration..............: avg=963.08ms min=6.45ms  med=872.59ms max=5.66s   p(90)=1.91s   p(95)=2.13s    p(99.9)=5.02s 
       { expected_response:true }...: avg=963.08ms min=6.45ms  med=872.59ms max=5.66s   p(90)=1.91s   p(95)=2.13s    p(99.9)=5.02s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 15172
     http_req_receiving.............: avg=112.37µs min=35.98µs med=100.97µs max=28.88ms p(90)=139.9µs p(95)=153.46µs p(99.9)=1.36ms
     http_req_sending...............: avg=41.44µs  min=5.91µs  med=18.4µs   max=80.72ms p(90)=24.74µs p(95)=30.41µs  p(99.9)=3.64ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s      p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=962.93ms min=6.35ms  med=872.37ms max=5.66s   p(90)=1.91s   p(95)=2.13s    p(99.9)=5.02s 
     http_reqs......................: 15172   221.663161/s
     iteration_duration.............: avg=1.03s    min=57.33ms med=955.16ms max=5.67s   p(90)=1.94s   p(95)=2.15s    p(99.9)=5.04s 
     iterations.....................: 14172   207.053145/s
     success_rate...................: 100.00% ✓ 14172      ✗ 0    
     vus............................: 73      min=0        max=500
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

     checks.........................: 100.00% ✓ 39774      ✗ 0    
     data_received..................: 1.2 GB  18 MB/s
     data_sent......................: 17 MB   245 kB/s
     http_req_blocked...............: avg=17µs     min=1.33µs  med=3.55µs   max=5.17ms  p(90)=5.29µs   p(95)=6.98µs   p(99.9)=2.8ms   
     http_req_connecting............: avg=11.51µs  min=0s      med=0s       max=5.09ms  p(90)=0s       p(95)=0s       p(99.9)=2.63ms  
     http_req_duration..............: avg=1.02s    min=8.7ms   med=927.87ms max=4.27s   p(90)=2.09s    p(95)=2.19s    p(99.9)=3.78s   
       { expected_response:true }...: avg=1.02s    min=8.7ms   med=927.87ms max=4.27s   p(90)=2.09s    p(95)=2.19s    p(99.9)=3.78s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 14258
     http_req_receiving.............: avg=106.99µs min=36.47µs med=95.75µs  max=71.9ms  p(90)=136.21µs p(95)=147.64µs p(99.9)=991.68µs
     http_req_sending...............: avg=30.86µs  min=6.4µs   med=17.27µs  max=66.48ms p(90)=23.28µs  p(95)=28.59µs  p(99.9)=2.32ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=1.02s    min=8.6ms   med=927.74ms max=4.27s   p(90)=2.09s    p(95)=2.19s    p(99.9)=3.78s   
     http_reqs......................: 14258   203.785031/s
     iteration_duration.............: avg=1.09s    min=56.01ms med=1.03s    max=4.28s   p(90)=2.1s     p(95)=2.2s     p(99.9)=3.82s   
     iterations.....................: 13258   189.492351/s
     success_rate...................: 100.00% ✓ 13258      ✗ 0    
     vus............................: 47      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: feddi (.net subgraphs) (77271dc84a06)</summary>

  **K6 Output**


```
data_received..................: 3.3 MB 56 kB/s
     data_sent......................: 43 kB  719 B/s
     http_req_blocked...............: avg=10.32µs  min=2.87µs   med=3.85µs   max=202.81µs p(90)=7.41µs   p(95)=12.25µs  p(99.9)=196.53µs
     http_req_connecting............: avg=3.24µs   min=0s       med=0s       max=113.43µs p(90)=0s       p(95)=0s       p(99.9)=109.57µs
     http_req_duration..............: avg=1.71s    min=33.03ms  med=54.03ms  max=44.2s    p(90)=208.7ms  p(95)=5.95s    p(99.9)=43.01s  
       { expected_response:true }...: avg=1.71s    min=33.03ms  med=54.03ms  max=44.2s    p(90)=208.7ms  p(95)=5.95s    p(99.9)=43.01s  
     http_req_failed................: 0.00%  ✓ 0        ✗ 35   
     http_req_receiving.............: avg=167.12µs min=112.72µs med=152.14µs max=400.97µs p(90)=194.23µs p(95)=228.56µs p(99.9)=397.46µs
     http_req_sending...............: avg=23.54µs  min=15.73µs  med=21.21µs  max=62.92µs  p(90)=25.88µs  p(95)=33.59µs  p(99.9)=62.09µs 
     http_req_tls_handshaking.......: avg=0s       min=0s       med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=1.71s    min=32.86ms  med=53.86ms  max=44.2s    p(90)=208.51ms p(95)=5.95s    p(99.9)=43.01s  
     http_reqs......................: 35     0.583326/s
     vus............................: 0      min=0      max=0  
     vus_max........................: 500    min=500    max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-185-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

