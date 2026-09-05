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
| hive-router | v0.0.84 | 3,100 | 3,364 | 3,055 | 3.3% |  |
| fusion-nightly-net11 | 16.7.0-p.2 | 2,809 | 2,935 | 2,779 | 1.8% |  |
| fusion-nightly | 16.7.0-p.2 | 2,590 | 2,716 | 2,579 | 1.8% |  |
| fusion | 16.6.4 | 2,588 | 2,711 | 2,565 | 2.0% |  |
| fusion-nightly-fed | 16.7.0-p.2 | 2,355 | 2,469 | 2,344 | 1.8% |  |
| grafbase | 0.53.5 | 2,225 | 2,347 | 2,213 | 2.3% |  |
| cosmo | 0.334.0 | 1,276 | 1,334 | 1,268 | 1.9% |  |
| hive-gateway-router-runtime | 2.10.8 | 633 | 648 | 630 | 0.9% |  |
| apollo-router | v2.16.1 | 489 | 506 | 483 | 1.7% |  |
| apollo-gateway | 2.14.3 | 282 | 286 | 281 | 0.5% |  |
| hive-gateway | 2.10.8 | 274 | 282 | 273 | 1.2% |  |
| feddi | 5ff8b6165878 | 1 | 1 | 1 | 0.0% |  |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| fusion-nightly-net11 | 16.7.0-p.2 | 2,460 | 2,588 | 2,439 | 2.2% |  |
| fusion | 16.6.4 | 2,414 | 2,575 | 2,393 | 2.5% |  |
| hive-router | v0.0.84 | 2,395 | 2,624 | 2,368 | 3.7% |  |
| fusion-nightly | 16.7.0-p.2 | 2,371 | 2,488 | 2,360 | 1.9% |  |
| fusion-nightly-fed | 16.7.0-p.2 | 2,322 | 2,436 | 2,317 | 1.8% |  |
| grafbase | 0.53.5 | 1,649 | 1,708 | 1,644 | 1.4% |  |
| cosmo | 0.334.0 | 1,205 | 1,248 | 1,190 | 1.7% |  |
| hive-gateway-router-runtime | 2.10.8 | 591 | 606 | 584 | 1.2% |  |
| apollo-router | v2.16.1 | 444 | 464 | 442 | 1.9% |  |
| apollo-gateway | 2.14.3 | 269 | 273 | 268 | 0.6% |  |
| hive-gateway | 2.10.8 | 258 | 265 | 257 | 1.3% |  |
| feddi | 5ff8b6165878 | 19 | 19 | 18 | 2.3% |  |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.84)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 1117353     ✗ 0     
     data_received..................: 33 GB   272 MB/s
     data_sent......................: 448 MB  3.7 MB/s
     http_req_blocked...............: avg=2.64µs  min=901ns   med=1.95µs  max=17.48ms  p(90)=3.21µs  p(95)=3.84µs   p(99.9)=29.1µs 
     http_req_connecting............: avg=221ns   min=0s      med=0s      max=3.31ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=15.89ms min=1.4ms   med=15.19ms max=263.8ms  p(90)=23.22ms p(95)=26.35ms  p(99.9)=46.26ms
       { expected_response:true }...: avg=15.89ms min=1.4ms   med=15.19ms max=263.8ms  p(90)=23.22ms p(95)=26.35ms  p(99.9)=46.26ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 372551
     http_req_receiving.............: avg=86.95µs min=24.27µs med=43.73µs max=169.57ms p(90)=82.12µs p(95)=158.55µs p(99.9)=7.24ms 
     http_req_sending...............: avg=46.31µs min=4.77µs  med=8.44µs  max=123.2ms  p(90)=14.59µs p(95)=94.08µs  p(99.9)=5.13ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=15.76ms min=1.33ms  med=15.08ms max=263.21ms p(90)=23.05ms p(95)=26.1ms   p(99.9)=45.14ms
     http_reqs......................: 372551  3100.06751/s
     iteration_duration.............: avg=16.1ms  min=2.09ms  med=15.38ms max=293.82ms p(90)=23.43ms p(95)=26.58ms  p(99.9)=47.27ms
     iterations.....................: 372451  3099.235391/s
     success_rate...................: 100.00% ✓ 372451      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (rust subgraphs) (16.7.0-p.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 1013004     ✗ 0     
     data_received..................: 30 GB   246 MB/s
     data_sent......................: 406 MB  3.4 MB/s
     http_req_blocked...............: avg=2.9µs    min=972ns   med=2.26µs  max=7.82ms   p(90)=3.53µs  p(95)=4.12µs  p(99.9)=32.2µs 
     http_req_connecting............: avg=253ns    min=0s      med=0s      max=3.42ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=17.55ms  min=1.94ms  med=16.66ms max=290.63ms p(90)=25.37ms p(95)=28.89ms p(99.9)=49.74ms
       { expected_response:true }...: avg=17.55ms  min=1.94ms  med=16.66ms max=290.63ms p(90)=25.37ms p(95)=28.89ms p(99.9)=49.74ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 337768
     http_req_receiving.............: avg=453.95µs min=51.13µs med=90.72µs max=88.28ms  p(90)=1.12ms  p(95)=1.77ms  p(99.9)=17.36ms
     http_req_sending...............: avg=47.05µs  min=4.4µs   med=8.54µs  max=194.61ms p(90)=15.16µs p(95)=94.88µs p(99.9)=5.04ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=17.05ms  min=1.85ms  med=16.17ms max=275.12ms p(90)=24.74ms p(95)=28.21ms p(99.9)=48.44ms
     http_reqs......................: 337768  2809.060673/s
     iteration_duration.............: avg=17.76ms  min=2.68ms  med=16.85ms max=309.71ms p(90)=25.58ms p(95)=29.11ms p(99.9)=50.13ms
     iterations.....................: 337668  2808.229019/s
     success_rate...................: 100.00% ✓ 337668      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (rust subgraphs) (16.7.0-p.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 934296      ✗ 0     
     data_received..................: 27 GB   227 MB/s
     data_sent......................: 374 MB  3.1 MB/s
     http_req_blocked...............: avg=2.6µs   min=941ns   med=2.08µs  max=16.89ms  p(90)=3.25µs  p(95)=3.82µs  p(99.9)=28.77µs 
     http_req_connecting............: avg=120ns   min=0s      med=0s      max=1.91ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=19.04ms min=2.05ms  med=16.41ms max=299.08ms p(90)=30.89ms p(95)=37.41ms p(99.9)=120.47ms
       { expected_response:true }...: avg=19.04ms min=2.05ms  med=16.41ms max=299.08ms p(90)=30.89ms p(95)=37.41ms p(99.9)=120.47ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 311532
     http_req_receiving.............: avg=553.8µs min=50.96µs med=90.11µs max=124.83ms p(90)=1.07ms  p(95)=1.93ms  p(99.9)=24.48ms 
     http_req_sending...............: avg=42.69µs min=4.67µs  med=8.47µs  max=135.37ms p(90)=14.4µs  p(95)=80.37µs p(99.9)=4.03ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=18.45ms min=1.9ms   med=15.88ms max=277.49ms p(90)=29.99ms p(95)=36.38ms p(99.9)=119.25ms
     http_reqs......................: 311532  2590.545042/s
     iteration_duration.............: avg=19.25ms min=2.94ms  med=16.6ms  max=320.17ms p(90)=31.12ms p(95)=37.65ms p(99.9)=121.46ms
     iterations.....................: 311432  2589.713491/s
     success_rate...................: 100.00% ✓ 311432      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (rust subgraphs) (16.6.4)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 933405      ✗ 0     
     data_received..................: 27 GB   227 MB/s
     data_sent......................: 374 MB  3.1 MB/s
     http_req_blocked...............: avg=2.78µs   min=871ns   med=1.82µs  max=18.03ms  p(90)=2.86µs  p(95)=3.37µs  p(99.9)=26.47µs 
     http_req_connecting............: avg=304ns    min=0s      med=0s      max=4.16ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=19.07ms  min=1.92ms  med=16.31ms max=291.6ms  p(90)=31.06ms p(95)=37.68ms p(99.9)=124.4ms 
       { expected_response:true }...: avg=19.07ms  min=1.92ms  med=16.31ms max=291.6ms  p(90)=31.06ms p(95)=37.68ms p(99.9)=124.4ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 311235
     http_req_receiving.............: avg=579.07µs min=51.03µs med=88.47µs max=167.25ms p(90)=1.09ms  p(95)=2ms     p(99.9)=25.13ms 
     http_req_sending...............: avg=41.2µs   min=4.19µs  med=7.76µs  max=237.68ms p(90)=12.85µs p(95)=68.43µs p(99.9)=3.4ms   
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=18.45ms  min=1.84ms  med=15.78ms max=291.45ms p(90)=30.1ms  p(95)=36.54ms p(99.9)=122.92ms
     http_reqs......................: 311235  2588.522831/s
     iteration_duration.............: avg=19.27ms  min=2.88ms  med=16.5ms  max=320.09ms p(90)=31.28ms p(95)=37.9ms  p(99.9)=125.61ms
     iterations.....................: 311135  2587.691137/s
     success_rate...................: 100.00% ✓ 311135      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (rust subgraphs) (16.7.0-p.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 849342      ✗ 0     
     data_received..................: 25 GB   207 MB/s
     data_sent......................: 340 MB  2.8 MB/s
     http_req_blocked...............: avg=3.02µs   min=1.02µs  med=2.32µs  max=16ms     p(90)=3.57µs  p(95)=4.13µs  p(99.9)=35.93µs 
     http_req_connecting............: avg=226ns    min=0s      med=0s      max=3.29ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=20.97ms  min=1.7ms   med=16.87ms max=580.98ms p(90)=35.52ms p(95)=45.4ms  p(99.9)=170.28ms
       { expected_response:true }...: avg=20.97ms  min=1.7ms   med=16.87ms max=580.98ms p(90)=35.52ms p(95)=45.4ms  p(99.9)=170.28ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 283214
     http_req_receiving.............: avg=620.97µs min=51.82µs med=97.09µs max=215.57ms p(90)=1.07ms  p(95)=1.89ms  p(99.9)=34.78ms 
     http_req_sending...............: avg=40.24µs  min=4.68µs  med=9µs     max=161.52ms p(90)=15.32µs p(95)=68.32µs p(99.9)=3.21ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=20.31ms  min=1.57ms  med=16.33ms max=580.87ms p(90)=34.44ms p(95)=44.08ms p(99.9)=167.23ms
     http_reqs......................: 283214  2355.800693/s
     iteration_duration.............: avg=21.18ms  min=2.61ms  med=17.07ms max=581.19ms p(90)=35.73ms p(95)=45.62ms p(99.9)=171.39ms
     iterations.....................: 283114  2354.968884/s
     success_rate...................: 100.00% ✓ 283114      ✗ 0     
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

     checks.........................: 100.00% ✓ 802197      ✗ 0     
     data_received..................: 24 GB   196 MB/s
     data_sent......................: 321 MB  2.7 MB/s
     http_req_blocked...............: avg=2.95µs  min=961ns   med=2.22µs  max=3.8ms    p(90)=3.84µs  p(95)=4.63µs   p(99.9)=32.84µs
     http_req_connecting............: avg=316ns   min=0s      med=0s      max=3.47ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=22.21ms min=1.72ms  med=21.96ms max=305.44ms p(90)=26.48ms p(95)=28.4ms   p(99.9)=47.37ms
       { expected_response:true }...: avg=22.21ms min=1.72ms  med=21.96ms max=305.44ms p(90)=26.48ms p(95)=28.4ms   p(99.9)=47.37ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 267499
     http_req_receiving.............: avg=87.59µs min=26.47µs med=51.82µs max=29.78ms  p(90)=91.58µs p(95)=119.99µs p(99.9)=7.09ms 
     http_req_sending...............: avg=38.89µs min=4.79µs  med=9.4µs   max=162.97ms p(90)=16.35µs p(95)=28.13µs  p(99.9)=2.09ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=22.09ms min=1.62ms  med=21.87ms max=295.73ms p(90)=26.34ms p(95)=28.21ms  p(99.9)=46.61ms
     http_reqs......................: 267499  2225.007673/s
     iteration_duration.............: avg=22.42ms min=3.94ms  med=22.16ms max=314.65ms p(90)=26.68ms p(95)=28.62ms  p(99.9)=47.78ms
     iterations.....................: 267399  2224.175891/s
     success_rate...................: 100.00% ✓ 267399      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (rust subgraphs) (0.334.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 460140      ✗ 0     
     data_received..................: 14 GB   112 MB/s
     data_sent......................: 184 MB  1.5 MB/s
     http_req_blocked...............: avg=3.04µs  min=1µs     med=2.13µs  max=3.79ms   p(90)=3.57µs  p(95)=4.21µs   p(99.9)=32.9µs  
     http_req_connecting............: avg=590ns   min=0s      med=0s      max=3.76ms   p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=38.88ms min=2.05ms  med=38.47ms max=295.92ms p(90)=54.4ms  p(95)=59.17ms  p(99.9)=81.68ms 
       { expected_response:true }...: avg=38.88ms min=2.05ms  med=38.47ms max=295.92ms p(90)=54.4ms  p(95)=59.17ms  p(99.9)=81.68ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 153480
     http_req_receiving.............: avg=72.1µs  min=26.45µs med=58.55µs max=142.1ms  p(90)=94.3µs  p(95)=109.86µs p(99.9)=791.98µs
     http_req_sending...............: avg=22.88µs min=4.63µs  med=9.51µs  max=96.21ms  p(90)=15.41µs p(95)=19.14µs  p(99.9)=917.82µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=38.79ms min=1.97ms  med=38.38ms max=289.01ms p(90)=54.3ms  p(95)=59.08ms  p(99.9)=81.37ms 
     http_reqs......................: 153480  1276.165627/s
     iteration_duration.............: avg=39.11ms min=3.64ms  med=38.68ms max=320.57ms p(90)=54.6ms  p(95)=59.37ms  p(99.9)=82.11ms 
     iterations.....................: 153380  1275.334141/s
     success_rate...................: 100.00% ✓ 153380      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (rust subgraphs) (2.10.8)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 228459     ✗ 0    
     data_received..................: 6.7 GB  56 MB/s
     data_sent......................: 92 MB   760 kB/s
     http_req_blocked...............: avg=3.86µs  min=1.03µs  med=2.73µs  max=3.35ms   p(90)=4.19µs   p(95)=4.83µs   p(99.9)=45.01µs 
     http_req_connecting............: avg=889ns   min=0s      med=0s      max=3.32ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=78.45ms min=3.52ms  med=77.62ms max=286.3ms  p(90)=99.14ms  p(95)=108.92ms p(99.9)=181.41ms
       { expected_response:true }...: avg=78.45ms min=3.52ms  med=77.62ms max=286.3ms  p(90)=99.14ms  p(95)=108.92ms p(99.9)=181.41ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 76253
     http_req_receiving.............: avg=81.08µs min=27.7µs  med=69.9µs  max=114.31ms p(90)=107.57µs p(95)=120.81µs p(99.9)=622.49µs
     http_req_sending...............: avg=23.73µs min=4.67µs  med=13.24µs max=139.62ms p(90)=20.52µs  p(95)=22.88µs  p(99.9)=651.21µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=78.34ms min=3.45ms  med=77.52ms max=286.07ms p(90)=99.04ms  p(95)=108.8ms  p(99.9)=181.11ms
     http_reqs......................: 76253   633.07162/s
     iteration_duration.............: avg=78.79ms min=21.77ms med=77.86ms max=313.26ms p(90)=99.4ms   p(95)=109.21ms p(99.9)=183.03ms
     iterations.....................: 76153   632.241395/s
     success_rate...................: 100.00% ✓ 76153      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-router (rust subgraphs) (v2.16.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 176841     ✗ 0    
     data_received..................: 5.2 GB  43 MB/s
     data_sent......................: 71 MB   588 kB/s
     http_req_blocked...............: avg=5µs      min=1.23µs  med=3.3µs    max=3.55ms   p(90)=4.74µs   p(95)=5.34µs   p(99.9)=58.04µs 
     http_req_connecting............: avg=1.47µs   min=0s      med=0s       max=3.5ms    p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=101.38ms min=4.59ms  med=101.17ms max=311.82ms p(90)=122.26ms p(95)=128.56ms p(99.9)=156.84ms
       { expected_response:true }...: avg=101.38ms min=4.59ms  med=101.17ms max=311.82ms p(90)=122.26ms p(95)=128.56ms p(99.9)=156.84ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 59047
     http_req_receiving.............: avg=85.22µs  min=31.63µs med=77.79µs  max=103.99ms p(90)=110.1µs  p(95)=122.69µs p(99.9)=544.11µs
     http_req_sending...............: avg=25.48µs  min=5.7µs   med=15.67µs  max=111.68ms p(90)=21.55µs  p(95)=23.5µs   p(99.9)=603.77µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=101.27ms min=4.41ms  med=101.07ms max=311.27ms p(90)=122.15ms p(95)=128.46ms p(99.9)=156.26ms
     http_reqs......................: 59047   489.641869/s
     iteration_duration.............: avg=101.81ms min=22.46ms med=101.45ms max=349.51ms p(90)=122.53ms p(95)=128.83ms p(99.9)=158.7ms 
     iterations.....................: 58947   488.812628/s
     success_rate...................: 100.00% ✓ 58947      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-gateway (rust subgraphs) (2.14.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 102108     ✗ 0    
     data_received..................: 3.0 GB  25 MB/s
     data_sent......................: 41 MB   339 kB/s
     http_req_blocked...............: avg=6.45µs   min=1.33µs  med=3.41µs   max=3.52ms   p(90)=4.67µs   p(95)=5.18µs   p(99.9)=1.49ms  
     http_req_connecting............: avg=2.82µs   min=0s      med=0s       max=3.47ms   p(90)=0s       p(95)=0s       p(99.9)=1.45ms  
     http_req_duration..............: avg=175.6ms  min=7.34ms  med=168.94ms max=391.97ms p(90)=198.85ms p(95)=204.14ms p(99.9)=267.22ms
       { expected_response:true }...: avg=175.6ms  min=7.34ms  med=168.94ms max=391.97ms p(90)=198.85ms p(95)=204.14ms p(99.9)=267.22ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 34136
     http_req_receiving.............: avg=91.53µs  min=34.62µs med=84.6µs   max=54.73ms  p(90)=114.02µs p(95)=124.9µs  p(99.9)=485.63µs
     http_req_sending...............: avg=31.82µs  min=6µs     med=16.94µs  max=116.46ms p(90)=21.24µs  p(95)=23.02µs  p(99.9)=456.13µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=175.48ms min=7.19ms  med=168.83ms max=391.47ms p(90)=198.74ms p(95)=204.02ms p(99.9)=266.61ms
     http_reqs......................: 34136   282.231937/s
     iteration_duration.............: avg=176.4ms  min=41.21ms med=169.21ms max=407.97ms p(90)=199.14ms p(95)=204.44ms p(99.9)=270.05ms
     iterations.....................: 34036   281.40515/s
     success_rate...................: 100.00% ✓ 34036      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (rust subgraphs) (2.10.8)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 99294      ✗ 0    
     data_received..................: 2.9 GB  24 MB/s
     data_sent......................: 40 MB   329 kB/s
     http_req_blocked...............: avg=6.35µs   min=1.18µs  med=3.54µs   max=3.4ms    p(90)=4.96µs   p(95)=5.57µs   p(99.9)=1.16ms  
     http_req_connecting............: avg=2.55µs   min=0s      med=0s       max=3.36ms   p(90)=0s       p(95)=0s       p(99.9)=1.14ms  
     http_req_duration..............: avg=180.58ms min=5.96ms  med=166.43ms max=658.77ms p(90)=211.41ms p(95)=250.78ms p(99.9)=598.1ms 
       { expected_response:true }...: avg=180.58ms min=5.96ms  med=166.43ms max=658.77ms p(90)=211.41ms p(95)=250.78ms p(99.9)=598.1ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 33198
     http_req_receiving.............: avg=91.26µs  min=32.06µs med=86.01µs  max=9.05ms   p(90)=115.54µs p(95)=126.9µs  p(99.9)=767.48µs
     http_req_sending...............: avg=32.12µs  min=6µs     med=17.48µs  max=130.6ms  p(90)=22.5µs   p(95)=24.33µs  p(99.9)=612.2µs 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=180.46ms min=5.85ms  med=166.32ms max=658.67ms p(90)=211.3ms  p(95)=250.66ms p(99.9)=597.99ms
     http_reqs......................: 33198   274.164202/s
     iteration_duration.............: avg=181.4ms  min=35.84ms med=166.78ms max=659.04ms p(90)=211.87ms p(95)=252.09ms p(99.9)=598.34ms
     iterations.....................: 33098   273.338357/s
     success_rate...................: 100.00% ✓ 33098      ✗ 0    
     vus............................: 5       min=5        max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: feddi (rust subgraphs) (5ff8b6165878)</summary>

  **K6 Output**


```
data_received..................: 6.8 MB 113 kB/s
     data_sent......................: 86 kB  1.4 kB/s
     http_req_blocked...............: avg=5.73µs   min=2.56µs  med=3.24µs   max=165.3µs  p(90)=4.4µs    p(95)=4.81µs   p(99.9)=154.19µs
     http_req_connecting............: avg=1.19µs   min=0s      med=0s       max=84.63µs  p(90)=0s       p(95)=0s       p(99.9)=78.71µs 
     http_req_duration..............: avg=453.93ms min=22.39ms med=31.69ms  max=30.02s   p(90)=40.31ms  p(95)=41.55ms  p(99.9)=27.92s  
       { expected_response:true }...: avg=453.93ms min=22.39ms med=31.69ms  max=30.02s   p(90)=40.31ms  p(95)=41.55ms  p(99.9)=27.92s  
     http_req_failed................: 0.00%  ✓ 0        ✗ 71  
     http_req_receiving.............: avg=122.37µs min=73µs    med=118.28µs max=426.11µs p(90)=143.53µs p(95)=204.16µs p(99.9)=420.72µs
     http_req_sending...............: avg=20.22µs  min=13.72µs med=17.56µs  max=139.27µs p(90)=19.97µs  p(95)=22.25µs  p(99.9)=133.55µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=453.79ms min=22.24ms med=31.53ms  max=30.02s   p(90)=40.1ms   p(95)=41.42ms  p(99.9)=27.92s  
     http_reqs......................: 71     1.183313/s
     vus............................: 0      min=0      max=0 
     vus_max........................: 50     min=50     max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (.net subgraphs) (16.7.0-p.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 887133      ✗ 0     
     data_received..................: 26 GB   216 MB/s
     data_sent......................: 356 MB  3.0 MB/s
     http_req_blocked...............: avg=2.6µs    min=841ns   med=1.98µs   max=10.25ms  p(90)=3.32µs  p(95)=3.99µs  p(99.9)=29.46µs
     http_req_connecting............: avg=175ns    min=0s      med=0s       max=2.98ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=20.06ms  min=1.5ms   med=19.25ms  max=277.98ms p(90)=29.09ms p(95)=32.65ms p(99.9)=52.9ms 
       { expected_response:true }...: avg=20.06ms  min=1.5ms   med=19.25ms  max=277.98ms p(90)=29.09ms p(95)=32.65ms p(99.9)=52.9ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 295811
     http_req_receiving.............: avg=562.19µs min=52.61µs med=107.52µs max=162.02ms p(90)=1.36ms  p(95)=2.11ms  p(99.9)=18.48ms
     http_req_sending...............: avg=39.78µs  min=4.48µs  med=8.59µs   max=96.44ms  p(90)=16.17µs p(95)=76.66µs p(99.9)=3.11ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=19.46ms  min=1.4ms   med=18.65ms  max=277.59ms p(90)=28.37ms p(95)=31.86ms p(99.9)=51.48ms
     http_reqs......................: 295811  2460.799797/s
     iteration_duration.............: avg=20.28ms  min=2.89ms  med=19.45ms  max=290.68ms p(90)=29.3ms  p(95)=32.87ms p(99.9)=53.48ms
     iterations.....................: 295711  2459.967914/s
     success_rate...................: 100.00% ✓ 295711      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (.net subgraphs) (16.6.4)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 870498      ✗ 0     
     data_received..................: 25 GB   212 MB/s
     data_sent......................: 349 MB  2.9 MB/s
     http_req_blocked...............: avg=3.76µs   min=1µs     med=2.66µs  max=20.66ms  p(90)=4.23µs  p(95)=4.98µs  p(99.9)=40.06µs 
     http_req_connecting............: avg=325ns    min=0s      med=0s      max=3.94ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=20.44ms  min=1.66ms  med=17.17ms max=361.51ms p(90)=33.55ms p(95)=40.9ms  p(99.9)=147.19ms
       { expected_response:true }...: avg=20.44ms  min=1.66ms  med=17.17ms max=361.51ms p(90)=33.55ms p(95)=40.9ms  p(99.9)=147.19ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 290266
     http_req_receiving.............: avg=594.24µs min=52.93µs med=99.97µs max=143.55ms p(90)=1.13ms  p(95)=2ms     p(99.9)=28.15ms 
     http_req_sending...............: avg=46.65µs  min=5.06µs  med=10.23µs max=96.89ms  p(90)=18.71µs p(95)=96.89µs p(99.9)=4.19ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=19.8ms   min=1.57ms  med=16.61ms max=361.41ms p(90)=32.51ms p(95)=39.74ms p(99.9)=145.41ms
     http_reqs......................: 290266  2414.334603/s
     iteration_duration.............: avg=20.66ms  min=2.51ms  med=17.38ms max=361.71ms p(90)=33.78ms p(95)=41.15ms p(99.9)=148.3ms 
     iterations.....................: 290166  2413.502837/s
     success_rate...................: 100.00% ✓ 290166      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.84)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 863742      ✗ 0     
     data_received..................: 25 GB   210 MB/s
     data_sent......................: 346 MB  2.9 MB/s
     http_req_blocked...............: avg=3.37µs  min=1.04µs  med=2.65µs  max=8.56ms   p(90)=4.21µs  p(95)=4.97µs   p(99.9)=38.74µs
     http_req_connecting............: avg=317ns   min=0s      med=0s      max=4.03ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=20.61ms min=1.75ms  med=20.36ms max=295.44ms p(90)=28.74ms p(95)=31.2ms   p(99.9)=49.44ms
       { expected_response:true }...: avg=20.61ms min=1.75ms  med=20.36ms max=295.44ms p(90)=28.74ms p(95)=31.2ms   p(99.9)=49.44ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 288014
     http_req_receiving.............: avg=88.75µs min=26.53µs med=53.44µs max=165.35ms p(90)=92.01µs p(95)=122.39µs p(99.9)=6.04ms 
     http_req_sending...............: avg=42.95µs min=4.95µs  med=10.14µs max=181.08ms p(90)=16.8µs  p(95)=44.71µs  p(99.9)=2.97ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=20.48ms min=1.7ms   med=20.24ms max=295.03ms p(90)=28.59ms p(95)=31.02ms  p(99.9)=48.61ms
     http_reqs......................: 288014  2395.478875/s
     iteration_duration.............: avg=20.83ms min=3.33ms  med=20.56ms max=305.68ms p(90)=28.94ms p(95)=31.42ms  p(99.9)=49.82ms
     iterations.....................: 287914  2394.647152/s
     success_rate...................: 100.00% ✓ 287914      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.7.0-p.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 854964      ✗ 0     
     data_received..................: 25 GB   208 MB/s
     data_sent......................: 343 MB  2.8 MB/s
     http_req_blocked...............: avg=3.33µs   min=1.06µs  med=2.64µs  max=6.77ms   p(90)=4.08µs  p(95)=4.73µs  p(99.9)=36.99µs 
     http_req_connecting............: avg=321ns    min=0s      med=0s      max=3.52ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=20.81ms  min=1.61ms  med=17.36ms max=296.83ms p(90)=34.36ms p(95)=42.15ms p(99.9)=150.95ms
       { expected_response:true }...: avg=20.81ms  min=1.61ms  med=17.36ms max=296.83ms p(90)=34.36ms p(95)=42.15ms p(99.9)=150.95ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 285088
     http_req_receiving.............: avg=618.88µs min=52.99µs med=100.7µs max=200.65ms p(90)=1.14ms  p(95)=2.04ms  p(99.9)=29.19ms 
     http_req_sending...............: avg=43.24µs  min=5.05µs  med=9.98µs  max=92.49ms  p(90)=17.54µs p(95)=90.17µs p(99.9)=2.92ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=20.15ms  min=1.49ms  med=16.8ms  max=296.1ms  p(90)=33.33ms p(95)=40.91ms p(99.9)=148.39ms
     http_reqs......................: 285088  2371.655506/s
     iteration_duration.............: avg=21.04ms  min=2.66ms  med=17.57ms max=312.16ms p(90)=34.6ms  p(95)=42.42ms p(99.9)=152.57ms
     iterations.....................: 284988  2370.823603/s
     success_rate...................: 100.00% ✓ 284988      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (.net subgraphs) (16.7.0-p.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 837309      ✗ 0     
     data_received..................: 25 GB   204 MB/s
     data_sent......................: 336 MB  2.8 MB/s
     http_req_blocked...............: avg=3.66µs   min=962ns  med=2.73µs   max=21.1ms   p(90)=4.4µs   p(95)=5.17µs  p(99.9)=38.89µs 
     http_req_connecting............: avg=344ns    min=0s     med=0s       max=3.57ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=21.26ms  min=1.88ms med=18.11ms  max=365.65ms p(90)=34.46ms p(95)=42.25ms p(99.9)=142.44ms
       { expected_response:true }...: avg=21.26ms  min=1.88ms med=18.11ms  max=365.65ms p(90)=34.46ms p(95)=42.25ms p(99.9)=142.44ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 279203
     http_req_receiving.............: avg=573.44µs min=51.2µs med=101.03µs max=222.32ms p(90)=1.12ms  p(95)=1.96ms  p(99.9)=26.4ms  
     http_req_sending...............: avg=44.77µs  min=4.83µs med=10.36µs  max=157.03ms p(90)=19.74µs p(95)=92.2µs  p(99.9)=3.23ms  
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=20.64ms  min=1.78ms med=17.56ms  max=364.75ms p(90)=33.52ms p(95)=41.16ms p(99.9)=141.51ms
     http_reqs......................: 279203  2322.026395/s
     iteration_duration.............: avg=21.48ms  min=2.91ms med=18.32ms  max=365.83ms p(90)=34.7ms  p(95)=42.51ms p(99.9)=143.61ms
     iterations.....................: 279103  2321.194733/s
     success_rate...................: 100.00% ✓ 279103      ✗ 0     
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

     checks.........................: 100.00% ✓ 594885      ✗ 0     
     data_received..................: 17 GB   145 MB/s
     data_sent......................: 238 MB  2.0 MB/s
     http_req_blocked...............: avg=3.28µs  min=862ns   med=2.23µs  max=6.14ms   p(90)=4.37µs   p(95)=5.46µs   p(99.9)=46.12µs
     http_req_connecting............: avg=445ns   min=0s      med=0s      max=4.01ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=30ms    min=2.23ms  med=29.54ms max=294.26ms p(90)=39.82ms  p(95)=43.16ms  p(99.9)=64.32ms
       { expected_response:true }...: avg=30ms    min=2.23ms  med=29.54ms max=294.26ms p(90)=39.82ms  p(95)=43.16ms  p(99.9)=64.32ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 198395
     http_req_receiving.............: avg=93.65µs min=27.62µs med=53.87µs max=136.97ms p(90)=124.61µs p(95)=209.04µs p(99.9)=3.81ms 
     http_req_sending...............: avg=41.74µs min=4.8µs   med=9.49µs  max=146.33ms p(90)=24.39µs  p(95)=110.31µs p(99.9)=3.21ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=29.86ms min=2.16ms  med=29.42ms max=287.02ms p(90)=39.67ms  p(95)=42.98ms  p(99.9)=63.41ms
     http_reqs......................: 198395  1649.442426/s
     iteration_duration.............: avg=30.24ms min=5.37ms  med=29.77ms max=303.48ms p(90)=40.05ms  p(95)=43.37ms  p(99.9)=64.85ms
     iterations.....................: 198295  1648.611033/s
     success_rate...................: 100.00% ✓ 198295      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (.net subgraphs) (0.334.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 434589      ✗ 0     
     data_received..................: 13 GB   105 MB/s
     data_sent......................: 174 MB  1.4 MB/s
     http_req_blocked...............: avg=3.32µs  min=982ns   med=2.32µs  max=4.22ms   p(90)=3.94µs   p(95)=4.64µs   p(99.9)=33.76µs 
     http_req_connecting............: avg=664ns   min=0s      med=0s      max=4.18ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=41.17ms min=2.15ms  med=40.81ms max=297.36ms p(90)=57.18ms  p(95)=62.13ms  p(99.9)=86ms    
       { expected_response:true }...: avg=41.17ms min=2.15ms  med=40.81ms max=297.36ms p(90)=57.18ms  p(95)=62.13ms  p(99.9)=86ms    
     http_req_failed................: 0.00%   ✓ 0           ✗ 144963
     http_req_receiving.............: avg=80.86µs min=28.55µs med=65.82µs max=103.23ms p(90)=106.01µs p(95)=122.55µs p(99.9)=897.51µs
     http_req_sending...............: avg=25.25µs min=4.93µs  med=11.09µs max=134.57ms p(90)=18.19µs  p(95)=21.78µs  p(99.9)=838.95µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=41.06ms min=2.06ms  med=40.71ms max=294.39ms p(90)=57.07ms  p(95)=62.03ms  p(99.9)=85.43ms 
     http_reqs......................: 144963  1205.120046/s
     iteration_duration.............: avg=41.41ms min=3.99ms  med=41.03ms max=324.89ms p(90)=57.39ms  p(95)=62.34ms  p(99.9)=86.35ms 
     iterations.....................: 144863  1204.288716/s
     success_rate...................: 100.00% ✓ 144863      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (.net subgraphs) (2.10.8)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 213447     ✗ 0    
     data_received..................: 6.2 GB  52 MB/s
     data_sent......................: 86 MB   710 kB/s
     http_req_blocked...............: avg=4.32µs  min=962ns   med=2.78µs  max=3.59ms   p(90)=4.32µs   p(95)=4.93µs   p(99.9)=44.28µs 
     http_req_connecting............: avg=1.29µs  min=0s      med=0s      max=3.55ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=83.98ms min=3.91ms  med=81.91ms max=336.06ms p(90)=102.65ms p(95)=112.73ms p(99.9)=198.11ms
       { expected_response:true }...: avg=83.98ms min=3.91ms  med=81.91ms max=336.06ms p(90)=102.65ms p(95)=112.73ms p(99.9)=198.11ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 71249
     http_req_receiving.............: avg=83.04µs min=28.92µs med=73.37µs max=115.03ms p(90)=110.06µs p(95)=123.42µs p(99.9)=635.37µs
     http_req_sending...............: avg=24.74µs min=4.94µs  med=13.47µs max=177.72ms p(90)=20.31µs  p(95)=22.36µs  p(99.9)=588.59µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=83.88ms min=3.83ms  med=81.81ms max=335.52ms p(90)=102.54ms p(95)=112.62ms p(99.9)=197.19ms
     http_reqs......................: 71249   591.219932/s
     iteration_duration.............: avg=84.33ms min=24.71ms med=82.16ms max=346.09ms p(90)=102.9ms  p(95)=112.99ms p(99.9)=199.2ms 
     iterations.....................: 71149   590.390138/s
     success_rate...................: 100.00% ✓ 71149      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-router (.net subgraphs) (v2.16.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 160590     ✗ 0    
     data_received..................: 4.7 GB  39 MB/s
     data_sent......................: 64 MB   534 kB/s
     http_req_blocked...............: avg=5.4µs    min=1.13µs  med=3.63µs   max=3.37ms   p(90)=5.2µs    p(95)=5.83µs   p(99.9)=72.74µs 
     http_req_connecting............: avg=1.55µs   min=0s      med=0s       max=3.33ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=111.62ms min=5.21ms  med=109.39ms max=317.51ms p(90)=147.62ms p(95)=158.57ms p(99.9)=202.94ms
       { expected_response:true }...: avg=111.62ms min=5.21ms  med=109.39ms max=317.51ms p(90)=147.62ms p(95)=158.57ms p(99.9)=202.94ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 53630
     http_req_receiving.............: avg=93.19µs  min=30.12µs med=85.24µs  max=66.88ms  p(90)=116.18µs p(95)=128.56µs p(99.9)=636.42µs
     http_req_sending...............: avg=28.34µs  min=5.27µs  med=17.92µs  max=148.81ms p(90)=23.29µs  p(95)=25.39µs  p(99.9)=570.22µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=111.5ms  min=5.12ms  med=109.29ms max=316.77ms p(90)=147.49ms p(95)=158.46ms p(99.9)=201.75ms
     http_reqs......................: 53630   444.437541/s
     iteration_duration.............: avg=112.11ms min=28.2ms  med=109.73ms max=334.13ms p(90)=147.92ms p(95)=158.89ms p(99.9)=205.32ms
     iterations.....................: 53530   443.608831/s
     success_rate...................: 100.00% ✓ 53530      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-gateway (.net subgraphs) (2.14.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 97419      ✗ 0    
     data_received..................: 2.9 GB  24 MB/s
     data_sent......................: 39 MB   323 kB/s
     http_req_blocked...............: avg=6.88µs   min=1.35µs  med=3.67µs   max=3.65ms   p(90)=5.15µs   p(95)=5.77µs   p(99.9)=1.65ms  
     http_req_connecting............: avg=2.91µs   min=0s      med=0s       max=3.61ms   p(90)=0s       p(95)=0s       p(99.9)=1.63ms  
     http_req_duration..............: avg=183.97ms min=7.86ms  med=185.64ms max=410.57ms p(90)=193.82ms p(95)=197.81ms p(99.9)=286.59ms
       { expected_response:true }...: avg=183.97ms min=7.86ms  med=185.64ms max=410.57ms p(90)=193.82ms p(95)=197.81ms p(99.9)=286.59ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32573
     http_req_receiving.............: avg=108.59µs min=32.7µs  med=90.12µs  max=183.84ms p(90)=121.58µs p(95)=133.16µs p(99.9)=547.57µs
     http_req_sending...............: avg=31.36µs  min=5.8µs   med=18.8µs   max=82.02ms  p(90)=23.63µs  p(95)=25.62µs  p(99.9)=590.33µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=183.83ms min=7.71ms  med=185.54ms max=410.43ms p(90)=193.71ms p(95)=197.69ms p(99.9)=286.35ms
     http_reqs......................: 32573   269.285214/s
     iteration_duration.............: avg=184.83ms min=36.75ms med=186.01ms max=420ms    p(90)=194.11ms p(95)=198.09ms p(99.9)=288.39ms
     iterations.....................: 32473   268.458501/s
     success_rate...................: 100.00% ✓ 32473      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (.net subgraphs) (2.10.8)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 93396      ✗ 0    
     data_received..................: 2.7 GB  23 MB/s
     data_sent......................: 38 MB   310 kB/s
     http_req_blocked...............: avg=6.8µs    min=1.35µs  med=3.58µs   max=4.17ms   p(90)=5µs      p(95)=5.61µs   p(99.9)=1.33ms  
     http_req_connecting............: avg=2.92µs   min=0s      med=0s       max=4.12ms   p(90)=0s       p(95)=0s       p(99.9)=1.28ms  
     http_req_duration..............: avg=191.98ms min=6.44ms  med=178.12ms max=717.85ms p(90)=225.29ms p(95)=274.31ms p(99.9)=603.52ms
       { expected_response:true }...: avg=191.98ms min=6.44ms  med=178.12ms max=717.85ms p(90)=225.29ms p(95)=274.31ms p(99.9)=603.52ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 31232
     http_req_receiving.............: avg=97µs     min=35.94µs med=89.7µs   max=64.22ms  p(90)=120.53µs p(95)=132.62µs p(99.9)=762.2µs 
     http_req_sending...............: avg=30.79µs  min=6.61µs  med=18.51µs  max=135.69ms p(90)=23.32µs  p(95)=25.17µs  p(99.9)=623.94µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=191.85ms min=6.3ms   med=178ms    max=717.74ms p(90)=225.16ms p(95)=274.01ms p(99.9)=603.41ms
     http_reqs......................: 31232   258.070061/s
     iteration_duration.............: avg=192.86ms min=32.96ms med=178.5ms  max=718.12ms p(90)=225.68ms p(95)=275.17ms p(99.9)=603.78ms
     iterations.....................: 31132   257.243761/s
     success_rate...................: 100.00% ✓ 31132      ✗ 0    
     vus............................: 11      min=11       max=50 
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

     checks.........................: 100.00% ✓ 6933      ✗ 0   
     data_received..................: 231 MB  1.8 MB/s
     data_sent......................: 2.9 MB  23 kB/s
     http_req_blocked...............: avg=120.22µs min=1.26µs   med=3.23µs  max=9.16ms  p(90)=4.76µs   p(95)=5.6µs    p(99.9)=8.32ms  
     http_req_connecting............: avg=113.12µs min=0s       med=0s      max=9.1ms   p(90)=0s       p(95)=0s       p(99.9)=8ms     
     http_req_duration..............: avg=2.52s    min=27.06ms  med=2.57s   max=4.59s   p(90)=3.35s    p(95)=3.56s    p(99.9)=4.48s   
       { expected_response:true }...: avg=2.52s    min=27.06ms  med=2.57s   max=4.59s   p(90)=3.35s    p(95)=3.56s    p(99.9)=4.48s   
     http_req_failed................: 0.00%   ✓ 0         ✗ 2411
     http_req_receiving.............: avg=98.44µs  min=30.79µs  med=91.55µs max=8.5ms   p(90)=132.76µs p(95)=152.74µs p(99.9)=334.62µs
     http_req_sending...............: avg=52.53µs  min=5.61µs   med=18.23µs max=10.81ms p(90)=23.52µs  p(95)=27.23µs  p(99.9)=3.3ms   
     http_req_tls_handshaking.......: avg=0s       min=0s       med=0s      max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=2.52s    min=26.94ms  med=2.57s   max=4.59s   p(90)=3.35s    p(95)=3.56s    p(99.9)=4.48s   
     http_reqs......................: 2411    19.080736/s
     iteration_duration.............: avg=2.62s    min=308.29ms med=2.61s   max=4.59s   p(90)=3.36s    p(95)=3.57s    p(99.9)=4.48s   
     iterations.....................: 2311    18.289332/s
     success_rate...................: 100.00% ✓ 2311      ✗ 0   
     vus............................: 38      min=0       max=50
     vus_max........................: 50      min=50      max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

