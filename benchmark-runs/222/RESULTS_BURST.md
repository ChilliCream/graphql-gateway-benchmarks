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
| hive-router | v0.0.65 | 2,839 | 2,934 | 2,800 | 1.5% |  |
| fusion | 16.1.4 | 2,065 | 2,087 | 2,039 | 0.9% |  |
| fusion-nightly | 16.2.0-p.1 | 2,016 | 2,074 | 2,008 | 1.3% |  |
| cosmo | 0.321.1 | 1,161 | 1,161 | 1,161 | 0.0% | non-compatible response (16 across 8/9 runs) |
| hive-gateway-router-runtime | 2.8.2 | 522 | 526 | 518 | 0.6% |  |
| hive-gateway | 2.8.2 | 225 | 227 | 221 | 0.9% |  |
| apollo-gateway | 2.14.1 | 205 | 209 | 204 | 0.7% |  |
| apollo-router | v2.15.0 | — | — | — | — | non-compatible response (8970 across 9/9 runs) |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (471260 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.65 | 2,297 | 2,363 | 2,254 | 1.5% |  |
| fusion | 16.1.4 | 1,937 | 1,950 | 1,828 | 1.9% |  |
| fusion-nightly | 16.2.0-p.1 | 1,845 | 1,884 | 1,824 | 1.1% |  |
| cosmo | 0.321.1 | 1,110 | 1,110 | 1,108 | 0.1% | non-compatible response (14 across 7/9 runs) |
| hive-gateway-router-runtime | 2.8.2 | 490 | 499 | 484 | 1.1% |  |
| hive-gateway | 2.8.2 | 223 | 225 | 220 | 0.7% |  |
| apollo-gateway | 2.14.1 | 209 | 211 | 208 | 0.4% |  |
| apollo-router | v2.15.0 | — | — | — | — | non-compatible response (13683 across 9/9 runs) |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (394962 across 9/9 runs) |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.65)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 524382      ✗ 0     
     data_received..................: 15 GB   249 MB/s
     data_sent......................: 211 MB  3.4 MB/s
     http_req_blocked...............: avg=32.35µs  min=1.02µs  med=2.25µs  max=66.18ms  p(90)=3.66µs   p(95)=4.79µs   p(99.9)=10.94ms 
     http_req_connecting............: avg=29.02µs  min=0s      med=0s      max=66ms     p(90)=0s       p(95)=0s       p(99.9)=10.76ms 
     http_req_duration..............: avg=80.76ms  min=1.55ms  med=73.77ms max=299.02ms p(90)=158.13ms p(95)=174.03ms p(99.9)=221.58ms
       { expected_response:true }...: avg=80.76ms  min=1.55ms  med=73.77ms max=299.02ms p(90)=158.13ms p(95)=174.03ms p(99.9)=221.58ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 175794
     http_req_receiving.............: avg=530.81µs min=28.94µs med=55.14µs max=120.88ms p(90)=270.31µs p(95)=428.32µs p(99.9)=52.55ms 
     http_req_sending...............: avg=97.45µs  min=5.22µs  med=9.79µs  max=85.18ms  p(90)=18.9µs   p(95)=132.09µs p(99.9)=16.44ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=80.13ms  min=1.47ms  med=73.28ms max=249.59ms p(90)=156.85ms p(95)=172.04ms p(99.9)=216.17ms
     http_reqs......................: 175794  2839.789291/s
     iteration_duration.............: avg=81.56ms  min=2.04ms  med=74.68ms max=346.31ms p(90)=158.62ms p(95)=174.57ms p(99.9)=223.68ms
     iterations.....................: 174794  2823.635217/s
     success_rate...................: 100.00% ✓ 174794      ✗ 0     
     vus............................: 53      min=0         max=499 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (rust subgraphs) (16.1.4)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 385326      ✗ 0     
     data_received..................: 11 GB   181 MB/s
     data_sent......................: 156 MB  2.5 MB/s
     http_req_blocked...............: avg=15.78µs  min=1.05µs  med=2.19µs   max=62.62ms  p(90)=3.41µs   p(95)=4.29µs   p(99.9)=1.61ms  
     http_req_connecting............: avg=13.02µs  min=0s      med=0s       max=62.46ms  p(90)=0s       p(95)=0s       p(99.9)=1.57ms  
     http_req_duration..............: avg=109.96ms min=2.35ms  med=100.23ms max=949.77ms p(90)=214.72ms p(95)=250.73ms p(99.9)=445.85ms
       { expected_response:true }...: avg=109.96ms min=2.35ms  med=100.23ms max=949.77ms p(90)=214.72ms p(95)=250.73ms p(99.9)=445.85ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 129442
     http_req_receiving.............: avg=2.03ms   min=52.78µs med=112.53µs max=638.34ms p(90)=1.38ms   p(95)=4.89ms   p(99.9)=136.9ms 
     http_req_sending...............: avg=65.89µs  min=5.32µs  med=9.5µs    max=195.89ms p(90)=16.54µs  p(95)=117.68µs p(99.9)=9.21ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=107.85ms min=2.24ms  med=99.07ms  max=706.58ms p(90)=210.86ms p(95)=243ms    p(99.9)=401.2ms 
     http_reqs......................: 129442  2065.461278/s
     iteration_duration.............: avg=111.08ms min=3.69ms  med=101.52ms max=949.99ms p(90)=215.5ms  p(95)=251.65ms p(99.9)=446.53ms
     iterations.....................: 128442  2049.504623/s
     success_rate...................: 100.00% ✓ 128442      ✗ 0     
     vus............................: 88      min=0         max=500 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (rust subgraphs) (16.2.0-p.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 376806      ✗ 0     
     data_received..................: 11 GB   177 MB/s
     data_sent......................: 152 MB  2.4 MB/s
     http_req_blocked...............: avg=17.6µs   min=992ns   med=2.23µs   max=85.49ms  p(90)=3.54µs   p(95)=4.47µs   p(99.9)=2.54ms  
     http_req_connecting............: avg=14.32µs  min=0s      med=0s       max=85.42ms  p(90)=0s       p(95)=0s       p(99.9)=2.03ms  
     http_req_duration..............: avg=112.41ms min=2.41ms  med=103.71ms max=931.07ms p(90)=218.79ms p(95)=256.43ms p(99.9)=522.58ms
       { expected_response:true }...: avg=112.41ms min=2.41ms  med=103.71ms max=931.07ms p(90)=218.79ms p(95)=256.43ms p(99.9)=522.58ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 126602
     http_req_receiving.............: avg=1.83ms   min=50.86µs med=114.98µs max=522.42ms p(90)=1.49ms   p(95)=4.96ms   p(99.9)=144.74ms
     http_req_sending...............: avg=69.23µs  min=5.22µs  med=9.68µs   max=131.66ms p(90)=17.98µs  p(95)=119.6µs  p(99.9)=10.25ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=110.51ms min=2.32ms  med=102.57ms max=908.76ms p(90)=215.63ms p(95)=249.65ms p(99.9)=503.33ms
     http_reqs......................: 126602  2016.151753/s
     iteration_duration.............: avg=113.58ms min=3.48ms  med=105.07ms max=981.35ms p(90)=219.5ms  p(95)=257.36ms p(99.9)=528.43ms
     iterations.....................: 125602  2000.226635/s
     success_rate...................: 100.00% ✓ 125602      ✗ 0     
     vus............................: 95      min=0         max=500 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (rust subgraphs) (0.321.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 214911      ✗ 0    
     data_received..................: 6.4 GB  102 MB/s
     data_sent......................: 87 MB   1.4 MB/s
     http_req_blocked...............: avg=7.38µs   min=1.08µs  med=2.24µs   max=57.54ms  p(90)=3.7µs    p(95)=4.64µs   p(99.9)=608.43µs
     http_req_connecting............: avg=4.49µs   min=0s      med=0s       max=57.49ms  p(90)=0s       p(95)=0s       p(99.9)=552.63µs
     http_req_duration..............: avg=196.44ms min=2.07ms  med=197.03ms max=551.26ms p(90)=364.56ms p(95)=390.48ms p(99.9)=478.2ms 
       { expected_response:true }...: avg=196.44ms min=2.07ms  med=197.03ms max=551.26ms p(90)=364.56ms p(95)=390.48ms p(99.9)=478.2ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 72637
     http_req_receiving.............: avg=79.22µs  min=29.55µs med=60.45µs  max=96ms     p(90)=95.29µs  p(95)=109.45µs p(99.9)=2ms     
     http_req_sending...............: avg=32.03µs  min=5.47µs  med=10.64µs  max=108.08ms p(90)=16.87µs  p(95)=20.57µs  p(99.9)=3.72ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=196.33ms min=1.98ms  med=196.91ms max=551.19ms p(90)=364.47ms p(95)=390.37ms p(99.9)=478.13ms
     http_reqs......................: 72637   1161.853731/s
     iteration_duration.............: avg=199.44ms min=5.2ms   med=200.46ms max=551.41ms p(90)=365.49ms p(95)=391.27ms p(99.9)=478.5ms 
     iterations.....................: 71637   1145.858388/s
     success_rate...................: 100.00% ✓ 71637       ✗ 0    
     vus............................: 83      min=0         max=494
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (rust subgraphs) (2.8.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 98469      ✗ 0    
     data_received..................: 3.0 GB  46 MB/s
     data_sent......................: 41 MB   627 kB/s
     http_req_blocked...............: avg=9.62µs   min=1.12µs  med=2.9µs    max=40.48ms  p(90)=4.77µs   p(95)=5.78µs   p(99.9)=1.13ms  
     http_req_connecting............: avg=5.7µs    min=0s      med=0s       max=40.43ms  p(90)=0s       p(95)=0s       p(99.9)=1.09ms  
     http_req_duration..............: avg=424.38ms min=3.87ms  med=394.39ms max=1.64s    p(90)=832.66ms p(95)=910.53ms p(99.9)=1.36s   
       { expected_response:true }...: avg=424.38ms min=3.87ms  med=394.39ms max=1.64s    p(90)=832.66ms p(95)=910.53ms p(99.9)=1.36s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 33823
     http_req_receiving.............: avg=87.89µs  min=32.52µs med=76.68µs  max=85.93ms  p(90)=113.49µs p(95)=126.93µs p(99.9)=909.06µs
     http_req_sending...............: avg=33.43µs  min=5.8µs   med=13.95µs  max=153.68ms p(90)=21.98µs  p(95)=25.23µs  p(99.9)=3.03ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=424.26ms min=3.81ms  med=394.31ms max=1.64s    p(90)=832.54ms p(95)=910.47ms p(99.9)=1.36s   
     http_reqs......................: 33823   522.397267/s
     iteration_duration.............: avg=437.53ms min=16.36ms med=409.46ms max=1.64s    p(90)=836.93ms p(95)=914.07ms p(99.9)=1.36s   
     iterations.....................: 32823   506.952236/s
     success_rate...................: 100.00% ✓ 32823      ✗ 0    
     vus............................: 93      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (rust subgraphs) (2.8.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 43296      ✗ 0    
     data_received..................: 1.4 GB  20 MB/s
     data_sent......................: 19 MB   272 kB/s
     http_req_blocked...............: avg=14.54µs  min=1.32µs  med=3.46µs   max=3.67ms p(90)=5.26µs   p(95)=6.95µs  p(99.9)=2.45ms
     http_req_connecting............: avg=9.51µs   min=0s      med=0s       max=3.64ms p(90)=0s       p(95)=0s      p(99.9)=2.42ms
     http_req_duration..............: avg=926.76ms min=6.3ms   med=807.93ms max=20.18s p(90)=1.6s     p(95)=1.82s   p(99.9)=17.79s
       { expected_response:true }...: avg=926.76ms min=6.3ms   med=807.93ms max=20.18s p(90)=1.6s     p(95)=1.82s   p(99.9)=17.79s
     http_req_failed................: 0.00%   ✓ 0          ✗ 15432
     http_req_receiving.............: avg=97.98µs  min=40.4µs  med=92.17µs  max=3.16ms p(90)=129.85µs p(95)=143.6µs p(99.9)=1.02ms
     http_req_sending...............: avg=28.73µs  min=6.06µs  med=17.19µs  max=8.76ms p(90)=23.65µs  p(95)=28.31µs p(99.9)=3.7ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s     p(90)=0s       p(95)=0s      p(99.9)=0s    
     http_req_waiting...............: avg=926.63ms min=6.2ms   med=807.69ms max=20.18s p(90)=1.6s     p(95)=1.82s   p(99.9)=17.79s
     http_reqs......................: 15432   225.690004/s
     iteration_duration.............: avg=990.89ms min=38.99ms med=897.53ms max=20.18s p(90)=1.61s    p(95)=1.83s   p(99.9)=17.86s
     iterations.....................: 14432   211.065198/s
     success_rate...................: 100.00% ✓ 14432      ✗ 0    
     vus............................: 71      min=0        max=499
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

     checks.........................: 100.00% ✓ 42768      ✗ 0    
     data_received..................: 1.3 GB  18 MB/s
     data_sent......................: 19 MB   252 kB/s
     http_req_blocked...............: avg=13.03µs  min=1.18µs  med=3.53µs   max=3.01ms   p(90)=5.17µs   p(95)=6.53µs   p(99.9)=1.7ms  
     http_req_connecting............: avg=7.91µs   min=0s      med=0s       max=2.98ms   p(90)=0s       p(95)=0s       p(99.9)=1.67ms 
     http_req_duration..............: avg=448.52ms min=8.34ms  med=495.3ms  max=1.36s    p(90)=769.29ms p(95)=820.31ms p(99.9)=1.17s  
       { expected_response:true }...: avg=448.52ms min=8.34ms  med=495.3ms  max=1.36s    p(90)=769.29ms p(95)=820.31ms p(99.9)=1.17s  
     http_req_failed................: 0.00%   ✓ 0          ✗ 15256
     http_req_receiving.............: avg=291.25µs min=34.59µs med=91.45µs  max=169.84ms p(90)=131.12µs p(95)=144.91µs p(99.9)=92.91ms
     http_req_sending...............: avg=47.1µs   min=5.94µs  med=16.72µs  max=202.49ms p(90)=22.74µs  p(95)=27.11µs  p(99.9)=2.53ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=448.18ms min=8.21ms  med=495.14ms max=1.36s    p(90)=769.19ms p(95)=820.23ms p(99.9)=1.17s  
     http_reqs......................: 15256   205.618295/s
     iteration_duration.............: avg=479.92ms min=11.64ms med=530.1ms  max=1.37s    p(90)=772.94ms p(95)=826.21ms p(99.9)=1.17s  
     iterations.....................: 14256   192.140431/s
     success_rate...................: 100.00% ✓ 14256      ✗ 0    
     vus............................: 57      min=0        max=495
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.65)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 424962      ✗ 0     
     data_received..................: 13 GB   201 MB/s
     data_sent......................: 171 MB  2.8 MB/s
     http_req_blocked...............: avg=24µs     min=1.05µs  med=2.42µs  max=81.46ms  p(90)=4.04µs   p(95)=5.27µs   p(99.9)=2.94ms  
     http_req_connecting............: avg=20.5µs   min=0s      med=0s      max=81.4ms   p(90)=0s       p(95)=0s       p(99.9)=2.67ms  
     http_req_duration..............: avg=99.67ms  min=1.67ms  med=93.59ms max=348.17ms p(90)=191.89ms p(95)=211.24ms p(99.9)=275.2ms 
       { expected_response:true }...: avg=99.67ms  min=1.67ms  med=93.59ms max=348.17ms p(90)=191.89ms p(95)=211.24ms p(99.9)=275.2ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 142654
     http_req_receiving.............: avg=216.54µs min=29.33µs med=59.39µs max=128.86ms p(90)=170.38µs p(95)=417.16µs p(99.9)=23.38ms 
     http_req_sending...............: avg=80.2µs   min=5.07µs  med=10.58µs max=168.85ms p(90)=20.38µs  p(95)=137.47µs p(99.9)=11.35ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=99.37ms  min=1.62ms  med=93.22ms max=336.04ms p(90)=191.39ms p(95)=210.76ms p(99.9)=274ms   
     http_reqs......................: 142654  2297.559482/s
     iteration_duration.............: avg=100.67ms min=4.33ms  med=94.7ms  max=394.08ms p(90)=192.43ms p(95)=211.89ms p(99.9)=277.28ms
     iterations.....................: 141654  2281.453663/s
     success_rate...................: 100.00% ✓ 141654      ✗ 0     
     vus............................: 60      min=0         max=497 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (.net subgraphs) (16.1.4)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 358524      ✗ 0     
     data_received..................: 11 GB   170 MB/s
     data_sent......................: 145 MB  2.3 MB/s
     http_req_blocked...............: avg=13.3µs   min=1.01µs  med=2.28µs   max=49.57ms  p(90)=3.76µs   p(95)=4.75µs   p(99.9)=884.4µs 
     http_req_connecting............: avg=10.24µs  min=0s      med=0s       max=49.46ms  p(90)=0s       p(95)=0s       p(99.9)=835.38µs
     http_req_duration..............: avg=118.18ms min=1.79ms  med=109.33ms max=713.04ms p(90)=228.53ms p(95)=260.65ms p(99.9)=500.39ms
       { expected_response:true }...: avg=118.18ms min=1.79ms  med=109.33ms max=713.04ms p(90)=228.53ms p(95)=260.65ms p(99.9)=500.39ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 120508
     http_req_receiving.............: avg=1.75ms   min=50.45µs med=110.46µs max=376.51ms p(90)=1.67ms   p(95)=4.8ms    p(99.9)=118.93ms
     http_req_sending...............: avg=60.09µs  min=5.24µs  med=9.81µs   max=72.05ms  p(90)=19.19µs  p(95)=119.65µs p(99.9)=8ms     
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=116.37ms min=1.67ms  med=108.19ms max=642.9ms  p(90)=225.64ms p(95)=254.3ms  p(99.9)=482.79ms
     http_reqs......................: 120508  1937.670749/s
     iteration_duration.............: avg=119.44ms min=2.96ms  med=110.84ms max=730.91ms p(90)=229.09ms p(95)=261.43ms p(99.9)=500.74ms
     iterations.....................: 119508  1921.591562/s
     success_rate...................: 100.00% ✓ 119508      ✗ 0     
     vus............................: 73      min=0         max=496 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.2.0-p.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 341883      ✗ 0     
     data_received..................: 10 GB   162 MB/s
     data_sent......................: 138 MB  2.2 MB/s
     http_req_blocked...............: avg=20.84µs  min=972ns   med=2.29µs   max=57.35ms  p(90)=3.74µs   p(95)=4.71µs   p(99.9)=1.59ms  
     http_req_connecting............: avg=17.64µs  min=0s      med=0s       max=57.31ms  p(90)=0s       p(95)=0s       p(99.9)=1.27ms  
     http_req_duration..............: avg=123.84ms min=1.83ms  med=114.8ms  max=770.26ms p(90)=238.17ms p(95)=270.5ms  p(99.9)=612.47ms
       { expected_response:true }...: avg=123.84ms min=1.83ms  med=114.8ms  max=770.26ms p(90)=238.17ms p(95)=270.5ms  p(99.9)=612.47ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 114961
     http_req_receiving.............: avg=1.36ms   min=51.13µs med=114.91µs max=312.82ms p(90)=1.53ms   p(95)=3.61ms   p(99.9)=137.69ms
     http_req_sending...............: avg=54.79µs  min=5.21µs  med=9.83µs   max=53.7ms   p(90)=18.25µs  p(95)=112.21µs p(99.9)=7.68ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=122.42ms min=1.71ms  med=113.55ms max=769.7ms  p(90)=236.09ms p(95)=267.01ms p(99.9)=610.27ms
     http_reqs......................: 114961  1845.530992/s
     iteration_duration.............: avg=125.21ms min=3.13ms  med=116.45ms max=770.59ms p(90)=238.81ms p(95)=271.43ms p(99.9)=616.26ms
     iterations.....................: 113961  1829.477452/s
     success_rate...................: 100.00% ✓ 113961      ✗ 0     
     vus............................: 68      min=0         max=495 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (.net subgraphs) (0.321.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 206097      ✗ 0    
     data_received..................: 6.1 GB  97 MB/s
     data_sent......................: 84 MB   1.3 MB/s
     http_req_blocked...............: avg=7.39µs   min=1.01µs  med=2.4µs    max=42.99ms  p(90)=4.05µs   p(95)=5.03µs   p(99.9)=699.48µs
     http_req_connecting............: avg=4.3µs    min=0s      med=0s       max=42.92ms  p(90)=0s       p(95)=0s       p(99.9)=588.83µs
     http_req_duration..............: avg=204.75ms min=2.17ms  med=202.3ms  max=578.34ms p(90)=378.8ms  p(95)=408.53ms p(99.9)=517.45ms
       { expected_response:true }...: avg=204.75ms min=2.17ms  med=202.3ms  max=578.34ms p(90)=378.8ms  p(95)=408.53ms p(99.9)=517.45ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 69699
     http_req_receiving.............: avg=82.58µs  min=30.45µs med=64.53µs  max=109.08ms p(90)=102.7µs  p(95)=118.6µs  p(99.9)=1.61ms  
     http_req_sending...............: avg=34.26µs  min=5.55µs  med=11.54µs  max=175.12ms p(90)=18.94µs  p(95)=22.47µs  p(99.9)=3.61ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=204.63ms min=2.09ms  med=202.17ms max=578.29ms p(90)=378.71ms p(95)=408.42ms p(99.9)=517.38ms
     http_reqs......................: 69699   1110.866315/s
     iteration_duration.............: avg=207.98ms min=5.14ms  med=205.92ms max=578.57ms p(90)=380.03ms p(95)=409.31ms p(99.9)=517.98ms
     iterations.....................: 68699   1094.928263/s
     success_rate...................: 100.00% ✓ 68699       ✗ 0    
     vus............................: 92      min=0         max=500
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (.net subgraphs) (2.8.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 92778      ✗ 0    
     data_received..................: 2.8 GB  43 MB/s
     data_sent......................: 38 MB   589 kB/s
     http_req_blocked...............: avg=11.12µs  min=1.09µs  med=3.22µs   max=28.22ms  p(90)=5.06µs   p(95)=6.06µs   p(99.9)=1.92ms
     http_req_connecting............: avg=6.81µs   min=0s      med=0s       max=28.13ms  p(90)=0s       p(95)=0s       p(99.9)=1.89ms
     http_req_duration..............: avg=449.68ms min=3.99ms  med=420.5ms  max=1.91s    p(90)=879.35ms p(95)=957.59ms p(99.9)=1.48s 
       { expected_response:true }...: avg=449.68ms min=3.99ms  med=420.5ms  max=1.91s    p(90)=879.35ms p(95)=957.59ms p(99.9)=1.48s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 31926
     http_req_receiving.............: avg=91.46µs  min=31.52µs med=80.96µs  max=45.71ms  p(90)=118.48µs p(95)=132.88µs p(99.9)=1.02ms
     http_req_sending...............: avg=34.25µs  min=5.81µs  med=14.75µs  max=136.49ms p(90)=22.12µs  p(95)=25.37µs  p(99.9)=2.47ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=449.56ms min=3.91ms  med=420.39ms max=1.91s    p(90)=879.24ms p(95)=957.49ms p(99.9)=1.48s 
     http_reqs......................: 31926   490.873701/s
     iteration_duration.............: avg=464.46ms min=32.03ms med=437.8ms  max=1.91s    p(90)=882.21ms p(95)=960.32ms p(99.9)=1.49s 
     iterations.....................: 30926   475.498342/s
     success_rate...................: 100.00% ✓ 30926      ✗ 0    
     vus............................: 58      min=0        max=498
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (.net subgraphs) (2.8.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 42669      ✗ 0    
     data_received..................: 1.3 GB  20 MB/s
     data_sent......................: 18 MB   268 kB/s
     http_req_blocked...............: avg=18.75µs  min=1.24µs  med=3.8µs    max=38.37ms p(90)=5.75µs   p(95)=7.37µs   p(99.9)=2.66ms
     http_req_connecting............: avg=13.05µs  min=0s      med=0s       max=38.31ms p(90)=0s       p(95)=0s       p(99.9)=2.64ms
     http_req_duration..............: avg=959.7ms  min=6.36ms  med=853.77ms max=5.81s   p(90)=1.89s    p(95)=2.15s    p(99.9)=5.19s 
       { expected_response:true }...: avg=959.7ms  min=6.36ms  med=853.77ms max=5.81s   p(90)=1.89s    p(95)=2.15s    p(99.9)=5.19s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 15223
     http_req_receiving.............: avg=116.18µs min=35.05µs med=100.6µs  max=81.14ms p(90)=139.66µs p(95)=153.18µs p(99.9)=1.07ms
     http_req_sending...............: avg=33.96µs  min=6.14µs  med=18.83µs  max=49.51ms p(90)=25.06µs  p(95)=30.04µs  p(99.9)=2.5ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=959.55ms min=6.23ms  med=853.62ms max=5.81s   p(90)=1.89s    p(95)=2.15s    p(99.9)=5.19s 
     http_reqs......................: 15223   223.296859/s
     iteration_duration.............: avg=1.02s    min=42.75ms med=934.93ms max=5.82s   p(90)=1.93s    p(95)=2.16s    p(99.9)=5.2s  
     iterations.....................: 14223   208.628472/s
     success_rate...................: 100.00% ✓ 14223      ✗ 0    
     vus............................: 66      min=0        max=500
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

     checks.........................: 100.00% ✓ 40893      ✗ 0    
     data_received..................: 1.3 GB  18 MB/s
     data_sent......................: 18 MB   251 kB/s
     http_req_blocked...............: avg=16.58µs  min=1.28µs  med=3.64µs   max=3.89ms   p(90)=5.41µs   p(95)=7.23µs   p(99.9)=2.54ms  
     http_req_connecting............: avg=11.02µs  min=0s      med=0s       max=3.85ms   p(90)=0s       p(95)=0s       p(99.9)=2.5ms   
     http_req_duration..............: avg=996.41ms min=8.8ms   med=900.07ms max=4.12s    p(90)=2.05s    p(95)=2.19s    p(99.9)=3.63s   
       { expected_response:true }...: avg=996.41ms min=8.8ms   med=900.07ms max=4.12s    p(90)=2.05s    p(95)=2.19s    p(99.9)=3.63s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 14631
     http_req_receiving.............: avg=101.61µs min=34.48µs med=94.86µs  max=15.78ms  p(90)=134.11µs p(95)=145.69µs p(99.9)=702.17µs
     http_req_sending...............: avg=42.01µs  min=6.13µs  med=18.2µs   max=120.39ms p(90)=24.26µs  p(95)=29.04µs  p(99.9)=2.97ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=996.26ms min=8.7ms   med=899.95ms max=4.12s    p(90)=2.05s    p(95)=2.19s    p(99.9)=3.63s   
     http_reqs......................: 14631   209.316223/s
     iteration_duration.............: avg=1.06s    min=51.94ms med=991.75ms max=4.13s    p(90)=2.08s    p(95)=2.2s     p(99.9)=3.67s   
     iterations.....................: 13631   195.009872/s
     success_rate...................: 100.00% ✓ 13631      ✗ 0    
     vus............................: 17      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-181-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

