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
| hive-router | v0.0.78 | 2,947 | 3,228 | 2,879 | 4.0% |  |
| fusion-nightly | 16.5.0-p.8 | 2,396 | 2,446 | 2,373 | 1.1% |  |
| fusion | 16.4.0 | 2,384 | 2,481 | 2,369 | 1.6% |  |
| fusion-nightly-net11 | 16.5.0-p.8 | 2,382 | 2,462 | 2,351 | 1.6% |  |
| grafbase | 0.53.5 | 2,147 | 2,282 | 2,132 | 2.5% |  |
| cosmo | 0.329.0 | 1,307 | 1,354 | 1,297 | 1.5% |  |
| hive-gateway-router-runtime | 2.10.2 | 612 | 628 | 608 | 1.0% |  |
| apollo-router | v2.16.0 | 490 | 508 | 487 | 1.4% |  |
| apollo-gateway | 2.14.2 | 279 | 284 | 279 | 0.8% |  |
| hive-gateway | 2.10.2 | 273 | 280 | 272 | 1.0% |  |
| feddi | 77271dc84a06 | — | — | — | — | non-compatible response (1180 across 9/9 runs) |
| fusion-nightly-fed | — | — | — | — | — | not run |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.78 | 2,555 | 2,727 | 2,514 | 2.9% |  |
| fusion-nightly-net11 | 16.5.0-p.8 | 2,330 | 2,419 | 2,322 | 1.4% |  |
| fusion | 16.4.0 | 2,265 | 2,361 | 2,254 | 1.7% |  |
| fusion-nightly | 16.5.0-p.8 | 2,235 | 2,331 | 2,222 | 1.7% |  |
| fusion-nightly-fed | 16.5.0-p.8 | 2,164 | 2,247 | 2,152 | 1.5% |  |
| grafbase | 0.53.5 | 1,649 | 1,709 | 1,637 | 1.4% |  |
| cosmo | 0.329.0 | 1,172 | 1,221 | 1,170 | 1.8% |  |
| hive-gateway-router-runtime | 2.10.2 | 566 | 589 | 565 | 1.4% |  |
| apollo-router | v2.16.0 | 436 | 460 | 431 | 2.1% |  |
| apollo-gateway | 2.14.2 | 263 | 268 | 262 | 0.8% |  |
| hive-gateway | 2.10.2 | 256 | 265 | 254 | 1.5% |  |
| feddi | 77271dc84a06 | 20 | 21 | 20 | 2.2% |  |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.78)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 1062489     ✗ 0     
     data_received..................: 31 GB   259 MB/s
     data_sent......................: 426 MB  3.5 MB/s
     http_req_blocked...............: avg=3.15µs  min=1.03µs  med=2.34µs  max=18.92ms  p(90)=3.69µs  p(95)=4.31µs   p(99.9)=36.4µs 
     http_req_connecting............: avg=261ns   min=0s      med=0s      max=3.32ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=16.72ms min=1.42ms  med=15.98ms max=293.16ms p(90)=24.84ms p(95)=28.16ms  p(99.9)=48.88ms
       { expected_response:true }...: avg=16.72ms min=1.42ms  med=15.98ms max=293.16ms p(90)=24.84ms p(95)=28.16ms  p(99.9)=48.88ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 354263
     http_req_receiving.............: avg=94.52µs min=26.97µs med=47.59µs max=86.2ms   p(90)=85.42µs p(95)=155.38µs p(99.9)=8.73ms 
     http_req_sending...............: avg=45.48µs min=4.64µs  med=8.86µs  max=57.56ms  p(90)=15.14µs p(95)=95.32µs  p(99.9)=4.25ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=16.58ms min=1.35ms  med=15.86ms max=281.57ms p(90)=24.65ms p(95)=27.9ms   p(99.9)=47.89ms
     http_reqs......................: 354263  2947.692803/s
     iteration_duration.............: avg=16.93ms min=1.82ms  med=16.17ms max=304.41ms p(90)=25.05ms p(95)=28.39ms  p(99.9)=49.5ms 
     iterations.....................: 354163  2946.86074/s
     success_rate...................: 100.00% ✓ 354163      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (rust subgraphs) (16.5.0-p.8)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 864435      ✗ 0     
     data_received..................: 25 GB   210 MB/s
     data_sent......................: 346 MB  2.9 MB/s
     http_req_blocked...............: avg=3.09µs   min=992ns   med=2.34µs  max=18.58ms  p(90)=3.55µs  p(95)=4.1µs   p(99.9)=34.86µs 
     http_req_connecting............: avg=269ns    min=0s      med=0s      max=3.39ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=20.6ms   min=2.06ms  med=17.5ms  max=310.67ms p(90)=33.54ms p(95)=40.96ms p(99.9)=141.05ms
       { expected_response:true }...: avg=20.6ms   min=2.06ms  med=17.5ms  max=310.67ms p(90)=33.54ms p(95)=40.96ms p(99.9)=141.05ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 288245
     http_req_receiving.............: avg=615.85µs min=51.48µs med=96.85µs max=196.91ms p(90)=1.11ms  p(95)=1.98ms  p(99.9)=27.68ms 
     http_req_sending...............: avg=38.24µs  min=4.79µs  med=8.93µs  max=89.25ms  p(90)=14.86µs p(95)=75.14µs p(99.9)=2.67ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=19.95ms  min=1.92ms  med=16.95ms max=310.59ms p(90)=32.54ms p(95)=39.73ms p(99.9)=139.82ms
     http_reqs......................: 288245  2396.807146/s
     iteration_duration.............: avg=20.81ms  min=3.11ms  med=17.7ms  max=329.16ms p(90)=33.77ms p(95)=41.19ms p(99.9)=142.22ms
     iterations.....................: 288145  2395.975628/s
     success_rate...................: 100.00% ✓ 288145      ✗ 0     
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

     checks.........................: 100.00% ✓ 859932      ✗ 0     
     data_received..................: 25 GB   209 MB/s
     data_sent......................: 345 MB  2.9 MB/s
     http_req_blocked...............: avg=2.96µs   min=932ns   med=2.28µs  max=5.37ms   p(90)=3.55µs  p(95)=4.14µs  p(99.9)=33.99µs 
     http_req_connecting............: avg=316ns    min=0s      med=0s      max=4.02ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=20.71ms  min=2.18ms  med=17.6ms  max=387.02ms p(90)=33.71ms p(95)=41.03ms p(99.9)=142.16ms
       { expected_response:true }...: avg=20.71ms  min=2.18ms  med=17.6ms  max=387.02ms p(90)=33.71ms p(95)=41.03ms p(99.9)=142.16ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 286744
     http_req_receiving.............: avg=621.06µs min=51.79µs med=96.29µs max=195.54ms p(90)=1.12ms  p(95)=1.99ms  p(99.9)=27.65ms 
     http_req_sending...............: avg=39.26µs  min=4.62µs  med=8.82µs  max=126.34ms p(90)=15.04µs p(95)=78.43µs p(99.9)=2.76ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=20.05ms  min=2.07ms  med=17.05ms max=386.55ms p(90)=32.66ms p(95)=39.79ms p(99.9)=139.29ms
     http_reqs......................: 286744  2384.121518/s
     iteration_duration.............: avg=20.92ms  min=3.04ms  med=17.8ms  max=387.2ms  p(90)=33.94ms p(95)=41.28ms p(99.9)=143.28ms
     iterations.....................: 286644  2383.290072/s
     success_rate...................: 100.00% ✓ 286644      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (rust subgraphs) (16.5.0-p.8)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 859026      ✗ 0     
     data_received..................: 25 GB   209 MB/s
     data_sent......................: 344 MB  2.9 MB/s
     http_req_blocked...............: avg=2.55µs   min=821ns  med=1.85µs   max=11.39ms  p(90)=3.09µs  p(95)=3.68µs  p(99.9)=28.07µs
     http_req_connecting............: avg=303ns    min=0s     med=0s       max=3.96ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=20.74ms  min=2ms    med=19.87ms  max=284.97ms p(90)=29.99ms p(95)=33.65ms p(99.9)=54.78ms
       { expected_response:true }...: avg=20.74ms  min=2ms    med=19.87ms  max=284.97ms p(90)=29.99ms p(95)=33.65ms p(99.9)=54.78ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 286442
     http_req_receiving.............: avg=751.21µs min=48.7µs med=166.42µs max=171.88ms p(90)=1.79ms  p(95)=2.6ms   p(99.9)=18.44ms
     http_req_sending...............: avg=36.87µs  min=4.47µs med=7.87µs   max=172.01ms p(90)=15µs    p(95)=58.99µs p(99.9)=2.9ms  
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=19.95ms  min=1.88ms med=19.07ms  max=271.1ms  p(90)=29.07ms p(95)=32.69ms p(99.9)=52.78ms
     http_reqs......................: 286442  2382.063296/s
     iteration_duration.............: avg=20.94ms  min=3.7ms  med=20.06ms  max=308.56ms p(90)=30.19ms p(95)=33.86ms p(99.9)=55.17ms
     iterations.....................: 286342  2381.231692/s
     success_rate...................: 100.00% ✓ 286342      ✗ 0     
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

     checks.........................: 100.00% ✓ 774351      ✗ 0     
     data_received..................: 23 GB   189 MB/s
     data_sent......................: 310 MB  2.6 MB/s
     http_req_blocked...............: avg=4.05µs  min=1.01µs  med=2.72µs  max=120.98ms p(90)=4.34µs  p(95)=5.13µs  p(99.9)=38.82µs
     http_req_connecting............: avg=387ns   min=0s      med=0s      max=3.96ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=23.01ms min=1.68ms  med=22.77ms max=295.13ms p(90)=27.42ms p(95)=29.31ms p(99.9)=49.49ms
       { expected_response:true }...: avg=23.01ms min=1.68ms  med=22.77ms max=295.13ms p(90)=27.42ms p(95)=29.31ms p(99.9)=49.49ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 258217
     http_req_receiving.............: avg=92.31µs min=28.49µs med=57.57µs max=120.81ms p(90)=97.71µs p(95)=129µs   p(99.9)=6.06ms 
     http_req_sending...............: avg=40.99µs min=4.93µs  med=10.89µs max=144.74ms p(90)=17.71µs p(95)=34.38µs p(99.9)=2.27ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=22.88ms min=1.6ms   med=22.67ms max=294.87ms p(90)=27.28ms p(95)=29.13ms p(99.9)=48.38ms
     http_reqs......................: 258217  2147.893585/s
     iteration_duration.............: avg=23.23ms min=3.62ms  med=22.97ms max=308.45ms p(90)=27.63ms p(95)=29.53ms p(99.9)=50.13ms
     iterations.....................: 258117  2147.061768/s
     success_rate...................: 100.00% ✓ 258117      ✗ 0     
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

     checks.........................: 100.00% ✓ 471561      ✗ 0     
     data_received..................: 14 GB   115 MB/s
     data_sent......................: 189 MB  1.6 MB/s
     http_req_blocked...............: avg=3.41µs  min=1.02µs  med=2.53µs  max=3.58ms   p(90)=4.06µs  p(95)=4.73µs   p(99.9)=30.05µs
     http_req_connecting............: avg=570ns   min=0s      med=0s      max=3.54ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=37.93ms min=2.04ms  med=37.55ms max=294.53ms p(90)=52.95ms p(95)=57.68ms  p(99.9)=81.06ms
       { expected_response:true }...: avg=37.93ms min=2.04ms  med=37.55ms max=294.53ms p(90)=52.95ms p(95)=57.68ms  p(99.9)=81.06ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 157287
     http_req_receiving.............: avg=77.15µs min=25.97µs med=62.39µs max=154.18ms p(90)=98.77µs p(95)=115.09µs p(99.9)=935µs  
     http_req_sending...............: avg=25.47µs min=4.74µs  med=10.85µs max=88.28ms  p(90)=17.31µs p(95)=21.52µs  p(99.9)=1ms    
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=37.82ms min=1.92ms  med=37.45ms max=294ms    p(90)=52.85ms p(95)=57.56ms  p(99.9)=80.92ms
     http_reqs......................: 157287  1307.759328/s
     iteration_duration.............: avg=38.16ms min=4.01ms  med=37.76ms max=319.63ms p(90)=53.15ms p(95)=57.89ms  p(99.9)=81.36ms
     iterations.....................: 157187  1306.92788/s
     success_rate...................: 100.00% ✓ 157187      ✗ 0     
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

     checks.........................: 100.00% ✓ 220944     ✗ 0    
     data_received..................: 6.5 GB  54 MB/s
     data_sent......................: 89 MB   735 kB/s
     http_req_blocked...............: avg=4.15µs  min=1.01µs  med=2.69µs  max=3.81ms   p(90)=4.21µs   p(95)=4.86µs   p(99.9)=43.28µs 
     http_req_connecting............: avg=1.19µs  min=0s      med=0s      max=3.77ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=81.14ms min=3.6ms   med=79.26ms max=311.92ms p(90)=99.82ms  p(95)=109.53ms p(99.9)=190.44ms
       { expected_response:true }...: avg=81.14ms min=3.6ms   med=79.26ms max=311.92ms p(90)=99.82ms  p(95)=109.53ms p(99.9)=190.44ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 73748
     http_req_receiving.............: avg=78.06µs min=27.74µs med=66.85µs max=91.24ms  p(90)=104.07µs p(95)=118.02µs p(99.9)=596.7µs 
     http_req_sending...............: avg=23.09µs min=5.15µs  med=12.88µs max=136.51ms p(90)=20.18µs  p(95)=22.53µs  p(99.9)=615.42µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=81.04ms min=3.54ms  med=79.17ms max=303.97ms p(90)=99.7ms   p(95)=109.42ms p(99.9)=190.23ms
     http_reqs......................: 73748   612.104637/s
     iteration_duration.............: avg=81.48ms min=25.6ms  med=79.5ms  max=327.93ms p(90)=100.06ms p(95)=109.79ms p(99.9)=192.45ms
     iterations.....................: 73648   611.274643/s
     success_rate...................: 100.00% ✓ 73648      ✗ 0    
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

     checks.........................: 100.00% ✓ 176976     ✗ 0    
     data_received..................: 5.2 GB  43 MB/s
     data_sent......................: 71 MB   589 kB/s
     http_req_blocked...............: avg=7.23µs   min=1.05µs  med=2.85µs   max=9.48ms   p(90)=4.17µs   p(95)=4.69µs   p(99.9)=56.02µs 
     http_req_connecting............: avg=3.99µs   min=0s      med=0s       max=7.65ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=101.3ms  min=4.7ms   med=101.03ms max=306.58ms p(90)=122.07ms p(95)=128.42ms p(99.9)=157.14ms
       { expected_response:true }...: avg=101.3ms  min=4.7ms   med=101.03ms max=306.58ms p(90)=122.07ms p(95)=128.42ms p(99.9)=157.14ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 59092
     http_req_receiving.............: avg=79.47µs  min=28.2µs  med=75.49µs  max=30.17ms  p(90)=105.82µs p(95)=118.85µs p(99.9)=557.88µs
     http_req_sending...............: avg=28.51µs  min=5.08µs  med=15.44µs  max=103.73ms p(90)=20.83µs  p(95)=22.62µs  p(99.9)=868.71µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=101.19ms min=4.57ms  med=100.92ms max=305.79ms p(90)=121.96ms p(95)=128.3ms  p(99.9)=156.76ms
     http_reqs......................: 59092   490.061671/s
     iteration_duration.............: avg=101.73ms min=31.66ms med=101.31ms max=317.3ms  p(90)=122.34ms p(95)=128.68ms p(99.9)=158.11ms
     iterations.....................: 58992   489.232351/s
     success_rate...................: 100.00% ✓ 58992      ✗ 0    
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

     checks.........................: 100.00% ✓ 101070     ✗ 0    
     data_received..................: 3.0 GB  25 MB/s
     data_sent......................: 41 MB   336 kB/s
     http_req_blocked...............: avg=5.63µs   min=1.13µs  med=2.92µs   max=3.56ms   p(90)=4.13µs   p(95)=4.63µs   p(99.9)=1.14ms  
     http_req_connecting............: avg=2.53µs   min=0s      med=0s       max=3.52ms   p(90)=0s       p(95)=0s       p(99.9)=1.12ms  
     http_req_duration..............: avg=177.37ms min=7.31ms  med=169.95ms max=392.24ms p(90)=203.76ms p(95)=210.1ms  p(99.9)=275.43ms
       { expected_response:true }...: avg=177.37ms min=7.31ms  med=169.95ms max=392.24ms p(90)=203.76ms p(95)=210.1ms  p(99.9)=275.43ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 33790
     http_req_receiving.............: avg=89.09µs  min=33.01µs med=82.88µs  max=89ms     p(90)=112.37µs p(95)=123µs    p(99.9)=571.49µs
     http_req_sending...............: avg=26.11µs  min=5.31µs  med=15.59µs  max=74.3ms   p(90)=19.95µs  p(95)=21.65µs  p(99.9)=540.71µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=177.26ms min=7.22ms  med=169.85ms max=391.75ms p(90)=203.65ms p(95)=209.98ms p(99.9)=275.35ms
     http_reqs......................: 33790   279.524246/s
     iteration_duration.............: avg=178.16ms min=26.66ms med=170.23ms max=402.26ms p(90)=204.03ms p(95)=210.41ms p(99.9)=279.33ms
     iterations.....................: 33690   278.697006/s
     success_rate...................: 100.00% ✓ 33690      ✗ 0    
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

     checks.........................: 100.00% ✓ 99072      ✗ 0    
     data_received..................: 2.9 GB  24 MB/s
     data_sent......................: 40 MB   329 kB/s
     http_req_blocked...............: avg=6.66µs   min=1.07µs  med=2.98µs   max=4.32ms   p(90)=4.33µs   p(95)=4.88µs   p(99.9)=1.94ms  
     http_req_connecting............: avg=3.45µs   min=0s      med=0s       max=4.27ms   p(90)=0s       p(95)=0s       p(99.9)=1.9ms   
     http_req_duration..............: avg=181ms    min=5.84ms  med=166.63ms max=595.6ms  p(90)=208.44ms p(95)=254.97ms p(99.9)=540.82ms
       { expected_response:true }...: avg=181ms    min=5.84ms  med=166.63ms max=595.6ms  p(90)=208.44ms p(95)=254.97ms p(99.9)=540.82ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 33124
     http_req_receiving.............: avg=86.45µs  min=31.02µs med=83.21µs  max=11ms     p(90)=111.99µs p(95)=123.11µs p(99.9)=548.15µs
     http_req_sending...............: avg=21.59µs  min=5.4µs   med=16.55µs  max=40.13ms  p(90)=20.84µs  p(95)=22.49µs  p(99.9)=406.52µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=180.89ms min=5.72ms  med=166.53ms max=595.53ms p(90)=208.33ms p(95)=254.83ms p(99.9)=540.73ms
     http_reqs......................: 33124   273.921618/s
     iteration_duration.............: avg=181.78ms min=31.92ms med=166.94ms max=595.79ms p(90)=208.72ms p(95)=255.51ms p(99.9)=541.26ms
     iterations.....................: 33024   273.09466/s
     success_rate...................: 100.00% ✓ 33024      ✗ 0    
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

     checks.........................: 100.00% ✓ 921273      ✗ 0     
     data_received..................: 27 GB   223 MB/s
     data_sent......................: 369 MB  3.1 MB/s
     http_req_blocked...............: avg=3.37µs  min=862ns   med=2.48µs  max=13.68ms  p(90)=4.21µs  p(95)=5.01µs   p(99.9)=38.62µs
     http_req_connecting............: avg=305ns   min=0s      med=0s      max=4.06ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=19.31ms min=1.72ms  med=19.05ms max=302.9ms  p(90)=26.59ms p(95)=28.96ms  p(99.9)=48.31ms
       { expected_response:true }...: avg=19.31ms min=1.72ms  med=19.05ms max=302.9ms  p(90)=26.59ms p(95)=28.96ms  p(99.9)=48.31ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 307191
     http_req_receiving.............: avg=93.18µs min=25.16µs med=51.66µs max=122.1ms  p(90)=95.45µs p(95)=152.06µs p(99.9)=7.07ms 
     http_req_sending...............: avg=43.45µs min=4.69µs  med=10.31µs max=168.31ms p(90)=19.28µs p(95)=100.18µs p(99.9)=2.88ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=19.17ms min=1.67ms  med=18.93ms max=284.8ms  p(90)=26.44ms p(95)=28.76ms  p(99.9)=47.45ms
     http_reqs......................: 307191  2555.028802/s
     iteration_duration.............: avg=19.52ms min=2.93ms  med=19.25ms max=316.99ms p(90)=26.8ms  p(95)=29.19ms  p(99.9)=48.95ms
     iterations.....................: 307091  2554.197062/s
     success_rate...................: 100.00% ✓ 307091      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (.net subgraphs) (16.5.0-p.8)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 840222      ✗ 0     
     data_received..................: 25 GB   204 MB/s
     data_sent......................: 337 MB  2.8 MB/s
     http_req_blocked...............: avg=3.03µs  min=852ns   med=2.05µs   max=15.22ms  p(90)=3.88µs  p(95)=4.66µs  p(99.9)=31.48µs
     http_req_connecting............: avg=331ns   min=0s      med=0s       max=3.57ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=21.19ms min=1.6ms   med=20.35ms  max=299.67ms p(90)=30.47ms p(95)=34.06ms p(99.9)=54.59ms
       { expected_response:true }...: avg=21.19ms min=1.6ms   med=20.35ms  max=299.67ms p(90)=30.47ms p(95)=34.06ms p(99.9)=54.59ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 280174
     http_req_receiving.............: avg=807.3µs min=49.89µs med=141.77µs max=105.75ms p(90)=2.01ms  p(95)=2.92ms  p(99.9)=20.88ms
     http_req_sending...............: avg=38.94µs min=4.5µs   med=8.62µs   max=131.64ms p(90)=18.93µs p(95)=74.59µs p(99.9)=2.98ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=20.34ms min=1.52ms  med=19.5ms   max=280.54ms p(90)=29.49ms p(95)=32.97ms p(99.9)=52.79ms
     http_reqs......................: 280174  2330.754761/s
     iteration_duration.............: avg=21.41ms min=3.05ms  med=20.56ms  max=308.59ms p(90)=30.68ms p(95)=34.29ms p(99.9)=55.06ms
     iterations.....................: 280074  2329.922865/s
     success_rate...................: 100.00% ✓ 280074      ✗ 0     
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

     checks.........................: 100.00% ✓ 816615      ✗ 0     
     data_received..................: 24 GB   199 MB/s
     data_sent......................: 327 MB  2.7 MB/s
     http_req_blocked...............: avg=3.72µs   min=992ns   med=2.78µs   max=17.17ms  p(90)=4.42µs  p(95)=5.18µs  p(99.9)=40.31µs 
     http_req_connecting............: avg=326ns    min=0s      med=0s       max=3.56ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=21.79ms  min=1.73ms  med=18.09ms  max=375.45ms p(90)=35.91ms p(95)=44.17ms p(99.9)=161.8ms 
       { expected_response:true }...: avg=21.79ms  min=1.73ms  med=18.09ms  max=375.45ms p(90)=35.91ms p(95)=44.17ms p(99.9)=161.8ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 272305
     http_req_receiving.............: avg=644.24µs min=52.23µs med=101.47µs max=229.54ms p(90)=1.16ms  p(95)=2.04ms  p(99.9)=31.81ms 
     http_req_sending...............: avg=43.99µs  min=5.01µs  med=10.81µs  max=106.05ms p(90)=20.26µs p(95)=90.89µs p(99.9)=3.29ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=21.11ms  min=1.63ms  med=17.53ms  max=375.29ms p(90)=34.79ms p(95)=42.82ms p(99.9)=158.26ms
     http_reqs......................: 272305  2265.091897/s
     iteration_duration.............: avg=22.03ms  min=2.78ms  med=18.3ms   max=375.74ms p(90)=36.16ms p(95)=44.42ms p(99.9)=164.33ms
     iterations.....................: 272205  2264.260075/s
     success_rate...................: 100.00% ✓ 272205      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.5.0-p.8)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 806013      ✗ 0     
     data_received..................: 24 GB   196 MB/s
     data_sent......................: 323 MB  2.7 MB/s
     http_req_blocked...............: avg=2.86µs   min=872ns   med=2.09µs   max=15.55ms  p(90)=3.54µs  p(95)=4.19µs  p(99.9)=31.44µs 
     http_req_connecting............: avg=310ns    min=0s      med=0s       max=3.37ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=22.11ms  min=1.64ms  med=18.07ms  max=441.82ms p(90)=36.35ms p(95)=45.11ms p(99.9)=182.13ms
       { expected_response:true }...: avg=22.11ms  min=1.64ms  med=18.07ms  max=441.82ms p(90)=36.35ms p(95)=45.11ms p(99.9)=182.13ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 268771
     http_req_receiving.............: avg=657.78µs min=50.82µs med=101.56µs max=218.63ms p(90)=1.19ms  p(95)=2.02ms  p(99.9)=30.94ms 
     http_req_sending...............: avg=38µs     min=4.6µs   med=8.89µs   max=118.16ms p(90)=16.95µs p(95)=35.92µs p(99.9)=2.33ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=21.41ms  min=1.56ms  med=17.48ms  max=441.32ms p(90)=35.21ms p(95)=43.83ms p(99.9)=179.79ms
     http_reqs......................: 268771  2235.711462/s
     iteration_duration.............: avg=22.32ms  min=2.67ms  med=18.27ms  max=442.02ms p(90)=36.57ms p(95)=45.32ms p(99.9)=182.86ms
     iterations.....................: 268671  2234.879634/s
     success_rate...................: 100.00% ✓ 268671      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (.net subgraphs) (16.5.0-p.8)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 780597      ✗ 0     
     data_received..................: 23 GB   190 MB/s
     data_sent......................: 313 MB  2.6 MB/s
     http_req_blocked...............: avg=3.05µs  min=932ns   med=2.2µs    max=14.91ms  p(90)=3.87µs  p(95)=4.59µs  p(99.9)=36.32µs 
     http_req_connecting............: avg=329ns   min=0s      med=0s       max=3.47ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=22.82ms min=1.93ms  med=19.14ms  max=532.9ms  p(90)=36.88ms p(95)=45.48ms p(99.9)=167.45ms
       { expected_response:true }...: avg=22.82ms min=1.93ms  med=19.14ms  max=532.9ms  p(90)=36.88ms p(95)=45.48ms p(99.9)=167.45ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 260299
     http_req_receiving.............: avg=612.9µs min=51.39µs med=101.62µs max=303.15ms p(90)=1.14ms  p(95)=1.95ms  p(99.9)=29.62ms 
     http_req_sending...............: avg=39.41µs min=4.52µs  med=9.39µs   max=118.55ms p(90)=18.62µs p(95)=60.38µs p(99.9)=2.59ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=22.17ms min=1.79ms  med=18.58ms  max=431.27ms p(90)=35.77ms p(95)=44.21ms p(99.9)=165.13ms
     http_reqs......................: 260299  2164.705165/s
     iteration_duration.............: avg=23.04ms min=3.17ms  med=19.35ms  max=533.1ms  p(90)=37.1ms  p(95)=45.72ms p(99.9)=168.87ms
     iterations.....................: 260199  2163.873543/s
     success_rate...................: 100.00% ✓ 260199      ✗ 0     
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

     checks.........................: 100.00% ✓ 594819      ✗ 0     
     data_received..................: 17 GB   145 MB/s
     data_sent......................: 238 MB  2.0 MB/s
     http_req_blocked...............: avg=3.22µs  min=831ns  med=2.21µs  max=4.05ms   p(90)=4.24µs   p(95)=5.39µs   p(99.9)=35.77µs
     http_req_connecting............: avg=476ns   min=0s     med=0s      max=4.01ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=30.01ms min=2.27ms med=29.44ms max=311.73ms p(90)=39.46ms  p(95)=42.71ms  p(99.9)=62.58ms
       { expected_response:true }...: avg=30.01ms min=2.27ms med=29.44ms max=311.73ms p(90)=39.46ms  p(95)=42.71ms  p(99.9)=62.58ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 198373
     http_req_receiving.............: avg=92.22µs min=29.6µs med=56.02µs max=48.94ms  p(90)=124.61µs p(95)=197.19µs p(99.9)=3.61ms 
     http_req_sending...............: avg=42.47µs min=4.86µs med=9.44µs  max=232.6ms  p(90)=23.96µs  p(95)=103µs    p(99.9)=2.9ms  
     http_req_tls_handshaking.......: avg=0s      min=0s     med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=29.87ms min=2.15ms med=29.33ms max=300.95ms p(90)=39.32ms  p(95)=42.54ms  p(99.9)=61.63ms
     http_reqs......................: 198373  1649.238411/s
     iteration_duration.............: avg=30.25ms min=7.62ms med=29.66ms max=322.01ms p(90)=39.68ms  p(95)=42.94ms  p(99.9)=63.24ms
     iterations.....................: 198273  1648.407028/s
     success_rate...................: 100.00% ✓ 198273      ✗ 0     
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

     checks.........................: 100.00% ✓ 422919      ✗ 0     
     data_received..................: 12 GB   103 MB/s
     data_sent......................: 170 MB  1.4 MB/s
     http_req_blocked...............: avg=3.96µs  min=1.13µs  med=2.97µs  max=4.01ms   p(90)=4.56µs   p(95)=5.26µs   p(99.9)=39.81µs 
     http_req_connecting............: avg=656ns   min=0s      med=0s      max=3.96ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=42.29ms min=2.12ms  med=41.88ms max=303.26ms p(90)=58.93ms  p(95)=64.15ms  p(99.9)=88.94ms 
       { expected_response:true }...: avg=42.29ms min=2.12ms  med=41.88ms max=303.26ms p(90)=58.93ms  p(95)=64.15ms  p(99.9)=88.94ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 141073
     http_req_receiving.............: avg=84.31µs min=28.48µs med=68.27µs max=200.55ms p(90)=108.67µs p(95)=126.32µs p(99.9)=878.63µs
     http_req_sending...............: avg=25.79µs min=5.27µs  med=13.23µs max=125.5ms  p(90)=20.18µs  p(95)=24.03µs  p(99.9)=1ms     
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=42.18ms min=2.02ms  med=41.77ms max=303.08ms p(90)=58.82ms  p(95)=64.04ms  p(99.9)=88.62ms 
     http_reqs......................: 141073  1172.770442/s
     iteration_duration.............: avg=42.55ms min=4.27ms  med=42.1ms  max=318.26ms p(90)=59.15ms  p(95)=64.37ms  p(99.9)=89.4ms  
     iterations.....................: 140973  1171.93912/s
     success_rate...................: 100.00% ✓ 140973      ✗ 0     
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

     checks.........................: 100.00% ✓ 204684     ✗ 0    
     data_received..................: 6.0 GB  50 MB/s
     data_sent......................: 82 MB   681 kB/s
     http_req_blocked...............: avg=4.74µs  min=1.12µs  med=3.2µs   max=3.59ms   p(90)=4.75µs   p(95)=5.41µs   p(99.9)=49.29µs 
     http_req_connecting............: avg=1.28µs  min=0s      med=0s      max=3.55ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=87.57ms min=3.95ms  med=86.02ms max=324.12ms p(90)=108.16ms p(95)=118.61ms p(99.9)=208.03ms
       { expected_response:true }...: avg=87.57ms min=3.95ms  med=86.02ms max=324.12ms p(90)=108.16ms p(95)=118.61ms p(99.9)=208.03ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 68328
     http_req_receiving.............: avg=89.12µs min=30.45µs med=74.7µs  max=146.43ms p(90)=110.63µs p(95)=123.88µs p(99.9)=661.27µs
     http_req_sending...............: avg=27.48µs min=5.69µs  med=14.79µs max=206.04ms p(90)=21.4µs   p(95)=23.63µs  p(99.9)=611µs   
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=87.46ms min=3.83ms  med=85.92ms max=313.58ms p(90)=108.05ms p(95)=118.49ms p(99.9)=207.04ms
     http_reqs......................: 68328   566.891122/s
     iteration_duration.............: avg=87.95ms min=25.17ms med=86.28ms max=350.51ms p(90)=108.42ms p(95)=118.94ms p(99.9)=210ms   
     iterations.....................: 68228   566.06146/s
     success_rate...................: 100.00% ✓ 68228      ✗ 0    
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

     checks.........................: 100.00% ✓ 157779     ✗ 0    
     data_received..................: 4.6 GB  38 MB/s
     data_sent......................: 63 MB   524 kB/s
     http_req_blocked...............: avg=5.7µs    min=1.29µs med=3.65µs   max=3.84ms   p(90)=5.15µs   p(95)=5.78µs   p(99.9)=115.61µs
     http_req_connecting............: avg=1.78µs   min=0s     med=0s       max=3.8ms    p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=113.63ms min=5.02ms med=111.44ms max=317.94ms p(90)=150.21ms p(95)=161.51ms p(99.9)=209.68ms
       { expected_response:true }...: avg=113.63ms min=5.02ms med=111.44ms max=317.94ms p(90)=150.21ms p(95)=161.51ms p(99.9)=209.68ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 52693
     http_req_receiving.............: avg=90.56µs  min=32.4µs med=85.22µs  max=62.82ms  p(90)=117.06µs p(95)=129.42µs p(99.9)=553.13µs
     http_req_sending...............: avg=27.84µs  min=5.98µs med=17.33µs  max=118ms    p(90)=22.99µs  p(95)=24.97µs  p(99.9)=738.56µs
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=113.51ms min=4.94ms med=111.33ms max=316.92ms p(90)=150.09ms p(95)=161.39ms p(99.9)=209.54ms
     http_reqs......................: 52693   436.715158/s
     iteration_duration.............: avg=114.11ms min=24.7ms med=111.76ms max=341.89ms p(90)=150.49ms p(95)=161.85ms p(99.9)=210.84ms
     iterations.....................: 52593   435.886366/s
     success_rate...................: 100.00% ✓ 52593      ✗ 0    
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

     checks.........................: 100.00% ✓ 95178      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 38 MB   316 kB/s
     http_req_blocked...............: avg=6.17µs   min=1.12µs  med=3µs      max=4.21ms   p(90)=4.32µs   p(95)=4.85µs   p(99.9)=1.32ms  
     http_req_connecting............: avg=2.95µs   min=0s      med=0s       max=4.16ms   p(90)=0s       p(95)=0s       p(99.9)=1.3ms   
     http_req_duration..............: avg=188.35ms min=7.94ms  med=181.5ms  max=396.45ms p(90)=211.35ms p(95)=218.07ms p(99.9)=281.73ms
       { expected_response:true }...: avg=188.35ms min=7.94ms  med=181.5ms  max=396.45ms p(90)=211.35ms p(95)=218.07ms p(99.9)=281.73ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 31826
     http_req_receiving.............: avg=92.98µs  min=30.8µs  med=84.41µs  max=136.51ms p(90)=114.2µs  p(95)=125.55µs p(99.9)=496.76µs
     http_req_sending...............: avg=29.72µs  min=5.13µs  med=16.32µs  max=143.79ms p(90)=20.64µs  p(95)=22.39µs  p(99.9)=573.03µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=188.23ms min=7.79ms  med=181.39ms max=396.25ms p(90)=211.23ms p(95)=217.97ms p(99.9)=281.61ms
     http_reqs......................: 31826   263.012439/s
     iteration_duration.............: avg=189.24ms min=28.96ms med=181.78ms max=418.72ms p(90)=211.66ms p(95)=218.36ms p(99.9)=285.29ms
     iterations.....................: 31726   262.186032/s
     success_rate...................: 100.00% ✓ 31726      ✗ 0    
     vus............................: 8       min=8        max=50 
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

     checks.........................: 100.00% ✓ 92568      ✗ 0    
     data_received..................: 2.7 GB  22 MB/s
     data_sent......................: 37 MB   308 kB/s
     http_req_blocked...............: avg=6.83µs   min=1.25µs  med=3.67µs   max=3.97ms   p(90)=5.09µs   p(95)=5.69µs   p(99.9)=1.33ms  
     http_req_connecting............: avg=2.89µs   min=0s      med=0s       max=3.93ms   p(90)=0s       p(95)=0s       p(99.9)=1.31ms  
     http_req_duration..............: avg=193.65ms min=6.37ms  med=177.63ms max=683.18ms p(90)=233.4ms  p(95)=292.48ms p(99.9)=580.11ms
       { expected_response:true }...: avg=193.65ms min=6.37ms  med=177.63ms max=683.18ms p(90)=233.4ms  p(95)=292.48ms p(99.9)=580.11ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 30956
     http_req_receiving.............: avg=103.83µs min=34.72µs med=88.47µs  max=161.12ms p(90)=118.85µs p(95)=131.03µs p(99.9)=687.2µs 
     http_req_sending...............: avg=28.73µs  min=5.42µs  med=18.26µs  max=65.29ms  p(90)=22.78µs  p(95)=24.59µs  p(99.9)=566.38µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=193.51ms min=6.28ms  med=177.49ms max=683.02ms p(90)=233.24ms p(95)=292.3ms  p(99.9)=579.96ms
     http_reqs......................: 30956   256.073819/s
     iteration_duration.............: avg=194.55ms min=60.86ms med=177.99ms max=683.44ms p(90)=233.78ms p(95)=294.16ms p(99.9)=580.37ms
     iterations.....................: 30856   255.2466/s
     success_rate...................: 100.00% ✓ 30856      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
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
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 7377      ✗ 0   
     data_received..................: 245 MB  2.0 MB/s
     data_sent......................: 3.1 MB  25 kB/s
     http_req_blocked...............: avg=76.34µs min=1.41µs   med=3.68µs  max=10.07ms  p(90)=5.24µs  p(95)=6.01µs   p(99.9)=8.7ms   
     http_req_connecting............: avg=70.33µs min=0s       med=0s      max=9.44ms   p(90)=0s      p(95)=0s       p(99.9)=8.66ms  
     http_req_duration..............: avg=2.35s   min=29.42ms  med=2.41s   max=4.4s     p(90)=3.15s   p(95)=3.35s    p(99.9)=4.15s   
       { expected_response:true }...: avg=2.35s   min=29.42ms  med=2.41s   max=4.4s     p(90)=3.15s   p(95)=3.35s    p(99.9)=4.15s   
     http_req_failed................: 0.00%   ✓ 0         ✗ 2559
     http_req_receiving.............: avg=99.11µs min=37.85µs  med=94.17µs max=796.75µs p(90)=138.7µs p(95)=156.25µs p(99.9)=462.89µs
     http_req_sending...............: avg=83.34µs min=6.63µs   med=18.7µs  max=4.62ms   p(90)=24.34µs p(95)=28.21µs  p(99.9)=4.48ms  
     http_req_tls_handshaking.......: avg=0s      min=0s       med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=2.35s   min=29.25ms  med=2.41s   max=4.4s     p(90)=3.15s   p(95)=3.35s    p(99.9)=4.15s   
     http_reqs......................: 2559    20.438441/s
     iteration_duration.............: avg=2.44s   min=835.24ms med=2.45s   max=4.4s     p(90)=3.16s   p(95)=3.35s    p(99.9)=4.16s   
     iterations.....................: 2459    19.639753/s
     success_rate...................: 100.00% ✓ 2459      ✗ 0   
     vus............................: 10      min=0       max=50
     vus_max........................: 50      min=50      max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

