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
| hive-router | v0.0.84 | 3,096 | 3,335 | 3,066 | 2.8% |  |
| fusion-nightly-net11 | 16.7.0-p.1 | 2,620 | 2,762 | 2,604 | 2.0% |  |
| fusion-nightly | 16.7.0-p.1 | 2,597 | 2,748 | 2,585 | 2.1% |  |
| fusion | 16.6.2 | 2,591 | 2,681 | 2,562 | 1.5% |  |
| fusion-nightly-fed | 16.7.0-p.1 | 2,425 | 2,499 | 2,410 | 1.1% |  |
| grafbase | 0.53.5 | 2,195 | 2,323 | 2,185 | 2.3% |  |
| cosmo | 0.334.0 | 1,271 | 1,323 | 1,261 | 1.7% |  |
| hive-gateway-router-runtime | 2.10.8 | 610 | 630 | 608 | 1.2% |  |
| apollo-router | v2.16.1 | 443 | 465 | 440 | 2.1% |  |
| apollo-gateway | 2.14.3 | 280 | 283 | 279 | 0.5% |  |
| hive-gateway | 2.10.8 | 272 | 280 | 271 | 1.0% |  |
| feddi | 5ff8b6165878 | — | — | — | — | non-compatible response (1328 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.84 | 2,580 | 2,757 | 2,555 | 2.8% |  |
| fusion | 16.6.2 | 2,474 | 2,585 | 2,468 | 1.7% |  |
| fusion-nightly | 16.7.0-p.1 | 2,463 | 2,547 | 2,457 | 1.5% |  |
| fusion-nightly-net11 | 16.7.0-p.1 | 2,456 | 2,565 | 2,425 | 2.1% |  |
| fusion-nightly-fed | 16.7.0-p.1 | 2,332 | 2,420 | 2,327 | 1.3% |  |
| grafbase | 0.53.5 | 1,652 | 1,701 | 1,643 | 1.2% |  |
| cosmo | 0.334.0 | 1,228 | 1,268 | 1,220 | 1.4% |  |
| hive-gateway-router-runtime | 2.10.8 | 571 | 590 | 566 | 1.4% |  |
| apollo-router | v2.16.1 | 450 | 463 | 448 | 1.3% |  |
| apollo-gateway | 2.14.3 | 267 | 271 | 266 | 0.6% |  |
| hive-gateway | 2.10.8 | 266 | 273 | 264 | 1.1% |  |
| feddi | 5ff8b6165878 | 20 | 21 | 19 | 3.0% |  |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.84)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 1116201     ✗ 0     
     data_received..................: 33 GB   272 MB/s
     data_sent......................: 447 MB  3.7 MB/s
     http_req_blocked...............: avg=2.79µs  min=891ns   med=2µs     max=19.22ms  p(90)=3.4µs   p(95)=4.1µs    p(99.9)=31.57µs
     http_req_connecting............: avg=225ns   min=0s      med=0s      max=3.37ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=15.91ms min=1.45ms  med=15.17ms max=295.35ms p(90)=23.2ms  p(95)=26.48ms  p(99.9)=46.54ms
       { expected_response:true }...: avg=15.91ms min=1.45ms  med=15.17ms max=295.35ms p(90)=23.2ms  p(95)=26.48ms  p(99.9)=46.54ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 372167
     http_req_receiving.............: avg=91.87µs min=25.85µs med=45.38µs max=126.01ms p(90)=85.6µs  p(95)=158.11µs p(99.9)=8.06ms 
     http_req_sending...............: avg=49.03µs min=4.63µs  med=8.43µs  max=184.58ms p(90)=15µs    p(95)=93.24µs  p(99.9)=6.71ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=15.77ms min=1.37ms  med=15.06ms max=284.63ms p(90)=23.02ms p(95)=26.21ms  p(99.9)=45.12ms
     http_reqs......................: 372167  3096.380578/s
     iteration_duration.............: avg=16.11ms min=2.07ms  med=15.36ms max=309.79ms p(90)=23.4ms  p(95)=26.7ms   p(99.9)=47.29ms
     iterations.....................: 372067  3095.548591/s
     success_rate...................: 100.00% ✓ 372067      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (rust subgraphs) (16.7.0-p.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 944901      ✗ 0     
     data_received..................: 28 GB   230 MB/s
     data_sent......................: 379 MB  3.1 MB/s
     http_req_blocked...............: avg=2.9µs    min=961ns   med=2.29µs  max=12.08ms  p(90)=3.55µs  p(95)=4.12µs  p(99.9)=32.45µs
     http_req_connecting............: avg=166ns    min=0s      med=0s      max=2.96ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=18.82ms  min=1.97ms  med=17.95ms max=296.96ms p(90)=27.3ms  p(95)=30.86ms p(99.9)=51.57ms
       { expected_response:true }...: avg=18.82ms  min=1.97ms  med=17.95ms max=296.96ms p(90)=27.3ms  p(95)=30.86ms p(99.9)=51.57ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 315067
     http_req_receiving.............: avg=495.64µs min=52.14µs med=96.95µs max=243.34ms p(90)=1.2ms   p(95)=1.86ms  p(99.9)=17.68ms
     http_req_sending...............: avg=43.73µs  min=4.56µs  med=8.95µs  max=137.62ms p(90)=15.61µs p(95)=90.22µs p(99.9)=3.92ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=18.28ms  min=1.83ms  med=17.42ms max=296.34ms p(90)=26.65ms p(95)=30.16ms p(99.9)=50.08ms
     http_reqs......................: 315067  2620.165159/s
     iteration_duration.............: avg=19.04ms  min=3.3ms   med=18.15ms max=315.8ms  p(90)=27.51ms p(95)=31.1ms  p(99.9)=52.1ms 
     iterations.....................: 314967  2619.333538/s
     success_rate...................: 100.00% ✓ 314967      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (rust subgraphs) (16.7.0-p.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 936858      ✗ 0     
     data_received..................: 27 GB   228 MB/s
     data_sent......................: 375 MB  3.1 MB/s
     http_req_blocked...............: avg=2.94µs   min=852ns   med=2.2µs   max=12.76ms  p(90)=3.58µs  p(95)=4.2µs   p(99.9)=34.52µs 
     http_req_connecting............: avg=290ns    min=0s      med=0s      max=4.06ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=18.98ms  min=2.03ms  med=16.47ms max=286.5ms  p(90)=30.68ms p(95)=36.86ms p(99.9)=110.81ms
       { expected_response:true }...: avg=18.98ms  min=2.03ms  med=16.47ms max=286.5ms  p(90)=30.68ms p(95)=36.86ms p(99.9)=110.81ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 312386
     http_req_receiving.............: avg=558.52µs min=51.56µs med=91.09µs max=127.44ms p(90)=1.09ms  p(95)=1.98ms  p(99.9)=25.36ms 
     http_req_sending...............: avg=45.06µs  min=4.37µs  med=8.52µs  max=133.56ms p(90)=15.73µs p(95)=90.22µs p(99.9)=4.93ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=18.38ms  min=1.93ms  med=15.95ms max=276.92ms p(90)=29.76ms p(95)=35.76ms p(99.9)=109.27ms
     http_reqs......................: 312386  2597.51195/s
     iteration_duration.............: avg=19.2ms   min=3.03ms  med=16.67ms max=306.17ms p(90)=30.91ms p(95)=37.11ms p(99.9)=111.7ms 
     iterations.....................: 312286  2596.680443/s
     success_rate...................: 100.00% ✓ 312286      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (rust subgraphs) (16.6.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 934662      ✗ 0     
     data_received..................: 27 GB   227 MB/s
     data_sent......................: 375 MB  3.1 MB/s
     http_req_blocked...............: avg=2.43µs   min=842ns   med=1.81µs  max=3.83ms   p(90)=2.94µs  p(95)=3.48µs  p(99.9)=26.84µs 
     http_req_connecting............: avg=286ns    min=0s      med=0s      max=3.78ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=19.04ms  min=2.03ms  med=16.37ms max=298.7ms  p(90)=30.85ms p(95)=37.33ms p(99.9)=120.34ms
       { expected_response:true }...: avg=19.04ms  min=2.03ms  med=16.37ms max=298.7ms  p(90)=30.85ms p(95)=37.33ms p(99.9)=120.34ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 311654
     http_req_receiving.............: avg=552.38µs min=52.15µs med=90.3µs  max=233.94ms p(90)=1.06ms  p(95)=1.88ms  p(99.9)=24.46ms 
     http_req_sending...............: avg=40.39µs  min=4.43µs  med=8.08µs  max=145.04ms p(90)=14.17µs p(95)=75.67µs p(99.9)=3.57ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=18.45ms  min=1.93ms  med=15.85ms max=298.15ms p(90)=29.94ms p(95)=36.29ms p(99.9)=119.02ms
     http_reqs......................: 311654  2591.336858/s
     iteration_duration.............: avg=19.25ms  min=3.13ms  med=16.56ms max=322.89ms p(90)=31.07ms p(95)=37.56ms p(99.9)=121.45ms
     iterations.....................: 311554  2590.505379/s
     success_rate...................: 100.00% ✓ 311554      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (rust subgraphs) (16.7.0-p.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 874503      ✗ 0     
     data_received..................: 26 GB   213 MB/s
     data_sent......................: 350 MB  2.9 MB/s
     http_req_blocked...............: avg=2.94µs   min=872ns  med=2.23µs  max=14.68ms  p(90)=3.52µs  p(95)=4.13µs  p(99.9)=34.71µs 
     http_req_connecting............: avg=301ns    min=0s     med=0s      max=3.6ms    p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=20.36ms  min=1.69ms med=16.77ms max=315.02ms p(90)=34.65ms p(95)=43.01ms p(99.9)=153.8ms 
       { expected_response:true }...: avg=20.36ms  min=1.69ms med=16.77ms max=315.02ms p(90)=34.65ms p(95)=43.01ms p(99.9)=153.8ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 291601
     http_req_receiving.............: avg=594.79µs min=50.4µs med=93.03µs max=208.41ms p(90)=1.08ms  p(95)=1.93ms  p(99.9)=28.87ms 
     http_req_sending...............: avg=40.49µs  min=4.54µs med=8.53µs  max=225.36ms p(90)=14.57µs p(95)=53.41µs p(99.9)=3.43ms  
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=19.72ms  min=1.58ms med=16.24ms max=313.69ms p(90)=33.67ms p(95)=41.87ms p(99.9)=151.56ms
     http_reqs......................: 291601  2425.668151/s
     iteration_duration.............: avg=20.57ms  min=2.7ms  med=16.97ms max=315.19ms p(90)=34.87ms p(95)=43.24ms p(99.9)=154.58ms
     iterations.....................: 291501  2424.836306/s
     success_rate...................: 100.00% ✓ 291501      ✗ 0     
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

     checks.........................: 100.00% ✓ 791499      ✗ 0     
     data_received..................: 23 GB   193 MB/s
     data_sent......................: 317 MB  2.6 MB/s
     http_req_blocked...............: avg=3.21µs  min=931ns   med=2.25µs  max=13.18ms  p(90)=3.8µs   p(95)=4.56µs  p(99.9)=37.4µs 
     http_req_connecting............: avg=314ns   min=0s      med=0s      max=3.36ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=22.51ms min=1.71ms  med=22.25ms max=290.3ms  p(90)=26.84ms p(95)=28.8ms  p(99.9)=49.11ms
       { expected_response:true }...: avg=22.51ms min=1.71ms  med=22.25ms max=290.3ms  p(90)=26.84ms p(95)=28.8ms  p(99.9)=49.11ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 263933
     http_req_receiving.............: avg=89.49µs min=26.57µs med=52.13µs max=75.85ms  p(90)=92.5µs  p(95)=123.2µs p(99.9)=7.11ms 
     http_req_sending...............: avg=38.03µs min=4.58µs  med=9.67µs  max=153.27ms p(90)=17.53µs p(95)=31.08µs p(99.9)=2.06ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=22.38ms min=1.65ms  med=22.16ms max=289.68ms p(90)=26.7ms  p(95)=28.62ms p(99.9)=47.84ms
     http_reqs......................: 263933  2195.302386/s
     iteration_duration.............: avg=22.73ms min=4.24ms  med=22.45ms max=300.78ms p(90)=27.04ms p(95)=29.03ms p(99.9)=49.71ms
     iterations.....................: 263833  2194.470621/s
     success_rate...................: 100.00% ✓ 263833      ✗ 0     
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

     checks.........................: 100.00% ✓ 458565      ✗ 0     
     data_received..................: 13 GB   112 MB/s
     data_sent......................: 184 MB  1.5 MB/s
     http_req_blocked...............: avg=3.37µs  min=932ns   med=2.43µs  max=4.17ms   p(90)=3.79µs  p(95)=4.38µs   p(99.9)=31.38µs 
     http_req_connecting............: avg=643ns   min=0s      med=0s      max=4.13ms   p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=39.01ms min=2ms     med=38.58ms max=300.79ms p(90)=54.47ms p(95)=59.3ms   p(99.9)=83.44ms 
       { expected_response:true }...: avg=39.01ms min=2ms     med=38.58ms max=300.79ms p(90)=54.47ms p(95)=59.3ms   p(99.9)=83.44ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 152955
     http_req_receiving.............: avg=72.21µs min=27.43µs med=58.17µs max=64.6ms   p(90)=92.48µs p(95)=108.14µs p(99.9)=981.54µs
     http_req_sending...............: avg=23.33µs min=4.97µs  med=10.22µs max=135.38ms p(90)=15.51µs p(95)=19.22µs  p(99.9)=947.52µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=38.92ms min=1.89ms  med=38.49ms max=300.27ms p(90)=54.38ms p(95)=59.21ms  p(99.9)=83.08ms 
     http_reqs......................: 152955  1271.661985/s
     iteration_duration.............: avg=39.24ms min=3.68ms  med=38.79ms max=319.57ms p(90)=54.67ms p(95)=59.51ms  p(99.9)=83.94ms 
     iterations.....................: 152855  1270.830589/s
     success_rate...................: 100.00% ✓ 152855      ✗ 0     
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

     checks.........................: 100.00% ✓ 220497    ✗ 0    
     data_received..................: 6.5 GB  54 MB/s
     data_sent......................: 88 MB   734 kB/s
     http_req_blocked...............: avg=4.42µs  min=1.21µs  med=2.81µs  max=3.57ms   p(90)=4.33µs   p(95)=4.97µs   p(99.9)=47.5µs  
     http_req_connecting............: avg=1.3µs   min=0s      med=0s      max=3.53ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=81.3ms  min=3.68ms  med=79.64ms max=313.85ms p(90)=101.09ms p(95)=111.69ms p(99.9)=191.37ms
       { expected_response:true }...: avg=81.3ms  min=3.68ms  med=79.64ms max=313.85ms p(90)=101.09ms p(95)=111.69ms p(99.9)=191.37ms
     http_req_failed................: 0.00%   ✓ 0         ✗ 73599
     http_req_receiving.............: avg=81.09µs min=29.91µs med=67.54µs max=118.81ms p(90)=101.19µs p(95)=113.6µs  p(99.9)=592.66µs
     http_req_sending...............: avg=22.26µs min=5.28µs  med=12.14µs max=110.98ms p(90)=18.17µs  p(95)=20.38µs  p(99.9)=616.72µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=81.2ms  min=3.58ms  med=79.54ms max=312.11ms p(90)=100.98ms p(95)=111.59ms p(99.9)=190.82ms
     http_reqs......................: 73599   610.85016/s
     iteration_duration.............: avg=81.63ms min=21.43ms med=79.87ms max=326.72ms p(90)=101.33ms p(95)=111.97ms p(99.9)=192ms   
     iterations.....................: 73499   610.02019/s
     success_rate...................: 100.00% ✓ 73499     ✗ 0    
     vus............................: 50      min=50      max=50 
     vus_max........................: 50      min=50      max=50
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

     checks.........................: 100.00% ✓ 160080     ✗ 0    
     data_received..................: 4.7 GB  39 MB/s
     data_sent......................: 64 MB   532 kB/s
     http_req_blocked...............: avg=4.62µs   min=1.09µs  med=2.82µs   max=3.45ms   p(90)=4.26µs   p(95)=4.78µs   p(99.9)=78.83µs 
     http_req_connecting............: avg=1.59µs   min=0s      med=0s       max=3.42ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=112.01ms min=4.7ms   med=111.73ms max=311.94ms p(90)=135.33ms p(95)=142.19ms p(99.9)=175.73ms
       { expected_response:true }...: avg=112.01ms min=4.7ms   med=111.73ms max=311.94ms p(90)=135.33ms p(95)=142.19ms p(99.9)=175.73ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 53460
     http_req_receiving.............: avg=78.49µs  min=30.28µs med=74.45µs  max=14.36ms  p(90)=105.01µs p(95)=117.19µs p(99.9)=521.82µs
     http_req_sending...............: avg=22.72µs  min=5µs     med=14.42µs  max=112.48ms p(90)=19.86µs  p(95)=21.57µs  p(99.9)=515.59µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=111.91ms min=4.58ms  med=111.63ms max=311.21ms p(90)=135.24ms p(95)=142.09ms p(99.9)=175.27ms
     http_reqs......................: 53460   443.273829/s
     iteration_duration.............: avg=112.47ms min=13.09ms med=112ms    max=339.52ms p(90)=135.58ms p(95)=142.48ms p(99.9)=177.94ms
     iterations.....................: 53360   442.44466/s
     success_rate...................: 100.00% ✓ 53360      ✗ 0    
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

     checks.........................: 100.00% ✓ 101445     ✗ 0    
     data_received..................: 3.0 GB  25 MB/s
     data_sent......................: 41 MB   337 kB/s
     http_req_blocked...............: avg=6.42µs   min=1.33µs  med=3.33µs   max=3.56ms   p(90)=4.59µs   p(95)=5.14µs   p(99.9)=1.24ms  
     http_req_connecting............: avg=2.86µs   min=0s      med=0s       max=3.52ms   p(90)=0s       p(95)=0s       p(99.9)=1.22ms  
     http_req_duration..............: avg=176.74ms min=7.3ms   med=178.89ms max=362.38ms p(90)=212.76ms p(95)=218.71ms p(99.9)=280.39ms
       { expected_response:true }...: avg=176.74ms min=7.3ms   med=178.89ms max=362.38ms p(90)=212.76ms p(95)=218.71ms p(99.9)=280.39ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 33915
     http_req_receiving.............: avg=86.19µs  min=35.77µs med=82.81µs  max=1.79ms   p(90)=112.93µs p(95)=123.51µs p(99.9)=491.64µs
     http_req_sending...............: avg=28.85µs  min=6.12µs  med=16.28µs  max=122.19ms p(90)=20.87µs  p(95)=22.68µs  p(99.9)=607.57µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=176.62ms min=7.17ms  med=178.78ms max=361.67ms p(90)=212.67ms p(95)=218.6ms  p(99.9)=280.26ms
     http_reqs......................: 33915   280.522744/s
     iteration_duration.............: avg=177.52ms min=43.37ms med=179.29ms max=384.93ms p(90)=213.04ms p(95)=219.02ms p(99.9)=284.02ms
     iterations.....................: 33815   279.695609/s
     success_rate...................: 100.00% ✓ 33815      ✗ 0    
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

     checks.........................: 100.00% ✓ 98490      ✗ 0    
     data_received..................: 2.9 GB  24 MB/s
     data_sent......................: 40 MB   327 kB/s
     http_req_blocked...............: avg=6.86µs   min=1.4µs   med=3.58µs   max=4.15ms   p(90)=4.97µs   p(95)=5.58µs   p(99.9)=1.48ms  
     http_req_connecting............: avg=3.02µs   min=0s      med=0s       max=4.11ms   p(90)=0s       p(95)=0s       p(99.9)=1.39ms  
     http_req_duration..............: avg=182.05ms min=6.07ms  med=167.04ms max=623.48ms p(90)=211.8ms  p(95)=256.46ms p(99.9)=546.5ms 
       { expected_response:true }...: avg=182.05ms min=6.07ms  med=167.04ms max=623.48ms p(90)=211.8ms  p(95)=256.46ms p(99.9)=546.5ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 32930
     http_req_receiving.............: avg=91.96µs  min=36.62µs med=84.84µs  max=24.76ms  p(90)=119.06µs p(95)=132.44µs p(99.9)=602.86µs
     http_req_sending...............: avg=23.47µs  min=5.98µs  med=17.5µs   max=29.95ms  p(90)=22.38µs  p(95)=24.05µs  p(99.9)=461.16µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=181.94ms min=5.96ms  med=166.93ms max=623.34ms p(90)=211.71ms p(95)=256.27ms p(99.9)=546.39ms
     http_reqs......................: 32930   272.438225/s
     iteration_duration.............: avg=182.86ms min=63.14ms med=167.37ms max=623.78ms p(90)=212.17ms p(95)=257.28ms p(99.9)=546.78ms
     iterations.....................: 32830   271.610899/s
     success_rate...................: 100.00% ✓ 32830      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
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

     checks.........................: 100.00% ✓ 930156      ✗ 0     
     data_received..................: 27 GB   226 MB/s
     data_sent......................: 373 MB  3.1 MB/s
     http_req_blocked...............: avg=3.59µs  min=892ns   med=2.23µs  max=8.8ms    p(90)=3.91µs  p(95)=4.75µs   p(99.9)=37.33µs
     http_req_connecting............: avg=902ns   min=0s      med=0s      max=8.62ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=19.12ms min=1.58ms  med=18.87ms max=278.16ms p(90)=26.35ms p(95)=28.71ms  p(99.9)=48.37ms
       { expected_response:true }...: avg=19.12ms min=1.58ms  med=18.87ms max=278.16ms p(90)=26.35ms p(95)=28.71ms  p(99.9)=48.37ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 310152
     http_req_receiving.............: avg=88.02µs min=25.88µs med=50.44µs max=81.09ms  p(90)=92.14µs p(95)=131.38µs p(99.9)=6.46ms 
     http_req_sending...............: avg=42.97µs min=4.57µs  med=9.33µs  max=209.28ms p(90)=17.7µs  p(95)=83.08µs  p(99.9)=3.06ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=18.99ms min=1.52ms  med=18.75ms max=277.11ms p(90)=26.21ms p(95)=28.51ms  p(99.9)=47.17ms
     http_reqs......................: 310152  2580.285084/s
     iteration_duration.............: avg=19.34ms min=3.49ms  med=19.06ms max=293.48ms p(90)=26.56ms p(95)=28.92ms  p(99.9)=48.83ms
     iterations.....................: 310052  2579.453142/s
     success_rate...................: 100.00% ✓ 310052      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (.net subgraphs) (16.6.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 892137      ✗ 0     
     data_received..................: 26 GB   217 MB/s
     data_sent......................: 358 MB  3.0 MB/s
     http_req_blocked...............: avg=4.92µs   min=951ns   med=2.67µs  max=220.22ms p(90)=4.32µs  p(95)=5.08µs  p(99.9)=37.94µs 
     http_req_connecting............: avg=1.63µs   min=0s      med=0s      max=220.05ms p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=19.94ms  min=1.64ms  med=16.88ms max=330.78ms p(90)=32.66ms p(95)=39.9ms  p(99.9)=135.51ms
       { expected_response:true }...: avg=19.94ms  min=1.64ms  med=16.88ms max=330.78ms p(90)=32.66ms p(95)=39.9ms  p(99.9)=135.51ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 297479
     http_req_receiving.............: avg=569.14µs min=50.08µs med=95.76µs max=188.33ms p(90)=1.09ms  p(95)=1.96ms  p(99.9)=26.71ms 
     http_req_sending...............: avg=45.59µs  min=4.57µs  med=9.67µs  max=83.05ms  p(90)=18.08µs p(95)=95.78µs p(99.9)=4.21ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=19.33ms  min=1.55ms  med=16.34ms max=330.67ms p(90)=31.69ms p(95)=38.75ms p(99.9)=134.34ms
     http_reqs......................: 297479  2474.623961/s
     iteration_duration.............: avg=20.16ms  min=2.53ms  med=17.09ms max=331ms    p(90)=32.89ms p(95)=40.14ms p(99.9)=136.99ms
     iterations.....................: 297379  2473.792096/s
     success_rate...................: 100.00% ✓ 297379      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.7.0-p.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 888189      ✗ 0     
     data_received..................: 26 GB   216 MB/s
     data_sent......................: 356 MB  3.0 MB/s
     http_req_blocked...............: avg=3.57µs  min=912ns   med=2.35µs  max=15.93ms  p(90)=3.85µs  p(95)=4.55µs  p(99.9)=36.82µs 
     http_req_connecting............: avg=699ns   min=0s      med=0s      max=8.23ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=20.03ms min=1.56ms  med=16.87ms max=345.11ms p(90)=33.11ms p(95)=40.44ms p(99.9)=136.51ms
       { expected_response:true }...: avg=20.03ms min=1.56ms  med=16.87ms max=345.11ms p(90)=33.11ms p(95)=40.44ms p(99.9)=136.51ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 296163
     http_req_receiving.............: avg=580.2µs min=49.86µs med=92.62µs max=164.42ms p(90)=1.09ms  p(95)=1.99ms  p(99.9)=27.45ms 
     http_req_sending...............: avg=44.71µs min=4.57µs  med=9.36µs  max=227.08ms p(90)=18.3µs  p(95)=83.79µs p(99.9)=4.46ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=19.4ms  min=1.47ms  med=16.33ms max=345.03ms p(90)=32.08ms p(95)=39.32ms p(99.9)=134.11ms
     http_reqs......................: 296163  2463.765272/s
     iteration_duration.............: avg=20.25ms min=2.5ms   med=17.07ms max=345.26ms p(90)=33.35ms p(95)=40.7ms  p(99.9)=137.69ms
     iterations.....................: 296063  2462.933377/s
     success_rate...................: 100.00% ✓ 296063      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (.net subgraphs) (16.7.0-p.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 885588      ✗ 0     
     data_received..................: 26 GB   215 MB/s
     data_sent......................: 355 MB  3.0 MB/s
     http_req_blocked...............: avg=3.73µs   min=911ns   med=2.71µs   max=21.08ms  p(90)=4.37µs  p(95)=5.1µs   p(99.9)=36.83µs
     http_req_connecting............: avg=298ns    min=0s      med=0s       max=3.56ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=20.08ms  min=1.53ms  med=19.19ms  max=241.95ms p(90)=29.24ms p(95)=33.01ms p(99.9)=55.5ms 
       { expected_response:true }...: avg=20.08ms  min=1.53ms  med=19.19ms  max=241.95ms p(90)=29.24ms p(95)=33.01ms p(99.9)=55.5ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 295296
     http_req_receiving.............: avg=561.91µs min=53.23µs med=105.38µs max=48.65ms  p(90)=1.4ms   p(95)=2.23ms  p(99.9)=19.05ms
     http_req_sending...............: avg=47.29µs  min=4.61µs  med=10.31µs  max=53.87ms  p(90)=19.71µs p(95)=99.6µs  p(99.9)=4.14ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=19.47ms  min=1.44ms  med=18.59ms  max=236.02ms p(90)=28.52ms p(95)=32.21ms p(99.9)=54.11ms
     http_reqs......................: 295296  2456.692424/s
     iteration_duration.............: avg=20.31ms  min=2.69ms  med=19.4ms   max=337.48ms p(90)=29.48ms p(95)=33.26ms p(99.9)=56.27ms
     iterations.....................: 295196  2455.860482/s
     success_rate...................: 100.00% ✓ 295196      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (.net subgraphs) (16.7.0-p.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 840927      ✗ 0     
     data_received..................: 25 GB   204 MB/s
     data_sent......................: 337 MB  2.8 MB/s
     http_req_blocked...............: avg=3.01µs   min=841ns   med=2.1µs   max=17.68ms  p(90)=3.72µs  p(95)=4.49µs  p(99.9)=33.76µs 
     http_req_connecting............: avg=304ns    min=0s      med=0s      max=3.26ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=21.17ms  min=1.84ms  med=17.84ms max=352.1ms  p(90)=34.58ms p(95)=42.6ms  p(99.9)=148.54ms
       { expected_response:true }...: avg=21.17ms  min=1.84ms  med=17.84ms max=352.1ms  p(90)=34.58ms p(95)=42.6ms  p(99.9)=148.54ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 280409
     http_req_receiving.............: avg=572.76µs min=51.59µs med=99.35µs max=250.48ms p(90)=1.1ms   p(95)=1.88ms  p(99.9)=25.39ms 
     http_req_sending...............: avg=40.11µs  min=4.57µs  med=9.01µs  max=239.45ms p(90)=18.41µs p(95)=73.91µs p(99.9)=2.72ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=20.56ms  min=1.74ms  med=17.3ms  max=351.42ms p(90)=33.59ms p(95)=41.49ms p(99.9)=146.6ms 
     http_reqs......................: 280409  2332.261459/s
     iteration_duration.............: avg=21.39ms  min=2.97ms  med=18.04ms max=352.3ms  p(90)=34.81ms p(95)=42.84ms p(99.9)=149.58ms
     iterations.....................: 280309  2331.429723/s
     success_rate...................: 100.00% ✓ 280309      ✗ 0     
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

     checks.........................: 100.00% ✓ 595956      ✗ 0     
     data_received..................: 17 GB   145 MB/s
     data_sent......................: 239 MB  2.0 MB/s
     http_req_blocked...............: avg=3.31µs  min=852ns   med=2.22µs  max=4.08ms   p(90)=4.52µs   p(95)=5.6µs    p(99.9)=44.79µs
     http_req_connecting............: avg=483ns   min=0s      med=0s      max=4.04ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=29.94ms min=2.3ms   med=29.39ms max=292.84ms p(90)=39.35ms  p(95)=42.7ms   p(99.9)=64.14ms
       { expected_response:true }...: avg=29.94ms min=2.3ms   med=29.39ms max=292.84ms p(90)=39.35ms  p(95)=42.7ms   p(99.9)=64.14ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 198752
     http_req_receiving.............: avg=95.4µs  min=27.15µs med=56.5µs  max=201.23ms p(90)=125.96µs p(95)=193.69µs p(99.9)=3.85ms 
     http_req_sending...............: avg=40.55µs min=4.58µs  med=9.49µs  max=209.87ms p(90)=24.53µs  p(95)=103.2µs  p(99.9)=2.76ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=29.81ms min=2.2ms   med=29.27ms max=276.17ms p(90)=39.19ms  p(95)=42.54ms  p(99.9)=63.42ms
     http_reqs......................: 198752  1652.339971/s
     iteration_duration.............: avg=30.19ms min=6.69ms  med=29.61ms max=319.66ms p(90)=39.57ms  p(95)=42.92ms  p(99.9)=64.45ms
     iterations.....................: 198652  1651.508613/s
     success_rate...................: 100.00% ✓ 198652      ✗ 0     
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

     checks.........................: 100.00% ✓ 443166      ✗ 0     
     data_received..................: 13 GB   108 MB/s
     data_sent......................: 178 MB  1.5 MB/s
     http_req_blocked...............: avg=3.33µs  min=931ns   med=2.44µs  max=3.36ms   p(90)=4.12µs   p(95)=4.8µs    p(99.9)=31.52µs 
     http_req_connecting............: avg=559ns   min=0s      med=0s      max=3.32ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=40.37ms min=2.13ms  med=40ms    max=288.63ms p(90)=56.18ms  p(95)=61.03ms  p(99.9)=84.99ms 
       { expected_response:true }...: avg=40.37ms min=2.13ms  med=40ms    max=288.63ms p(90)=56.18ms  p(95)=61.03ms  p(99.9)=84.99ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 147822
     http_req_receiving.............: avg=75.82µs min=26.42µs med=63.45µs max=144.87ms p(90)=102.28µs p(95)=117.99µs p(99.9)=866.28µs
     http_req_sending...............: avg=29.58µs min=4.83µs  med=11.79µs max=164ms    p(90)=19.04µs  p(95)=22.53µs  p(99.9)=997.33µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=40.26ms min=2.05ms  med=39.9ms  max=288.12ms p(90)=56.07ms  p(95)=60.91ms  p(99.9)=84.62ms 
     http_reqs......................: 147822  1228.915914/s
     iteration_duration.............: avg=40.61ms min=4.06ms  med=40.23ms max=297.41ms p(90)=56.39ms  p(95)=61.24ms  p(99.9)=85.46ms 
     iterations.....................: 147722  1228.084566/s
     success_rate...................: 100.00% ✓ 147722      ✗ 0     
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

     checks.........................: 100.00% ✓ 206460     ✗ 0    
     data_received..................: 6.0 GB  50 MB/s
     data_sent......................: 83 MB   687 kB/s
     http_req_blocked...............: avg=4.21µs  min=1.01µs  med=2.78µs  max=3.33ms   p(90)=4.29µs   p(95)=4.89µs   p(99.9)=47.11µs 
     http_req_connecting............: avg=1.19µs  min=0s      med=0s      max=3.29ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=86.83ms min=3.86ms  med=84.85ms max=321.83ms p(90)=108.51ms p(95)=120.6ms  p(99.9)=209.09ms
       { expected_response:true }...: avg=86.83ms min=3.86ms  med=84.85ms max=321.83ms p(90)=108.51ms p(95)=120.6ms  p(99.9)=209.09ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 68920
     http_req_receiving.............: avg=83.39µs min=26.99µs med=71.37µs max=93.32ms  p(90)=107.62µs p(95)=120.95µs p(99.9)=668.44µs
     http_req_sending...............: avg=20.75µs min=5µs     med=12.77µs max=106.33ms p(90)=19.83µs  p(95)=21.95µs  p(99.9)=567.06µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=86.73ms min=3.78ms  med=84.76ms max=303.91ms p(90)=108.4ms  p(95)=120.48ms p(99.9)=208.57ms
     http_reqs......................: 68920   571.917032/s
     iteration_duration.............: avg=87.19ms min=19.93ms med=85.1ms  max=342.63ms p(90)=108.75ms p(95)=120.86ms p(99.9)=211.45ms
     iterations.....................: 68820   571.087205/s
     success_rate...................: 100.00% ✓ 68820      ✗ 0    
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

     checks.........................: 100.00% ✓ 162648     ✗ 0    
     data_received..................: 4.8 GB  39 MB/s
     data_sent......................: 65 MB   541 kB/s
     http_req_blocked...............: avg=5.6µs    min=1.43µs  med=3.74µs   max=3.49ms   p(90)=5.23µs   p(95)=5.84µs   p(99.9)=90.08µs 
     http_req_connecting............: avg=1.59µs   min=0s      med=0s       max=3.45ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=110.2ms  min=5.15ms  med=108.1ms  max=331.86ms p(90)=145.49ms p(95)=156.42ms p(99.9)=200.1ms 
       { expected_response:true }...: avg=110.2ms  min=5.15ms  med=108.1ms  max=331.86ms p(90)=145.49ms p(95)=156.42ms p(99.9)=200.1ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 54316
     http_req_receiving.............: avg=89.71µs  min=32.71µs med=84.7µs   max=69.09ms  p(90)=116.16µs p(95)=128.63µs p(99.9)=670.82µs
     http_req_sending...............: avg=26.23µs  min=5.92µs  med=18.21µs  max=143.34ms p(90)=23.5µs   p(95)=25.56µs  p(99.9)=596.33µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=110.09ms min=5.04ms  med=107.98ms max=331.27ms p(90)=145.37ms p(95)=156.28ms p(99.9)=199.91ms
     http_reqs......................: 54316   450.186398/s
     iteration_duration.............: avg=110.68ms min=34.79ms med=108.43ms max=344.58ms p(90)=145.79ms p(95)=156.7ms  p(99.9)=201.55ms
     iterations.....................: 54216   449.357569/s
     success_rate...................: 100.00% ✓ 54216      ✗ 0    
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

     checks.........................: 100.00% ✓ 96807      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 39 MB   321 kB/s
     http_req_blocked...............: avg=6.61µs   min=1.24µs  med=3.64µs   max=4ms      p(90)=5.05µs   p(95)=5.64µs   p(99.9)=1.1ms   
     http_req_connecting............: avg=2.6µs    min=0s      med=0s       max=3.96ms   p(90)=0s       p(95)=0s       p(99.9)=931.43µs
     http_req_duration..............: avg=185.19ms min=7.72ms  med=190.77ms max=391.08ms p(90)=203.59ms p(95)=209.43ms p(99.9)=286.78ms
       { expected_response:true }...: avg=185.19ms min=7.72ms  med=190.77ms max=391.08ms p(90)=203.59ms p(95)=209.43ms p(99.9)=286.78ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32369
     http_req_receiving.............: avg=100.4µs  min=34.53µs med=89.6µs   max=129.48ms p(90)=120.49µs p(95)=132.04µs p(99.9)=700.33µs
     http_req_sending...............: avg=33.03µs  min=5.55µs  med=17.43µs  max=118.95ms p(90)=22.08µs  p(95)=23.92µs  p(99.9)=525.17µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=185.06ms min=7.58ms  med=190.66ms max=390.5ms  p(90)=203.48ms p(95)=209.29ms p(99.9)=286.49ms
     http_reqs......................: 32369   267.572772/s
     iteration_duration.............: avg=186.05ms min=24.13ms med=191.12ms max=402ms    p(90)=203.88ms p(95)=209.75ms p(99.9)=290.95ms
     iterations.....................: 32269   266.746139/s
     success_rate...................: 100.00% ✓ 32269      ✗ 0    
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

     checks.........................: 100.00% ✓ 96189      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 39 MB   320 kB/s
     http_req_blocked...............: avg=6.04µs   min=1.16µs  med=3.1µs    max=3.43ms   p(90)=4.48µs   p(95)=5.05µs   p(99.9)=1.36ms  
     http_req_connecting............: avg=2.7µs    min=0s      med=0s       max=3.4ms    p(90)=0s       p(95)=0s       p(99.9)=1.34ms  
     http_req_duration..............: avg=186.39ms min=5.73ms  med=171.16ms max=666.41ms p(90)=218.89ms p(95)=261.06ms p(99.9)=622.64ms
       { expected_response:true }...: avg=186.39ms min=5.73ms  med=171.16ms max=666.41ms p(90)=218.89ms p(95)=261.06ms p(99.9)=622.64ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32163
     http_req_receiving.............: avg=92.74µs  min=31.38µs med=89.08µs  max=24.79ms  p(90)=118.83µs p(95)=130.45µs p(99.9)=543.53µs
     http_req_sending...............: avg=25.19µs  min=5.34µs  med=17.33µs  max=56.81ms  p(90)=22.02µs  p(95)=23.87µs  p(99.9)=521.84µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=186.27ms min=5.65ms  med=171.06ms max=666.29ms p(90)=218.75ms p(95)=260.98ms p(99.9)=622.52ms
     http_reqs......................: 32163   266.142195/s
     iteration_duration.............: avg=187.23ms min=36.03ms med=171.49ms max=666.64ms p(90)=219.23ms p(95)=261.96ms p(99.9)=623ms   
     iterations.....................: 32063   265.314716/s
     success_rate...................: 100.00% ✓ 32063      ✗ 0    
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

     checks.........................: 100.00% ✓ 7278      ✗ 0   
     data_received..................: 242 MB  1.9 MB/s
     data_sent......................: 3.0 MB  24 kB/s
     http_req_blocked...............: avg=92.95µs min=1.21µs   med=3.09µs  max=7.18ms  p(90)=4.56µs   p(95)=5.5µs    p(99.9)=6.92ms  
     http_req_connecting............: avg=86.19µs min=0s       med=0s      max=7.03ms  p(90)=0s       p(95)=0s       p(99.9)=6.78ms  
     http_req_duration..............: avg=2.39s   min=28.69ms  med=2.45s   max=4.52s   p(90)=3.23s    p(95)=3.44s    p(99.9)=4.32s   
       { expected_response:true }...: avg=2.39s   min=28.69ms  med=2.45s   max=4.52s   p(90)=3.23s    p(95)=3.44s    p(99.9)=4.32s   
     http_req_failed................: 0.00%   ✓ 0         ✗ 2526
     http_req_receiving.............: avg=95.61µs min=32.96µs  med=91.22µs max=655.2µs p(90)=136.94µs p(95)=151.57µs p(99.9)=365.91µs
     http_req_sending...............: avg=69.39µs min=5.8µs    med=18µs    max=5.32ms  p(90)=23.07µs  p(95)=27.33µs  p(99.9)=3.07ms  
     http_req_tls_handshaking.......: avg=0s      min=0s       med=0s      max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=2.39s   min=28.51ms  med=2.45s   max=4.52s   p(90)=3.23s    p(95)=3.44s    p(99.9)=4.31s   
     http_reqs......................: 2526    20.050393/s
     iteration_duration.............: avg=2.49s   min=834.75ms med=2.48s   max=4.52s   p(90)=3.24s    p(95)=3.46s    p(99.9)=4.32s   
     iterations.....................: 2426    19.256633/s
     success_rate...................: 100.00% ✓ 2426      ✗ 0   
     vus............................: 49      min=0       max=50
     vus_max........................: 50      min=50      max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

