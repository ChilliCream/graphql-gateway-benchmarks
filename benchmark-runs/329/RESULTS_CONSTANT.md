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
| hive-router | v0.0.84 | 3,013 | 3,307 | 2,950 | 3.9% |  |
| fusion-nightly-net11 | 16.6.2-p.7 | 2,627 | 2,776 | 2,607 | 2.2% |  |
| fusion-nightly | 16.6.2-p.7 | 2,621 | 2,720 | 2,596 | 1.6% |  |
| fusion | 16.6.1 | 2,569 | 2,683 | 2,539 | 2.0% |  |
| fusion-nightly-fed | 16.6.2-p.7 | 2,457 | 2,518 | 2,432 | 1.1% |  |
| grafbase | 0.53.5 | 2,138 | 2,260 | 2,127 | 2.3% |  |
| cosmo | 0.334.0 | 1,273 | 1,328 | 1,267 | 1.7% |  |
| hive-gateway-router-runtime | 2.10.8 | 641 | 659 | 639 | 1.0% |  |
| apollo-router | v2.16.1 | 492 | 508 | 489 | 1.3% |  |
| hive-gateway | 2.10.8 | 285 | 294 | 285 | 1.1% |  |
| apollo-gateway | 2.14.3 | 278 | 283 | 277 | 0.7% |  |
| feddi | 5ff8b6165878 | 1 | 1 | 1 | 0.0% | non-compatible response (173 across 1/2 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| fusion-nightly-net11 | 16.6.2-p.7 | 2,562 | 2,685 | 2,557 | 1.8% |  |
| hive-router | v0.0.84 | 2,544 | 2,736 | 2,524 | 2.9% |  |
| fusion | 16.6.1 | 2,432 | 2,576 | 2,383 | 2.5% |  |
| fusion-nightly | 16.6.2-p.7 | 2,367 | 2,497 | 2,355 | 2.1% |  |
| fusion-nightly-fed | 16.6.2-p.7 | 2,318 | 2,413 | 2,308 | 1.5% |  |
| grafbase | 0.53.5 | 1,620 | 1,682 | 1,618 | 1.4% |  |
| cosmo | 0.334.0 | 1,187 | 1,236 | 1,182 | 1.6% |  |
| hive-gateway-router-runtime | 2.10.8 | 589 | 610 | 582 | 1.4% |  |
| apollo-router | v2.16.1 | 413 | 442 | 405 | 3.0% |  |
| apollo-gateway | 2.14.3 | 269 | 273 | 265 | 0.9% |  |
| hive-gateway | 2.10.8 | 260 | 268 | 258 | 1.2% |  |
| feddi | 5ff8b6165878 | 22 | 23 | 22 | 1.5% |  |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.84)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 1086057     ✗ 0     
     data_received..................: 32 GB   264 MB/s
     data_sent......................: 435 MB  3.6 MB/s
     http_req_blocked...............: avg=3.05µs   min=1µs     med=2.3µs   max=15.93ms  p(90)=3.62µs  p(95)=4.24µs   p(99.9)=34.33µs
     http_req_connecting............: avg=233ns    min=0s      med=0s      max=3.49ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=16.36ms  min=1.43ms  med=15.81ms max=330.15ms p(90)=23.88ms p(95)=26.9ms   p(99.9)=46.51ms
       { expected_response:true }...: avg=16.36ms  min=1.43ms  med=15.81ms max=330.15ms p(90)=23.88ms p(95)=26.9ms   p(99.9)=46.51ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 362119
     http_req_receiving.............: avg=104.72µs min=25.67µs med=46.26µs max=298.62ms p(90)=83.06µs p(95)=148.42µs p(99.9)=7.64ms 
     http_req_sending...............: avg=45.02µs  min=4.49µs  med=8.59µs  max=69.8ms   p(90)=14.83µs p(95)=92.78µs  p(99.9)=5.23ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=16.21ms  min=1.39ms  med=15.69ms max=83.34ms  p(90)=23.71ms p(95)=26.67ms  p(99.9)=44.71ms
     http_reqs......................: 362119  3013.123616/s
     iteration_duration.............: avg=16.56ms  min=1.92ms  med=15.99ms max=345.77ms p(90)=24.08ms p(95)=27.13ms  p(99.9)=47.2ms 
     iterations.....................: 362019  3012.291535/s
     success_rate...................: 100.00% ✓ 362019      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (rust subgraphs) (16.6.2-p.7)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 947736      ✗ 0     
     data_received..................: 28 GB   230 MB/s
     data_sent......................: 380 MB  3.2 MB/s
     http_req_blocked...............: avg=2.62µs   min=891ns   med=1.93µs  max=16.92ms  p(90)=3.18µs  p(95)=3.78µs  p(99.9)=28.98µs
     http_req_connecting............: avg=219ns    min=0s      med=0s      max=3.27ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=18.77ms  min=1.98ms  med=17.91ms max=306.27ms p(90)=27.25ms p(95)=30.78ms p(99.9)=51.99ms
       { expected_response:true }...: avg=18.77ms  min=1.98ms  med=17.91ms max=306.27ms p(90)=27.25ms p(95)=30.78ms p(99.9)=51.99ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 316012
     http_req_receiving.............: avg=494.96µs min=50.21µs med=93.98µs max=257.6ms  p(90)=1.2ms   p(95)=1.85ms  p(99.9)=17.92ms
     http_req_sending...............: avg=42.27µs  min=4.51µs  med=8.09µs  max=266.31ms p(90)=14.42µs p(95)=80.13µs p(99.9)=3.6ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=18.24ms  min=1.87ms  med=17.38ms max=281.67ms p(90)=26.59ms p(95)=30.04ms p(99.9)=50.23ms
     http_reqs......................: 316012  2627.978032/s
     iteration_duration.............: avg=18.98ms  min=2.95ms  med=18.1ms  max=317.1ms  p(90)=27.46ms p(95)=31ms    p(99.9)=52.46ms
     iterations.....................: 315912  2627.146425/s
     success_rate...................: 100.00% ✓ 315912      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (rust subgraphs) (16.6.2-p.7)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 945327      ✗ 0     
     data_received..................: 28 GB   230 MB/s
     data_sent......................: 379 MB  3.1 MB/s
     http_req_blocked...............: avg=2.78µs   min=891ns   med=1.98µs  max=11.49ms  p(90)=3.21µs  p(95)=3.77µs  p(99.9)=28.5µs  
     http_req_connecting............: avg=372ns    min=0s      med=0s      max=4.05ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=18.82ms  min=2ms     med=16.16ms max=271.53ms p(90)=30.58ms p(95)=37.13ms p(99.9)=118.87ms
       { expected_response:true }...: avg=18.82ms  min=2ms     med=16.16ms max=271.53ms p(90)=30.58ms p(95)=37.13ms p(99.9)=118.87ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 315209
     http_req_receiving.............: avg=568.13µs min=51.45µs med=89.26µs max=125.67ms p(90)=1.07ms  p(95)=1.94ms  p(99.9)=25.56ms 
     http_req_sending...............: avg=43.26µs  min=4.44µs  med=8.12µs  max=113.44ms p(90)=13.66µs p(95)=77.98µs p(99.9)=4.67ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=18.21ms  min=1.9ms   med=15.64ms max=264.23ms p(90)=29.62ms p(95)=35.98ms p(99.9)=116.78ms
     http_reqs......................: 315209  2621.296684/s
     iteration_duration.............: avg=19.03ms  min=2.67ms  med=16.35ms max=293.87ms p(90)=30.8ms  p(95)=37.36ms p(99.9)=119.87ms
     iterations.....................: 315109  2620.465078/s
     success_rate...................: 100.00% ✓ 315109      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (rust subgraphs) (16.6.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 926940      ✗ 0     
     data_received..................: 27 GB   225 MB/s
     data_sent......................: 371 MB  3.1 MB/s
     http_req_blocked...............: avg=2.68µs   min=902ns   med=1.87µs  max=17.91ms  p(90)=2.92µs  p(95)=3.43µs  p(99.9)=25.16µs 
     http_req_connecting............: avg=334ns    min=0s      med=0s      max=3.59ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=19.2ms   min=2.04ms  med=16.48ms max=296.6ms  p(90)=31.22ms p(95)=37.83ms p(99.9)=125.24ms
       { expected_response:true }...: avg=19.2ms   min=2.04ms  med=16.48ms max=296.6ms  p(90)=31.22ms p(95)=37.83ms p(99.9)=125.24ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 309080
     http_req_receiving.............: avg=566.65µs min=50.47µs med=88.38µs max=136.19ms p(90)=1.08ms  p(95)=1.95ms  p(99.9)=24.47ms 
     http_req_sending...............: avg=40.31µs  min=4.6µs   med=7.98µs  max=108.2ms  p(90)=13.25µs p(95)=68.88µs p(99.9)=3.78ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=18.6ms   min=1.89ms  med=15.94ms max=296.19ms p(90)=30.28ms p(95)=36.79ms p(99.9)=122.63ms
     http_reqs......................: 309080  2569.931666/s
     iteration_duration.............: avg=19.41ms  min=3.14ms  med=16.67ms max=311.5ms  p(90)=31.44ms p(95)=38.05ms p(99.9)=126.19ms
     iterations.....................: 308980  2569.100188/s
     success_rate...................: 100.00% ✓ 308980      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (rust subgraphs) (16.6.2-p.7)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 886134      ✗ 0     
     data_received..................: 26 GB   216 MB/s
     data_sent......................: 355 MB  3.0 MB/s
     http_req_blocked...............: avg=2.83µs   min=842ns  med=2µs     max=22.43ms  p(90)=3.34µs  p(95)=3.99µs  p(99.9)=32.5µs  
     http_req_connecting............: avg=321ns    min=0s     med=0s      max=3.9ms    p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=20.09ms  min=1.73ms med=16.35ms max=362.16ms p(90)=33.92ms p(95)=42.95ms p(99.9)=163.58ms
       { expected_response:true }...: avg=20.09ms  min=1.73ms med=16.35ms max=362.16ms p(90)=33.92ms p(95)=42.95ms p(99.9)=163.58ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 295478
     http_req_receiving.............: avg=581.06µs min=51.1µs med=90.85µs max=257.57ms p(90)=1.04ms  p(95)=1.86ms  p(99.9)=29.34ms 
     http_req_sending...............: avg=39.76µs  min=4.49µs med=8.29µs  max=122.17ms p(90)=15.12µs p(95)=51.74µs p(99.9)=3.27ms  
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=19.47ms  min=1.62ms med=15.84ms max=362.04ms p(90)=32.9ms  p(95)=41.74ms p(99.9)=161.92ms
     http_reqs......................: 295478  2457.818932/s
     iteration_duration.............: avg=20.3ms   min=2.5ms  med=16.54ms max=362.37ms p(90)=34.13ms p(95)=43.16ms p(99.9)=164.25ms
     iterations.....................: 295378  2456.987121/s
     success_rate...................: 100.00% ✓ 295378      ✗ 0     
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

     checks.........................: 100.00% ✓ 770859      ✗ 0     
     data_received..................: 23 GB   188 MB/s
     data_sent......................: 309 MB  2.6 MB/s
     http_req_blocked...............: avg=3.11µs  min=761ns   med=2.19µs  max=17.48ms  p(90)=3.73µs  p(95)=4.48µs   p(99.9)=34.24µs
     http_req_connecting............: avg=355ns   min=0s      med=0s      max=3.9ms    p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=23.13ms min=1.7ms   med=22.88ms max=284.77ms p(90)=27.44ms p(95)=29.2ms   p(99.9)=48.11ms
       { expected_response:true }...: avg=23.13ms min=1.7ms   med=22.88ms max=284.77ms p(90)=27.44ms p(95)=29.2ms   p(99.9)=48.11ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 257053
     http_req_receiving.............: avg=86.55µs min=26.38µs med=54.14µs max=134.94ms p(90)=90.32µs p(95)=114.21µs p(99.9)=5.37ms 
     http_req_sending...............: avg=34.57µs min=4.53µs  med=9.36µs  max=139.17ms p(90)=16.01µs p(95)=23.99µs  p(99.9)=1.76ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=23.01ms min=1.62ms  med=22.79ms max=284.21ms p(90)=27.31ms p(95)=29.03ms  p(99.9)=47.19ms
     http_reqs......................: 257053  2138.106838/s
     iteration_duration.............: avg=23.34ms min=4.66ms  med=23.07ms max=298.46ms p(90)=27.64ms p(95)=29.42ms  p(99.9)=48.49ms
     iterations.....................: 256953  2137.275061/s
     success_rate...................: 100.00% ✓ 256953      ✗ 0     
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

     checks.........................: 100.00% ✓ 459129      ✗ 0     
     data_received..................: 13 GB   112 MB/s
     data_sent......................: 184 MB  1.5 MB/s
     http_req_blocked...............: avg=2.9µs   min=952ns   med=1.95µs  max=4.18ms   p(90)=3.31µs  p(95)=3.95µs   p(99.9)=28.47µs 
     http_req_connecting............: avg=624ns   min=0s      med=0s      max=4.13ms   p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=38.97ms min=2.04ms  med=38.6ms  max=281.63ms p(90)=54.32ms p(95)=59.08ms  p(99.9)=81.69ms 
       { expected_response:true }...: avg=38.97ms min=2.04ms  med=38.6ms  max=281.63ms p(90)=54.32ms p(95)=59.08ms  p(99.9)=81.69ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 153143
     http_req_receiving.............: avg=66.94µs min=25.48µs med=56.2µs  max=31.94ms  p(90)=90.94µs p(95)=106.01µs p(99.9)=726.2µs 
     http_req_sending...............: avg=19.89µs min=4.75µs  med=9.33µs  max=82ms     p(90)=15.3µs  p(95)=19.12µs  p(99.9)=835.88µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=38.88ms min=1.93ms  med=38.51ms max=281.5ms  p(90)=54.23ms p(95)=58.98ms  p(99.9)=81.42ms 
     http_reqs......................: 153143  1273.280778/s
     iteration_duration.............: avg=39.2ms  min=4.23ms  med=38.79ms max=311.9ms  p(90)=54.5ms  p(95)=59.26ms  p(99.9)=82.17ms 
     iterations.....................: 153043  1272.449346/s
     success_rate...................: 100.00% ✓ 153043      ✗ 0     
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

     checks.........................: 100.00% ✓ 231363     ✗ 0    
     data_received..................: 6.8 GB  56 MB/s
     data_sent......................: 93 MB   770 kB/s
     http_req_blocked...............: avg=4.8µs   min=1.2µs   med=3.12µs  max=23.19ms  p(90)=4.67µs   p(95)=5.33µs   p(99.9)=45.3µs  
     http_req_connecting............: avg=1.12µs  min=0s      med=0s      max=3.59ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=77.46ms min=3.53ms  med=75.3ms  max=325.18ms p(90)=96.88ms  p(95)=106.91ms p(99.9)=190.13ms
       { expected_response:true }...: avg=77.46ms min=3.53ms  med=75.3ms  max=325.18ms p(90)=96.88ms  p(95)=106.91ms p(99.9)=190.13ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 77221
     http_req_receiving.............: avg=88.56µs min=29.86µs med=71.94µs max=230.61ms p(90)=108.21µs p(95)=121.67µs p(99.9)=666.56µs
     http_req_sending...............: avg=23.22µs min=5.01µs  med=13.99µs max=98.61ms  p(90)=21.3µs   p(95)=23.69µs  p(99.9)=605.48µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=77.34ms min=3.46ms  med=75.19ms max=307.68ms p(90)=96.78ms  p(95)=106.75ms p(99.9)=188.06ms
     http_reqs......................: 77221   641.062565/s
     iteration_duration.............: avg=77.8ms  min=12.77ms med=75.55ms max=335.26ms p(90)=97.14ms  p(95)=107.22ms p(99.9)=192.08ms
     iterations.....................: 77121   640.232399/s
     success_rate...................: 100.00% ✓ 77121      ✗ 0    
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

     checks.........................: 100.00% ✓ 177771     ✗ 0    
     data_received..................: 5.2 GB  43 MB/s
     data_sent......................: 71 MB   591 kB/s
     http_req_blocked...............: avg=5.04µs   min=1.23µs  med=3.31µs   max=3.98ms   p(90)=4.77µs   p(95)=5.37µs   p(99.9)=47.9µs  
     http_req_connecting............: avg=1.5µs    min=0s      med=0s       max=3.94ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=100.83ms min=4.62ms  med=100.6ms  max=320.57ms p(90)=121.69ms p(95)=127.85ms p(99.9)=157.78ms
       { expected_response:true }...: avg=100.83ms min=4.62ms  med=100.6ms  max=320.57ms p(90)=121.69ms p(95)=127.85ms p(99.9)=157.78ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 59357
     http_req_receiving.............: avg=84.55µs  min=32.19µs med=79.1µs   max=30.85ms  p(90)=110.4µs  p(95)=122.98µs p(99.9)=591.83µs
     http_req_sending...............: avg=25.75µs  min=5.58µs  med=16.33µs  max=126.27ms p(90)=22.3µs   p(95)=24.27µs  p(99.9)=571.36µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=100.72ms min=4.49ms  med=100.5ms  max=320.07ms p(90)=121.58ms p(95)=127.72ms p(99.9)=157.48ms
     http_reqs......................: 59357   492.245623/s
     iteration_duration.............: avg=101.27ms min=20.22ms med=100.89ms max=332.7ms  p(90)=121.96ms p(95)=128.12ms p(99.9)=160.39ms
     iterations.....................: 59257   491.416326/s
     success_rate...................: 100.00% ✓ 59257      ✗ 0    
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

     checks.........................: 100.00% ✓ 103335     ✗ 0    
     data_received..................: 3.0 GB  25 MB/s
     data_sent......................: 42 MB   343 kB/s
     http_req_blocked...............: avg=6.12µs   min=1µs     med=3.21µs   max=3.99ms   p(90)=4.57µs   p(95)=5.12µs   p(99.9)=1.32ms  
     http_req_connecting............: avg=2.7µs    min=0s      med=0s       max=3.95ms   p(90)=0s       p(95)=0s       p(99.9)=1.26ms  
     http_req_duration..............: avg=173.5ms  min=5.49ms  med=158.16ms max=628.07ms p(90)=200.51ms p(95)=230.89ms p(99.9)=586.81ms
       { expected_response:true }...: avg=173.5ms  min=5.49ms  med=158.16ms max=628.07ms p(90)=200.51ms p(95)=230.89ms p(99.9)=586.81ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 34545
     http_req_receiving.............: avg=91.47µs  min=29.55µs med=89.74µs  max=11.82ms  p(90)=119.3µs  p(95)=130.94µs p(99.9)=653.53µs
     http_req_sending...............: avg=30.66µs  min=5.21µs  med=17.75µs  max=80.9ms   p(90)=21.91µs  p(95)=23.58µs  p(99.9)=574.38µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=173.38ms min=5.42ms  med=158.03ms max=627.98ms p(90)=200.4ms  p(95)=230.82ms p(99.9)=586.71ms
     http_reqs......................: 34545   285.697878/s
     iteration_duration.............: avg=174.28ms min=13.77ms med=158.51ms max=628.28ms p(90)=200.9ms  p(95)=231.85ms p(99.9)=587.1ms 
     iterations.....................: 34445   284.870847/s
     success_rate...................: 100.00% ✓ 34445      ✗ 0    
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

     checks.........................: 100.00% ✓ 100806     ✗ 0    
     data_received..................: 3.0 GB  25 MB/s
     data_sent......................: 41 MB   335 kB/s
     http_req_blocked...............: avg=6.06µs   min=1.26µs  med=3.12µs   max=3.36ms   p(90)=4.28µs   p(95)=4.8µs    p(99.9)=1.38ms  
     http_req_connecting............: avg=2.67µs   min=0s      med=0s       max=3.33ms   p(90)=0s       p(95)=0s       p(99.9)=1.3ms   
     http_req_duration..............: avg=177.9ms  min=7.57ms  med=178.12ms max=383.56ms p(90)=187.21ms p(95)=192.13ms p(99.9)=258.76ms
       { expected_response:true }...: avg=177.9ms  min=7.57ms  med=178.12ms max=383.56ms p(90)=187.21ms p(95)=192.13ms p(99.9)=258.76ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 33702
     http_req_receiving.............: avg=94.85µs  min=34.94µs med=82.26µs  max=86.54ms  p(90)=113.55µs p(95)=124.82µs p(99.9)=628.83µs
     http_req_sending...............: avg=35.44µs  min=5.8µs   med=16.11µs  max=119.92ms p(90)=20.74µs  p(95)=22.47µs  p(99.9)=577.97µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=177.77ms min=7.43ms  med=178.01ms max=376.46ms p(90)=187.08ms p(95)=191.96ms p(99.9)=258.67ms
     http_reqs......................: 33702   278.58522/s
     iteration_duration.............: avg=178.68ms min=25.48ms med=178.45ms max=390.95ms p(90)=187.48ms p(95)=192.41ms p(99.9)=260.11ms
     iterations.....................: 33602   277.758606/s
     success_rate...................: 100.00% ✓ 33602      ✗ 0    
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
data_received..................: 9.3 MB 155 kB/s
     data_sent......................: 118 kB 2.0 kB/s
     http_req_blocked...............: avg=5.85µs   min=2.56µs  med=3.43µs  max=162.6µs  p(90)=5.05µs   p(95)=5.5µs    p(99.9)=152.71µs
     http_req_connecting............: avg=936ns    min=0s      med=0s      max=90.85µs  p(90)=0s       p(95)=0s       p(99.9)=82.13µs 
     http_req_duration..............: avg=340.94ms min=23.13ms med=30.11ms max=30.02s   p(90)=39.83ms  p(95)=42.16ms  p(99.9)=27.14s  
       { expected_response:true }...: avg=340.94ms min=23.13ms med=30.11ms max=30.02s   p(90)=39.83ms  p(95)=42.16ms  p(99.9)=27.14s  
     http_req_failed................: 0.00%  ✓ 0        ✗ 97  
     http_req_receiving.............: avg=111.76µs min=70.54µs med=87.08µs max=798.43µs p(90)=144.36µs p(95)=171.11µs p(99.9)=757.49µs
     http_req_sending...............: avg=21.83µs  min=13.66µs med=18.02µs max=164.68µs p(90)=22.62µs  p(95)=27.27µs  p(99.9)=163.3µs 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=340.8ms  min=22.99ms med=29.97ms max=30.02s   p(90)=39.72ms  p(95)=42.05ms  p(99.9)=27.14s  
     http_reqs......................: 97     1.616659/s
     vus............................: 0      min=0      max=0 
     vus_max........................: 50     min=50     max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (.net subgraphs) (16.6.2-p.7)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 923823      ✗ 0     
     data_received..................: 27 GB   225 MB/s
     data_sent......................: 370 MB  3.1 MB/s
     http_req_blocked...............: avg=2.68µs   min=902ns   med=2.03µs  max=3.41ms   p(90)=3.46µs  p(95)=4.16µs  p(99.9)=31.55µs
     http_req_connecting............: avg=268ns    min=0s      med=0s      max=3.38ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=19.26ms  min=1.54ms  med=18.43ms max=282.28ms p(90)=27.8ms  p(95)=31.27ms p(99.9)=52.71ms
       { expected_response:true }...: avg=19.26ms  min=1.54ms  med=18.43ms max=282.28ms p(90)=27.8ms  p(95)=31.27ms p(99.9)=52.71ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 308041
     http_req_receiving.............: avg=528.34µs min=50.21µs med=96.76µs max=268.18ms p(90)=1.33ms  p(95)=2.08ms  p(99.9)=18.23ms
     http_req_sending...............: avg=43.26µs  min=4.5µs   med=8.69µs  max=193.18ms p(90)=17.88µs p(95)=87.36µs p(99.9)=3.72ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=18.68ms  min=1.41ms  med=17.86ms max=271.76ms p(90)=27.12ms p(95)=30.53ms p(99.9)=50.84ms
     http_reqs......................: 308041  2562.851143/s
     iteration_duration.............: avg=19.47ms  min=2.64ms  med=18.63ms max=305.89ms p(90)=28ms    p(95)=31.49ms p(99.9)=53.11ms
     iterations.....................: 307941  2562.019159/s
     success_rate...................: 100.00% ✓ 307941      ✗ 0     
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

     checks.........................: 100.00% ✓ 917205      ✗ 0     
     data_received..................: 27 GB   222 MB/s
     data_sent......................: 368 MB  3.1 MB/s
     http_req_blocked...............: avg=2.98µs  min=922ns   med=2.17µs  max=16.33ms  p(90)=3.77µs  p(95)=4.54µs   p(99.9)=36.61µs
     http_req_connecting............: avg=301ns   min=0s      med=0s      max=3.99ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=19.4ms  min=1.66ms  med=19.07ms max=296.82ms p(90)=26.85ms p(95)=29.28ms  p(99.9)=48.63ms
       { expected_response:true }...: avg=19.4ms  min=1.66ms  med=19.07ms max=296.82ms p(90)=26.85ms p(95)=29.28ms  p(99.9)=48.63ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 305835
     http_req_receiving.............: avg=87.41µs min=25.16µs med=48.47µs max=39.68ms  p(90)=90.13µs p(95)=131.72µs p(99.9)=7ms    
     http_req_sending...............: avg=42.29µs min=4.73µs  med=9.39µs  max=244.23ms p(90)=17.29µs p(95)=83.02µs  p(99.9)=2.95ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=19.27ms min=1.61ms  med=18.96ms max=284.95ms p(90)=26.71ms p(95)=29.09ms  p(99.9)=47.63ms
     http_reqs......................: 305835  2544.019274/s
     iteration_duration.............: avg=19.61ms min=3.29ms  med=19.27ms max=317.15ms p(90)=27.06ms p(95)=29.5ms   p(99.9)=49.26ms
     iterations.....................: 305735  2543.187447/s
     success_rate...................: 100.00% ✓ 305735      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (.net subgraphs) (16.6.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 876948      ✗ 0     
     data_received..................: 26 GB   213 MB/s
     data_sent......................: 351 MB  2.9 MB/s
     http_req_blocked...............: avg=3.32µs   min=1.01µs  med=2.57µs  max=15.38ms  p(90)=4.06µs  p(95)=4.74µs  p(99.9)=35.5µs  
     http_req_connecting............: avg=323ns    min=0s      med=0s      max=3.26ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=20.29ms  min=1.54ms  med=17.05ms max=475.57ms p(90)=33.36ms p(95)=40.75ms p(99.9)=143.53ms
       { expected_response:true }...: avg=20.29ms  min=1.54ms  med=17.05ms max=475.57ms p(90)=33.36ms p(95)=40.75ms p(99.9)=143.53ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 292416
     http_req_receiving.............: avg=592.38µs min=51.59µs med=97.87µs max=258.76ms p(90)=1.12ms  p(95)=1.99ms  p(99.9)=27.59ms 
     http_req_sending...............: avg=45.01µs  min=4.98µs  med=9.79µs  max=157.89ms p(90)=17.56µs p(95)=92.2µs  p(99.9)=3.81ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=19.65ms  min=1.45ms  med=16.5ms  max=475.48ms p(90)=32.34ms p(95)=39.57ms p(99.9)=142.36ms
     http_reqs......................: 292416  2432.529563/s
     iteration_duration.............: avg=20.51ms  min=2.61ms  med=17.26ms max=475.8ms  p(90)=33.59ms p(95)=41ms    p(99.9)=145.81ms
     iterations.....................: 292316  2431.697691/s
     success_rate...................: 100.00% ✓ 292316      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.6.2-p.7)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 853323      ✗ 0     
     data_received..................: 25 GB   208 MB/s
     data_sent......................: 342 MB  2.8 MB/s
     http_req_blocked...............: avg=3.24µs   min=862ns   med=2.43µs   max=12.21ms  p(90)=4µs     p(95)=4.7µs   p(99.9)=36.31µs 
     http_req_connecting............: avg=334ns    min=0s      med=0s       max=4.08ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=20.86ms  min=1.67ms  med=17.54ms  max=518.85ms p(90)=34.22ms p(95)=41.79ms p(99.9)=146.17ms
       { expected_response:true }...: avg=20.86ms  min=1.67ms  med=17.54ms  max=518.85ms p(90)=34.22ms p(95)=41.79ms p(99.9)=146.17ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 284541
     http_req_receiving.............: avg=602.51µs min=52.19µs med=100.17µs max=173.76ms p(90)=1.14ms  p(95)=1.97ms  p(99.9)=27.47ms 
     http_req_sending...............: avg=44µs     min=4.76µs  med=9.45µs   max=242.08ms p(90)=17.83µs p(95)=83.05µs p(99.9)=3.31ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=20.21ms  min=1.55ms  med=16.98ms  max=518.76ms p(90)=33.19ms p(95)=40.65ms p(99.9)=143.65ms
     http_reqs......................: 284541  2367.052141/s
     iteration_duration.............: avg=21.08ms  min=2.72ms  med=17.75ms  max=519.05ms p(90)=34.45ms p(95)=42.02ms p(99.9)=147.57ms
     iterations.....................: 284441  2366.220257/s
     success_rate...................: 100.00% ✓ 284441      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (.net subgraphs) (16.6.2-p.7)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 835944      ✗ 0     
     data_received..................: 24 GB   203 MB/s
     data_sent......................: 335 MB  2.8 MB/s
     http_req_blocked...............: avg=2.96µs  min=861ns   med=2.17µs  max=13.26ms  p(90)=3.85µs  p(95)=4.6µs   p(99.9)=32.94µs 
     http_req_connecting............: avg=330ns   min=0s      med=0s      max=4.04ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=21.3ms  min=1.85ms  med=18.04ms max=295.16ms p(90)=34.56ms p(95)=42.36ms p(99.9)=148.19ms
       { expected_response:true }...: avg=21.3ms  min=1.85ms  med=18.04ms max=295.16ms p(90)=34.56ms p(95)=42.36ms p(99.9)=148.19ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 278748
     http_req_receiving.............: avg=572.1µs min=52.09µs med=99.14µs max=173.05ms p(90)=1.11ms  p(95)=1.89ms  p(99.9)=26.75ms 
     http_req_sending...............: avg=39.43µs min=4.6µs   med=9.15µs  max=162.97ms p(90)=18.7µs  p(95)=68.34µs p(99.9)=2.69ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=20.69ms min=1.74ms  med=17.5ms  max=289.31ms p(90)=33.59ms p(95)=41.23ms p(99.9)=145.56ms
     http_reqs......................: 278748  2318.316627/s
     iteration_duration.............: avg=21.52ms min=2.93ms  med=18.25ms max=313.56ms p(90)=34.78ms p(95)=42.6ms  p(99.9)=149.76ms
     iterations.....................: 278648  2317.484938/s
     success_rate...................: 100.00% ✓ 278648      ✗ 0     
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

     checks.........................: 100.00% ✓ 584454      ✗ 0     
     data_received..................: 17 GB   142 MB/s
     data_sent......................: 234 MB  1.9 MB/s
     http_req_blocked...............: avg=3.28µs  min=871ns   med=2.17µs  max=11.11ms  p(90)=4.3µs    p(95)=5.37µs   p(99.9)=42.6µs 
     http_req_connecting............: avg=474ns   min=0s      med=0s      max=4.01ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=30.55ms min=2.2ms   med=30.03ms max=310.73ms p(90)=40.19ms  p(95)=43.47ms  p(99.9)=64.99ms
       { expected_response:true }...: avg=30.55ms min=2.2ms   med=30.03ms max=310.73ms p(90)=40.19ms  p(95)=43.47ms  p(99.9)=64.99ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 194918
     http_req_receiving.............: avg=90.71µs min=26.93µs med=54.58µs max=57.54ms  p(90)=123.36µs p(95)=190.52µs p(99.9)=3.4ms  
     http_req_sending...............: avg=38.41µs min=4.57µs  med=9.17µs  max=172.05ms p(90)=23.66µs  p(95)=102.1µs  p(99.9)=2.41ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=30.42ms min=2.13ms  med=29.92ms max=310.2ms  p(90)=40.06ms  p(95)=43.31ms  p(99.9)=64.25ms
     http_reqs......................: 194918  1620.3155/s
     iteration_duration.............: avg=30.78ms min=6.45ms  med=30.26ms max=325.57ms p(90)=40.41ms  p(95)=43.69ms  p(99.9)=65.38ms
     iterations.....................: 194818  1619.484219/s
     success_rate...................: 100.00% ✓ 194818      ✗ 0     
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

     checks.........................: 100.00% ✓ 428172      ✗ 0     
     data_received..................: 13 GB   104 MB/s
     data_sent......................: 172 MB  1.4 MB/s
     http_req_blocked...............: avg=3.84µs  min=1µs     med=2.92µs  max=3.47ms   p(90)=4.5µs    p(95)=5.2µs    p(99.9)=38.24µs 
     http_req_connecting............: avg=604ns   min=0s      med=0s      max=3.43ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=41.78ms min=2.14ms  med=41.35ms max=295.98ms p(90)=58.07ms  p(95)=63.07ms  p(99.9)=86.19ms 
       { expected_response:true }...: avg=41.78ms min=2.14ms  med=41.35ms max=295.98ms p(90)=58.07ms  p(95)=63.07ms  p(99.9)=86.19ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 142824
     http_req_receiving.............: avg=81.12µs min=27.61µs med=66.27µs max=191.42ms p(90)=106.37µs p(95)=124.36µs p(99.9)=899.34µs
     http_req_sending...............: avg=27.23µs min=5.25µs  med=12.38µs max=85.25ms  p(90)=18.98µs  p(95)=22.88µs  p(99.9)=1.09ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=41.67ms min=2.02ms  med=41.25ms max=295.43ms p(90)=57.95ms  p(95)=62.96ms  p(99.9)=85.74ms 
     http_reqs......................: 142824  1187.368886/s
     iteration_duration.............: avg=42.03ms min=4.16ms  med=41.57ms max=319.74ms p(90)=58.29ms  p(95)=63.29ms  p(99.9)=86.69ms 
     iterations.....................: 142724  1186.537535/s
     success_rate...................: 100.00% ✓ 142724      ✗ 0     
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

     checks.........................: 100.00% ✓ 212805     ✗ 0    
     data_received..................: 6.2 GB  52 MB/s
     data_sent......................: 85 MB   708 kB/s
     http_req_blocked...............: avg=4.59µs  min=1.12µs  med=3.02µs  max=3.59ms   p(90)=4.55µs   p(95)=5.25µs   p(99.9)=52.53µs 
     http_req_connecting............: avg=1.31µs  min=0s      med=0s      max=3.55ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=84.22ms min=3.86ms  med=82.23ms max=329.86ms p(90)=102.97ms p(95)=112.82ms p(99.9)=194.34ms
       { expected_response:true }...: avg=84.22ms min=3.86ms  med=82.23ms max=329.86ms p(90)=102.97ms p(95)=112.82ms p(99.9)=194.34ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 71035
     http_req_receiving.............: avg=99.69µs min=28.9µs  med=76.05µs max=138.58ms p(90)=112.74µs p(95)=126.04µs p(99.9)=769.61µs
     http_req_sending...............: avg=24.16µs min=4.76µs  med=14.68µs max=127.41ms p(90)=21.58µs  p(95)=23.86µs  p(99.9)=604.06µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=84.1ms  min=3.73ms  med=82.13ms max=248.58ms p(90)=102.85ms p(95)=112.7ms  p(99.9)=192.51ms
     http_reqs......................: 71035   589.330193/s
     iteration_duration.............: avg=84.59ms min=12.54ms med=82.48ms max=337.16ms p(90)=103.24ms p(95)=113.1ms  p(99.9)=196.64ms
     iterations.....................: 70935   588.50056/s
     success_rate...................: 100.00% ✓ 70935      ✗ 0    
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

     checks.........................: 100.00% ✓ 149496     ✗ 0    
     data_received..................: 4.4 GB  36 MB/s
     data_sent......................: 60 MB   497 kB/s
     http_req_blocked...............: avg=5.04µs   min=1.07µs  med=3.1µs    max=3.47ms   p(90)=4.52µs   p(95)=5.07µs   p(99.9)=145.92µs
     http_req_connecting............: avg=1.72µs   min=0s      med=0s       max=3.43ms   p(90)=0s       p(95)=0s       p(99.9)=64.74µs 
     http_req_duration..............: avg=119.92ms min=5.51ms  med=117.54ms max=322.31ms p(90)=159.06ms p(95)=171.28ms p(99.9)=220.9ms 
       { expected_response:true }...: avg=119.92ms min=5.51ms  med=117.54ms max=322.31ms p(90)=159.06ms p(95)=171.28ms p(99.9)=220.9ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 49932
     http_req_receiving.............: avg=83.03µs  min=31.21µs med=81.11µs  max=1.78ms   p(90)=111.26µs p(95)=123.15µs p(99.9)=483.17µs
     http_req_sending...............: avg=27.01µs  min=4.81µs  med=16.81µs  max=147.22ms p(90)=21.74µs  p(95)=23.51µs  p(99.9)=521.94µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=119.81ms min=5.39ms  med=117.44ms max=321.84ms p(90)=158.93ms p(95)=171.16ms p(99.9)=220.82ms
     http_reqs......................: 49932   413.7439/s
     iteration_duration.............: avg=120.43ms min=30.2ms  med=117.86ms max=333.12ms p(90)=159.37ms p(95)=171.57ms p(99.9)=224.52ms
     iterations.....................: 49832   412.915285/s
     success_rate...................: 100.00% ✓ 49832      ✗ 0    
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

     checks.........................: 100.00% ✓ 97623      ✗ 0    
     data_received..................: 2.9 GB  24 MB/s
     data_sent......................: 39 MB   324 kB/s
     http_req_blocked...............: avg=6.22µs   min=1.09µs  med=3.16µs   max=4.04ms   p(90)=4.52µs   p(95)=5.06µs   p(99.9)=1.38ms  
     http_req_connecting............: avg=2.85µs   min=0s      med=0s       max=3.98ms   p(90)=0s       p(95)=0s       p(99.9)=1.36ms  
     http_req_duration..............: avg=183.64ms min=7.8ms   med=202.52ms max=390.53ms p(90)=213.95ms p(95)=219.02ms p(99.9)=290.31ms
       { expected_response:true }...: avg=183.64ms min=7.8ms   med=202.52ms max=390.53ms p(90)=213.95ms p(95)=219.02ms p(99.9)=290.31ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32641
     http_req_receiving.............: avg=89.6µs   min=29.12µs med=87.68µs  max=1.44ms   p(90)=118.15µs p(95)=130.06µs p(99.9)=597.13µs
     http_req_sending...............: avg=33.46µs  min=5.22µs  med=17.11µs  max=121.71ms p(90)=21.49µs  p(95)=23.36µs  p(99.9)=507.35µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=183.52ms min=7.64ms  med=202.41ms max=389.91ms p(90)=213.84ms p(95)=218.92ms p(99.9)=290.2ms 
     http_reqs......................: 32641   269.757117/s
     iteration_duration.............: avg=184.48ms min=45.28ms med=202.79ms max=403.75ms p(90)=214.22ms p(95)=219.28ms p(99.9)=295.82ms
     iterations.....................: 32541   268.93068/s
     success_rate...................: 100.00% ✓ 32541      ✗ 0    
     vus............................: 8       min=8        max=50 
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

     checks.........................: 100.00% ✓ 93987      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 38 MB   312 kB/s
     http_req_blocked...............: avg=7.25µs   min=1.5µs   med=3.71µs   max=3.72ms   p(90)=5.13µs   p(95)=5.76µs   p(99.9)=1.71ms  
     http_req_connecting............: avg=3.23µs   min=0s      med=0s       max=3.67ms   p(90)=0s       p(95)=0s       p(99.9)=1.65ms  
     http_req_duration..............: avg=190.75ms min=6.2ms   med=179.26ms max=683.85ms p(90)=230.29ms p(95)=294.75ms p(99.9)=575.52ms
       { expected_response:true }...: avg=190.75ms min=6.2ms   med=179.26ms max=683.85ms p(90)=230.29ms p(95)=294.75ms p(99.9)=575.52ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 31429
     http_req_receiving.............: avg=94.53µs  min=39.96µs med=90.19µs  max=6.31ms   p(90)=120.27µs p(95)=132.27µs p(99.9)=629.46µs
     http_req_sending...............: avg=23.61µs  min=7.22µs  med=18.08µs  max=40.47ms  p(90)=22.65µs  p(95)=24.41µs  p(99.9)=450.44µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=190.63ms min=6.06ms  med=179.13ms max=683.75ms p(90)=230.18ms p(95)=294.61ms p(99.9)=575.4ms 
     http_reqs......................: 31429   260.014265/s
     iteration_duration.............: avg=191.63ms min=54.64ms med=179.64ms max=684.1ms  p(90)=230.75ms p(95)=297.41ms p(99.9)=575.8ms 
     iterations.....................: 31329   259.186958/s
     success_rate...................: 100.00% ✓ 31329      ✗ 0    
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

     checks.........................: 100.00% ✓ 8316      ✗ 0   
     data_received..................: 275 MB  2.2 MB/s
     data_sent......................: 3.4 MB  28 kB/s
     http_req_blocked...............: avg=45.41µs  min=1.5µs   med=4.04µs   max=4.11ms   p(90)=5.83µs   p(95)=6.75µs   p(99.9)=3.67ms  
     http_req_connecting............: avg=39.94µs  min=0s      med=0s       max=4.05ms   p(90)=0s       p(95)=0s       p(99.9)=3.63ms  
     http_req_duration..............: avg=2.1s     min=24.73ms med=2.12s    max=4.03s    p(90)=2.79s    p(95)=2.96s    p(99.9)=3.72s   
       { expected_response:true }...: avg=2.1s     min=24.73ms med=2.12s    max=4.03s    p(90)=2.79s    p(95)=2.96s    p(99.9)=3.72s   
     http_req_failed................: 0.00%   ✓ 0         ✗ 2872
     http_req_receiving.............: avg=109.35µs min=37.16µs med=102.63µs max=987.31µs p(90)=150.82µs p(95)=169.45µs p(99.9)=629.52µs
     http_req_sending...............: avg=64.58µs  min=7.62µs  med=20.6µs   max=51.97ms  p(90)=26.91µs  p(95)=31.43µs  p(99.9)=2.29ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=2.1s     min=24.57ms med=2.12s    max=4.03s    p(90)=2.79s    p(95)=2.96s    p(99.9)=3.72s   
     http_reqs......................: 2872    22.988022/s
     iteration_duration.............: avg=2.18s    min=809.9ms med=2.14s    max=4.03s    p(90)=2.8s     p(95)=2.97s    p(99.9)=3.73s   
     iterations.....................: 2772    22.187604/s
     success_rate...................: 100.00% ✓ 2772      ✗ 0   
     vus............................: 41      min=0       max=50
     vus_max........................: 50      min=50      max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

