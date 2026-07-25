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
| hive-router | v0.0.83 | 3,094 | 3,369 | 3,060 | 3.6% |  |
| fusion-nightly-net11 | 16.6.0-p.3 | 2,722 | 2,829 | 2,691 | 1.7% |  |
| fusion-nightly | 16.6.0-p.3 | 2,629 | 2,759 | 2,605 | 2.0% |  |
| fusion | 16.5.1 | 2,469 | 2,580 | 2,453 | 2.0% |  |
| grafbase | 0.53.5 | 2,153 | 2,272 | 2,136 | 2.3% |  |
| cosmo | 0.331.1 | 1,316 | 1,351 | 1,306 | 1.2% |  |
| hive-gateway-router-runtime | 2.10.4 | 625 | 644 | 621 | 1.3% |  |
| apollo-router | v2.16.0 | 460 | 473 | 451 | 1.6% |  |
| apollo-gateway | 2.14.2 | 284 | 287 | 282 | 0.5% |  |
| hive-gateway | 2.10.4 | 278 | 286 | 275 | 1.4% |  |
| feddi | 5ff8b6165878 | 1 | 1 | 1 | 0.0% | non-compatible response (472 across 3/4 runs) |
| fusion-nightly-fed | — | — | — | — | — | not run |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.83 | 2,593 | 2,769 | 2,563 | 2.8% |  |
| fusion-nightly-net11 | 16.6.0-p.3 | 2,458 | 2,556 | 2,432 | 1.7% |  |
| fusion-nightly | 16.6.0-p.3 | 2,367 | 2,493 | 2,354 | 2.1% |  |
| fusion | 16.5.1 | 2,329 | 2,434 | 2,312 | 1.9% |  |
| fusion-nightly-fed | 16.6.0-p.3 | 2,207 | 2,314 | 2,196 | 1.8% |  |
| grafbase | 0.53.5 | 1,687 | 1,740 | 1,684 | 1.3% |  |
| cosmo | 0.331.1 | 1,192 | 1,238 | 1,186 | 1.5% |  |
| hive-gateway-router-runtime | 2.10.4 | 569 | 592 | 568 | 1.6% |  |
| apollo-router | v2.16.0 | 447 | 466 | 444 | 1.8% |  |
| apollo-gateway | 2.14.2 | 272 | 275 | 271 | 0.4% |  |
| hive-gateway | 2.10.4 | 266 | 273 | 265 | 1.0% |  |
| feddi | 5ff8b6165878 | 21 | 22 | 20 | 3.2% |  |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.83)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 1115514     ✗ 0     
     data_received..................: 33 GB   271 MB/s
     data_sent......................: 447 MB  3.7 MB/s
     http_req_blocked...............: avg=2.65µs  min=912ns   med=1.94µs  max=16.55ms  p(90)=3.25µs  p(95)=3.88µs  p(99.9)=32.15µs
     http_req_connecting............: avg=262ns   min=0s      med=0s      max=3.66ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=15.92ms min=1.42ms  med=15.23ms max=292.83ms p(90)=23.37ms p(95)=26.68ms p(99.9)=46.96ms
       { expected_response:true }...: avg=15.92ms min=1.42ms  med=15.23ms max=292.83ms p(90)=23.37ms p(95)=26.68ms p(99.9)=46.96ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 371938
     http_req_receiving.............: avg=92.11µs min=25.01µs med=42.54µs max=118.57ms p(90)=81.37µs p(95)=156.8µs p(99.9)=9.96ms 
     http_req_sending...............: avg=47.86µs min=4.69µs  med=8.12µs  max=167.37ms p(90)=14.42µs p(95)=91.86µs p(99.9)=6.98ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=15.78ms min=1.37ms  med=15.11ms max=292.68ms p(90)=23.18ms p(95)=26.4ms  p(99.9)=45.94ms
     http_reqs......................: 371938  3094.568195/s
     iteration_duration.............: avg=16.12ms min=1.87ms  med=15.41ms max=304.39ms p(90)=23.59ms p(95)=26.92ms p(99.9)=47.65ms
     iterations.....................: 371838  3093.736183/s
     success_rate...................: 100.00% ✓ 371838      ✗ 0     
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

     checks.........................: 100.00% ✓ 981753      ✗ 0     
     data_received..................: 29 GB   239 MB/s
     data_sent......................: 393 MB  3.3 MB/s
     http_req_blocked...............: avg=2.92µs   min=861ns   med=1.93µs   max=17.21ms  p(90)=3.23µs  p(95)=3.86µs  p(99.9)=31.07µs
     http_req_connecting............: avg=466ns    min=0s      med=0s       max=8.29ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=18.12ms  min=1.92ms  med=17.27ms  max=292.94ms p(90)=25.9ms  p(95)=29.35ms p(99.9)=50.56ms
       { expected_response:true }...: avg=18.12ms  min=1.92ms  med=17.27ms  max=292.94ms p(90)=25.9ms  p(95)=29.35ms p(99.9)=50.56ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 327351
     http_req_receiving.............: avg=645.17µs min=52.13µs med=102.15µs max=218.9ms  p(90)=1.64ms  p(95)=2.43ms  p(99.9)=18.69ms
     http_req_sending...............: avg=44.63µs  min=4.55µs  med=8.15µs   max=126.36ms p(90)=15.19µs p(95)=85.99µs p(99.9)=4.52ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=17.43ms  min=1.84ms  med=16.59ms  max=289.23ms p(90)=25.07ms p(95)=28.44ms p(99.9)=48.5ms 
     http_reqs......................: 327351  2722.414087/s
     iteration_duration.............: avg=18.32ms  min=3.05ms  med=17.47ms  max=304.94ms p(90)=26.11ms p(95)=29.58ms p(99.9)=51.25ms
     iterations.....................: 327251  2721.582437/s
     success_rate...................: 100.00% ✓ 327251      ✗ 0     
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

     checks.........................: 100.00% ✓ 948189      ✗ 0     
     data_received..................: 28 GB   231 MB/s
     data_sent......................: 380 MB  3.2 MB/s
     http_req_blocked...............: avg=3.26µs   min=1.02µs  med=2.4µs   max=16.6ms   p(90)=3.72µs  p(95)=4.34µs  p(99.9)=35.72µs 
     http_req_connecting............: avg=307ns    min=0s      med=0s      max=3.91ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=18.76ms  min=1.93ms  med=16.19ms max=294.74ms p(90)=30.35ms p(95)=36.63ms p(99.9)=120.7ms 
       { expected_response:true }...: avg=18.76ms  min=1.93ms  med=16.19ms max=294.74ms p(90)=30.35ms p(95)=36.63ms p(99.9)=120.7ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 316163
     http_req_receiving.............: avg=559.45µs min=51.77µs med=94.65µs max=203.37ms p(90)=1.07ms  p(95)=1.93ms  p(99.9)=24.94ms 
     http_req_sending...............: avg=45.82µs  min=4.81µs  med=9.11µs  max=177.34ms p(90)=15.88µs p(95)=95.16µs p(99.9)=4.18ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=18.15ms  min=1.84ms  med=15.66ms max=288.04ms p(90)=29.43ms p(95)=35.62ms p(99.9)=118.2ms 
     http_reqs......................: 316163  2629.489183/s
     iteration_duration.............: avg=18.97ms  min=2.59ms  med=16.39ms max=309.95ms p(90)=30.57ms p(95)=36.86ms p(99.9)=121.43ms
     iterations.....................: 316063  2628.657495/s
     success_rate...................: 100.00% ✓ 316063      ✗ 0     
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

     checks.........................: 100.00% ✓ 890343      ✗ 0     
     data_received..................: 26 GB   216 MB/s
     data_sent......................: 357 MB  3.0 MB/s
     http_req_blocked...............: avg=2.9µs    min=882ns   med=2.26µs  max=8.19ms   p(90)=3.54µs  p(95)=4.12µs  p(99.9)=32.26µs 
     http_req_connecting............: avg=282ns    min=0s      med=0s      max=3.41ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=20ms     min=1.92ms  med=17.24ms max=283.04ms p(90)=32.5ms  p(95)=39.27ms p(99.9)=121.96ms
       { expected_response:true }...: avg=20ms     min=1.92ms  med=17.24ms max=283.04ms p(90)=32.5ms  p(95)=39.27ms p(99.9)=121.96ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 296881
     http_req_receiving.............: avg=587.38µs min=50.98µs med=94.15µs max=134.14ms p(90)=1.11ms  p(95)=1.97ms  p(99.9)=26.01ms 
     http_req_sending...............: avg=41.61µs  min=4.66µs  med=8.66µs  max=196.72ms p(90)=14.85µs p(95)=80.84µs p(99.9)=3.11ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=19.37ms  min=1.85ms  med=16.7ms  max=282.42ms p(90)=31.51ms p(95)=38.14ms p(99.9)=119.67ms
     http_reqs......................: 296881  2469.012571/s
     iteration_duration.............: avg=20.2ms   min=3.27ms  med=17.43ms max=293.07ms p(90)=32.71ms p(95)=39.51ms p(99.9)=123.01ms
     iterations.....................: 296781  2468.180921/s
     success_rate...................: 100.00% ✓ 296781      ✗ 0     
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

     checks.........................: 100.00% ✓ 776472      ✗ 0     
     data_received..................: 23 GB   189 MB/s
     data_sent......................: 311 MB  2.6 MB/s
     http_req_blocked...............: avg=3.55µs  min=1.06µs  med=2.59µs  max=9.25ms   p(90)=4.04µs  p(95)=4.76µs   p(99.9)=38.57µs
     http_req_connecting............: avg=580ns   min=0s      med=0s      max=9.21ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=22.95ms min=1.75ms  med=22.72ms max=294.28ms p(90)=27.23ms p(95)=29.03ms  p(99.9)=48.43ms
       { expected_response:true }...: avg=22.95ms min=1.75ms  med=22.72ms max=294.28ms p(90)=27.23ms p(95)=29.03ms  p(99.9)=48.43ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 258924
     http_req_receiving.............: avg=88.27µs min=27.89µs med=56.77µs max=153.61ms p(90)=95.88µs p(95)=123.32µs p(99.9)=5.3ms  
     http_req_sending...............: avg=37.2µs  min=4.88µs  med=10.43µs max=122.67ms p(90)=17.33µs p(95)=29.11µs  p(99.9)=1.85ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=22.83ms min=1.64ms  med=22.62ms max=273.52ms p(90)=27.1ms  p(95)=28.86ms  p(99.9)=47.67ms
     http_reqs......................: 258924  2153.439126/s
     iteration_duration.............: avg=23.17ms min=3.5ms   med=22.92ms max=303.16ms p(90)=27.44ms p(95)=29.25ms  p(99.9)=48.68ms
     iterations.....................: 258824  2152.607439/s
     success_rate...................: 100.00% ✓ 258824      ✗ 0     
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

     checks.........................: 100.00% ✓ 474621      ✗ 0     
     data_received..................: 14 GB   116 MB/s
     data_sent......................: 190 MB  1.6 MB/s
     http_req_blocked...............: avg=3.5µs   min=1.13µs  med=2.61µs  max=4.17ms   p(90)=4.07µs  p(95)=4.74µs   p(99.9)=37.85µs
     http_req_connecting............: avg=580ns   min=0s      med=0s      max=4.13ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=37.68ms min=2.04ms  med=37.34ms max=318.54ms p(90)=52.52ms p(95)=57.16ms  p(99.9)=78.99ms
       { expected_response:true }...: avg=37.68ms min=2.04ms  med=37.34ms max=318.54ms p(90)=52.52ms p(95)=57.16ms  p(99.9)=78.99ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 158307
     http_req_receiving.............: avg=76.72µs min=26.54µs med=61.01µs max=158.68ms p(90)=97.51µs p(95)=113.74µs p(99.9)=1.04ms 
     http_req_sending...............: avg=25.46µs min=5.25µs  med=11.44µs max=43.25ms  p(90)=17.83µs p(95)=21.86µs  p(99.9)=1.01ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=37.58ms min=1.97ms  med=37.25ms max=317.95ms p(90)=52.4ms  p(95)=57.05ms  p(99.9)=78.88ms
     http_reqs......................: 158307  1316.145511/s
     iteration_duration.............: avg=37.92ms min=3.54ms  med=37.56ms max=327.67ms p(90)=52.73ms p(95)=57.37ms  p(99.9)=79.52ms
     iterations.....................: 158207  1315.314123/s
     success_rate...................: 100.00% ✓ 158207      ✗ 0     
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

     checks.........................: 100.00% ✓ 225849     ✗ 0    
     data_received..................: 6.6 GB  55 MB/s
     data_sent......................: 91 MB   752 kB/s
     http_req_blocked...............: avg=4.23µs  min=1.23µs  med=2.95µs  max=3.41ms   p(90)=4.45µs   p(95)=5.11µs   p(99.9)=44.58µs 
     http_req_connecting............: avg=1.02µs  min=0s      med=0s      max=3.38ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=79.36ms min=3.56ms  med=77.41ms max=329.18ms p(90)=101.84ms p(95)=112.77ms p(99.9)=194.81ms
       { expected_response:true }...: avg=79.36ms min=3.56ms  med=77.41ms max=329.18ms p(90)=101.84ms p(95)=112.77ms p(99.9)=194.81ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 75383
     http_req_receiving.............: avg=80.73µs min=29.3µs  med=70.84µs max=133.43ms p(90)=106.81µs p(95)=119.48µs p(99.9)=606.83µs
     http_req_sending...............: avg=21.91µs min=5.53µs  med=13.95µs max=52.52ms  p(90)=20.93µs  p(95)=23.24µs  p(99.9)=631.46µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=79.25ms min=3.45ms  med=77.32ms max=328.6ms  p(90)=101.74ms p(95)=112.68ms p(99.9)=194.17ms
     http_reqs......................: 75383   625.765867/s
     iteration_duration.............: avg=79.7ms  min=21.64ms med=77.66ms max=338.02ms p(90)=102.1ms  p(95)=113.05ms p(99.9)=196.27ms
     iterations.....................: 75283   624.935752/s
     success_rate...................: 100.00% ✓ 75283      ✗ 0    
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

     checks.........................: 100.00% ✓ 166320     ✗ 0    
     data_received..................: 4.9 GB  40 MB/s
     data_sent......................: 67 MB   553 kB/s
     http_req_blocked...............: avg=5.23µs   min=1.33µs  med=3.51µs   max=3.81ms   p(90)=4.89µs   p(95)=5.44µs   p(99.9)=78.23µs 
     http_req_connecting............: avg=1.46µs   min=0s      med=0s       max=3.77ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=107.8ms  min=4.79ms  med=107.52ms max=296.3ms  p(90)=130.25ms p(95)=136.78ms p(99.9)=170.76ms
       { expected_response:true }...: avg=107.8ms  min=4.79ms  med=107.52ms max=296.3ms  p(90)=130.25ms p(95)=136.78ms p(99.9)=170.76ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 55540
     http_req_receiving.............: avg=85.15µs  min=32.51µs med=76.69µs  max=78.76ms  p(90)=108.71µs p(95)=121.38µs p(99.9)=571.87µs
     http_req_sending...............: avg=29.58µs  min=5.87µs  med=16.22µs  max=105.35ms p(90)=21.78µs  p(95)=23.68µs  p(99.9)=599.8µs 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=107.68ms min=4.66ms  med=107.42ms max=295.4ms  p(90)=130.14ms p(95)=136.68ms p(99.9)=168.6ms 
     http_reqs......................: 55540   460.485931/s
     iteration_duration.............: avg=108.25ms min=18.83ms med=107.81ms max=318.92ms p(90)=130.52ms p(95)=137.06ms p(99.9)=173.06ms
     iterations.....................: 55440   459.656824/s
     success_rate...................: 100.00% ✓ 55440      ✗ 0    
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

     checks.........................: 100.00% ✓ 102711     ✗ 0    
     data_received..................: 3.0 GB  25 MB/s
     data_sent......................: 41 MB   341 kB/s
     http_req_blocked...............: avg=5.97µs   min=1.15µs  med=3.05µs   max=4.12ms   p(90)=4.3µs    p(95)=4.81µs   p(99.9)=1.26ms  
     http_req_connecting............: avg=2.65µs   min=0s      med=0s       max=3.98ms   p(90)=0s       p(95)=0s       p(99.9)=1.18ms  
     http_req_duration..............: avg=174.55ms min=7.42ms  med=174.8ms  max=392.49ms p(90)=184.82ms p(95)=188.62ms p(99.9)=252.84ms
       { expected_response:true }...: avg=174.55ms min=7.42ms  med=174.8ms  max=392.49ms p(90)=184.82ms p(95)=188.62ms p(99.9)=252.84ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 34337
     http_req_receiving.............: avg=91.22µs  min=29.54µs med=81.19µs  max=113.73ms p(90)=111.13µs p(95)=121.88µs p(99.9)=548.78µs
     http_req_sending...............: avg=34.04µs  min=5.4µs   med=16.16µs  max=128.88ms p(90)=20.55µs  p(95)=22.22µs  p(99.9)=564.91µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=174.42ms min=7.3ms   med=174.7ms  max=391.17ms p(90)=184.71ms p(95)=188.47ms p(99.9)=252.64ms
     http_reqs......................: 34337   284.007538/s
     iteration_duration.............: avg=175.32ms min=38.52ms med=175.09ms max=401.82ms p(90)=185.07ms p(95)=188.9ms  p(99.9)=258.82ms
     iterations.....................: 34237   283.18042/s
     success_rate...................: 100.00% ✓ 34237      ✗ 0    
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

     checks.........................: 100.00% ✓ 100812     ✗ 0    
     data_received..................: 3.0 GB  25 MB/s
     data_sent......................: 41 MB   335 kB/s
     http_req_blocked...............: avg=9.61µs   min=1.11µs  med=3.17µs   max=7.71ms   p(90)=4.54µs   p(95)=5.07µs   p(99.9)=2.94ms  
     http_req_connecting............: avg=6.08µs   min=0s      med=0s       max=7.68ms   p(90)=0s       p(95)=0s       p(99.9)=2.84ms  
     http_req_duration..............: avg=177.89ms min=5.84ms  med=162.81ms max=740.68ms p(90)=208.92ms p(95)=249.52ms p(99.9)=617.9ms 
       { expected_response:true }...: avg=177.89ms min=5.84ms  med=162.81ms max=740.68ms p(90)=208.92ms p(95)=249.52ms p(99.9)=617.9ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 33704
     http_req_receiving.............: avg=91.12µs  min=32µs    med=86.06µs  max=58.1ms   p(90)=115.54µs p(95)=127.34µs p(99.9)=653.13µs
     http_req_sending...............: avg=29.35µs  min=5.37µs  med=16.7µs   max=94.95ms  p(90)=21.09µs  p(95)=22.83µs  p(99.9)=2.48ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=177.77ms min=5.69ms  med=162.72ms max=740.57ms p(90)=208.81ms p(95)=249.42ms p(99.9)=617.83ms
     http_reqs......................: 33704   278.844731/s
     iteration_duration.............: avg=178.67ms min=33.96ms med=163.17ms max=740.96ms p(90)=209.31ms p(95)=251.02ms p(99.9)=618.56ms
     iterations.....................: 33604   278.017396/s
     success_rate...................: 100.00% ✓ 33604      ✗ 0    
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
data_received..................: 9.0 MB 150 kB/s
     data_sent......................: 114 kB 1.9 kB/s
     http_req_blocked...............: avg=6µs      min=2.78µs  med=3.55µs   max=190.8µs  p(90)=5.48µs   p(95)=6.23µs   p(99.9)=174.23µs
     http_req_connecting............: avg=1.02µs   min=0s      med=0s       max=96.72µs  p(90)=0s       p(95)=0s       p(99.9)=87.72µs 
     http_req_duration..............: avg=350.35ms min=22.28ms med=29.1ms   max=30.03s   p(90)=40.92ms  p(95)=42.1ms   p(99.9)=27.24s  
       { expected_response:true }...: avg=350.35ms min=22.28ms med=29.1ms   max=30.03s   p(90)=40.92ms  p(95)=42.1ms   p(99.9)=27.24s  
     http_req_failed................: 0.00%  ✓ 0        ✗ 94  
     http_req_receiving.............: avg=120.77µs min=73.8µs  med=111.49µs max=415.75µs p(90)=170.35µs p(95)=181.18µs p(99.9)=409.92µs
     http_req_sending...............: avg=20.73µs  min=14.09µs med=18.72µs  max=115.95µs p(90)=21.88µs  p(95)=23.66µs  p(99.9)=112.19µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=350.2ms  min=22.19ms med=28.97ms  max=30.03s   p(90)=40.8ms   p(95)=41.67ms  p(99.9)=27.24s  
     http_reqs......................: 94     1.566643/s
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

     checks.........................: 100.00% ✓ 934953      ✗ 0     
     data_received..................: 27 GB   227 MB/s
     data_sent......................: 375 MB  3.1 MB/s
     http_req_blocked...............: avg=3.58µs  min=992ns   med=2.72µs  max=18.14ms  p(90)=4.42µs  p(95)=5.24µs   p(99.9)=41.08µs
     http_req_connecting............: avg=292ns   min=0s      med=0s      max=3.69ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=19.01ms min=1.55ms  med=18.64ms max=245.99ms p(90)=26.43ms p(95)=29.1ms   p(99.9)=49.86ms
       { expected_response:true }...: avg=19.01ms min=1.55ms  med=18.64ms max=245.99ms p(90)=26.43ms p(95)=29.1ms   p(99.9)=49.86ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 311751
     http_req_receiving.............: avg=98.81µs min=25.48µs med=52.51µs max=55.04ms  p(90)=96.83µs p(95)=162.79µs p(99.9)=8.17ms 
     http_req_sending...............: avg=49.04µs min=4.95µs  med=11.07µs max=129.65ms p(90)=19.84µs p(95)=106.99µs p(99.9)=4.32ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=18.87ms min=1.46ms  med=18.52ms max=245.16ms p(90)=26.26ms p(95)=28.84ms  p(99.9)=48.84ms
     http_reqs......................: 311751  2593.57148/s
     iteration_duration.............: avg=19.24ms min=3.33ms  med=18.86ms max=335.78ms p(90)=26.65ms p(95)=29.34ms  p(99.9)=50.6ms 
     iterations.....................: 311651  2592.739544/s
     success_rate...................: 100.00% ✓ 311651      ✗ 0     
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

     checks.........................: 100.00% ✓ 886182      ✗ 0     
     data_received..................: 26 GB   216 MB/s
     data_sent......................: 355 MB  3.0 MB/s
     http_req_blocked...............: avg=2.83µs   min=861ns   med=1.99µs   max=15ms     p(90)=3.57µs  p(95)=4.31µs  p(99.9)=28µs   
     http_req_connecting............: avg=304ns    min=0s      med=0s       max=3.58ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=20.08ms  min=1.47ms  med=19.22ms  max=275.75ms p(90)=28.9ms  p(95)=32.46ms p(99.9)=54.16ms
       { expected_response:true }...: avg=20.08ms  min=1.47ms  med=19.22ms  max=275.75ms p(90)=28.9ms  p(95)=32.46ms p(99.9)=54.16ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 295494
     http_req_receiving.............: avg=778.57µs min=51.38µs med=126.09µs max=68.94ms  p(90)=1.96ms  p(95)=2.87ms  p(99.9)=19.91ms
     http_req_sending...............: avg=41.15µs  min=4.66µs  med=8.52µs   max=135.19ms p(90)=18.06µs p(95)=77.89µs p(99.9)=3.09ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=19.26ms  min=1.35ms  med=18.39ms  max=275.11ms p(90)=27.94ms p(95)=31.44ms p(99.9)=51.72ms
     http_reqs......................: 295494  2458.464069/s
     iteration_duration.............: avg=20.3ms   min=2.91ms  med=19.43ms  max=298.7ms  p(90)=29.12ms p(95)=32.69ms p(99.9)=54.55ms
     iterations.....................: 295394  2457.632084/s
     success_rate...................: 100.00% ✓ 295394      ✗ 0     
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

     checks.........................: 100.00% ✓ 853296      ✗ 0     
     data_received..................: 25 GB   208 MB/s
     data_sent......................: 342 MB  2.8 MB/s
     http_req_blocked...............: avg=2.74µs  min=882ns  med=2.03µs  max=6.84ms   p(90)=3.36µs  p(95)=3.98µs  p(99.9)=34.74µs 
     http_req_connecting............: avg=297ns   min=0s     med=0s      max=3.33ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=20.87ms min=1.58ms med=17.4ms  max=339.68ms p(90)=34.39ms p(95)=42.33ms p(99.9)=147.61ms
       { expected_response:true }...: avg=20.87ms min=1.58ms med=17.4ms  max=339.68ms p(90)=34.39ms p(95)=42.33ms p(99.9)=147.61ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 284532
     http_req_receiving.............: avg=611.3µs min=51.7µs med=96.72µs max=176.56ms p(90)=1.14ms  p(95)=1.94ms  p(99.9)=29.05ms 
     http_req_sending...............: avg=40.64µs min=4.75µs med=8.58µs  max=106.82ms p(90)=15.85µs p(95)=63.81µs p(99.9)=3.44ms  
     http_req_tls_handshaking.......: avg=0s      min=0s     med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=20.22ms min=1.47ms med=16.84ms max=339.12ms p(90)=33.35ms p(95)=41.07ms p(99.9)=144.69ms
     http_reqs......................: 284532  2367.099635/s
     iteration_duration.............: avg=21.08ms min=2.77ms med=17.59ms max=339.86ms p(90)=34.62ms p(95)=42.55ms p(99.9)=148.63ms
     iterations.....................: 284432  2366.267708/s
     success_rate...................: 100.00% ✓ 284432      ✗ 0     
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

     checks.........................: 100.00% ✓ 839793      ✗ 0     
     data_received..................: 25 GB   204 MB/s
     data_sent......................: 337 MB  2.8 MB/s
     http_req_blocked...............: avg=2.76µs   min=861ns   med=2.01µs  max=9.29ms   p(90)=3.41µs  p(95)=4.08µs  p(99.9)=29.33µs 
     http_req_connecting............: avg=297ns    min=0s      med=0s      max=3.38ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=21.21ms  min=1.57ms  med=17.38ms max=517.82ms p(90)=35.07ms p(95)=43.46ms p(99.9)=176.65ms
       { expected_response:true }...: avg=21.21ms  min=1.57ms  med=17.38ms max=517.82ms p(90)=35.07ms p(95)=43.46ms p(99.9)=176.65ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 280031
     http_req_receiving.............: avg=595.78µs min=50.09µs med=96.42µs max=204.12ms p(90)=1.1ms   p(95)=1.86ms  p(99.9)=27.22ms 
     http_req_sending...............: avg=38.1µs   min=4.39µs  med=8.67µs  max=253.84ms p(90)=16.04µs p(95)=39.87µs p(99.9)=2.53ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=20.58ms  min=1.49ms  med=16.84ms max=517.72ms p(90)=34ms    p(95)=42.26ms p(99.9)=174.91ms
     http_reqs......................: 280031  2329.503363/s
     iteration_duration.............: avg=21.42ms  min=2.57ms  med=17.57ms max=518.01ms p(90)=35.28ms p(95)=43.68ms p(99.9)=178.06ms
     iterations.....................: 279931  2328.67149/s
     success_rate...................: 100.00% ✓ 279931      ✗ 0     
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

     checks.........................: 100.00% ✓ 795843      ✗ 0     
     data_received..................: 23 GB   193 MB/s
     data_sent......................: 319 MB  2.7 MB/s
     http_req_blocked...............: avg=3.2µs   min=921ns   med=2.12µs  max=16.2ms   p(90)=3.67µs  p(95)=4.37µs  p(99.9)=36.16µs 
     http_req_connecting............: avg=396ns   min=0s      med=0s      max=3.97ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=22.38ms min=1.92ms  med=18.81ms max=410.86ms p(90)=36.28ms p(95)=44.62ms p(99.9)=155.78ms
       { expected_response:true }...: avg=22.38ms min=1.92ms  med=18.81ms max=410.86ms p(90)=36.28ms p(95)=44.62ms p(99.9)=155.78ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 265381
     http_req_receiving.............: avg=612.7µs min=51.29µs med=99.74µs max=182.93ms p(90)=1.14ms  p(95)=1.96ms  p(99.9)=28.78ms 
     http_req_sending...............: avg=39.19µs min=4.77µs  med=9.08µs  max=168.62ms p(90)=18.49µs p(95)=49.84µs p(99.9)=2.57ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=21.73ms min=1.82ms  med=18.23ms max=410.76ms p(90)=35.21ms p(95)=43.32ms p(99.9)=154.59ms
     http_reqs......................: 265381  2207.014562/s
     iteration_duration.............: avg=22.6ms  min=3.33ms  med=19.01ms max=411.07ms p(90)=36.51ms p(95)=44.85ms p(99.9)=158.27ms
     iterations.....................: 265281  2206.182922/s
     success_rate...................: 100.00% ✓ 265281      ✗ 0     
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

     checks.........................: 100.00% ✓ 608751     ✗ 0     
     data_received..................: 18 GB   148 MB/s
     data_sent......................: 244 MB  2.0 MB/s
     http_req_blocked...............: avg=3.53µs  min=872ns   med=2.33µs  max=11.75ms  p(90)=4.69µs   p(95)=5.81µs   p(99.9)=43µs   
     http_req_connecting............: avg=453ns   min=0s      med=0s      max=3.81ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=29.31ms min=2.28ms  med=28.83ms max=312.82ms p(90)=38.69ms  p(95)=42.09ms  p(99.9)=63.18ms
       { expected_response:true }...: avg=29.31ms min=2.28ms  med=28.83ms max=312.82ms p(90)=38.69ms  p(95)=42.09ms  p(99.9)=63.18ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 203017
     http_req_receiving.............: avg=96.13µs min=28.65µs med=55.51µs max=29.09ms  p(90)=126.08µs p(95)=206.76µs p(99.9)=4.41ms 
     http_req_sending...............: avg=42.57µs min=4.57µs  med=9.62µs  max=121.13ms p(90)=24.77µs  p(95)=113.06µs p(99.9)=3.18ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=29.17ms min=2.18ms  med=28.71ms max=312.43ms p(90)=38.53ms  p(95)=41.91ms  p(99.9)=62.21ms
     http_reqs......................: 203017  1687.78233/s
     iteration_duration.............: avg=29.55ms min=5.27ms  med=29.06ms max=346.85ms p(90)=38.91ms  p(95)=42.32ms  p(99.9)=63.57ms
     iterations.....................: 202917  1686.95098/s
     success_rate...................: 100.00% ✓ 202917     ✗ 0     
     vus............................: 50      min=50       max=50  
     vus_max........................: 50      min=50       max=50
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

     checks.........................: 100.00% ✓ 430113      ✗ 0     
     data_received..................: 13 GB   104 MB/s
     data_sent......................: 172 MB  1.4 MB/s
     http_req_blocked...............: avg=3.87µs  min=1.11µs  med=2.88µs  max=4.03ms   p(90)=4.4µs    p(95)=5.08µs   p(99.9)=38.33µs 
     http_req_connecting............: avg=683ns   min=0s      med=0s      max=3.99ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=41.59ms min=2.11ms  med=41.19ms max=308.29ms p(90)=57.95ms  p(95)=63.04ms  p(99.9)=87.46ms 
       { expected_response:true }...: avg=41.59ms min=2.11ms  med=41.19ms max=308.29ms p(90)=57.95ms  p(95)=63.04ms  p(99.9)=87.46ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 143471
     http_req_receiving.............: avg=85.87µs min=28.93µs med=71.33µs max=169.73ms p(90)=112.24µs p(95)=130.22µs p(99.9)=839.65µs
     http_req_sending...............: avg=26.21µs min=5.25µs  med=12.65µs max=102.52ms p(90)=19.75µs  p(95)=23.56µs  p(99.9)=939.05µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=41.47ms min=2.04ms  med=41.09ms max=308.12ms p(90)=57.84ms  p(95)=62.92ms  p(99.9)=87.27ms 
     http_reqs......................: 143471  1192.756902/s
     iteration_duration.............: avg=41.84ms min=3.66ms  med=41.42ms max=321.33ms p(90)=58.17ms  p(95)=63.26ms  p(99.9)=87.78ms 
     iterations.....................: 143371  1191.925544/s
     success_rate...................: 100.00% ✓ 143371      ✗ 0     
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

     checks.........................: 100.00% ✓ 205758     ✗ 0    
     data_received..................: 6.0 GB  50 MB/s
     data_sent......................: 83 MB   685 kB/s
     http_req_blocked...............: avg=5µs     min=1.23µs  med=3.24µs  max=3.6ms    p(90)=4.75µs   p(95)=5.4µs    p(99.9)=45.98µs 
     http_req_connecting............: avg=1.52µs  min=0s      med=0s      max=3.56ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=87.12ms min=3.84ms  med=84.86ms max=313.11ms p(90)=112.81ms p(95)=125.26ms p(99.9)=212.07ms
       { expected_response:true }...: avg=87.12ms min=3.84ms  med=84.86ms max=313.11ms p(90)=112.81ms p(95)=125.26ms p(99.9)=212.07ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 68686
     http_req_receiving.............: avg=89.04µs min=29.46µs med=75.69µs max=173.35ms p(90)=111.16µs p(95)=124.51µs p(99.9)=699.26µs
     http_req_sending...............: avg=27.65µs min=4.93µs  med=14.29µs max=189.11ms p(90)=20.96µs  p(95)=23.28µs  p(99.9)=622.93µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=87.01ms min=3.76ms  med=84.74ms max=312.8ms  p(90)=112.7ms  p(95)=125.13ms p(99.9)=211.21ms
     http_reqs......................: 68686   569.98052/s
     iteration_duration.............: avg=87.49ms min=20.86ms med=85.14ms max=328.22ms p(90)=113.06ms p(95)=125.53ms p(99.9)=214.07ms
     iterations.....................: 68586   569.150684/s
     success_rate...................: 100.00% ✓ 68586      ✗ 0    
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

     checks.........................: 100.00% ✓ 161637     ✗ 0    
     data_received..................: 4.7 GB  39 MB/s
     data_sent......................: 65 MB   537 kB/s
     http_req_blocked...............: avg=7.8µs    min=1.08µs  med=3.18µs   max=8.32ms   p(90)=4.71µs   p(95)=5.3µs    p(99.9)=63.42µs 
     http_req_connecting............: avg=4.09µs   min=0s      med=0s       max=8.13ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=110.91ms min=5.38ms  med=108.63ms max=303.49ms p(90)=146.43ms p(95)=157.58ms p(99.9)=203.8ms 
       { expected_response:true }...: avg=110.91ms min=5.38ms  med=108.63ms max=303.49ms p(90)=146.43ms p(95)=157.58ms p(99.9)=203.8ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 53979
     http_req_receiving.............: avg=89.06µs  min=28.62µs med=83.33µs  max=93.79ms  p(90)=114.56µs p(95)=126.99µs p(99.9)=579.24µs
     http_req_sending...............: avg=25.41µs  min=5.28µs  med=16.99µs  max=87.94ms  p(90)=22.32µs  p(95)=24.21µs  p(99.9)=636.45µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=110.8ms  min=5.24ms  med=108.51ms max=302.71ms p(90)=146.33ms p(95)=157.47ms p(99.9)=203.17ms
     http_reqs......................: 53979   447.354146/s
     iteration_duration.............: avg=111.39ms min=26.21ms med=108.94ms max=334.12ms p(90)=146.74ms p(95)=157.87ms p(99.9)=204.9ms 
     iterations.....................: 53879   446.52539/s
     success_rate...................: 100.00% ✓ 53879      ✗ 0    
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

     checks.........................: 100.00% ✓ 98511      ✗ 0    
     data_received..................: 2.9 GB  24 MB/s
     data_sent......................: 40 MB   327 kB/s
     http_req_blocked...............: avg=6.8µs    min=1.37µs  med=3.61µs   max=3.95ms   p(90)=5.09µs   p(95)=5.69µs   p(99.9)=1.38ms  
     http_req_connecting............: avg=2.91µs   min=0s      med=0s       max=3.91ms   p(90)=0s       p(95)=0s       p(99.9)=1.35ms  
     http_req_duration..............: avg=181.98ms min=7.73ms  med=183.17ms max=376.16ms p(90)=192.83ms p(95)=197.08ms p(99.9)=268.67ms
       { expected_response:true }...: avg=181.98ms min=7.73ms  med=183.17ms max=376.16ms p(90)=192.83ms p(95)=197.08ms p(99.9)=268.67ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32937
     http_req_receiving.............: avg=94.73µs  min=34.33µs med=90.39µs  max=20.54ms  p(90)=122.09µs p(95)=134.53µs p(99.9)=473.59µs
     http_req_sending...............: avg=24.47µs  min=6.11µs  med=18.31µs  max=26.68ms  p(90)=23.26µs  p(95)=25.28µs  p(99.9)=518µs   
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=181.87ms min=7.63ms  med=183.04ms max=375.98ms p(90)=192.72ms p(95)=196.97ms p(99.9)=268.54ms
     http_reqs......................: 32937   272.261132/s
     iteration_duration.............: avg=182.82ms min=54.94ms med=183.73ms max=383.89ms p(90)=193.14ms p(95)=197.38ms p(99.9)=269.85ms
     iterations.....................: 32837   271.43452/s
     success_rate...................: 100.00% ✓ 32837      ✗ 0    
     vus............................: 50      min=50       max=50 
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

     checks.........................: 100.00% ✓ 96408      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 39 MB   320 kB/s
     http_req_blocked...............: avg=6.92µs   min=1.31µs  med=3.64µs   max=3.87ms   p(90)=5.11µs   p(95)=5.74µs   p(99.9)=1.48ms  
     http_req_connecting............: avg=2.98µs   min=0s      med=0s       max=3.83ms   p(90)=0s       p(95)=0s       p(99.9)=1.46ms  
     http_req_duration..............: avg=185.98ms min=6.1ms   med=170.85ms max=617.87ms p(90)=218.5ms  p(95)=271.5ms  p(99.9)=545.73ms
       { expected_response:true }...: avg=185.98ms min=6.1ms   med=170.85ms max=617.87ms p(90)=218.5ms  p(95)=271.5ms  p(99.9)=545.73ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32236
     http_req_receiving.............: avg=102.07µs min=37.38µs med=92.71µs  max=65.74ms  p(90)=123.6µs  p(95)=136.73µs p(99.9)=629.9µs 
     http_req_sending...............: avg=29.2µs   min=5.69µs  med=18.89µs  max=46.26ms  p(90)=23.81µs  p(95)=25.77µs  p(99.9)=529.15µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=185.85ms min=5.96ms  med=170.74ms max=617.77ms p(90)=218.38ms p(95)=271.32ms p(99.9)=545.61ms
     http_reqs......................: 32236   266.601373/s
     iteration_duration.............: avg=186.83ms min=45.91ms med=171.24ms max=618.12ms p(90)=218.99ms p(95)=272.99ms p(99.9)=546.15ms
     iterations.....................: 32136   265.774343/s
     success_rate...................: 100.00% ✓ 32136      ✗ 0    
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

     checks.........................: 100.00% ✓ 7707      ✗ 0   
     data_received..................: 256 MB  2.0 MB/s
     data_sent......................: 3.2 MB  25 kB/s
     http_req_blocked...............: avg=46.66µs min=1.12µs   med=3.12µs  max=5.09ms   p(90)=4.6µs    p(95)=5.35µs   p(99.9)=4.7ms   
     http_req_connecting............: avg=42.51µs min=0s       med=0s      max=5.03ms   p(90)=0s       p(95)=0s       p(99.9)=4.68ms  
     http_req_duration..............: avg=2.27s   min=27.35ms  med=2.29s   max=12.76s   p(90)=3.09s    p(95)=3.38s    p(99.9)=11.51s  
       { expected_response:true }...: avg=2.27s   min=27.35ms  med=2.29s   max=12.76s   p(90)=3.09s    p(95)=3.38s    p(99.9)=11.51s  
     http_req_failed................: 0.00%   ✓ 0         ✗ 2669
     http_req_receiving.............: avg=99.57µs min=32.77µs  med=96.78µs max=514.05µs p(90)=134.99µs p(95)=147.16µs p(99.9)=373.15µs
     http_req_sending...............: avg=75.29µs min=5.43µs   med=18.52µs max=6.34ms   p(90)=23.92µs  p(95)=27.63µs  p(99.9)=5.96ms  
     http_req_tls_handshaking.......: avg=0s      min=0s       med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=2.27s   min=27.27ms  med=2.29s   max=12.76s   p(90)=3.09s    p(95)=3.38s    p(99.9)=11.51s  
     http_reqs......................: 2669    21.142609/s
     iteration_duration.............: avg=2.35s   min=252.54ms med=2.33s   max=12.76s   p(90)=3.11s    p(95)=3.4s     p(99.9)=11.67s  
     iterations.....................: 2569    20.350454/s
     success_rate...................: 100.00% ✓ 2569      ✗ 0   
     vus............................: 16      min=0       max=50
     vus_max........................: 50      min=50      max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

