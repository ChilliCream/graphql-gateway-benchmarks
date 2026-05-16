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
| hive-router | v0.0.49 | 2,688 | 2,818 | 2,638 | 2.1% |  |
| hotchocolate | 16.1.0-p.1.10 | 2,110 | 2,152 | 2,090 | 0.9% |  |
| cosmo | 0.307.0 | 1,162 | 1,171 | 1,156 | 0.6% | non-compatible response (10 across 6/9 runs) |
| hive-gateway-router-runtime | 2.5.25 | 492 | 495 | 490 | 0.4% |  |
| hive-gateway | 2.5.25 | 238 | 239 | 235 | 0.6% |  |
| apollo-gateway | 2.13.3 | 202 | 207 | 201 | 0.9% |  |
| apollo-router | v2.13.1 | — | — | — | — | non-compatible response (18124 across 9/9 runs) |
| grafbase | 0.53.3 | — | — | — | — | non-compatible response (531525 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.49 | 2,329 | 2,439 | 2,302 | 2.0% |  |
| hotchocolate | 16.1.0-p.1.10 | 1,933 | 1,953 | 1,888 | 1.2% |  |
| cosmo | 0.307.0 | 1,125 | 1,125 | 1,121 | 0.3% | non-compatible response (17 across 7/9 runs) |
| hive-gateway-router-runtime | 2.5.25 | 462 | 469 | 455 | 1.0% |  |
| hive-gateway | 2.5.25 | 224 | 228 | 223 | 0.7% |  |
| apollo-gateway | 2.13.3 | 209 | 210 | 208 | 0.4% |  |
| apollo-router | v2.13.1 | — | — | — | — | non-compatible response (14534 across 9/9 runs) |
| grafbase | 0.53.3 | — | — | — | — | non-compatible response (330612 across 9/9 runs) |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.49)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 496185      ✗ 0     
     data_received..................: 15 GB   236 MB/s
     data_sent......................: 200 MB  3.2 MB/s
     http_req_blocked...............: avg=24.8µs  min=1µs     med=2.23µs  max=110.78ms p(90)=3.61µs   p(95)=4.69µs   p(99.9)=4.88ms  
     http_req_connecting............: avg=21.71µs min=0s      med=0s      max=110.64ms p(90)=0s       p(95)=0s       p(99.9)=4.72ms  
     http_req_duration..............: avg=85.38ms min=1.63ms  med=79.31ms max=371.17ms p(90)=166.09ms p(95)=181.62ms p(99.9)=236.69ms
       { expected_response:true }...: avg=85.38ms min=1.63ms  med=79.31ms max=371.17ms p(90)=166.09ms p(95)=181.62ms p(99.9)=236.69ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 166395
     http_req_receiving.............: avg=347.3µs min=28.38µs med=55.71µs max=210.08ms p(90)=230.84µs p(95)=415.55µs p(99.9)=33.51ms 
     http_req_sending...............: avg=86.62µs min=5.38µs  med=9.84µs  max=339.22ms p(90)=18.34µs  p(95)=132.24µs p(99.9)=12.41ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=84.95ms min=1.55ms  med=79.03ms max=279ms    p(90)=165.38ms p(95)=180.39ms p(99.9)=233.23ms
     http_reqs......................: 166395  2688.950232/s
     iteration_duration.............: avg=86.19ms min=2.39ms  med=80.2ms  max=408.94ms p(90)=166.63ms p(95)=182.19ms p(99.9)=238.25ms
     iterations.....................: 165395  2672.79019/s
     success_rate...................: 100.00% ✓ 165395      ✗ 0     
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

     checks.........................: 100.00% ✓ 393408      ✗ 0     
     data_received..................: 12 GB   185 MB/s
     data_sent......................: 159 MB  2.5 MB/s
     http_req_blocked...............: avg=14.72µs  min=990ns   med=2.22µs   max=69.22ms  p(90)=3.54µs   p(95)=4.45µs   p(99.9)=1.27ms  
     http_req_connecting............: avg=11.45µs  min=0s      med=0s       max=69.18ms  p(90)=0s       p(95)=0s       p(99.9)=1.12ms  
     http_req_duration..............: avg=107.71ms min=2.32ms  med=99.35ms  max=599.66ms p(90)=211.71ms p(95)=247.26ms p(99.9)=419.88ms
       { expected_response:true }...: avg=107.71ms min=2.32ms  med=99.35ms  max=599.66ms p(90)=211.71ms p(95)=247.26ms p(99.9)=419.88ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 132136
     http_req_receiving.............: avg=2.05ms   min=51.26µs med=110.34µs max=292.13ms p(90)=1.49ms   p(95)=5.88ms   p(99.9)=130.22ms
     http_req_sending...............: avg=68.09µs  min=5.28µs  med=9.51µs   max=166.27ms p(90)=17.36µs  p(95)=118.17µs p(99.9)=9.43ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=105.58ms min=2.24ms  med=98.16ms  max=584.29ms p(90)=207.18ms p(95)=238.32ms p(99.9)=394.48ms
     http_reqs......................: 132136  2110.096056/s
     iteration_duration.............: avg=108.8ms  min=3.44ms  med=100.6ms  max=599.86ms p(90)=212.55ms p(95)=248.14ms p(99.9)=420.8ms 
     iterations.....................: 131136  2094.126933/s
     success_rate...................: 100.00% ✓ 131136      ✗ 0     
     vus............................: 86      min=0         max=497 
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

     checks.........................: 100.00% ✓ 214902      ✗ 0    
     data_received..................: 6.4 GB  102 MB/s
     data_sent......................: 87 MB   1.4 MB/s
     http_req_blocked...............: avg=6.12µs   min=1.08µs  med=2.28µs   max=19.11ms  p(90)=3.7µs    p(95)=4.49µs   p(99.9)=475.51µs
     http_req_connecting............: avg=3.15µs   min=0s      med=0s       max=18.96ms  p(90)=0s       p(95)=0s       p(99.9)=430.27µs
     http_req_duration..............: avg=196.51ms min=2.06ms  med=199.32ms max=743.55ms p(90)=362.06ms p(95)=392.99ms p(99.9)=554.73ms
       { expected_response:true }...: avg=196.51ms min=2.06ms  med=199.32ms max=743.55ms p(90)=362.06ms p(95)=392.99ms p(99.9)=554.73ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 72634
     http_req_receiving.............: avg=83.25µs  min=30.37µs med=59.47µs  max=172.39ms p(90)=92.6µs   p(95)=108.26µs p(99.9)=2.34ms  
     http_req_sending...............: avg=27.73µs  min=5.16µs  med=10.25µs  max=58.38ms  p(90)=15.42µs  p(95)=19.28µs  p(99.9)=3.38ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=196.4ms  min=1.99ms  med=199.22ms max=743.5ms  p(90)=361.97ms p(95)=392.87ms p(99.9)=554.67ms
     http_reqs......................: 72634   1162.259528/s
     iteration_duration.............: avg=199.49ms min=4.05ms  med=202.68ms max=743.75ms p(90)=363ms    p(95)=393.87ms p(99.9)=555.46ms
     iterations.....................: 71634   1146.257938/s
     success_rate...................: 100.00% ✓ 71634       ✗ 0    
     vus............................: 80      min=0         max=492
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

     checks.........................: 100.00% ✓ 92982      ✗ 0    
     data_received..................: 2.8 GB  43 MB/s
     data_sent......................: 38 MB   591 kB/s
     http_req_blocked...............: avg=9µs      min=1.08µs  med=3.15µs   max=20.61ms  p(90)=4.93µs   p(95)=5.99µs   p(99.9)=1.1ms   
     http_req_connecting............: avg=4.83µs   min=0s      med=0s       max=20.22ms  p(90)=0s       p(95)=0s       p(99.9)=1.06ms  
     http_req_duration..............: avg=448.99ms min=4.1ms   med=417.91ms max=1.89s    p(90)=892.54ms p(95)=970.85ms p(99.9)=1.42s   
       { expected_response:true }...: avg=448.99ms min=4.1ms   med=417.91ms max=1.89s    p(90)=892.54ms p(95)=970.85ms p(99.9)=1.42s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 31994
     http_req_receiving.............: avg=91.23µs  min=31.97µs med=79.84µs  max=77.82ms  p(90)=116.65µs p(95)=130.83µs p(99.9)=828.52µs
     http_req_sending...............: avg=35.22µs  min=5.73µs  med=14.01µs  max=106.92ms p(90)=21.42µs  p(95)=24.92µs  p(99.9)=3.57ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=448.86ms min=4.04ms  med=417.82ms max=1.89s    p(90)=892.45ms p(95)=970.72ms p(99.9)=1.42s   
     http_reqs......................: 31994   492.310059/s
     iteration_duration.............: avg=463.69ms min=28.44ms med=436.98ms max=1.9s     p(90)=897.46ms p(95)=973.83ms p(99.9)=1.44s   
     iterations.....................: 30994   476.922485/s
     success_rate...................: 100.00% ✓ 30994      ✗ 0    
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

     checks.........................: 100.00% ✓ 45621      ✗ 0    
     data_received..................: 1.4 GB  21 MB/s
     data_sent......................: 20 MB   287 kB/s
     http_req_blocked...............: avg=14.31µs  min=1.28µs  med=3.51µs   max=6.35ms  p(90)=5.37µs   p(95)=7.05µs   p(99.9)=2.38ms
     http_req_connecting............: avg=9.15µs   min=0s      med=0s       max=6.17ms  p(90)=0s       p(95)=0s       p(99.9)=2.35ms
     http_req_duration..............: avg=887.3ms  min=6.16ms  med=772.29ms max=18.68s  p(90)=1.53s    p(95)=1.68s    p(99.9)=16.53s
       { expected_response:true }...: avg=887.3ms  min=6.16ms  med=772.29ms max=18.68s  p(90)=1.53s    p(95)=1.68s    p(99.9)=16.53s
     http_req_failed................: 0.00%   ✓ 0          ✗ 16207
     http_req_receiving.............: avg=102.4µs  min=37.57µs med=95.43µs  max=5.27ms  p(90)=132.56µs p(95)=146.24µs p(99.9)=1.02ms
     http_req_sending...............: avg=35.89µs  min=6.49µs  med=17.34µs  max=52.49ms p(90)=23.57µs  p(95)=28.7µs   p(99.9)=3.29ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=887.16ms min=6.07ms  med=772.04ms max=18.68s  p(90)=1.53s    p(95)=1.68s    p(99.9)=16.53s
     http_reqs......................: 16207   238.420765/s
     iteration_duration.............: avg=945.65ms min=43.67ms med=832.05ms max=18.68s  p(90)=1.56s    p(95)=1.69s    p(99.9)=16.69s
     iterations.....................: 15207   223.70979/s
     success_rate...................: 100.00% ✓ 15207      ✗ 0    
     vus............................: 55      min=0        max=500
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

     checks.........................: 100.00% ✓ 42123      ✗ 0    
     data_received..................: 1.3 GB  18 MB/s
     data_sent......................: 19 MB   249 kB/s
     http_req_blocked...............: avg=16.38µs  min=1.27µs  med=3.31µs   max=5.6ms   p(90)=4.93µs   p(95)=6.59µs   p(99.9)=2.75ms 
     http_req_connecting............: avg=11.21µs  min=0s      med=0s       max=5.54ms  p(90)=0s       p(95)=0s       p(99.9)=2.65ms 
     http_req_duration..............: avg=432.77ms min=8.43ms  med=464.02ms max=1.26s   p(90)=737.53ms p(95)=787.76ms p(99.9)=1.1s   
       { expected_response:true }...: avg=432.77ms min=8.43ms  med=464.02ms max=1.26s   p(90)=737.53ms p(95)=787.76ms p(99.9)=1.1s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 15041
     http_req_receiving.............: avg=101.55µs min=36.01µs med=88.04µs  max=63.2ms  p(90)=126.64µs p(95)=140.68µs p(99.9)=842.3µs
     http_req_sending...............: avg=38.29µs  min=5.94µs  med=15.39µs  max=68.33ms p(90)=21.6µs   p(95)=26.78µs  p(99.9)=4.65ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=432.63ms min=8.3ms   med=463.93ms max=1.26s   p(90)=737.44ms p(95)=787.65ms p(99.9)=1.1s   
     http_reqs......................: 15041   202.486697/s
     iteration_duration.............: avg=463.45ms min=8.77ms  med=498.6ms  max=1.27s   p(90)=741.88ms p(95)=794.41ms p(99.9)=1.1s   
     iterations.....................: 14041   189.024381/s
     success_rate...................: 100.00% ✓ 14041      ✗ 0    
     vus............................: 66      min=0        max=494
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

     checks.........................: 100.00% ✓ 431121      ✗ 0     
     data_received..................: 13 GB   204 MB/s
     data_sent......................: 174 MB  2.8 MB/s
     http_req_blocked...............: avg=31.29µs  min=1.05µs  med=2.87µs  max=137.56ms p(90)=4.86µs   p(95)=6.24µs   p(99.9)=9.73ms  
     http_req_connecting............: avg=27.36µs  min=0s      med=0s      max=137.48ms p(90)=0s       p(95)=0s       p(99.9)=9.63ms  
     http_req_duration..............: avg=98.24ms  min=1.66ms  med=91.19ms max=331.38ms p(90)=190.17ms p(95)=208.03ms p(99.9)=275.57ms
       { expected_response:true }...: avg=98.24ms  min=1.66ms  med=91.19ms max=331.38ms p(90)=190.17ms p(95)=208.03ms p(99.9)=275.57ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 144707
     http_req_receiving.............: avg=307.62µs min=29.84µs med=61.89µs max=70.27ms  p(90)=196.91µs p(95)=442.82µs p(99.9)=31.85ms 
     http_req_sending...............: avg=93.72µs  min=5.33µs  med=11.39µs max=203.26ms p(90)=22.05µs  p(95)=142.69µs p(99.9)=14.45ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=97.84ms  min=1.59ms  med=90.89ms max=331.32ms p(90)=189.56ms p(95)=207.2ms  p(99.9)=271.17ms
     http_reqs......................: 144707  2329.615171/s
     iteration_duration.............: avg=99.23ms  min=4.27ms  med=92.33ms max=336.68ms p(90)=190.77ms p(95)=208.61ms p(99.9)=278.2ms 
     iterations.....................: 143707  2313.516328/s
     success_rate...................: 100.00% ✓ 143707      ✗ 0     
     vus............................: 63      min=0         max=497 
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

     checks.........................: 100.00% ✓ 358215      ✗ 0     
     data_received..................: 11 GB   170 MB/s
     data_sent......................: 145 MB  2.3 MB/s
     http_req_blocked...............: avg=21.17µs  min=1.01µs  med=2.51µs   max=91.03ms  p(90)=4.27µs   p(95)=5.37µs   p(99.9)=2.81ms  
     http_req_connecting............: avg=17.85µs  min=0s      med=0s       max=90.85ms  p(90)=0s       p(95)=0s       p(99.9)=2.7ms   
     http_req_duration..............: avg=118.22ms min=1.86ms  med=109.26ms max=878.87ms p(90)=229.39ms p(95)=264.79ms p(99.9)=609.01ms
       { expected_response:true }...: avg=118.22ms min=1.86ms  med=109.26ms max=878.87ms p(90)=229.39ms p(95)=264.79ms p(99.9)=609.01ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 120405
     http_req_receiving.............: avg=2.1ms    min=52.02µs med=116.69µs max=546.92ms p(90)=1.62ms   p(95)=4.71ms   p(99.9)=196.57ms
     http_req_sending...............: avg=67.08µs  min=5.27µs  med=10.45µs  max=137.65ms p(90)=20.51µs  p(95)=125.34µs p(99.9)=8.83ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=116.05ms min=1.76ms  med=108.15ms max=763.84ms p(90)=226.26ms p(95)=258.98ms p(99.9)=482.87ms
     http_reqs......................: 120405  1933.516491/s
     iteration_duration.............: avg=119.5ms  min=2.93ms  med=110.69ms max=879.15ms p(90)=230.1ms  p(95)=265.79ms p(99.9)=609.28ms
     iterations.....................: 119405  1917.458051/s
     success_rate...................: 100.00% ✓ 119405      ✗ 0     
     vus............................: 71      min=0         max=495 
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

     checks.........................: 100.00% ✓ 208320      ✗ 0    
     data_received..................: 6.2 GB  99 MB/s
     data_sent......................: 85 MB   1.4 MB/s
     http_req_blocked...............: avg=11.29µs  min=1.07µs  med=2.33µs   max=20.92ms  p(90)=3.95µs   p(95)=4.93µs   p(99.9)=561.42µs
     http_req_connecting............: avg=8.27µs   min=0s      med=0s       max=20.88ms  p(90)=0s       p(95)=0s       p(99.9)=488.27µs
     http_req_duration..............: avg=202.64ms min=2.1ms   med=203.23ms max=560.82ms p(90)=375.24ms p(95)=401.66ms p(99.9)=479.8ms 
       { expected_response:true }...: avg=202.64ms min=2.1ms   med=203.23ms max=560.82ms p(90)=375.24ms p(95)=401.66ms p(99.9)=479.8ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 70440
     http_req_receiving.............: avg=143.43µs min=29.99µs med=62.55µs  max=247.59ms p(90)=97.76µs  p(95)=112.23µs p(99.9)=2.53ms  
     http_req_sending...............: avg=37.1µs   min=5.41µs  med=10.71µs  max=29.58ms  p(90)=16.59µs  p(95)=20.16µs  p(99.9)=5.84ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=202.45ms min=2.03ms  med=202.93ms max=560.75ms p(90)=375.16ms p(95)=401.58ms p(99.9)=479.71ms
     http_reqs......................: 70440   1125.559341/s
     iteration_duration.............: avg=205.8ms  min=4.84ms  med=206.47ms max=561ms    p(90)=376.16ms p(95)=402.26ms p(99.9)=480.27ms
     iterations.....................: 69440   1109.580361/s
     success_rate...................: 100.00% ✓ 69440       ✗ 0    
     vus............................: 84      min=0         max=496
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

     checks.........................: 100.00% ✓ 87657      ✗ 0    
     data_received..................: 2.6 GB  41 MB/s
     data_sent......................: 36 MB   555 kB/s
     http_req_blocked...............: avg=8.77µs   min=1.11µs  med=3.2µs    max=5.41ms   p(90)=4.98µs   p(95)=6.03µs   p(99.9)=1.1ms   
     http_req_connecting............: avg=4.31µs   min=0s      med=0s       max=5.34ms   p(90)=0s       p(95)=0s       p(99.9)=973.27µs
     http_req_duration..............: avg=475.49ms min=4.21ms  med=441.58ms max=1.7s     p(90)=940.34ms p(95)=1.02s    p(99.9)=1.52s   
       { expected_response:true }...: avg=475.49ms min=4.21ms  med=441.58ms max=1.7s     p(90)=940.34ms p(95)=1.02s    p(99.9)=1.52s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 30219
     http_req_receiving.............: avg=101.29µs min=31.8µs  med=82.65µs  max=127.13ms p(90)=119.56µs p(95)=133.46µs p(99.9)=834.47µs
     http_req_sending...............: avg=25.5µs   min=5.78µs  med=14.62µs  max=16.37ms  p(90)=21.76µs  p(95)=25.11µs  p(99.9)=2.71ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=475.37ms min=4.15ms  med=441.45ms max=1.7s     p(90)=940.26ms p(95)=1.02s    p(99.9)=1.52s   
     http_reqs......................: 30219   462.367803/s
     iteration_duration.............: avg=491.98ms min=28.69ms med=460.13ms max=1.7s     p(90)=946.15ms p(95)=1.03s    p(99.9)=1.53s   
     iterations.....................: 29219   447.067237/s
     success_rate...................: 100.00% ✓ 29219      ✗ 0    
     vus............................: 74      min=0        max=495
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

     checks.........................: 100.00% ✓ 43023      ✗ 0    
     data_received..................: 1.3 GB  20 MB/s
     data_sent......................: 18 MB   270 kB/s
     http_req_blocked...............: avg=16.47µs  min=1.25µs  med=3.7µs    max=42.41ms p(90)=5.53µs   p(95)=7.42µs   p(99.9)=1.7ms   
     http_req_connecting............: avg=10.72µs  min=0s      med=0s       max=42.35ms p(90)=0s       p(95)=0s       p(99.9)=1.52ms  
     http_req_duration..............: avg=950.7ms  min=6.33ms  med=860.31ms max=5.42s   p(90)=1.86s    p(95)=2.09s    p(99.9)=5.02s   
       { expected_response:true }...: avg=950.7ms  min=6.33ms  med=860.31ms max=5.42s   p(90)=1.86s    p(95)=2.09s    p(99.9)=5.02s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 15341
     http_req_receiving.............: avg=105.97µs min=34.56µs med=99.47µs  max=10.64ms p(90)=139.59µs p(95)=152.39µs p(99.9)=926.16µs
     http_req_sending...............: avg=36.28µs  min=6.52µs  med=17.71µs  max=90.54ms p(90)=23.87µs  p(95)=29.4µs   p(99.9)=2.94ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=950.55ms min=6.23ms  med=860.17ms max=5.42s   p(90)=1.86s    p(95)=2.09s    p(99.9)=5.02s   
     http_reqs......................: 15341   224.520723/s
     iteration_duration.............: avg=1.01s    min=42.16ms med=960.27ms max=5.42s   p(90)=1.9s     p(95)=2.1s     p(99.9)=5.06s   
     iterations.....................: 14341   209.885384/s
     success_rate...................: 100.00% ✓ 14341      ✗ 0    
     vus............................: 66      min=0        max=500
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

     checks.........................: 100.00% ✓ 40941      ✗ 0    
     data_received..................: 1.3 GB  18 MB/s
     data_sent......................: 18 MB   252 kB/s
     http_req_blocked...............: avg=12.39µs  min=1.15µs  med=3.44µs   max=3.17ms  p(90)=5.12µs  p(95)=6.59µs   p(99.9)=1.36ms  
     http_req_connecting............: avg=7.07µs   min=0s      med=0s       max=2.55ms  p(90)=0s      p(95)=0s       p(99.9)=1.26ms  
     http_req_duration..............: avg=994.04ms min=8.65ms  med=893.89ms max=4.09s   p(90)=2.03s   p(95)=2.18s    p(99.9)=3.49s   
       { expected_response:true }...: avg=994.04ms min=8.65ms  med=893.89ms max=4.09s   p(90)=2.03s   p(95)=2.18s    p(99.9)=3.49s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 14647
     http_req_receiving.............: avg=105.66µs min=31.87µs med=94.94µs  max=52.28ms p(90)=135.9µs p(95)=148.59µs p(99.9)=883.07µs
     http_req_sending...............: avg=33.58µs  min=5.73µs  med=17.11µs  max=74.13ms p(90)=23µs    p(95)=28.29µs  p(99.9)=2.35ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=993.9ms  min=8.53ms  med=893.78ms max=4.09s   p(90)=2.03s   p(95)=2.18s    p(99.9)=3.49s   
     http_reqs......................: 14647   209.675218/s
     iteration_duration.............: avg=1.06s    min=63.6ms  med=977.52ms max=4.1s    p(90)=2.04s   p(95)=2.2s     p(99.9)=3.52s   
     iterations.....................: 13647   195.359985/s
     success_rate...................: 100.00% ✓ 13647      ✗ 0    
     vus............................: 10      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-177-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

