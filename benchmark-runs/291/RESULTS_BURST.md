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
| hive-router | v0.0.83 | 2,886 | 3,041 | 2,858 | 2.1% |  |
| fusion-nightly-net11 | 16.5.1-p.2 | 2,490 | 2,607 | 2,456 | 1.9% |  |
| fusion | 16.5.0 | 2,474 | 2,573 | 2,466 | 1.5% |  |
| fusion-nightly | 16.5.1-p.2 | 2,406 | 2,486 | 2,392 | 1.3% |  |
| cosmo | 0.331.1 | 1,241 | 1,281 | 1,237 | 1.2% |  |
| hive-gateway-router-runtime | 2.10.4 | 570 | 586 | 565 | 1.3% |  |
| hive-gateway | 2.10.4 | 249 | 255 | 247 | 1.1% |  |
| apollo-gateway | 2.14.2 | 236 | 242 | 234 | 1.0% |  |
| apollo-router | v2.16.0 | — | — | — | — | non-compatible response (9162 across 9/9 runs) |
| feddi | — | — | — | — | — | not run |
| fusion-nightly-fed | — | — | — | — | — | not run |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (551498 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| fusion-nightly-net11 | 16.5.1-p.2 | 2,404 | 2,498 | 2,396 | 1.4% |  |
| hive-router | v0.0.83 | 2,399 | 2,570 | 2,382 | 2.6% |  |
| fusion | 16.5.0 | 2,330 | 2,425 | 2,328 | 1.5% |  |
| fusion-nightly | 16.5.1-p.2 | 2,301 | 2,387 | 2,274 | 1.5% |  |
| fusion-nightly-fed | 16.5.1-p.2 | 2,092 | 2,208 | 2,077 | 2.1% |  |
| cosmo | 0.331.1 | 1,115 | 1,158 | 1,105 | 1.5% |  |
| hive-gateway-router-runtime | 2.10.4 | 532 | 546 | 528 | 1.2% |  |
| hive-gateway | 2.10.4 | 241 | 247 | 239 | 1.0% |  |
| apollo-gateway | 2.14.2 | 231 | 236 | 230 | 0.8% |  |
| apollo-router | v2.16.0 | — | — | — | — | non-compatible response (18754 across 9/9 runs) |
| feddi | — | — | — | — | — | not run |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (356896 across 9/9 runs) |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.83)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 531015      ✗ 0     
     data_received..................: 16 GB   253 MB/s
     data_sent......................: 214 MB  3.5 MB/s
     http_req_blocked...............: avg=24.91µs  min=1.01µs  med=2.69µs  max=73.12ms  p(90)=4.37µs   p(95)=5.58µs   p(99.9)=2.27ms  
     http_req_connecting............: avg=21.32µs  min=0s      med=0s      max=73.07ms  p(90)=0s       p(95)=0s       p(99.9)=2.21ms  
     http_req_duration..............: avg=79.8ms   min=1.4ms   med=74.58ms max=324.77ms p(90)=152.83ms p(95)=168.53ms p(99.9)=223.84ms
       { expected_response:true }...: avg=79.8ms   min=1.4ms   med=74.58ms max=324.77ms p(90)=152.83ms p(95)=168.53ms p(99.9)=223.84ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 178005
     http_req_receiving.............: avg=158.61µs min=23.54µs med=51.82µs max=50.78ms  p(90)=160.77µs p(95)=358.15µs p(99.9)=19.04ms 
     http_req_sending...............: avg=77.68µs  min=4.58µs  med=10.03µs max=158.8ms  p(90)=19.57µs  p(95)=126.01µs p(99.9)=10.88ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=79.56ms  min=1.34ms  med=74.38ms max=324.46ms p(90)=152.55ms p(95)=168.16ms p(99.9)=222.4ms 
     http_reqs......................: 178005  2886.233485/s
     iteration_duration.............: avg=80.52ms  min=2.15ms  med=75.35ms max=348.87ms p(90)=153.26ms p(95)=169.1ms  p(99.9)=227.12ms
     iterations.....................: 177005  2870.019145/s
     success_rate...................: 100.00% ✓ 177005      ✗ 0     
     vus............................: 88      min=0         max=493 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (rust subgraphs) (16.5.1-p.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 462042      ✗ 0     
     data_received..................: 14 GB   218 MB/s
     data_sent......................: 186 MB  3.0 MB/s
     http_req_blocked...............: avg=22.79µs  min=982ns   med=2.73µs   max=55.35ms  p(90)=4.45µs   p(95)=5.64µs   p(99.9)=2.63ms  
     http_req_connecting............: avg=18.99µs  min=0s      med=0s       max=55.11ms  p(90)=0s       p(95)=0s       p(99.9)=2.41ms  
     http_req_duration..............: avg=91.72ms  min=1.89ms  med=86.28ms  max=345.02ms p(90)=175.42ms p(95)=192.92ms p(99.9)=255.22ms
       { expected_response:true }...: avg=91.72ms  min=1.89ms  med=86.28ms  max=345.02ms p(90)=175.42ms p(95)=192.92ms p(99.9)=255.22ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 155014
     http_req_receiving.............: avg=752.83µs min=53.72µs med=115.09µs max=276.81ms p(90)=1.5ms    p(95)=2.45ms   p(99.9)=29.5ms  
     http_req_sending...............: avg=77.13µs  min=4.82µs  med=10.18µs  max=272.52ms p(90)=20.94µs  p(95)=125.08µs p(99.9)=10.23ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=90.89ms  min=1.82ms  med=85.44ms  max=343.89ms p(90)=174.57ms p(95)=191.82ms p(99.9)=253.45ms
     http_reqs......................: 155014  2490.509631/s
     iteration_duration.............: avg=92.58ms  min=4.2ms   med=87.21ms  max=351.72ms p(90)=175.95ms p(95)=193.4ms  p(99.9)=256.11ms
     iterations.....................: 154014  2474.443278/s
     success_rate...................: 100.00% ✓ 154014      ✗ 0     
     vus............................: 67      min=0         max=495 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (rust subgraphs) (16.5.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 460131      ✗ 0     
     data_received..................: 14 GB   217 MB/s
     data_sent......................: 185 MB  3.0 MB/s
     http_req_blocked...............: avg=17.21µs min=911ns   med=2.11µs  max=84.29ms  p(90)=3.51µs   p(95)=4.56µs   p(99.9)=1.12ms  
     http_req_connecting............: avg=14.46µs min=0s      med=0s      max=84.11ms  p(90)=0s       p(95)=0s       p(99.9)=1.08ms  
     http_req_duration..............: avg=92.14ms min=2ms     med=80.37ms max=1.22s    p(90)=176.95ms p(95)=202.18ms p(99.9)=549.89ms
       { expected_response:true }...: avg=92.14ms min=2ms     med=80.37ms max=1.22s    p(90)=176.95ms p(95)=202.18ms p(99.9)=549.89ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 154377
     http_req_receiving.............: avg=1.3ms   min=50.27µs med=95.52µs max=496.14ms p(90)=1.47ms   p(95)=4.02ms   p(99.9)=98.2ms  
     http_req_sending...............: avg=65.81µs min=4.78µs  med=9.1µs   max=265.57ms p(90)=17.14µs  p(95)=101.47µs p(99.9)=8.37ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=90.77ms min=1.89ms  med=79.29ms max=1.22s    p(90)=175.06ms p(95)=199.22ms p(99.9)=545.33ms
     http_reqs......................: 154377  2474.25036/s
     iteration_duration.............: avg=93ms    min=3.37ms  med=81.29ms max=1.22s    p(90)=177.53ms p(95)=202.69ms p(99.9)=550.38ms
     iterations.....................: 153377  2458.223035/s
     success_rate...................: 100.00% ✓ 153377      ✗ 0     
     vus............................: 75      min=0         max=494 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (rust subgraphs) (16.5.1-p.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 447357      ✗ 0     
     data_received..................: 13 GB   211 MB/s
     data_sent......................: 180 MB  2.9 MB/s
     http_req_blocked...............: avg=13.46µs min=851ns   med=1.95µs  max=67.91ms  p(90)=3.22µs   p(95)=4.18µs   p(99.9)=908µs   
     http_req_connecting............: avg=10.8µs  min=0s      med=0s      max=67.85ms  p(90)=0s       p(95)=0s       p(99.9)=777.83µs
     http_req_duration..............: avg=94.81ms min=1.97ms  med=81.85ms max=1.77s    p(90)=179.9ms  p(95)=207.33ms p(99.9)=648.19ms
       { expected_response:true }...: avg=94.81ms min=1.97ms  med=81.85ms max=1.77s    p(90)=179.9ms  p(95)=207.33ms p(99.9)=648.19ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 150119
     http_req_receiving.............: avg=1.54ms  min=51.82µs med=99.88µs max=660.94ms p(90)=1.76ms   p(95)=4.78ms   p(99.9)=87.28ms 
     http_req_sending...............: avg=55.15µs min=4.38µs  med=8.4µs   max=169.5ms  p(90)=15.13µs  p(95)=93.12µs  p(99.9)=7.81ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=93.22ms min=1.88ms  med=80.68ms max=1.76s    p(90)=177.59ms p(95)=203.26ms p(99.9)=638.03ms
     http_reqs......................: 150119  2406.976168/s
     iteration_duration.............: avg=95.68ms min=3.49ms  med=82.76ms max=1.77s    p(90)=180.43ms p(95)=208ms    p(99.9)=649.01ms
     iterations.....................: 149119  2390.94238/s
     success_rate...................: 100.00% ✓ 149119      ✗ 0     
     vus............................: 79      min=0         max=494 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (rust subgraphs) (0.331.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 229572      ✗ 0    
     data_received..................: 6.8 GB  109 MB/s
     data_sent......................: 93 MB   1.5 MB/s
     http_req_blocked...............: avg=6.01µs   min=1.05µs  med=2.72µs   max=14.52ms  p(90)=4.44µs   p(95)=5.4µs    p(99.9)=499.84µs
     http_req_connecting............: avg=2.64µs   min=0s      med=0s       max=14.46ms  p(90)=0s       p(95)=0s       p(99.9)=434.39µs
     http_req_duration..............: avg=184.03ms min=1.83ms  med=184.84ms max=497.79ms p(90)=342.37ms p(95)=365.59ms p(99.9)=436.15ms
       { expected_response:true }...: avg=184.03ms min=1.83ms  med=184.84ms max=497.79ms p(90)=342.37ms p(95)=365.59ms p(99.9)=436.15ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 77524
     http_req_receiving.............: avg=75.39µs  min=28.17µs med=61.51µs  max=25.38ms  p(90)=99.92µs  p(95)=115.68µs p(99.9)=1.17ms  
     http_req_sending...............: avg=35.76µs  min=5.06µs  med=11.25µs  max=146.29ms p(90)=18.16µs  p(95)=22.39µs  p(99.9)=3.44ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=183.92ms min=1.77ms  med=184.71ms max=497.74ms p(90)=342.28ms p(95)=365.44ms p(99.9)=436.07ms
     http_reqs......................: 77524   1241.091415/s
     iteration_duration.............: avg=186.67ms min=4.04ms  med=187.54ms max=497.91ms p(90)=343.27ms p(95)=366.25ms p(99.9)=436.49ms
     iterations.....................: 76524   1225.08229/s
     success_rate...................: 100.00% ✓ 76524       ✗ 0    
     vus............................: 79      min=0         max=493
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (rust subgraphs) (2.10.4)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 106965     ✗ 0    
     data_received..................: 3.2 GB  50 MB/s
     data_sent......................: 44 MB   685 kB/s
     http_req_blocked...............: avg=8.15µs   min=1.15µs  med=3.08µs   max=10.36ms  p(90)=4.79µs   p(95)=5.87µs   p(99.9)=1.06ms
     http_req_connecting............: avg=4.07µs   min=0s      med=0s       max=10.16ms  p(90)=0s       p(95)=0s       p(99.9)=1.01ms
     http_req_duration..............: avg=391.29ms min=3.5ms   med=364.44ms max=1.67s    p(90)=772.12ms p(95)=832.65ms p(99.9)=1.2s  
       { expected_response:true }...: avg=391.29ms min=3.5ms   med=364.44ms max=1.67s    p(90)=772.12ms p(95)=832.65ms p(99.9)=1.2s  
     http_req_failed................: 0.00%   ✓ 0          ✗ 36655
     http_req_receiving.............: avg=82.43µs  min=28.13µs med=70.43µs  max=27.78ms  p(90)=110.27µs p(95)=125.15µs p(99.9)=1.04ms
     http_req_sending...............: avg=36.22µs  min=5.63µs  med=14.29µs  max=202.52ms p(90)=21.78µs  p(95)=24.89µs  p(99.9)=2.98ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=391.18ms min=3.45ms  med=364.33ms max=1.67s    p(90)=772.02ms p(95)=832.54ms p(99.9)=1.2s  
     http_reqs......................: 36655   570.914964/s
     iteration_duration.............: avg=402.53ms min=20.28ms med=377.04ms max=1.68s    p(90)=774.94ms p(95)=835.52ms p(99.9)=1.21s 
     iterations.....................: 35655   555.3396/s
     success_rate...................: 100.00% ✓ 35655      ✗ 0    
     vus............................: 65      min=0        max=496
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (rust subgraphs) (2.10.4)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 47547      ✗ 0    
     data_received..................: 1.5 GB  22 MB/s
     data_sent......................: 20 MB   300 kB/s
     http_req_blocked...............: avg=15.19µs  min=1.32µs  med=3.65µs   max=16.4ms  p(90)=5.41µs   p(95)=7.07µs  p(99.9)=2.21ms
     http_req_connecting............: avg=9.8µs    min=0s      med=0s       max=16.33ms p(90)=0s       p(95)=0s      p(99.9)=2.19ms
     http_req_duration..............: avg=852.98ms min=5.77ms  med=732.98ms max=17.87s  p(90)=1.49s    p(95)=1.7s    p(99.9)=13.82s
       { expected_response:true }...: avg=852.98ms min=5.77ms  med=732.98ms max=17.87s  p(90)=1.49s    p(95)=1.7s    p(99.9)=13.82s
     http_req_failed................: 0.00%   ✓ 0          ✗ 16849
     http_req_receiving.............: avg=100.23µs min=36.88µs med=87.75µs  max=53.29ms p(90)=123.16µs p(95)=138.6µs p(99.9)=1.46ms
     http_req_sending...............: avg=27.91µs  min=6.1µs   med=17.31µs  max=32.28ms p(90)=23.11µs  p(95)=27.39µs p(99.9)=2.52ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s      p(99.9)=0s    
     http_req_waiting...............: avg=852.86ms min=5.7ms   med=732.84ms max=17.87s  p(90)=1.49s    p(95)=1.7s    p(99.9)=13.82s
     http_reqs......................: 16849   249.037887/s
     iteration_duration.............: avg=906.84ms min=40.92ms med=795.65ms max=17.87s  p(90)=1.51s    p(95)=1.71s   p(99.9)=13.91s
     iterations.....................: 15849   234.257313/s
     success_rate...................: 100.00% ✓ 15849      ✗ 0    
     vus............................: 78      min=0        max=500
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

     checks.........................: 100.00% ✓ 48981      ✗ 0    
     data_received..................: 1.5 GB  21 MB/s
     data_sent......................: 21 MB   290 kB/s
     http_req_blocked...............: avg=11.15µs  min=1.1µs  med=3.27µs   max=3.05ms  p(90)=4.95µs   p(95)=6.2µs    p(99.9)=1.45ms  
     http_req_connecting............: avg=6.37µs   min=0s     med=0s       max=3.01ms  p(90)=0s       p(95)=0s       p(99.9)=1.43ms  
     http_req_duration..............: avg=402.24ms min=7.47ms med=450.34ms max=1.13s   p(90)=682.64ms p(95)=716.28ms p(99.9)=981.48ms
       { expected_response:true }...: avg=402.24ms min=7.47ms med=450.34ms max=1.13s   p(90)=682.64ms p(95)=716.28ms p(99.9)=981.48ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 17327
     http_req_receiving.............: avg=91.48µs  min=28.9µs med=83.63µs  max=36.09ms p(90)=121.89µs p(95)=138.01µs p(99.9)=924.62µs
     http_req_sending...............: avg=31.01µs  min=5.69µs med=17.02µs  max=61.06ms p(90)=22.64µs  p(95)=26.79µs  p(99.9)=2.35ms  
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=402.12ms min=7.36ms med=450.27ms max=1.13s   p(90)=682.49ms p(95)=716.19ms p(99.9)=981.32ms
     http_reqs......................: 17327   236.710908/s
     iteration_duration.............: avg=426.85ms min=9.87ms med=484.58ms max=1.14s   p(90)=686.34ms p(95)=720.96ms p(99.9)=989.62ms
     iterations.....................: 16327   223.049518/s
     success_rate...................: 100.00% ✓ 16327      ✗ 0    
     vus............................: 57      min=0        max=496
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (.net subgraphs) (16.5.1-p.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 443166      ✗ 0     
     data_received..................: 13 GB   211 MB/s
     data_sent......................: 179 MB  2.9 MB/s
     http_req_blocked...............: avg=16.26µs  min=882ns   med=2.34µs   max=52.54ms  p(90)=4.27µs   p(95)=5.49µs   p(99.9)=1.49ms  
     http_req_connecting............: avg=12.99µs  min=0s      med=0s       max=51.25ms  p(90)=0s       p(95)=0s       p(99.9)=1.39ms  
     http_req_duration..............: avg=95.63ms  min=1.49ms  med=90.87ms  max=320.92ms p(90)=182.21ms p(95)=198.29ms p(99.9)=254.45ms
       { expected_response:true }...: avg=95.63ms  min=1.49ms  med=90.87ms  max=320.92ms p(90)=182.21ms p(95)=198.29ms p(99.9)=254.45ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 148722
     http_req_receiving.............: avg=777.72µs min=53.88µs med=117.88µs max=87.54ms  p(90)=1.63ms   p(95)=2.58ms   p(99.9)=28.02ms 
     http_req_sending...............: avg=62.32µs  min=4.34µs  med=9.73µs   max=117.93ms p(90)=21.97µs  p(95)=111.19µs p(99.9)=8.21ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=94.79ms  min=1.39ms  med=90.03ms  max=320.83ms p(90)=181.41ms p(95)=197.33ms p(99.9)=253.28ms
     http_reqs......................: 148722  2404.871784/s
     iteration_duration.............: avg=96.53ms  min=3.68ms  med=91.87ms  max=321.11ms p(90)=182.66ms p(95)=198.76ms p(99.9)=255.13ms
     iterations.....................: 147722  2388.701535/s
     success_rate...................: 100.00% ✓ 147722      ✗ 0     
     vus............................: 95      min=0         max=500 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.83)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 443694      ✗ 0     
     data_received..................: 13 GB   210 MB/s
     data_sent......................: 179 MB  2.9 MB/s
     http_req_blocked...............: avg=14.11µs  min=911ns   med=2.43µs  max=45.88ms  p(90)=4.31µs   p(95)=5.54µs   p(99.9)=563.04µs
     http_req_connecting............: avg=10.99µs  min=0s      med=0s      max=45.72ms  p(90)=0s       p(95)=0s       p(99.9)=474.81µs
     http_req_duration..............: avg=95.52ms  min=1.58ms  med=91.63ms max=305.1ms  p(90)=184.65ms p(95)=200.24ms p(99.9)=243.98ms
       { expected_response:true }...: avg=95.52ms  min=1.58ms  med=91.63ms max=305.1ms  p(90)=184.65ms p(95)=200.24ms p(99.9)=243.98ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 148898
     http_req_receiving.............: avg=118.41µs min=25.47µs med=54.08µs max=40.47ms  p(90)=128.08µs p(95)=338.12µs p(99.9)=9.57ms  
     http_req_sending...............: avg=63.96µs  min=4.85µs  med=10.51µs max=178.68ms p(90)=21.32µs  p(95)=118.7µs  p(99.9)=7.89ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=95.33ms  min=1.54ms  med=91.46ms max=304.56ms p(90)=184.41ms p(95)=199.98ms p(99.9)=243.44ms
     http_reqs......................: 148898  2399.8152/s
     iteration_duration.............: avg=96.4ms   min=3.52ms  med=92.61ms max=333.8ms  p(90)=185.1ms  p(95)=200.74ms p(99.9)=244.79ms
     iterations.....................: 147898  2383.698024/s
     success_rate...................: 100.00% ✓ 147898      ✗ 0     
     vus............................: 59      min=0         max=498 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (.net subgraphs) (16.5.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 429663      ✗ 0     
     data_received..................: 13 GB   204 MB/s
     data_sent......................: 173 MB  2.8 MB/s
     http_req_blocked...............: avg=17.16µs min=872ns   med=2.18µs   max=98.66ms  p(90)=3.76µs   p(95)=4.91µs   p(99.9)=1.4ms   
     http_req_connecting............: avg=14.23µs min=0s      med=0s       max=98.48ms  p(90)=0s       p(95)=0s       p(99.9)=1.35ms  
     http_req_duration..............: avg=98.7ms  min=1.54ms  med=83.96ms  max=2.09s    p(90)=182.77ms p(95)=213.33ms p(99.9)=966.45ms
       { expected_response:true }...: avg=98.7ms  min=1.54ms  med=83.96ms  max=2.09s    p(90)=182.77ms p(95)=213.33ms p(99.9)=966.45ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 144221
     http_req_receiving.............: avg=1.69ms  min=50.91µs med=103.77µs max=1.09s    p(90)=1.83ms   p(95)=4.78ms   p(99.9)=103.8ms 
     http_req_sending...............: avg=62.82µs min=4.67µs  med=9.5µs    max=117.01ms p(90)=20.15µs  p(95)=104.76µs p(99.9)=8.09ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=96.95ms min=1.45ms  med=82.77ms  max=2.07s    p(90)=180.4ms  p(95)=209.57ms p(99.9)=945.69ms
     http_reqs......................: 144221  2330.182962/s
     iteration_duration.............: avg=99.64ms min=2.95ms  med=85.07ms  max=2.09s    p(90)=183.37ms p(95)=214.08ms p(99.9)=970.75ms
     iterations.....................: 143221  2314.025933/s
     success_rate...................: 100.00% ✓ 143221      ✗ 0     
     vus............................: 52      min=0         max=499 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.5.1-p.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 424602      ✗ 0     
     data_received..................: 13 GB   202 MB/s
     data_sent......................: 171 MB  2.8 MB/s
     http_req_blocked...............: avg=21.8µs   min=1.1µs   med=2.88µs   max=83.76ms  p(90)=4.69µs   p(95)=5.9µs    p(99.9)=1.22ms  
     http_req_connecting............: avg=17.73µs  min=0s      med=0s       max=69.69ms  p(90)=0s       p(95)=0s       p(99.9)=1.12ms  
     http_req_duration..............: avg=99.8ms   min=1.59ms  med=88.61ms  max=1.34s    p(90)=189.15ms p(95)=217.61ms p(99.9)=726.64ms
       { expected_response:true }...: avg=99.8ms   min=1.59ms  med=88.61ms  max=1.34s    p(90)=189.15ms p(95)=217.61ms p(99.9)=726.64ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 142534
     http_req_receiving.............: avg=1.44ms   min=53.26µs med=108.84µs max=523.13ms p(90)=1.58ms   p(95)=4.06ms   p(99.9)=107.14ms
     http_req_sending...............: avg=73.37µs  min=5.15µs  med=11µs     max=117.62ms p(90)=21.41µs  p(95)=125.86µs p(99.9)=9.62ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=98.28ms  min=1.5ms   med=87.42ms  max=1.34s    p(90)=187.12ms p(95)=214.31ms p(99.9)=714.4ms 
     http_reqs......................: 142534  2301.606038/s
     iteration_duration.............: avg=100.78ms min=2.72ms  med=89.7ms   max=1.34s    p(90)=189.82ms p(95)=218.3ms  p(99.9)=727.99ms
     iterations.....................: 141534  2285.45827/s
     success_rate...................: 100.00% ✓ 141534      ✗ 0     
     vus............................: 53      min=0         max=499 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (.net subgraphs) (16.5.1-p.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 388194      ✗ 0     
     data_received..................: 11 GB   183 MB/s
     data_sent......................: 157 MB  2.5 MB/s
     http_req_blocked...............: avg=17.82µs  min=921ns   med=2.85µs   max=109.23ms p(90)=4.71µs   p(95)=5.9µs    p(99.9)=1.12ms  
     http_req_connecting............: avg=14.14µs  min=0s      med=0s       max=109.15ms p(90)=0s       p(95)=0s       p(99.9)=1.03ms  
     http_req_duration..............: avg=109.13ms min=1.87ms  med=91.59ms  max=1.84s    p(90)=203.87ms p(95)=238.03ms p(99.9)=1.04s   
       { expected_response:true }...: avg=109.13ms min=1.87ms  med=91.59ms  max=1.84s    p(90)=203.87ms p(95)=238.03ms p(99.9)=1.04s   
     http_req_failed................: 0.00%   ✓ 0           ✗ 130398
     http_req_receiving.............: avg=1.58ms   min=53.33µs med=115.74µs max=1.06s    p(90)=1.84ms   p(95)=4.6ms    p(99.9)=118.28ms
     http_req_sending...............: avg=67.31µs  min=4.93µs  med=11.12µs  max=169.92ms p(90)=21.04µs  p(95)=109.74µs p(99.9)=9.01ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=107.48ms min=1.79ms  med=90.24ms  max=1.84s    p(90)=202.07ms p(95)=235.02ms p(99.9)=1.02s   
     http_reqs......................: 130398  2092.452678/s
     iteration_duration.............: avg=110.3ms  min=3.59ms  med=93.02ms  max=1.84s    p(90)=204.57ms p(95)=239.01ms p(99.9)=1.05s   
     iterations.....................: 129398  2076.406015/s
     success_rate...................: 100.00% ✓ 129398      ✗ 0     
     vus............................: 72      min=0         max=495 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (.net subgraphs) (0.331.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 206652      ✗ 0    
     data_received..................: 6.1 GB  98 MB/s
     data_sent......................: 84 MB   1.3 MB/s
     http_req_blocked...............: avg=6.22µs   min=1.16µs  med=2.97µs   max=6.42ms   p(90)=4.67µs   p(95)=5.64µs   p(99.9)=588.58µs
     http_req_connecting............: avg=2.54µs   min=0s      med=0s       max=6.36ms   p(90)=0s       p(95)=0s       p(99.9)=457.79µs
     http_req_duration..............: avg=204.21ms min=1.93ms  med=204.36ms max=572.96ms p(90)=377.05ms p(95)=404.18ms p(99.9)=488.66ms
       { expected_response:true }...: avg=204.21ms min=1.93ms  med=204.36ms max=572.96ms p(90)=377.05ms p(95)=404.18ms p(99.9)=488.66ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 69884
     http_req_receiving.............: avg=80.78µs  min=28.62µs med=66.82µs  max=41.26ms  p(90)=109.28µs p(95)=126.27µs p(99.9)=934.43µs
     http_req_sending...............: avg=32.6µs   min=5.24µs  med=12.04µs  max=191.28ms p(90)=19.01µs  p(95)=22.9µs   p(99.9)=3.38ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=204.1ms  min=1.87ms  med=204.21ms max=572.86ms p(90)=376.95ms p(95)=404.1ms  p(99.9)=488.58ms
     http_reqs......................: 69884   1115.84493/s
     iteration_duration.............: avg=207.42ms min=5.48ms  med=207.85ms max=573.17ms p(90)=378.14ms p(95)=404.97ms p(99.9)=489.02ms
     iterations.....................: 68884   1099.877829/s
     success_rate...................: 100.00% ✓ 68884       ✗ 0    
     vus............................: 85      min=0         max=498
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (.net subgraphs) (2.10.4)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 100602     ✗ 0    
     data_received..................: 3.0 GB  47 MB/s
     data_sent......................: 42 MB   639 kB/s
     http_req_blocked...............: avg=8.53µs   min=1.1µs   med=3.39µs   max=11.52ms  p(90)=5.29µs   p(95)=6.36µs   p(99.9)=1.03ms  
     http_req_connecting............: avg=4.13µs   min=0s      med=0s       max=11.46ms  p(90)=0s       p(95)=0s       p(99.9)=993.17µs
     http_req_duration..............: avg=415.35ms min=3.97ms  med=386.41ms max=1.7s     p(90)=806.36ms p(95)=883.87ms p(99.9)=1.34s   
       { expected_response:true }...: avg=415.35ms min=3.97ms  med=386.41ms max=1.7s     p(90)=806.36ms p(95)=883.87ms p(99.9)=1.34s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 34534
     http_req_receiving.............: avg=94.7µs   min=29.49µs med=76.7µs   max=165.07ms p(90)=115.55µs p(95)=130.18µs p(99.9)=1.34ms  
     http_req_sending...............: avg=35.11µs  min=5.24µs  med=15.6µs   max=103.01ms p(90)=22.73µs  p(95)=25.92µs  p(99.9)=2.5ms   
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=415.22ms min=3.89ms  med=386.29ms max=1.7s     p(90)=806.24ms p(95)=883.78ms p(99.9)=1.34s   
     http_reqs......................: 34534   532.577093/s
     iteration_duration.............: avg=427.99ms min=30.16ms med=400.91ms max=1.7s     p(90)=810.33ms p(95)=888.57ms p(99.9)=1.36s   
     iterations.....................: 33534   517.155274/s
     success_rate...................: 100.00% ✓ 33534      ✗ 0    
     vus............................: 97      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (.net subgraphs) (2.10.4)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 46245      ✗ 0    
     data_received..................: 1.4 GB  21 MB/s
     data_sent......................: 20 MB   290 kB/s
     http_req_blocked...............: avg=11.03µs  min=1.12µs  med=3.22µs   max=13.75ms p(90)=4.98µs   p(95)=6.52µs   p(99.9)=883.39µs
     http_req_connecting............: avg=6.12µs   min=0s      med=0s       max=13.68ms p(90)=0s       p(95)=0s       p(99.9)=863.08µs
     http_req_duration..............: avg=888.35ms min=5.75ms  med=787.24ms max=4.63s   p(90)=1.77s    p(95)=2s       p(99.9)=4.15s   
       { expected_response:true }...: avg=888.35ms min=5.75ms  med=787.24ms max=4.63s   p(90)=1.77s    p(95)=2s       p(99.9)=4.15s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 16415
     http_req_receiving.............: avg=97.15µs  min=34.76µs med=90.6µs   max=12.05ms p(90)=126.72µs p(95)=142.02µs p(99.9)=1.32ms  
     http_req_sending...............: avg=26.73µs  min=5.54µs  med=17.21µs  max=16.59ms p(90)=22.82µs  p(95)=27.66µs  p(99.9)=2.06ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=888.22ms min=5.67ms  med=787.13ms max=4.63s   p(90)=1.77s    p(95)=2s       p(99.9)=4.15s   
     http_reqs......................: 16415   241.831145/s
     iteration_duration.............: avg=945.96ms min=32.9ms  med=867.1ms  max=4.64s   p(90)=1.79s    p(95)=2.02s    p(99.9)=4.22s   
     iterations.....................: 15415   227.098818/s
     success_rate...................: 100.00% ✓ 15415      ✗ 0    
     vus............................: 4       min=0        max=500
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

     checks.........................: 100.00% ✓ 44877      ✗ 0    
     data_received..................: 1.4 GB  20 MB/s
     data_sent......................: 19 MB   278 kB/s
     http_req_blocked...............: avg=13.84µs  min=1.15µs  med=3.13µs   max=17.13ms  p(90)=4.88µs   p(95)=6.61µs   p(99.9)=1.81ms
     http_req_connecting............: avg=8.92µs   min=0s      med=0s       max=17.07ms  p(90)=0s       p(95)=0s       p(99.9)=1.78ms
     http_req_duration..............: avg=910.66ms min=7.83ms  med=827.69ms max=3.2s     p(90)=1.83s    p(95)=1.97s    p(99.9)=2.91s 
       { expected_response:true }...: avg=910.66ms min=7.83ms  med=827.69ms max=3.2s     p(90)=1.83s    p(95)=1.97s    p(99.9)=2.91s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 15959
     http_req_receiving.............: avg=100.42µs min=33.95µs med=89.22µs  max=23.07ms  p(90)=128.06µs p(95)=144.41µs p(99.9)=1.07ms
     http_req_sending...............: avg=45.07µs  min=5.44µs  med=17.37µs  max=112.99ms p(90)=22.92µs  p(95)=27.9µs   p(99.9)=3.69ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=910.51ms min=7.71ms  med=827.56ms max=3.2s     p(90)=1.83s    p(95)=1.97s    p(99.9)=2.91s 
     http_reqs......................: 15959   231.750135/s
     iteration_duration.............: avg=971.47ms min=34.47ms med=924.47ms max=3.21s    p(90)=1.85s    p(95)=1.99s    p(99.9)=2.93s 
     iterations.....................: 14959   217.22854/s
     success_rate...................: 100.00% ✓ 14959      ✗ 0    
     vus............................: 7       min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

