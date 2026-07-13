## Overview for: `constant-vus-over-time`

Each benchmark runs a GraphQL gateway with 4 subgraphs and executes a heavy nested query that exercises federation/composition capabilities.

Results are split by subgraph technology:
- **Rust Subgraphs** = [async-graphql](https://github.com/async-graphql/async-graphql) + axum
- **.NET Subgraphs** = [HotChocolate](https://github.com/ChilliCream/graphql-platform)

**Methodology:** Each gateway executes 10 runs of 120s each. The first run is a full-duration warmup (discarded). The remaining 9 runs are measured. Results are ranked by **median RPS** across the 9 measured runs, with best/worst/CV% reported for transparency.

This scenario executes a constant load of **50 VUs** over **120s**.


### Rust Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.78 | 3,038 | 3,254 | 2,908 | 4.3% |  |
| fusion-nightly-net11 | 16.5.0-p.18 | 2,575 | 2,679 | 2,561 | 1.6% |  |
| fusion-nightly | 16.5.0-p.18 | 2,531 | 2,644 | 2,474 | 2.2% |  |
| fusion | 16.4.0 | 2,299 | 2,396 | 2,284 | 1.7% |  |
| grafbase | 0.53.5 | 2,145 | 2,265 | 2,135 | 2.0% |  |
| cosmo | 0.329.0 | 1,256 | 1,299 | 1,244 | 1.5% |  |
| hive-gateway-router-runtime | 2.10.2 | 613 | 633 | 610 | 1.3% |  |
| apollo-router | v2.16.0 | 488 | 509 | 486 | 1.6% |  |
| apollo-gateway | 2.14.2 | 282 | 285 | 281 | 0.6% |  |
| hive-gateway | 2.10.2 | 282 | 290 | 279 | 1.1% |  |
| feddi | 5ff8b6165878 | — | — | — | — | non-compatible response (814 across 9/9 runs) |
| fusion-nightly-fed | — | — | — | — | — | not run |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.78 | 2,402 | 2,602 | 2,380 | 3.2% |  |
| fusion-nightly-net11 | 16.5.0-p.18 | 2,385 | 2,526 | 2,368 | 2.2% |  |
| fusion-nightly | 16.5.0-p.18 | 2,289 | 2,393 | 2,280 | 1.8% |  |
| fusion | 16.4.0 | 2,277 | 2,368 | 2,270 | 1.5% |  |
| fusion-nightly-fed | 16.5.0-p.18 | 2,242 | 2,339 | 2,232 | 1.7% |  |
| grafbase | 0.53.5 | 1,672 | 1,729 | 1,664 | 1.3% |  |
| cosmo | 0.329.0 | 1,161 | 1,206 | 1,158 | 1.5% |  |
| hive-gateway-router-runtime | 2.10.2 | 586 | 608 | 585 | 1.3% |  |
| apollo-router | v2.16.0 | 450 | 469 | 448 | 1.6% |  |
| apollo-gateway | 2.14.2 | 270 | 274 | 266 | 0.9% |  |
| hive-gateway | 2.10.2 | 260 | 268 | 259 | 1.2% |  |
| feddi | 5ff8b6165878 | 19 | 19 | 18 | 2.8% |  |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.78)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 1095150     ✗ 0     
     data_received..................: 32 GB   267 MB/s
     data_sent......................: 439 MB  3.7 MB/s
     http_req_blocked...............: avg=2.59µs  min=801ns   med=1.84µs  max=17.12ms  p(90)=3.02µs  p(95)=3.59µs   p(99.9)=28.98µs
     http_req_connecting............: avg=231ns   min=0s      med=0s      max=3.21ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=16.22ms min=1.39ms  med=15.58ms max=272.57ms p(90)=23.97ms p(95)=27.09ms  p(99.9)=47.03ms
       { expected_response:true }...: avg=16.22ms min=1.39ms  med=15.58ms max=272.57ms p(90)=23.97ms p(95)=27.09ms  p(99.9)=47.03ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 365150
     http_req_receiving.............: avg=95.91µs min=25.51µs med=44.34µs max=213.31ms p(90)=78.96µs p(95)=134.72µs p(99.9)=8.04ms 
     http_req_sending...............: avg=42.93µs min=4.51µs  med=7.96µs  max=70.98ms  p(90)=13.72µs p(95)=86.37µs  p(99.9)=4.49ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=16.08ms min=1.34ms  med=15.47ms max=78.76ms  p(90)=23.82ms p(95)=26.86ms  p(99.9)=45.84ms
     http_reqs......................: 365150  3038.332194/s
     iteration_duration.............: avg=16.42ms min=1.83ms  med=15.76ms max=354.41ms p(90)=24.17ms p(95)=27.31ms  p(99.9)=47.84ms
     iterations.....................: 365050  3037.500117/s
     success_rate...................: 100.00% ✓ 365050      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (rust subgraphs) (16.5.0-p.18)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 928866      ✗ 0     
     data_received..................: 27 GB   226 MB/s
     data_sent......................: 372 MB  3.1 MB/s
     http_req_blocked...............: avg=2.6µs    min=851ns   med=1.86µs   max=15.63ms  p(90)=3.27µs  p(95)=3.94µs  p(99.9)=30.13µs
     http_req_connecting............: avg=276ns    min=0s      med=0s       max=3.35ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=19.16ms  min=1.94ms  med=18.31ms  max=294.31ms p(90)=27.57ms p(95)=31.17ms p(99.9)=52.4ms 
       { expected_response:true }...: avg=19.16ms  min=1.94ms  med=18.31ms  max=294.31ms p(90)=27.57ms p(95)=31.17ms p(99.9)=52.4ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 309722
     http_req_receiving.............: avg=710.87µs min=52.07µs med=115.18µs max=231.51ms p(90)=1.76ms  p(95)=2.63ms  p(99.9)=19.17ms
     http_req_sending...............: avg=41.9µs   min=4.52µs  med=8.06µs   max=106.61ms p(90)=15.83µs p(95)=80.69µs p(99.9)=3.69ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=18.41ms  min=1.83ms  med=17.55ms  max=249.94ms p(90)=26.66ms p(95)=30.23ms p(99.9)=50.32ms
     http_reqs......................: 309722  2575.706844/s
     iteration_duration.............: avg=19.37ms  min=3.21ms  med=18.5ms   max=306.97ms p(90)=27.77ms p(95)=31.39ms p(99.9)=52.95ms
     iterations.....................: 309622  2574.875225/s
     success_rate...................: 100.00% ✓ 309622      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (rust subgraphs) (16.5.0-p.18)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 912939      ✗ 0     
     data_received..................: 27 GB   222 MB/s
     data_sent......................: 366 MB  3.0 MB/s
     http_req_blocked...............: avg=2.53µs   min=871ns   med=1.83µs  max=13.14ms  p(90)=2.96µs  p(95)=3.52µs  p(99.9)=26.22µs 
     http_req_connecting............: avg=307ns    min=0s      med=0s      max=3.58ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=19.5ms   min=2ms     med=16.64ms max=290.99ms p(90)=31.85ms p(95)=38.73ms p(99.9)=134.37ms
       { expected_response:true }...: avg=19.5ms   min=2ms     med=16.64ms max=290.99ms p(90)=31.85ms p(95)=38.73ms p(99.9)=134.37ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 304413
     http_req_receiving.............: avg=676.68µs min=50.37µs med=90.42µs max=229.6ms  p(90)=1.14ms  p(95)=2.23ms  p(99.9)=31.01ms 
     http_req_sending...............: avg=39.24µs  min=4.08µs  med=7.93µs  max=215.73ms p(90)=13.52µs p(95)=63.4µs  p(99.9)=3.21ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=18.79ms  min=1.9ms   med=16.04ms max=290.51ms p(90)=30.64ms p(95)=37.35ms p(99.9)=132.88ms
     http_reqs......................: 304413  2531.064001/s
     iteration_duration.............: avg=19.7ms   min=2.94ms  med=16.83ms max=305.06ms p(90)=32.07ms p(95)=38.95ms p(99.9)=134.69ms
     iterations.....................: 304313  2530.232544/s
     success_rate...................: 100.00% ✓ 304313      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (rust subgraphs) (16.4.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 829473      ✗ 0     
     data_received..................: 24 GB   202 MB/s
     data_sent......................: 332 MB  2.8 MB/s
     http_req_blocked...............: avg=2.57µs   min=892ns   med=1.88µs  max=15.64ms  p(90)=2.97µs  p(95)=3.49µs  p(99.9)=27.03µs 
     http_req_connecting............: avg=302ns    min=0s      med=0s      max=3.27ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=21.49ms  min=2.06ms  med=18.24ms max=293.7ms  p(90)=34.93ms p(95)=42.47ms p(99.9)=152.46ms
       { expected_response:true }...: avg=21.49ms  min=2.06ms  med=18.24ms max=293.7ms  p(90)=34.93ms p(95)=42.47ms p(99.9)=152.46ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 276591
     http_req_receiving.............: avg=636.61µs min=50.97µs med=94.99µs max=172.78ms p(90)=1.12ms  p(95)=1.99ms  p(99.9)=28.41ms 
     http_req_sending...............: avg=35.63µs  min=4.57µs  med=8.16µs  max=176.11ms p(90)=13.32µs p(95)=30.66µs p(99.9)=2.4ms   
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=20.81ms  min=1.94ms  med=17.68ms max=293.15ms p(90)=33.87ms p(95)=41.14ms p(99.9)=151.25ms
     http_reqs......................: 276591  2299.569192/s
     iteration_duration.............: avg=21.69ms  min=3.02ms  med=18.43ms max=301.88ms p(90)=35.14ms p(95)=42.68ms p(99.9)=153.75ms
     iterations.....................: 276491  2298.737795/s
     success_rate...................: 100.00% ✓ 276491      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: grafbase (rust subgraphs) (0.53.5)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 773541      ✗ 0     
     data_received..................: 23 GB   189 MB/s
     data_sent......................: 310 MB  2.6 MB/s
     http_req_blocked...............: avg=3.43µs  min=1.05µs  med=2.66µs  max=4.81ms   p(90)=4.23µs  p(95)=5.02µs   p(99.9)=39.08µs
     http_req_connecting............: avg=339ns   min=0s      med=0s      max=3.55ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=23.03ms min=1.77ms  med=22.78ms max=291.26ms p(90)=27.5ms  p(95)=29.5ms   p(99.9)=50.26ms
       { expected_response:true }...: avg=23.03ms min=1.77ms  med=22.78ms max=291.26ms p(90)=27.5ms  p(95)=29.5ms   p(99.9)=50.26ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 257947
     http_req_receiving.............: avg=95.61µs min=27.57µs med=57.77µs max=156.58ms p(90)=97.41µs p(95)=127.37µs p(99.9)=6.8ms  
     http_req_sending...............: avg=42.92µs min=5.13µs  med=11.09µs max=221.05ms p(90)=18.15µs p(95)=39.79µs  p(99.9)=2.31ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=22.89ms min=1.7ms   med=22.67ms max=282.52ms p(90)=27.35ms p(95)=29.3ms   p(99.9)=49.34ms
     http_reqs......................: 257947  2145.439089/s
     iteration_duration.............: avg=23.25ms min=3.55ms  med=22.98ms max=303.45ms p(90)=27.71ms p(95)=29.73ms  p(99.9)=50.88ms
     iterations.....................: 257847  2144.607352/s
     success_rate...................: 100.00% ✓ 257847      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (rust subgraphs) (0.329.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 453111      ✗ 0     
     data_received..................: 13 GB   110 MB/s
     data_sent......................: 182 MB  1.5 MB/s
     http_req_blocked...............: avg=2.88µs  min=1µs     med=1.99µs  max=4.02ms   p(90)=3.27µs  p(95)=3.86µs   p(99.9)=29.34µs 
     http_req_connecting............: avg=596ns   min=0s      med=0s      max=3.98ms   p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=39.49ms min=2.05ms  med=39.07ms max=301.78ms p(90)=55.43ms p(95)=60.33ms  p(99.9)=84.24ms 
       { expected_response:true }...: avg=39.49ms min=2.05ms  med=39.07ms max=301.78ms p(90)=55.43ms p(95)=60.33ms  p(99.9)=84.24ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 151137
     http_req_receiving.............: avg=69.66µs min=28.19µs med=56.52µs max=205.45ms p(90)=89.14µs p(95)=103.75µs p(99.9)=736.34µs
     http_req_sending...............: avg=21.93µs min=4.81µs  med=9.45µs  max=112.99ms p(90)=15.06µs p(95)=18.71µs  p(99.9)=852.09µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=39.4ms  min=1.96ms  med=38.98ms max=275.63ms p(90)=55.34ms p(95)=60.24ms  p(99.9)=84.04ms 
     http_reqs......................: 151137  1256.64646/s
     iteration_duration.............: avg=39.72ms min=3.74ms  med=39.28ms max=310.13ms p(90)=55.62ms p(95)=60.53ms  p(99.9)=84.76ms 
     iterations.....................: 151037  1255.814998/s
     success_rate...................: 100.00% ✓ 151037      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (rust subgraphs) (2.10.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 221292     ✗ 0    
     data_received..................: 6.5 GB  54 MB/s
     data_sent......................: 89 MB   736 kB/s
     http_req_blocked...............: avg=4.18µs  min=1.03µs  med=2.54µs  max=3.64ms   p(90)=4.1µs    p(95)=4.73µs   p(99.9)=44.68µs 
     http_req_connecting............: avg=1.32µs  min=0s      med=0s      max=3.6ms    p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=81.01ms min=3.56ms  med=78.37ms max=311.88ms p(90)=101.38ms p(95)=112.3ms  p(99.9)=194.81ms
       { expected_response:true }...: avg=81.01ms min=3.56ms  med=78.37ms max=311.88ms p(90)=101.38ms p(95)=112.3ms  p(99.9)=194.81ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 73864
     http_req_receiving.............: avg=76.96µs min=28.21µs med=65.21µs max=173.69ms p(90)=101.22µs p(95)=114.76µs p(99.9)=702.6µs 
     http_req_sending...............: avg=23.7µs  min=4.74µs  med=12.34µs max=139.1ms  p(90)=19.61µs  p(95)=21.78µs  p(99.9)=590.61µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=80.91ms min=3.5ms   med=78.27ms max=311.5ms  p(90)=101.28ms p(95)=112.15ms p(99.9)=194.31ms
     http_reqs......................: 73864   613.053699/s
     iteration_duration.............: avg=81.35ms min=22.83ms med=78.62ms max=325.67ms p(90)=101.62ms p(95)=112.6ms  p(99.9)=196.79ms
     iterations.....................: 73764   612.223723/s
     success_rate...................: 100.00% ✓ 73764      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-router (rust subgraphs) (v2.16.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 176595     ✗ 0    
     data_received..................: 5.2 GB  43 MB/s
     data_sent......................: 71 MB   587 kB/s
     http_req_blocked...............: avg=4.74µs   min=1.09µs  med=2.97µs   max=4.01ms   p(90)=4.41µs   p(95)=4.94µs   p(99.9)=63.02µs 
     http_req_connecting............: avg=1.55µs   min=0s      med=0s       max=3.96ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=101.53ms min=4.55ms  med=101.23ms max=331.3ms  p(90)=122.51ms p(95)=129.05ms p(99.9)=159.72ms
       { expected_response:true }...: avg=101.53ms min=4.55ms  med=101.23ms max=331.3ms  p(90)=122.51ms p(95)=129.05ms p(99.9)=159.72ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 58965
     http_req_receiving.............: avg=79.69µs  min=28.75µs med=74.81µs  max=22.97ms  p(90)=107.13µs p(95)=120.1µs  p(99.9)=570.24µs
     http_req_sending...............: avg=28.12µs  min=4.82µs  med=15.22µs  max=179.72ms p(90)=20.73µs  p(95)=22.53µs  p(99.9)=552.57µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=101.42ms min=4.43ms  med=101.14ms max=330.67ms p(90)=122.4ms  p(95)=128.94ms p(99.9)=159.16ms
     http_reqs......................: 58965   488.985426/s
     iteration_duration.............: avg=101.95ms min=20.87ms med=101.51ms max=341.32ms p(90)=122.77ms p(95)=129.31ms p(99.9)=160.24ms
     iterations.....................: 58865   488.156145/s
     success_rate...................: 100.00% ✓ 58865      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
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

     checks.........................: 100.00% ✓ 102075     ✗ 0    
     data_received..................: 3.0 GB  25 MB/s
     data_sent......................: 41 MB   339 kB/s
     http_req_blocked...............: avg=6.24µs   min=1.36µs  med=3.38µs   max=4.18ms   p(90)=4.73µs   p(95)=5.3µs    p(99.9)=1.12ms  
     http_req_connecting............: avg=2.57µs   min=0s      med=0s       max=4.14ms   p(90)=0s       p(95)=0s       p(99.9)=1.08ms  
     http_req_duration..............: avg=175.63ms min=7.34ms  med=175.4ms  max=371.95ms p(90)=187.94ms p(95)=192.02ms p(99.9)=258.39ms
       { expected_response:true }...: avg=175.63ms min=7.34ms  med=175.4ms  max=371.95ms p(90)=187.94ms p(95)=192.02ms p(99.9)=258.39ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 34125
     http_req_receiving.............: avg=93.3µs   min=34.66µs med=85.31µs  max=161.12ms p(90)=115.71µs p(95)=126.86µs p(99.9)=492.76µs
     http_req_sending...............: avg=25.34µs  min=6.24µs  med=16.64µs  max=80.1ms   p(90)=21.21µs  p(95)=22.94µs  p(99.9)=491.99µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=175.51ms min=7.18ms  med=175.29ms max=371.63ms p(90)=187.82ms p(95)=191.9ms  p(99.9)=257.74ms
     http_reqs......................: 34125   282.239963/s
     iteration_duration.............: avg=176.43ms min=39.43ms med=175.71ms max=387.89ms p(90)=188.2ms  p(95)=192.31ms p(99.9)=261.3ms 
     iterations.....................: 34025   281.412886/s
     success_rate...................: 100.00% ✓ 34025      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (rust subgraphs) (2.10.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 102288     ✗ 0    
     data_received..................: 3.0 GB  25 MB/s
     data_sent......................: 41 MB   340 kB/s
     http_req_blocked...............: avg=6.02µs   min=1.47µs  med=3.75µs   max=3.32ms   p(90)=5.2µs    p(95)=5.81µs   p(99.9)=773.03µs
     http_req_connecting............: avg=1.95µs   min=0s      med=0s       max=3.29ms   p(90)=0s       p(95)=0s       p(99.9)=715.37µs
     http_req_duration..............: avg=175.27ms min=5.71ms  med=160.38ms max=712.19ms p(90)=203.07ms p(95)=238.78ms p(99.9)=573.46ms
       { expected_response:true }...: avg=175.27ms min=5.71ms  med=160.38ms max=712.19ms p(90)=203.07ms p(95)=238.78ms p(99.9)=573.46ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 34196
     http_req_receiving.............: avg=106.63µs min=35µs    med=92.92µs  max=122.47ms p(90)=124.05µs p(95)=136.49µs p(99.9)=771.77µs
     http_req_sending...............: avg=33.29µs  min=6.47µs  med=18.6µs   max=96.64ms  p(90)=23.26µs  p(95)=25.23µs  p(99.9)=497.52µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=175.13ms min=5.6ms   med=160.24ms max=712.05ms p(90)=202.97ms p(95)=238.61ms p(99.9)=573.37ms
     http_reqs......................: 34196   282.814818/s
     iteration_duration.............: avg=176.05ms min=32.89ms med=160.73ms max=712.54ms p(90)=203.46ms p(95)=239.76ms p(99.9)=573.72ms
     iterations.....................: 34096   281.987778/s
     success_rate...................: 100.00% ✓ 34096      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.78)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 866217      ✗ 0     
     data_received..................: 25 GB   210 MB/s
     data_sent......................: 347 MB  2.9 MB/s
     http_req_blocked...............: avg=3.43µs  min=1.04µs  med=2.7µs   max=4.35ms   p(90)=4.21µs  p(95)=4.92µs   p(99.9)=36.57µs
     http_req_connecting............: avg=352ns   min=0s      med=0s      max=4.31ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=20.55ms min=1.75ms  med=20.28ms max=276.66ms p(90)=28.86ms p(95)=31.4ms   p(99.9)=50.19ms
       { expected_response:true }...: avg=20.55ms min=1.75ms  med=20.28ms max=276.66ms p(90)=28.86ms p(95)=31.4ms   p(99.9)=50.19ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 288839
     http_req_receiving.............: avg=91.24µs min=26.79µs med=53.04µs max=173.44ms p(90)=91.71µs p(95)=123.49µs p(99.9)=6.54ms 
     http_req_sending...............: avg=43.98µs min=4.95µs  med=10.59µs max=176.6ms  p(90)=17.38µs p(95)=49.11µs  p(99.9)=2.95ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=20.41ms min=1.7ms   med=20.17ms max=276.54ms p(90)=28.71ms p(95)=31.2ms   p(99.9)=49.26ms
     http_reqs......................: 288839  2402.442366/s
     iteration_duration.............: avg=20.77ms min=3.3ms   med=20.48ms max=296.14ms p(90)=29.08ms p(95)=31.62ms  p(99.9)=50.83ms
     iterations.....................: 288739  2401.610607/s
     success_rate...................: 100.00% ✓ 288739      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (.net subgraphs) (16.5.0-p.18)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 859737      ✗ 0     
     data_received..................: 25 GB   209 MB/s
     data_sent......................: 345 MB  2.9 MB/s
     http_req_blocked...............: avg=2.91µs   min=791ns   med=2.09µs   max=14.68ms  p(90)=3.83µs  p(95)=4.59µs  p(99.9)=31.97µs
     http_req_connecting............: avg=291ns    min=0s      med=0s       max=3.28ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=20.7ms   min=1.58ms  med=19.86ms  max=297.28ms p(90)=29.79ms p(95)=33.41ms p(99.9)=54.51ms
       { expected_response:true }...: avg=20.7ms   min=1.58ms  med=19.86ms  max=297.28ms p(90)=29.79ms p(95)=33.41ms p(99.9)=54.51ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 286679
     http_req_receiving.............: avg=820.02µs min=50.78µs med=132.43µs max=81.14ms  p(90)=2.05ms  p(95)=3.1ms   p(99.9)=21.12ms
     http_req_sending...............: avg=43.79µs  min=4.51µs  med=8.8µs    max=124.44ms p(90)=18.68µs p(95)=85.47µs p(99.9)=3.89ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=19.84ms  min=1.49ms  med=18.98ms  max=296.57ms p(90)=28.77ms p(95)=32.32ms p(99.9)=52.43ms
     http_reqs......................: 286679  2385.009871/s
     iteration_duration.............: avg=20.92ms  min=2.69ms  med=20.06ms  max=308.58ms p(90)=30.01ms p(95)=33.64ms p(99.9)=54.94ms
     iterations.....................: 286579  2384.177927/s
     success_rate...................: 100.00% ✓ 286579      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.5.0-p.18)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 825297      ✗ 0     
     data_received..................: 24 GB   201 MB/s
     data_sent......................: 331 MB  2.8 MB/s
     http_req_blocked...............: avg=2.86µs   min=892ns   med=2.24µs   max=14.85ms  p(90)=3.83µs  p(95)=4.51µs  p(99.9)=33.68µs 
     http_req_connecting............: avg=147ns    min=0s      med=0s       max=2.17ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=21.58ms  min=1.58ms  med=17.78ms  max=352.53ms p(90)=35.78ms p(95)=44.14ms p(99.9)=168.28ms
       { expected_response:true }...: avg=21.58ms  min=1.58ms  med=17.78ms  max=352.53ms p(90)=35.78ms p(95)=44.14ms p(99.9)=168.28ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 275199
     http_req_receiving.............: avg=740.98µs min=52.32µs med=100.47µs max=219.34ms p(90)=1.2ms   p(95)=2.26ms  p(99.9)=35.79ms 
     http_req_sending...............: avg=39.91µs  min=4.68µs  med=9.24µs   max=191.6ms  p(90)=17.55µs p(95)=70.48µs p(99.9)=2.66ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=20.8ms   min=1.49ms  med=17.17ms  max=352.45ms p(90)=34.43ms p(95)=42.54ms p(99.9)=161.21ms
     http_reqs......................: 275199  2289.302998/s
     iteration_duration.............: avg=21.8ms   min=2.67ms  med=17.98ms  max=352.66ms p(90)=36.01ms p(95)=44.38ms p(99.9)=170.48ms
     iterations.....................: 275099  2288.471127/s
     success_rate...................: 100.00% ✓ 275099      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (.net subgraphs) (16.4.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 821037      ✗ 0     
     data_received..................: 24 GB   200 MB/s
     data_sent......................: 329 MB  2.7 MB/s
     http_req_blocked...............: avg=2.97µs   min=902ns   med=2.11µs  max=8.83ms   p(90)=3.69µs  p(95)=4.41µs  p(99.9)=32.57µs 
     http_req_connecting............: avg=406ns    min=0s      med=0s      max=4.2ms    p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=21.69ms  min=1.61ms  med=17.96ms max=481.71ms p(90)=35.62ms p(95)=43.84ms p(99.9)=173.03ms
       { expected_response:true }...: avg=21.69ms  min=1.61ms  med=17.96ms max=481.71ms p(90)=35.62ms p(95)=43.84ms p(99.9)=173.03ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 273779
     http_req_receiving.............: avg=623.36µs min=52.04µs med=96.8µs  max=212.01ms p(90)=1.11ms  p(95)=1.94ms  p(99.9)=31.21ms 
     http_req_sending...............: avg=40.01µs  min=4.64µs  med=9.18µs  max=182.43ms p(90)=18.77µs p(95)=63.62µs p(99.9)=2.73ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=21.03ms  min=1.52ms  med=17.42ms max=481.63ms p(90)=34.56ms p(95)=42.65ms p(99.9)=170.78ms
     http_reqs......................: 273779  2277.412254/s
     iteration_duration.............: avg=21.91ms  min=2.17ms  med=18.16ms max=481.9ms  p(90)=35.84ms p(95)=44.07ms p(99.9)=174.38ms
     iterations.....................: 273679  2276.58041/s
     success_rate...................: 100.00% ✓ 273679      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (.net subgraphs) (16.5.0-p.18)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 808695      ✗ 0     
     data_received..................: 24 GB   197 MB/s
     data_sent......................: 324 MB  2.7 MB/s
     http_req_blocked...............: avg=3.08µs   min=912ns   med=2.22µs  max=15.48ms  p(90)=3.91µs  p(95)=4.68µs  p(99.9)=32.32µs 
     http_req_connecting............: avg=294ns    min=0s      med=0s      max=15.46ms  p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=22.02ms  min=1.91ms  med=18.63ms max=337.27ms p(90)=35.26ms p(95)=43.49ms p(99.9)=152.77ms
       { expected_response:true }...: avg=22.02ms  min=1.91ms  med=18.63ms max=337.27ms p(90)=35.26ms p(95)=43.49ms p(99.9)=152.77ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 269665
     http_req_receiving.............: avg=629.49µs min=51.63µs med=99.71µs max=193.15ms p(90)=1.15ms  p(95)=2.03ms  p(99.9)=29.9ms  
     http_req_sending...............: avg=39.96µs  min=4.54µs  med=9.24µs  max=36.58ms  p(90)=18.97µs p(95)=64.35µs p(99.9)=2.8ms   
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=21.35ms  min=1.81ms  med=18.05ms max=335.82ms p(90)=34.22ms p(95)=42.16ms p(99.9)=151.15ms
     http_reqs......................: 269665  2242.622813/s
     iteration_duration.............: avg=22.24ms  min=3.11ms  med=18.84ms max=337.48ms p(90)=35.49ms p(95)=43.74ms p(99.9)=154.25ms
     iterations.....................: 269565  2241.79118/s
     success_rate...................: 100.00% ✓ 269565      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: grafbase (.net subgraphs) (0.53.5)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 603282      ✗ 0     
     data_received..................: 18 GB   147 MB/s
     data_sent......................: 242 MB  2.0 MB/s
     http_req_blocked...............: avg=3.28µs  min=842ns   med=2.22µs  max=3.46ms   p(90)=4.38µs   p(95)=5.46µs   p(99.9)=43.38µs
     http_req_connecting............: avg=433ns   min=0s      med=0s      max=3.42ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=29.58ms min=2.21ms  med=29ms    max=290.82ms p(90)=38.79ms  p(95)=42.1ms   p(99.9)=63.52ms
       { expected_response:true }...: avg=29.58ms min=2.21ms  med=29ms    max=290.82ms p(90)=38.79ms  p(95)=42.1ms   p(99.9)=63.52ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 201194
     http_req_receiving.............: avg=94.17µs min=28.93µs med=56.42µs max=154.58ms p(90)=124.82µs p(95)=195.89µs p(99.9)=3.6ms  
     http_req_sending...............: avg=40.77µs min=4.89µs  med=9.57µs  max=134.58ms p(90)=23.58µs  p(95)=102.58µs p(99.9)=2.66ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=29.45ms min=2.1ms   med=28.87ms max=290.12ms p(90)=38.65ms  p(95)=41.94ms  p(99.9)=63.14ms
     http_reqs......................: 201194  1672.70265/s
     iteration_duration.............: avg=29.82ms min=7.81ms  med=29.22ms max=302.01ms p(90)=39.01ms  p(95)=42.33ms  p(99.9)=63.95ms
     iterations.....................: 201094  1671.871262/s
     success_rate...................: 100.00% ✓ 201094      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (.net subgraphs) (0.329.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 418914      ✗ 0     
     data_received..................: 12 GB   102 MB/s
     data_sent......................: 168 MB  1.4 MB/s
     http_req_blocked...............: avg=3.24µs  min=951ns   med=2.25µs  max=3.56ms   p(90)=3.73µs  p(95)=4.39µs   p(99.9)=35.51µs 
     http_req_connecting............: avg=669ns   min=0s      med=0s      max=3.52ms   p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=42.72ms min=2.15ms  med=42.33ms max=300.57ms p(90)=59.54ms p(95)=64.71ms  p(99.9)=89.71ms 
       { expected_response:true }...: avg=42.72ms min=2.15ms  med=42.33ms max=300.57ms p(90)=59.54ms p(95)=64.71ms  p(99.9)=89.71ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 139738
     http_req_receiving.............: avg=77.63µs min=28.44µs med=65.64µs max=92.11ms  p(90)=103.7µs p(95)=119.42µs p(99.9)=736.38µs
     http_req_sending...............: avg=23.67µs min=4.97µs  med=11.39µs max=122.33ms p(90)=18.17µs p(95)=21.52µs  p(99.9)=826.93µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=42.62ms min=2.05ms  med=42.24ms max=300.38ms p(90)=59.43ms p(95)=64.62ms  p(99.9)=89.44ms 
     http_reqs......................: 139738  1161.691571/s
     iteration_duration.............: avg=42.96ms min=3.95ms  med=42.54ms max=319.16ms p(90)=59.75ms p(95)=64.92ms  p(99.9)=90.21ms 
     iterations.....................: 139638  1160.860235/s
     success_rate...................: 100.00% ✓ 139638      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (.net subgraphs) (2.10.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 211779     ✗ 0    
     data_received..................: 6.2 GB  51 MB/s
     data_sent......................: 85 MB   704 kB/s
     http_req_blocked...............: avg=4.05µs  min=1.05µs  med=2.82µs  max=3.27ms   p(90)=4.32µs   p(95)=4.93µs   p(99.9)=48.18µs 
     http_req_connecting............: avg=956ns   min=0s      med=0s      max=2.88ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=84.63ms min=4ms     med=82.81ms max=302.72ms p(90)=103.99ms p(95)=114.66ms p(99.9)=198.78ms
       { expected_response:true }...: avg=84.63ms min=4ms     med=82.81ms max=302.72ms p(90)=103.99ms p(95)=114.66ms p(99.9)=198.78ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 70693
     http_req_receiving.............: avg=86.61µs min=29.1µs  med=73.67µs max=135.88ms p(90)=109.95µs p(95)=123.57µs p(99.9)=668.57µs
     http_req_sending...............: avg=23.19µs min=5.09µs  med=14.59µs max=72.13ms  p(90)=21.25µs  p(95)=23.42µs  p(99.9)=631.3µs 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=84.52ms min=3.91ms  med=82.72ms max=302.17ms p(90)=103.88ms p(95)=114.58ms p(99.9)=198.26ms
     http_reqs......................: 70693   586.519025/s
     iteration_duration.............: avg=84.99ms min=29.79ms med=83.07ms max=310.74ms p(90)=104.25ms p(95)=114.95ms p(99.9)=200.12ms
     iterations.....................: 70593   585.689354/s
     success_rate...................: 100.00% ✓ 70593      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-router (.net subgraphs) (v2.16.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 162855     ✗ 0    
     data_received..................: 4.8 GB  39 MB/s
     data_sent......................: 65 MB   541 kB/s
     http_req_blocked...............: avg=6.29µs   min=1.38µs  med=3.62µs   max=10.55ms  p(90)=5.21µs   p(95)=5.85µs   p(99.9)=63.39µs 
     http_req_connecting............: avg=2.09µs   min=0s      med=0s       max=5.37ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=110.07ms min=5.2ms   med=107.82ms max=316.72ms p(90)=145.43ms p(95)=156.35ms p(99.9)=202.67ms
       { expected_response:true }...: avg=110.07ms min=5.2ms   med=107.82ms max=316.72ms p(90)=145.43ms p(95)=156.35ms p(99.9)=202.67ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 54385
     http_req_receiving.............: avg=91.88µs  min=30.61µs med=85.68µs  max=73.9ms   p(90)=117.19µs p(95)=130.23µs p(99.9)=614.89µs
     http_req_sending...............: avg=26.05µs  min=5.95µs  med=17.95µs  max=85.44ms  p(90)=23.41µs  p(95)=25.43µs  p(99.9)=651.07µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=109.95ms min=5.09ms  med=107.7ms  max=314.77ms p(90)=145.31ms p(95)=156.23ms p(99.9)=202.31ms
     http_reqs......................: 54385   450.766965/s
     iteration_duration.............: avg=110.55ms min=26.06ms med=108.13ms max=331.9ms  p(90)=145.75ms p(95)=156.67ms p(99.9)=203.9ms 
     iterations.....................: 54285   449.938121/s
     success_rate...................: 100.00% ✓ 54285      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
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

     checks.........................: 100.00% ✓ 97809      ✗ 0    
     data_received..................: 2.9 GB  24 MB/s
     data_sent......................: 39 MB   325 kB/s
     http_req_blocked...............: avg=6.16µs   min=1.1µs   med=3.2µs    max=3.94ms   p(90)=4.57µs   p(95)=5.14µs   p(99.9)=1.28ms  
     http_req_connecting............: avg=2.73µs   min=0s      med=0s       max=3.89ms   p(90)=0s       p(95)=0s       p(99.9)=1.26ms  
     http_req_duration..............: avg=183.29ms min=7.83ms  med=183.92ms max=402.41ms p(90)=193.5ms  p(95)=197.49ms p(99.9)=264.21ms
       { expected_response:true }...: avg=183.29ms min=7.83ms  med=183.92ms max=402.41ms p(90)=193.5ms  p(95)=197.49ms p(99.9)=264.21ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32703
     http_req_receiving.............: avg=95.21µs  min=29.77µs med=87.83µs  max=113.43ms p(90)=117.6µs  p(95)=128.6µs  p(99.9)=511.58µs
     http_req_sending...............: avg=29.52µs  min=5.34µs  med=17.11µs  max=144.65ms p(90)=21.44µs  p(95)=23.26µs  p(99.9)=502.4µs 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=183.16ms min=7.69ms  med=183.81ms max=402.25ms p(90)=193.39ms p(95)=197.37ms p(99.9)=263.65ms
     http_reqs......................: 32703   270.293049/s
     iteration_duration.............: avg=184.14ms min=47.8ms  med=184.3ms  max=410.31ms p(90)=193.77ms p(95)=197.77ms p(99.9)=273.7ms 
     iterations.....................: 32603   269.46654/s
     success_rate...................: 100.00% ✓ 32603      ✗ 0    
     vus............................: 4       min=4        max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (.net subgraphs) (2.10.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 94023      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 38 MB   312 kB/s
     http_req_blocked...............: avg=6.32µs   min=1.13µs  med=3.2µs    max=4.08ms   p(90)=4.56µs   p(95)=5.13µs   p(99.9)=1.36ms  
     http_req_connecting............: avg=2.9µs    min=0s      med=0s       max=4.04ms   p(90)=0s       p(95)=0s       p(99.9)=1.33ms  
     http_req_duration..............: avg=190.68ms min=6.16ms  med=176.19ms max=664.54ms p(90)=224.24ms p(95)=274.25ms p(99.9)=548.29ms
       { expected_response:true }...: avg=190.68ms min=6.16ms  med=176.19ms max=664.54ms p(90)=224.24ms p(95)=274.25ms p(99.9)=548.29ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 31441
     http_req_receiving.............: avg=97.32µs  min=34.93µs med=88.87µs  max=83.48ms  p(90)=119.46µs p(95)=131.49µs p(99.9)=727.53µs
     http_req_sending...............: avg=23.95µs  min=5.54µs  med=17.24µs  max=41.43ms  p(90)=21.62µs  p(95)=23.36µs  p(99.9)=462.85µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=190.56ms min=6.07ms  med=176.07ms max=664.44ms p(90)=224.13ms p(95)=274.11ms p(99.9)=548.2ms 
     http_reqs......................: 31441   260.123262/s
     iteration_duration.............: avg=191.55ms min=39.65ms med=176.53ms max=664.78ms p(90)=224.58ms p(95)=275.82ms p(99.9)=548.55ms
     iterations.....................: 31341   259.295924/s
     success_rate...................: 100.00% ✓ 31341      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: feddi (.net subgraphs) (5ff8b6165878)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 7101      ✗ 0   
     data_received..................: 236 MB  1.9 MB/s
     data_sent......................: 3.0 MB  23 kB/s
     http_req_blocked...............: avg=114.39µs min=1.1µs   med=3.02µs  max=8.43ms  p(90)=4.48µs   p(95)=5.42µs   p(99.9)=7.94ms  
     http_req_connecting............: avg=108.65µs min=0s      med=0s      max=8.38ms  p(90)=0s       p(95)=0s       p(99.9)=7.75ms  
     http_req_duration..............: avg=2.45s    min=32.18ms med=2.56s   max=4.67s   p(90)=3.24s    p(95)=3.43s    p(99.9)=4.44s   
       { expected_response:true }...: avg=2.45s    min=32.18ms med=2.56s   max=4.67s   p(90)=3.24s    p(95)=3.43s    p(99.9)=4.44s   
     http_req_failed................: 0.00%   ✓ 0         ✗ 2467
     http_req_receiving.............: avg=106.57µs min=29.52µs med=87.48µs max=40.62ms p(90)=125.72µs p(95)=147.08µs p(99.9)=464.45µs
     http_req_sending...............: avg=51.22µs  min=6.01µs  med=17.58µs max=13.48ms p(90)=22.71µs  p(95)=27.01µs  p(99.9)=5.39ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=2.45s    min=32.01ms med=2.56s   max=4.67s   p(90)=3.24s    p(95)=3.43s    p(99.9)=4.44s   
     http_reqs......................: 2467    19.497741/s
     iteration_duration.............: avg=2.56s    min=802.2ms med=2.59s   max=4.67s   p(90)=3.25s    p(95)=3.44s    p(99.9)=4.44s   
     iterations.....................: 2367    18.707399/s
     success_rate...................: 100.00% ✓ 2367      ✗ 0   
     vus............................: 32      min=0       max=50
     vus_max........................: 50      min=50      max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

