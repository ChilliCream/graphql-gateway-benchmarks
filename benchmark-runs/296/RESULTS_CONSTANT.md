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
| hive-router | v0.0.83 | 2,933 | 3,221 | 2,874 | 3.8% |  |
| fusion-nightly-net11 | 16.6.0-p.3 | 2,713 | 2,840 | 2,686 | 1.8% |  |
| fusion-nightly | 16.6.0-p.3 | 2,645 | 2,761 | 2,563 | 2.5% |  |
| fusion | 16.5.1 | 2,588 | 2,695 | 2,576 | 1.7% |  |
| grafbase | 0.53.5 | 2,146 | 2,268 | 2,132 | 2.2% |  |
| cosmo | 0.331.1 | 1,323 | 1,369 | 1,311 | 1.6% |  |
| hive-gateway-router-runtime | 2.10.4 | 627 | 640 | 622 | 0.9% |  |
| apollo-router | v2.16.0 | 480 | 490 | 465 | 1.5% |  |
| apollo-gateway | 2.14.2 | 285 | 287 | 283 | 0.5% |  |
| hive-gateway | 2.10.4 | 281 | 289 | 281 | 1.0% |  |
| feddi | 5ff8b6165878 | 1 | 1 | 1 | 0.0% | non-compatible response (161 across 1/2 runs) |
| fusion-nightly-fed | — | — | — | — | — | not run |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.83 | 2,558 | 2,725 | 2,533 | 2.6% |  |
| fusion-nightly-net11 | 16.6.0-p.3 | 2,520 | 2,636 | 2,513 | 1.8% |  |
| fusion-nightly | 16.6.0-p.3 | 2,466 | 2,584 | 2,429 | 1.9% |  |
| fusion | 16.5.1 | 2,432 | 2,534 | 2,423 | 1.6% |  |
| fusion-nightly-fed | 16.6.0-p.3 | 2,195 | 2,301 | 2,187 | 1.8% |  |
| grafbase | 0.53.5 | 1,689 | 1,744 | 1,681 | 1.2% |  |
| cosmo | 0.331.1 | 1,184 | 1,238 | 1,182 | 1.7% |  |
| hive-gateway-router-runtime | 2.10.4 | 568 | 592 | 566 | 1.5% |  |
| apollo-router | v2.16.0 | 451 | 470 | 449 | 1.5% |  |
| apollo-gateway | 2.14.2 | 264 | 269 | 263 | 0.8% |  |
| hive-gateway | 2.10.4 | 261 | 267 | 258 | 1.0% |  |
| feddi | 5ff8b6165878 | 26 | 27 | 25 | 2.6% |  |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.83)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 1057617     ✗ 0     
     data_received..................: 31 GB   257 MB/s
     data_sent......................: 424 MB  3.5 MB/s
     http_req_blocked...............: avg=2.92µs  min=982ns   med=2.31µs  max=6.48ms   p(90)=3.59µs  p(95)=4.19µs   p(99.9)=32.69µs
     http_req_connecting............: avg=251ns   min=0s      med=0s      max=3.44ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=16.8ms  min=1.46ms  med=16.1ms  max=288.76ms p(90)=24.66ms p(95)=27.89ms  p(99.9)=47.99ms
       { expected_response:true }...: avg=16.8ms  min=1.46ms  med=16.1ms  max=288.76ms p(90)=24.66ms p(95)=27.89ms  p(99.9)=47.99ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 352639
     http_req_receiving.............: avg=91.96µs min=26.38µs med=48.04µs max=212.11ms p(90)=84.19µs p(95)=144.73µs p(99.9)=7.36ms 
     http_req_sending...............: avg=47.63µs min=4.75µs  med=8.85µs  max=160.42ms p(90)=14.87µs p(95)=92.31µs  p(99.9)=5.29ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=16.66ms min=1.41ms  med=15.99ms max=287.96ms p(90)=24.49ms p(95)=27.65ms  p(99.9)=46.69ms
     http_reqs......................: 352639  2933.993778/s
     iteration_duration.............: avg=17.01ms min=1.88ms  med=16.3ms  max=300.87ms p(90)=24.87ms p(95)=28.12ms  p(99.9)=48.68ms
     iterations.....................: 352539  2933.161767/s
     success_rate...................: 100.00% ✓ 352539      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (rust subgraphs) (16.6.0-p.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 978510      ✗ 0     
     data_received..................: 29 GB   238 MB/s
     data_sent......................: 392 MB  3.3 MB/s
     http_req_blocked...............: avg=2.79µs   min=882ns   med=1.98µs   max=17.63ms  p(90)=3.33µs  p(95)=3.95µs  p(99.9)=26.28µs
     http_req_connecting............: avg=268ns    min=0s      med=0s       max=3.92ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=18.17ms  min=1.93ms  med=17.32ms  max=296ms    p(90)=26.03ms p(95)=29.53ms p(99.9)=49.25ms
       { expected_response:true }...: avg=18.17ms  min=1.93ms  med=17.32ms  max=296ms    p(90)=26.03ms p(95)=29.53ms p(99.9)=49.25ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 326270
     http_req_receiving.............: avg=661.05µs min=51.17µs med=103.61µs max=48.9ms   p(90)=1.67ms  p(95)=2.48ms  p(99.9)=20.13ms
     http_req_sending...............: avg=42.55µs  min=4.68µs  med=8.25µs   max=113.01ms p(90)=15.61µs p(95)=85.24µs p(99.9)=4.27ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=17.47ms  min=1.85ms  med=16.62ms  max=295.54ms p(90)=25.18ms p(95)=28.6ms  p(99.9)=47.72ms
     http_reqs......................: 326270  2713.42165/s
     iteration_duration.............: avg=18.38ms  min=2.97ms  med=17.51ms  max=312.43ms p(90)=26.24ms p(95)=29.76ms p(99.9)=49.86ms
     iterations.....................: 326170  2712.590001/s
     success_rate...................: 100.00% ✓ 326170      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (rust subgraphs) (16.6.0-p.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 953949      ✗ 0     
     data_received..................: 28 GB   232 MB/s
     data_sent......................: 382 MB  3.2 MB/s
     http_req_blocked...............: avg=2.73µs   min=892ns   med=1.89µs  max=16.34ms  p(90)=3.01µs  p(95)=3.56µs  p(99.9)=28.54µs 
     http_req_connecting............: avg=304ns    min=0s      med=0s      max=3.92ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=18.65ms  min=1.92ms  med=16.04ms max=335.63ms p(90)=30.43ms p(95)=36.94ms p(99.9)=115.61ms
       { expected_response:true }...: avg=18.65ms  min=1.92ms  med=16.04ms max=335.63ms p(90)=30.43ms p(95)=36.94ms p(99.9)=115.61ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 318083
     http_req_receiving.............: avg=551.91µs min=51.09µs med=87.8µs  max=191.02ms p(90)=1.04ms  p(95)=1.88ms  p(99.9)=25.14ms 
     http_req_sending...............: avg=43.74µs  min=4.53µs  med=7.99µs  max=169.57ms p(90)=13.42µs p(95)=77.84µs p(99.9)=4.75ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=18.06ms  min=1.84ms  med=15.52ms max=335.21ms p(90)=29.47ms p(95)=35.85ms p(99.9)=113.74ms
     http_reqs......................: 318083  2645.434764/s
     iteration_duration.............: avg=18.86ms  min=2.85ms  med=16.23ms max=335.77ms p(90)=30.64ms p(95)=37.18ms p(99.9)=116.36ms
     iterations.....................: 317983  2644.603083/s
     success_rate...................: 100.00% ✓ 317983      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (rust subgraphs) (16.5.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 933531      ✗ 0     
     data_received..................: 27 GB   227 MB/s
     data_sent......................: 374 MB  3.1 MB/s
     http_req_blocked...............: avg=3.1µs    min=911ns   med=2.22µs  max=9.49ms   p(90)=3.54µs  p(95)=4.14µs  p(99.9)=32.06µs 
     http_req_connecting............: avg=513ns    min=0s      med=0s      max=9.17ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=19.06ms  min=2.07ms  med=16.42ms max=273.07ms p(90)=30.84ms p(95)=37.4ms  p(99.9)=120.7ms 
       { expected_response:true }...: avg=19.06ms  min=2.07ms  med=16.42ms max=273.07ms p(90)=30.84ms p(95)=37.4ms  p(99.9)=120.7ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 311277
     http_req_receiving.............: avg=557.27µs min=51.25µs med=90.58µs max=201.73ms p(90)=1.06ms  p(95)=1.89ms  p(99.9)=25.42ms 
     http_req_sending...............: avg=43.79µs  min=4.63µs  med=8.83µs  max=78.33ms  p(90)=15.43µs p(95)=87.75µs p(99.9)=4.14ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=18.46ms  min=1.93ms  med=15.9ms  max=261.39ms p(90)=29.93ms p(95)=36.36ms p(99.9)=117.4ms 
     http_reqs......................: 311277  2588.464684/s
     iteration_duration.............: avg=19.27ms  min=3.06ms  med=16.62ms max=293.14ms p(90)=31.07ms p(95)=37.65ms p(99.9)=121.48ms
     iterations.....................: 311177  2587.633121/s
     success_rate...................: 100.00% ✓ 311177      ✗ 0     
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

     checks.........................: 100.00% ✓ 773829      ✗ 0     
     data_received..................: 23 GB   189 MB/s
     data_sent......................: 310 MB  2.6 MB/s
     http_req_blocked...............: avg=2.96µs  min=942ns   med=2.2µs   max=10.88ms  p(90)=3.64µs  p(95)=4.36µs   p(99.9)=34.13µs
     http_req_connecting............: avg=323ns   min=0s      med=0s      max=3.36ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=23.04ms min=1.74ms  med=22.82ms max=308.01ms p(90)=27.24ms p(95)=28.89ms  p(99.9)=47.44ms
       { expected_response:true }...: avg=23.04ms min=1.74ms  med=22.82ms max=308.01ms p(90)=27.24ms p(95)=28.89ms  p(99.9)=47.44ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 258043
     http_req_receiving.............: avg=98.17µs min=27.06µs med=52.6µs  max=277.74ms p(90)=88.7µs  p(95)=112.98µs p(99.9)=5.58ms 
     http_req_sending...............: avg=32.69µs min=4.92µs  med=9.28µs  max=56.78ms  p(90)=15.18µs p(95)=23.15µs  p(99.9)=1.64ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=22.91ms min=1.65ms  med=22.72ms max=262ms    p(90)=27.12ms p(95)=28.73ms  p(99.9)=46.12ms
     http_reqs......................: 258043  2146.462822/s
     iteration_duration.............: avg=23.25ms min=3.88ms  med=23.01ms max=316.94ms p(90)=27.44ms p(95)=29.1ms   p(99.9)=47.88ms
     iterations.....................: 257943  2145.630999/s
     success_rate...................: 100.00% ✓ 257943      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
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

     checks.........................: 100.00% ✓ 477165      ✗ 0     
     data_received..................: 14 GB   116 MB/s
     data_sent......................: 191 MB  1.6 MB/s
     http_req_blocked...............: avg=3.46µs  min=1.03µs  med=2.59µs  max=4.13ms   p(90)=4.02µs  p(95)=4.65µs   p(99.9)=34.67µs 
     http_req_connecting............: avg=577ns   min=0s      med=0s      max=4.02ms   p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=37.48ms min=2.01ms  med=37.12ms max=293.87ms p(90)=52.37ms p(95)=57.03ms  p(99.9)=79.69ms 
       { expected_response:true }...: avg=37.48ms min=2.01ms  med=37.12ms max=293.87ms p(90)=52.37ms p(95)=57.03ms  p(99.9)=79.69ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 159155
     http_req_receiving.............: avg=76.44µs min=27.81µs med=62.02µs max=144.96ms p(90)=97.88µs p(95)=113.58µs p(99.9)=938.15µs
     http_req_sending...............: avg=25.5µs  min=5.1µs   med=10.96µs max=225.79ms p(90)=17.42µs p(95)=21.59µs  p(99.9)=1.02ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=37.38ms min=1.93ms  med=37.02ms max=293.69ms p(90)=52.27ms p(95)=56.93ms  p(99.9)=79.25ms 
     http_reqs......................: 159155  1323.340866/s
     iteration_duration.............: avg=37.71ms min=3.54ms  med=37.33ms max=309.79ms p(90)=52.57ms p(95)=57.24ms  p(99.9)=80.03ms 
     iterations.....................: 159055  1322.509386/s
     success_rate...................: 100.00% ✓ 159055      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
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

     checks.........................: 100.00% ✓ 226686     ✗ 0    
     data_received..................: 6.6 GB  55 MB/s
     data_sent......................: 91 MB   754 kB/s
     http_req_blocked...............: avg=4.32µs  min=1.01µs  med=2.68µs  max=3.63ms   p(90)=4.27µs  p(95)=4.93µs   p(99.9)=43.71µs 
     http_req_connecting............: avg=1.31µs  min=0s      med=0s      max=3.59ms   p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=79.07ms min=3.69ms  med=77.31ms max=303.53ms p(90)=96.98ms p(95)=106.39ms p(99.9)=186.5ms 
       { expected_response:true }...: avg=79.07ms min=3.69ms  med=77.31ms max=303.53ms p(90)=96.98ms p(95)=106.39ms p(99.9)=186.5ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 75662
     http_req_receiving.............: avg=80.89µs min=26.29µs med=68.13µs max=151.2ms  p(90)=105.5µs p(95)=119.05µs p(99.9)=614.63µs
     http_req_sending...............: avg=21µs    min=5.08µs  med=12.6µs  max=60.82ms  p(90)=20.02µs p(95)=22.26µs  p(99.9)=575.01µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=78.97ms min=3.59ms  med=77.22ms max=302.96ms p(90)=96.86ms p(95)=106.29ms p(99.9)=185.8ms 
     http_reqs......................: 75662   627.875992/s
     iteration_duration.............: avg=79.42ms min=27.53ms med=77.55ms max=324.85ms p(90)=97.22ms p(95)=106.68ms p(99.9)=188.32ms
     iterations.....................: 75562   627.046149/s
     success_rate...................: 100.00% ✓ 75562      ✗ 0    
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

     checks.........................: 100.00% ✓ 173565     ✗ 0    
     data_received..................: 5.1 GB  42 MB/s
     data_sent......................: 70 MB   577 kB/s
     http_req_blocked...............: avg=4.48µs   min=1.08µs  med=3.03µs   max=3.58ms   p(90)=4.43µs   p(95)=4.97µs   p(99.9)=54.93µs 
     http_req_connecting............: avg=1.27µs   min=0s      med=0s       max=3.55ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=103.3ms  min=4.68ms  med=103ms    max=320.36ms p(90)=124.6ms  p(95)=130.91ms p(99.9)=162.46ms
       { expected_response:true }...: avg=103.3ms  min=4.68ms  med=103ms    max=320.36ms p(90)=124.6ms  p(95)=130.91ms p(99.9)=162.46ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 57955
     http_req_receiving.............: avg=80.83µs  min=28.36µs med=75.41µs  max=96.26ms  p(90)=106.44µs p(95)=119.73µs p(99.9)=521.64µs
     http_req_sending...............: avg=25.6µs   min=5.17µs  med=15.54µs  max=150.55ms p(90)=20.95µs  p(95)=22.8µs   p(99.9)=566.55µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=103.19ms min=4.58ms  med=102.9ms  max=312.28ms p(90)=124.49ms p(95)=130.81ms p(99.9)=161.98ms
     http_reqs......................: 57955   480.617707/s
     iteration_duration.............: avg=103.72ms min=24.03ms med=103.28ms max=329.17ms p(90)=124.87ms p(95)=131.16ms p(99.9)=163.62ms
     iterations.....................: 57855   479.788412/s
     success_rate...................: 100.00% ✓ 57855      ✗ 0    
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

     checks.........................: 100.00% ✓ 103437     ✗ 0    
     data_received..................: 3.0 GB  25 MB/s
     data_sent......................: 42 MB   343 kB/s
     http_req_blocked...............: avg=5.87µs   min=1.16µs  med=2.89µs   max=3.49ms   p(90)=4.11µs   p(95)=4.61µs   p(99.9)=1.63ms  
     http_req_connecting............: avg=2.76µs   min=0s      med=0s       max=3.46ms   p(90)=0s       p(95)=0s       p(99.9)=1.5ms   
     http_req_duration..............: avg=173.33ms min=7.46ms  med=174.19ms max=370.59ms p(90)=184.26ms p(95)=189.13ms p(99.9)=255.58ms
       { expected_response:true }...: avg=173.33ms min=7.46ms  med=174.19ms max=370.59ms p(90)=184.26ms p(95)=189.13ms p(99.9)=255.58ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 34579
     http_req_receiving.............: avg=91.8µs   min=29.27µs med=80.43µs  max=135.02ms p(90)=110.3µs  p(95)=121.46µs p(99.9)=541.38µs
     http_req_sending...............: avg=29.1µs   min=5.08µs  med=15.66µs  max=100.54ms p(90)=19.87µs  p(95)=21.52µs  p(99.9)=480.66µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=173.21ms min=7.35ms  med=174.07ms max=370.05ms p(90)=184.16ms p(95)=189.04ms p(99.9)=255.11ms
     http_reqs......................: 34579   285.975481/s
     iteration_duration.............: avg=174.1ms  min=18.77ms med=174.53ms max=382.31ms p(90)=184.54ms p(95)=189.41ms p(99.9)=257.69ms
     iterations.....................: 34479   285.14846/s
     success_rate...................: 100.00% ✓ 34479      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
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

     checks.........................: 100.00% ✓ 101595     ✗ 0    
     data_received..................: 3.0 GB  25 MB/s
     data_sent......................: 41 MB   338 kB/s
     http_req_blocked...............: avg=6.88µs   min=1.55µs  med=3.84µs   max=4.11ms   p(90)=5.39µs   p(95)=6.04µs   p(99.9)=1.37ms  
     http_req_connecting............: avg=2.74µs   min=0s      med=0s       max=4.07ms   p(90)=0s       p(95)=0s       p(99.9)=1.26ms  
     http_req_duration..............: avg=176.45ms min=5.49ms  med=163.74ms max=705.09ms p(90)=212.33ms p(95)=268.29ms p(99.9)=551.08ms
       { expected_response:true }...: avg=176.45ms min=5.49ms  med=163.74ms max=705.09ms p(90)=212.33ms p(95)=268.29ms p(99.9)=551.08ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 33965
     http_req_receiving.............: avg=93.21µs  min=37.25µs med=88.63µs  max=16.07ms  p(90)=119.4µs  p(95)=132.07µs p(99.9)=676.43µs
     http_req_sending...............: avg=25.33µs  min=6.1µs   med=18.16µs  max=138.21ms p(90)=22.91µs  p(95)=24.75µs  p(99.9)=547.08µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=176.33ms min=5.4ms   med=163.63ms max=705.01ms p(90)=212.23ms p(95)=268.15ms p(99.9)=551ms   
     http_reqs......................: 33965   281.219551/s
     iteration_duration.............: avg=177.25ms min=23.57ms med=164.13ms max=705.3ms  p(90)=212.75ms p(95)=269.2ms  p(99.9)=551.35ms
     iterations.....................: 33865   280.391582/s
     success_rate...................: 100.00% ✓ 33865      ✗ 0    
     vus............................: 50      min=50       max=50 
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
data_received..................: 5.9 MB 99 kB/s
     data_sent......................: 76 kB  1.3 kB/s
     http_req_blocked...............: avg=6.42µs   min=2.63µs  med=3.41µs  max=174µs    p(90)=5.06µs   p(95)=5.81µs   p(99.9)=163.87µs
     http_req_connecting............: avg=1.48µs   min=0s      med=0s      max=91.99µs  p(90)=0s       p(95)=0s       p(99.9)=86.37µs 
     http_req_duration..............: avg=515.78ms min=21.97ms med=31.01ms max=30.02s   p(90)=39.11ms  p(95)=42.42ms  p(99.9)=28.19s  
       { expected_response:true }...: avg=515.78ms min=21.97ms med=31.01ms max=30.02s   p(90)=39.11ms  p(95)=42.42ms  p(99.9)=28.19s  
     http_req_failed................: 0.00%  ✓ 0        ✗ 62  
     http_req_receiving.............: avg=124.43µs min=67.81µs med=93.67µs max=792.94µs p(90)=158.65µs p(95)=189.85µs p(99.9)=766.63µs
     http_req_sending...............: avg=20.33µs  min=15.03µs med=17.92µs max=96.67µs  p(90)=21.07µs  p(95)=28.7µs   p(99.9)=93.63µs 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=515.63ms min=21.83ms med=30.89ms max=30.02s   p(90)=39ms     p(95)=42.29ms  p(99.9)=28.19s  
     http_reqs......................: 62     1.033323/s
     vus............................: 0      min=0      max=0 
     vus_max........................: 50     min=50     max=50
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

     checks.........................: 100.00% ✓ 922431      ✗ 0     
     data_received..................: 27 GB   224 MB/s
     data_sent......................: 370 MB  3.1 MB/s
     http_req_blocked...............: avg=2.95µs  min=931ns   med=2.24µs  max=17.32ms  p(90)=3.87µs  p(95)=4.66µs   p(99.9)=34.55µs
     http_req_connecting............: avg=270ns   min=0s      med=0s      max=3.37ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=19.29ms min=1.65ms  med=19.05ms max=289.34ms p(90)=26.61ms p(95)=29.02ms  p(99.9)=48.79ms
       { expected_response:true }...: avg=19.29ms min=1.65ms  med=19.05ms max=289.34ms p(90)=26.61ms p(95)=29.02ms  p(99.9)=48.79ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 307577
     http_req_receiving.............: avg=88.29µs min=24.89µs med=48.79µs max=116.85ms p(90)=90.1µs  p(95)=126.87µs p(99.9)=6.57ms 
     http_req_sending...............: avg=43.08µs min=4.8µs   med=9.49µs  max=227.94ms p(90)=17.48µs p(95)=71.27µs  p(99.9)=3.63ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=19.15ms min=1.55ms  med=18.94ms max=288.67ms p(90)=26.46ms p(95)=28.81ms  p(99.9)=47.39ms
     http_reqs......................: 307577  2558.531841/s
     iteration_duration.............: avg=19.5ms  min=3.46ms  med=19.25ms max=308.16ms p(90)=26.82ms p(95)=29.24ms  p(99.9)=49.29ms
     iterations.....................: 307477  2557.700006/s
     success_rate...................: 100.00% ✓ 307477      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (.net subgraphs) (16.6.0-p.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 908631      ✗ 0     
     data_received..................: 27 GB   221 MB/s
     data_sent......................: 364 MB  3.0 MB/s
     http_req_blocked...............: avg=3.98µs   min=1.07µs  med=2.74µs   max=16.24ms  p(90)=4.39µs  p(95)=5.17µs   p(99.9)=35.37µs
     http_req_connecting............: avg=708ns    min=0s      med=0s       max=7.52ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=19.57ms  min=1.53ms  med=18.68ms  max=280.98ms p(90)=28.21ms p(95)=31.91ms  p(99.9)=53.38ms
       { expected_response:true }...: avg=19.57ms  min=1.53ms  med=18.68ms  max=280.98ms p(90)=28.21ms p(95)=31.91ms  p(99.9)=53.38ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 302977
     http_req_receiving.............: avg=757.78µs min=50.76µs med=112.48µs max=114.87ms p(90)=1.98ms  p(95)=3.02ms   p(99.9)=20.63ms
     http_req_sending...............: avg=48.39µs  min=4.88µs  med=9.85µs   max=151.64ms p(90)=19.44µs p(95)=100.12µs p(99.9)=4.47ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=18.76ms  min=1.41ms  med=17.86ms  max=277.91ms p(90)=27.28ms p(95)=30.87ms  p(99.9)=51.64ms
     http_reqs......................: 302977  2520.510953/s
     iteration_duration.............: avg=19.79ms  min=2.54ms  med=18.89ms  max=296.68ms p(90)=28.44ms p(95)=32.15ms  p(99.9)=54.01ms
     iterations.....................: 302877  2519.679038/s
     success_rate...................: 100.00% ✓ 302877      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.6.0-p.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 889047      ✗ 0     
     data_received..................: 26 GB   216 MB/s
     data_sent......................: 356 MB  3.0 MB/s
     http_req_blocked...............: avg=2.91µs   min=881ns   med=2.09µs  max=16.59ms  p(90)=3.87µs  p(95)=4.59µs  p(99.9)=31.7µs  
     http_req_connecting............: avg=285ns    min=0s      med=0s      max=3.49ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=20.02ms  min=1.6ms   med=16.76ms max=452.23ms p(90)=32.7ms  p(95)=40.05ms p(99.9)=149.96ms
       { expected_response:true }...: avg=20.02ms  min=1.6ms   med=16.76ms max=452.23ms p(90)=32.7ms  p(95)=40.05ms p(99.9)=149.96ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 296449
     http_req_receiving.............: avg=567.86µs min=49.75µs med=92.93µs max=193.06ms p(90)=1.08ms  p(95)=1.88ms  p(99.9)=27.43ms 
     http_req_sending...............: avg=44.13µs  min=4.19µs  med=8.69µs  max=156.28ms p(90)=18.23µs p(95)=76.85µs p(99.9)=3.77ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=19.41ms  min=1.51ms  med=16.24ms max=451.89ms p(90)=31.71ms p(95)=38.89ms p(99.9)=147.58ms
     http_reqs......................: 296449  2466.175457/s
     iteration_duration.............: avg=20.23ms  min=2.44ms  med=16.96ms max=452.44ms p(90)=32.93ms p(95)=40.28ms p(99.9)=151.17ms
     iterations.....................: 296349  2465.343551/s
     success_rate...................: 100.00% ✓ 296349      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (.net subgraphs) (16.5.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 876834      ✗ 0     
     data_received..................: 26 GB   213 MB/s
     data_sent......................: 351 MB  2.9 MB/s
     http_req_blocked...............: avg=3.48µs   min=1.03µs  med=2.64µs  max=12.81ms  p(90)=4.16µs  p(95)=4.86µs  p(99.9)=38.2µs  
     http_req_connecting............: avg=325ns    min=0s      med=0s      max=3.94ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=20.29ms  min=1.62ms  med=17.18ms max=339.3ms  p(90)=33.2ms  p(95)=40.46ms p(99.9)=138.81ms
       { expected_response:true }...: avg=20.29ms  min=1.62ms  med=17.18ms max=339.3ms  p(90)=33.2ms  p(95)=40.46ms p(99.9)=138.81ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 292378
     http_req_receiving.............: avg=579.88µs min=51.77µs med=97.16µs max=235.74ms p(90)=1.1ms   p(95)=1.93ms  p(99.9)=27.44ms 
     http_req_sending...............: avg=44.05µs  min=4.71µs  med=10.02µs max=72.24ms  p(90)=17.96µs p(95)=92.17µs p(99.9)=3.56ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=19.67ms  min=1.52ms  med=16.65ms max=318.18ms p(90)=32.2ms  p(95)=39.35ms p(99.9)=137.58ms
     http_reqs......................: 292378  2432.158419/s
     iteration_duration.............: avg=20.51ms  min=2.58ms  med=17.38ms max=347.31ms p(90)=33.42ms p(95)=40.69ms p(99.9)=139.53ms
     iterations.....................: 292278  2431.326565/s
     success_rate...................: 100.00% ✓ 292278      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (.net subgraphs) (16.6.0-p.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 791703      ✗ 0     
     data_received..................: 23 GB   192 MB/s
     data_sent......................: 317 MB  2.6 MB/s
     http_req_blocked...............: avg=3.01µs   min=892ns  med=2.14µs   max=14.95ms  p(90)=3.82µs  p(95)=4.56µs  p(99.9)=33.59µs 
     http_req_connecting............: avg=325ns    min=0s     med=0s       max=3.4ms    p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=22.5ms   min=1.96ms med=18.73ms  max=405.88ms p(90)=36.35ms p(95)=45.06ms p(99.9)=171.07ms
       { expected_response:true }...: avg=22.5ms   min=1.96ms med=18.73ms  max=405.88ms p(90)=36.35ms p(95)=45.06ms p(99.9)=171.07ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 264001
     http_req_receiving.............: avg=612.35µs min=51.3µs med=102.93µs max=177.23ms p(90)=1.15ms  p(95)=1.94ms  p(99.9)=28.02ms 
     http_req_sending...............: avg=37.98µs  min=4.68µs med=9.26µs   max=125.42ms p(90)=18.94µs p(95)=57.28µs p(99.9)=2.23ms  
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=21.85ms  min=1.85ms med=18.18ms  max=405.72ms p(90)=35.29ms p(95)=43.83ms p(99.9)=168.75ms
     http_reqs......................: 264001  2195.501456/s
     iteration_duration.............: avg=22.72ms  min=3.08ms med=18.94ms  max=406.14ms p(90)=36.56ms p(95)=45.29ms p(99.9)=172.75ms
     iterations.....................: 263901  2194.66983/s
     success_rate...................: 100.00% ✓ 263901      ✗ 0     
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

     checks.........................: 100.00% ✓ 609327      ✗ 0     
     data_received..................: 18 GB   148 MB/s
     data_sent......................: 244 MB  2.0 MB/s
     http_req_blocked...............: avg=4.15µs  min=852ns   med=2.21µs  max=8.82ms   p(90)=4.52µs   p(95)=5.68µs   p(99.9)=41.92µs
     http_req_connecting............: avg=1.24µs  min=0s      med=0s      max=8.79ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=29.28ms min=2.2ms   med=28.82ms max=298.48ms p(90)=38.76ms  p(95)=42.05ms  p(99.9)=64.32ms
       { expected_response:true }...: avg=29.28ms min=2.2ms   med=28.82ms max=298.48ms p(90)=38.76ms  p(95)=42.05ms  p(99.9)=64.32ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 203209
     http_req_receiving.............: avg=94.31µs min=25.48µs med=53.54µs max=106.32ms p(90)=125.12µs p(95)=210.2µs  p(99.9)=4.19ms 
     http_req_sending...............: avg=40.2µs  min=4.67µs  med=9.29µs  max=188.36ms p(90)=23.87µs  p(95)=108.99µs p(99.9)=2.37ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=29.15ms min=2.12ms  med=28.7ms  max=297.41ms p(90)=38.61ms  p(95)=41.87ms  p(99.9)=63.42ms
     http_reqs......................: 203209  1689.544689/s
     iteration_duration.............: avg=29.53ms min=6.41ms  med=29.04ms max=320.3ms  p(90)=38.98ms  p(95)=42.26ms  p(99.9)=64.89ms
     iterations.....................: 203109  1688.713257/s
     success_rate...................: 100.00% ✓ 203109      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
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

     checks.........................: 100.00% ✓ 427104      ✗ 0     
     data_received..................: 13 GB   104 MB/s
     data_sent......................: 171 MB  1.4 MB/s
     http_req_blocked...............: avg=3.19µs  min=992ns   med=2.21µs  max=4.09ms   p(90)=3.75µs  p(95)=4.42µs   p(99.9)=34.21µs 
     http_req_connecting............: avg=641ns   min=0s      med=0s      max=4.04ms   p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=41.9ms  min=2.15ms  med=41.47ms max=317.03ms p(90)=58.31ms p(95)=63.48ms  p(99.9)=87.47ms 
       { expected_response:true }...: avg=41.9ms  min=2.15ms  med=41.47ms max=317.03ms p(90)=58.31ms p(95)=63.48ms  p(99.9)=87.47ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 142468
     http_req_receiving.............: avg=74.18µs min=26.22µs med=60.91µs max=55.52ms  p(90)=99.43µs p(95)=116.27µs p(99.9)=807.47µs
     http_req_sending...............: avg=25.15µs min=4.5µs   med=10.52µs max=160.23ms p(90)=17.04µs p(95)=20.69µs  p(99.9)=961.86µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=41.8ms  min=2.02ms  med=41.38ms max=316.9ms  p(90)=58.21ms p(95)=63.37ms  p(99.9)=87.14ms 
     http_reqs......................: 142468  1184.397248/s
     iteration_duration.............: avg=42.13ms min=4ms     med=41.68ms max=331.17ms p(90)=58.51ms p(95)=63.69ms  p(99.9)=87.75ms 
     iterations.....................: 142368  1183.565906/s
     success_rate...................: 100.00% ✓ 142368      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
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

     checks.........................: 100.00% ✓ 205251     ✗ 0    
     data_received..................: 6.0 GB  50 MB/s
     data_sent......................: 82 MB   683 kB/s
     http_req_blocked...............: avg=4.73µs  min=1.22µs  med=3.19µs  max=4.14ms   p(90)=4.68µs   p(95)=5.31µs   p(99.9)=45.14µs 
     http_req_connecting............: avg=1.28µs  min=0s      med=0s      max=4.1ms    p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=87.32ms min=4.07ms  med=85.5ms  max=322.25ms p(90)=107.88ms p(95)=118.87ms p(99.9)=207.21ms
       { expected_response:true }...: avg=87.32ms min=4.07ms  med=85.5ms  max=322.25ms p(90)=107.88ms p(95)=118.87ms p(99.9)=207.21ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 68517
     http_req_receiving.............: avg=83.15µs min=30.25µs med=75.33µs max=52.27ms  p(90)=111.31µs p(95)=124.61µs p(99.9)=645.11µs
     http_req_sending...............: avg=25.98µs min=5.48µs  med=14.64µs max=112.2ms  p(90)=21.04µs  p(95)=23.26µs  p(99.9)=635.73µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=87.21ms min=3.96ms  med=85.39ms max=321.43ms p(90)=107.77ms p(95)=118.71ms p(99.9)=207.11ms
     http_reqs......................: 68517   568.477747/s
     iteration_duration.............: avg=87.7ms  min=17.07ms med=85.75ms max=331.29ms p(90)=108.18ms p(95)=119.18ms p(99.9)=209.16ms
     iterations.....................: 68417   567.648058/s
     success_rate...................: 100.00% ✓ 68417      ✗ 0    
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

     checks.........................: 100.00% ✓ 163137     ✗ 0    
     data_received..................: 4.8 GB  40 MB/s
     data_sent......................: 65 MB   542 kB/s
     http_req_blocked...............: avg=4.8µs    min=1.17µs  med=3.05µs   max=3.33ms   p(90)=4.56µs   p(95)=5.12µs   p(99.9)=61.2µs  
     http_req_connecting............: avg=1.53µs   min=0s      med=0s       max=3.3ms    p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=109.88ms min=4.94ms  med=107.91ms max=319.99ms p(90)=144.96ms p(95)=155.93ms p(99.9)=199.91ms
       { expected_response:true }...: avg=109.88ms min=4.94ms  med=107.91ms max=319.99ms p(90)=144.96ms p(95)=155.93ms p(99.9)=199.91ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 54479
     http_req_receiving.............: avg=88.34µs  min=29.95µs med=82.92µs  max=115.52ms p(90)=114.61µs p(95)=127.63µs p(99.9)=583.35µs
     http_req_sending...............: avg=24.5µs   min=5.17µs  med=16.5µs   max=129.24ms p(90)=21.79µs  p(95)=23.7µs   p(99.9)=571.26µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=109.77ms min=4.86ms  med=107.8ms  max=319.42ms p(90)=144.86ms p(95)=155.82ms p(99.9)=199.63ms
     http_reqs......................: 54479   451.58007/s
     iteration_duration.............: avg=110.36ms min=20ms    med=108.22ms max=335.42ms p(90)=145.28ms p(95)=156.21ms p(99.9)=202.26ms
     iterations.....................: 54379   450.751163/s
     success_rate...................: 100.00% ✓ 54379      ✗ 0    
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

     checks.........................: 100.00% ✓ 95628      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 38 MB   317 kB/s
     http_req_blocked...............: avg=6.99µs   min=1.53µs  med=3.6µs    max=4.07ms   p(90)=5.01µs   p(95)=5.6µs    p(99.9)=1.52ms  
     http_req_connecting............: avg=3.09µs   min=0s      med=0s       max=4.03ms   p(90)=0s       p(95)=0s       p(99.9)=1.47ms  
     http_req_duration..............: avg=187.45ms min=7.92ms  med=194.35ms max=375.6ms  p(90)=212.41ms p(95)=218.89ms p(99.9)=287.99ms
       { expected_response:true }...: avg=187.45ms min=7.92ms  med=194.35ms max=375.6ms  p(90)=212.41ms p(95)=218.89ms p(99.9)=287.99ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 31976
     http_req_receiving.............: avg=98.16µs  min=35.59µs med=89.03µs  max=93.63ms  p(90)=119.05µs p(95)=130.42µs p(99.9)=523.09µs
     http_req_sending...............: avg=27.88µs  min=6.32µs  med=18.24µs  max=74.63ms  p(90)=22.97µs  p(95)=24.9µs   p(99.9)=504.34µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=187.33ms min=7.76ms  med=194.23ms max=375.37ms p(90)=212.29ms p(95)=218.78ms p(99.9)=287.77ms
     http_reqs......................: 31976   264.290873/s
     iteration_duration.............: avg=188.33ms min=32.81ms med=194.66ms max=395.51ms p(90)=212.72ms p(95)=219.2ms  p(99.9)=290.14ms
     iterations.....................: 31876   263.464344/s
     success_rate...................: 100.00% ✓ 31876      ✗ 0    
     vus............................: 1       min=1        max=50 
     vus_max........................: 50      min=50       max=50
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

     checks.........................: 100.00% ✓ 94563      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 38 MB   314 kB/s
     http_req_blocked...............: avg=7.1µs    min=1.42µs  med=3.7µs    max=3.45ms   p(90)=5.15µs   p(95)=5.76µs   p(99.9)=1.83ms  
     http_req_connecting............: avg=3.06µs   min=0s      med=0s       max=3.4ms    p(90)=0s       p(95)=0s       p(99.9)=1.8ms   
     http_req_duration..............: avg=189.58ms min=5.92ms  med=173.96ms max=673.9ms  p(90)=224.22ms p(95)=274.63ms p(99.9)=549.67ms
       { expected_response:true }...: avg=189.58ms min=5.92ms  med=173.96ms max=673.9ms  p(90)=224.22ms p(95)=274.63ms p(99.9)=549.67ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 31621
     http_req_receiving.............: avg=95.96µs  min=36.75µs med=91.53µs  max=9.57ms   p(90)=122.45µs p(95)=134.3µs  p(99.9)=634.23µs
     http_req_sending...............: avg=29.3µs   min=6.15µs  med=18.85µs  max=57.95ms  p(90)=23.46µs  p(95)=25.24µs  p(99.9)=517.22µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=189.45ms min=5.73ms  med=173.84ms max=673.78ms p(90)=224.11ms p(95)=274.52ms p(99.9)=549.58ms
     http_reqs......................: 31621   261.67398/s
     iteration_duration.............: avg=190.45ms min=55.18ms med=174.34ms max=674.18ms p(90)=224.63ms p(95)=275.99ms p(99.9)=549.9ms 
     iterations.....................: 31521   260.846448/s
     success_rate...................: 100.00% ✓ 31521      ✗ 0    
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

     checks.........................: 100.00% ✓ 9639      ✗ 0   
     data_received..................: 317 MB  2.5 MB/s
     data_sent......................: 4.0 MB  32 kB/s
     http_req_blocked...............: avg=60.27µs  min=1.22µs  med=3.51µs  max=8.31ms  p(90)=5.28µs   p(95)=6µs      p(99.9)=6.23ms
     http_req_connecting............: avg=51.38µs  min=0s      med=0s      max=6.21ms  p(90)=0s       p(95)=0s       p(99.9)=5.97ms
     http_req_duration..............: avg=1.82s    min=23.87ms med=1.84s   max=4.24s   p(90)=2.54s    p(95)=2.77s    p(99.9)=3.72s 
       { expected_response:true }...: avg=1.82s    min=23.87ms med=1.84s   max=4.24s   p(90)=2.54s    p(95)=2.77s    p(99.9)=3.72s 
     http_req_failed................: 0.00%   ✓ 0         ✗ 3313
     http_req_receiving.............: avg=115.79µs min=32.12µs med=99.85µs max=25.33ms p(90)=144.46µs p(95)=162.15µs p(99.9)=1.33ms
     http_req_sending...............: avg=100.7µs  min=5.87µs  med=20.08µs max=54.24ms p(90)=25.47µs  p(95)=28.62µs  p(99.9)=5.1ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=1.82s    min=23.76ms med=1.84s   max=4.24s   p(90)=2.54s    p(95)=2.77s    p(99.9)=3.72s 
     http_reqs......................: 3313    26.547025/s
     iteration_duration.............: avg=1.88s    min=63.91ms med=1.86s   max=4.24s   p(90)=2.55s    p(95)=2.78s    p(99.9)=3.73s 
     iterations.....................: 3213    25.745726/s
     success_rate...................: 100.00% ✓ 3213      ✗ 0   
     vus............................: 46      min=0       max=50
     vus_max........................: 50      min=50      max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

