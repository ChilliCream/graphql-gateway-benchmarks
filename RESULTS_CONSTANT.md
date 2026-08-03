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
| hive-router | v0.0.84 | 3,011 | 3,241 | 2,949 | 3.3% |  |
| fusion-nightly-net11 | 16.6.0-p.13 | 2,639 | 2,729 | 2,630 | 1.6% |  |
| fusion-nightly | 16.6.0-p.13 | 2,627 | 2,750 | 2,614 | 1.8% |  |
| fusion | 16.5.1 | 2,488 | 2,597 | 2,478 | 1.7% |  |
| grafbase | 0.53.5 | 2,136 | 2,266 | 2,122 | 2.4% |  |
| cosmo | 0.334.0 | 1,268 | 1,315 | 1,259 | 1.7% |  |
| hive-gateway-router-runtime | 2.10.8 | 615 | 633 | 614 | 1.0% |  |
| apollo-router | v2.16.1 | 444 | 465 | 440 | 2.2% |  |
| apollo-gateway | 2.14.3 | 280 | 285 | 277 | 0.8% |  |
| hive-gateway | 2.10.8 | 274 | 281 | 273 | 1.1% |  |
| feddi | 5ff8b6165878 | — | — | — | — | non-compatible response (1204 across 9/9 runs) |
| fusion-nightly-fed | — | — | — | — | — | not run |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.84 | 2,544 | 2,748 | 2,510 | 3.1% |  |
| fusion-nightly-net11 | 16.6.0-p.13 | 2,500 | 2,601 | 2,448 | 1.8% |  |
| fusion-nightly | 16.6.0-p.13 | 2,462 | 2,581 | 2,453 | 1.8% |  |
| fusion | 16.5.1 | 2,409 | 2,518 | 2,381 | 1.8% |  |
| fusion-nightly-fed | 16.6.0-p.13 | 2,186 | 2,287 | 2,179 | 1.9% |  |
| grafbase | 0.53.5 | 1,649 | 1,712 | 1,641 | 1.5% |  |
| cosmo | 0.334.0 | 1,190 | 1,241 | 1,182 | 1.7% |  |
| hive-gateway-router-runtime | 2.10.8 | 575 | 596 | 570 | 1.6% |  |
| apollo-router | v2.16.1 | 444 | 462 | 442 | 1.8% |  |
| hive-gateway | 2.10.8 | 269 | 275 | 267 | 0.9% |  |
| apollo-gateway | 2.14.3 | 264 | 269 | 263 | 0.7% |  |
| feddi | 5ff8b6165878 | 21 | 23 | 20 | 5.7% |  |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.84)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 1085427     ✗ 0     
     data_received..................: 32 GB   264 MB/s
     data_sent......................: 435 MB  3.6 MB/s
     http_req_blocked...............: avg=3.03µs  min=992ns   med=2.31µs  max=17.04ms  p(90)=3.59µs  p(95)=4.18µs   p(99.9)=36.33µs
     http_req_connecting............: avg=253ns   min=0s      med=0s      max=3.88ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=16.37ms min=1.39ms  med=15.62ms max=288.21ms p(90)=24.1ms  p(95)=27.38ms  p(99.9)=47.47ms
       { expected_response:true }...: avg=16.37ms min=1.39ms  med=15.62ms max=288.21ms p(90)=24.1ms  p(95)=27.38ms  p(99.9)=47.47ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 361909
     http_req_receiving.............: avg=90.9µs  min=25.19µs med=46.81µs max=67.23ms  p(90)=85.49µs p(95)=159.81µs p(99.9)=7.69ms 
     http_req_sending...............: avg=47.39µs min=4.48µs  med=8.68µs  max=144.35ms p(90)=14.9µs  p(95)=97.09µs  p(99.9)=5.6ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=16.23ms min=1.32ms  med=15.51ms max=255.19ms p(90)=23.92ms p(95)=27.11ms  p(99.9)=46.55ms
     http_reqs......................: 361909  3011.622525/s
     iteration_duration.............: avg=16.57ms min=1.89ms  med=15.81ms max=300.11ms p(90)=24.3ms  p(95)=27.62ms  p(99.9)=48.06ms
     iterations.....................: 361809  3010.790376/s
     success_rate...................: 100.00% ✓ 361809      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (rust subgraphs) (16.6.0-p.13)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 951777      ✗ 0     
     data_received..................: 28 GB   231 MB/s
     data_sent......................: 381 MB  3.2 MB/s
     http_req_blocked...............: avg=2.83µs   min=892ns  med=1.97µs   max=25.84ms  p(90)=3.38µs  p(95)=4.08µs  p(99.9)=28.65µs
     http_req_connecting............: avg=282ns    min=0s     med=0s       max=3.91ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=18.68ms  min=1.98ms med=17.78ms  max=289.36ms p(90)=26.77ms p(95)=30.35ms p(99.9)=51.32ms
       { expected_response:true }...: avg=18.68ms  min=1.98ms med=17.78ms  max=289.36ms p(90)=26.77ms p(95)=30.35ms p(99.9)=51.32ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 317359
     http_req_receiving.............: avg=667.05µs min=52.5µs med=101.33µs max=40.45ms  p(90)=1.72ms  p(95)=2.58ms  p(99.9)=20.91ms
     http_req_sending...............: avg=47.16µs  min=4.56µs med=8.24µs   max=115.46ms p(90)=16.69µs p(95)=89.02µs p(99.9)=5.93ms 
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=17.97ms  min=1.85ms med=17.08ms  max=284.24ms p(90)=25.9ms  p(95)=29.44ms p(99.9)=49.58ms
     http_reqs......................: 317359  2639.39333/s
     iteration_duration.............: avg=18.9ms   min=3.38ms med=17.98ms  max=298.52ms p(90)=26.99ms p(95)=30.59ms p(99.9)=51.93ms
     iterations.....................: 317259  2638.561655/s
     success_rate...................: 100.00% ✓ 317259      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (rust subgraphs) (16.6.0-p.13)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 947583      ✗ 0     
     data_received..................: 28 GB   230 MB/s
     data_sent......................: 380 MB  3.2 MB/s
     http_req_blocked...............: avg=2.64µs   min=832ns   med=1.86µs  max=16.17ms  p(90)=3.11µs  p(95)=3.71µs  p(99.9)=28.36µs 
     http_req_connecting............: avg=333ns    min=0s      med=0s      max=3.98ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=18.78ms  min=1.92ms  med=16.19ms max=328.71ms p(90)=30.43ms p(95)=36.79ms p(99.9)=116.39ms
       { expected_response:true }...: avg=18.78ms  min=1.92ms  med=16.19ms max=328.71ms p(90)=30.43ms p(95)=36.79ms p(99.9)=116.39ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 315961
     http_req_receiving.............: avg=561.52µs min=50.01µs med=88.55µs max=305.5ms  p(90)=1.04ms  p(95)=1.84ms  p(99.9)=25.49ms 
     http_req_sending...............: avg=42.36µs  min=4.37µs  med=8.1µs   max=35.08ms  p(90)=14.88µs p(95)=77.49µs p(99.9)=4.88ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=18.18ms  min=1.84ms  med=15.68ms max=314.26ms p(90)=29.48ms p(95)=35.75ms p(99.9)=112.96ms
     http_reqs......................: 315961  2627.521397/s
     iteration_duration.............: avg=18.98ms  min=2.97ms  med=16.38ms max=344.77ms p(90)=30.64ms p(95)=37.01ms p(99.9)=116.71ms
     iterations.....................: 315861  2626.6898/s
     success_rate...................: 100.00% ✓ 315861      ✗ 0     
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

     checks.........................: 100.00% ✓ 897333      ✗ 0     
     data_received..................: 26 GB   218 MB/s
     data_sent......................: 360 MB  3.0 MB/s
     http_req_blocked...............: avg=2.95µs   min=952ns   med=2.28µs  max=6.88ms   p(90)=3.51µs  p(95)=4.06µs  p(99.9)=32.73µs 
     http_req_connecting............: avg=306ns    min=0s      med=0s      max=4.08ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=19.84ms  min=1.98ms  med=16.91ms max=353.11ms p(90)=32.51ms p(95)=39.62ms p(99.9)=131.24ms
       { expected_response:true }...: avg=19.84ms  min=1.98ms  med=16.91ms max=353.11ms p(90)=32.51ms p(95)=39.62ms p(99.9)=131.24ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 299211
     http_req_receiving.............: avg=597.54µs min=52.04µs med=94.23µs max=209.87ms p(90)=1.1ms   p(95)=2.01ms  p(99.9)=27.1ms  
     http_req_sending...............: avg=40.94µs  min=4.76µs  med=8.66µs  max=107.34ms p(90)=14.23µs p(95)=80.98µs p(99.9)=3.65ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=19.2ms   min=1.87ms  med=16.35ms max=353.01ms p(90)=31.5ms  p(95)=38.5ms  p(99.9)=129.85ms
     http_reqs......................: 299211  2488.343124/s
     iteration_duration.............: avg=20.05ms  min=2.99ms  med=17.11ms max=353.28ms p(90)=32.73ms p(95)=39.85ms p(99.9)=131.5ms 
     iterations.....................: 299111  2487.511489/s
     success_rate...................: 100.00% ✓ 299111      ✗ 0     
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

     checks.........................: 100.00% ✓ 770280      ✗ 0     
     data_received..................: 23 GB   188 MB/s
     data_sent......................: 309 MB  2.6 MB/s
     http_req_blocked...............: avg=2.9µs   min=942ns  med=2.12µs  max=13.34ms  p(90)=3.58µs  p(95)=4.28µs  p(99.9)=33.38µs
     http_req_connecting............: avg=403ns   min=0s     med=0s      max=13.29ms  p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=23.15ms min=1.67ms med=22.92ms max=309.64ms p(90)=27.44ms p(95)=29.18ms p(99.9)=48.37ms
       { expected_response:true }...: avg=23.15ms min=1.67ms med=22.92ms max=309.64ms p(90)=27.44ms p(95)=29.18ms p(99.9)=48.37ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 256860
     http_req_receiving.............: avg=83.96µs min=26.6µs med=52.06µs max=68.88ms  p(90)=88.26µs p(95)=113.8µs p(99.9)=5.31ms 
     http_req_sending...............: avg=35.05µs min=4.58µs med=9.03µs  max=160.64ms p(90)=15.16µs p(95)=24.15µs p(99.9)=1.68ms 
     http_req_tls_handshaking.......: avg=0s      min=0s     med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=23.03ms min=1.62ms med=22.82ms max=309.27ms p(90)=27.31ms p(95)=29.01ms p(99.9)=47.08ms
     http_reqs......................: 256860  2136.468487/s
     iteration_duration.............: avg=23.36ms min=3.88ms med=23.1ms  max=321.16ms p(90)=27.64ms p(95)=29.39ms p(99.9)=48.92ms
     iterations.....................: 256760  2135.636723/s
     success_rate...................: 100.00% ✓ 256760      ✗ 0     
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

     checks.........................: 100.00% ✓ 457251      ✗ 0     
     data_received..................: 13 GB   111 MB/s
     data_sent......................: 183 MB  1.5 MB/s
     http_req_blocked...............: avg=3.41µs  min=1.08µs  med=2.51µs  max=3.94ms   p(90)=3.93µs  p(95)=4.58µs   p(99.9)=33.91µs 
     http_req_connecting............: avg=602ns   min=0s      med=0s      max=3.9ms    p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=39.12ms min=2.04ms  med=38.73ms max=299.49ms p(90)=54.64ms p(95)=59.42ms  p(99.9)=82.72ms 
       { expected_response:true }...: avg=39.12ms min=2.04ms  med=38.73ms max=299.49ms p(90)=54.64ms p(95)=59.42ms  p(99.9)=82.72ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 152517
     http_req_receiving.............: avg=75.54µs min=26.53µs med=61.41µs max=110.75ms p(90)=98.28µs p(95)=114.69µs p(99.9)=878.52µs
     http_req_sending...............: avg=25.01µs min=4.86µs  med=10.8µs  max=119.92ms p(90)=16.97µs p(95)=20.96µs  p(99.9)=994.34µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=39.02ms min=1.95ms  med=38.63ms max=296.26ms p(90)=54.54ms p(95)=59.31ms  p(99.9)=82.59ms 
     http_reqs......................: 152517  1268.048818/s
     iteration_duration.............: avg=39.36ms min=3.85ms  med=38.93ms max=321.21ms p(90)=54.84ms p(95)=59.62ms  p(99.9)=83.08ms 
     iterations.....................: 152417  1267.217403/s
     success_rate...................: 100.00% ✓ 152417      ✗ 0     
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

     checks.........................: 100.00% ✓ 222177     ✗ 0    
     data_received..................: 6.5 GB  54 MB/s
     data_sent......................: 89 MB   739 kB/s
     http_req_blocked...............: avg=5.16µs  min=982ns   med=2.2µs   max=7.73ms   p(90)=3.65µs  p(95)=4.23µs   p(99.9)=43.54µs 
     http_req_connecting............: avg=2.55µs  min=0s      med=0s      max=7.7ms    p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=80.7ms  min=3.56ms  med=78.99ms max=319.93ms p(90)=98.76ms p(95)=108.22ms p(99.9)=185.55ms
       { expected_response:true }...: avg=80.7ms  min=3.56ms  med=78.99ms max=319.93ms p(90)=98.76ms p(95)=108.22ms p(99.9)=185.55ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 74159
     http_req_receiving.............: avg=74.73µs min=29.18µs med=63.25µs max=117.78ms p(90)=98.68µs p(95)=112.03µs p(99.9)=629.37µs
     http_req_sending...............: avg=20.32µs min=4.86µs  med=10.97µs max=65.44ms  p(90)=17.7µs  p(95)=19.76µs  p(99.9)=889.72µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=80.6ms  min=3.49ms  med=78.9ms  max=309.11ms p(90)=98.67ms p(95)=108.12ms p(99.9)=185.12ms
     http_reqs......................: 74159   615.487787/s
     iteration_duration.............: avg=81.03ms min=21.94ms med=79.21ms max=327.76ms p(90)=98.99ms p(95)=108.44ms p(99.9)=187.52ms
     iterations.....................: 74059   614.65783/s
     success_rate...................: 100.00% ✓ 74059      ✗ 0    
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

     checks.........................: 100.00% ✓ 160485     ✗ 0    
     data_received..................: 4.7 GB  39 MB/s
     data_sent......................: 64 MB   534 kB/s
     http_req_blocked...............: avg=4.85µs   min=1.09µs  med=2.87µs   max=3.57ms   p(90)=4.22µs   p(95)=4.74µs   p(99.9)=105.32µs
     http_req_connecting............: avg=1.78µs   min=0s      med=0s       max=3.53ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=111.73ms min=4.71ms  med=111.46ms max=312.25ms p(90)=135.11ms p(95)=142.11ms p(99.9)=174.06ms
       { expected_response:true }...: avg=111.73ms min=4.71ms  med=111.46ms max=312.25ms p(90)=135.11ms p(95)=142.11ms p(99.9)=174.06ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 53595
     http_req_receiving.............: avg=86.22µs  min=28.17µs med=73.81µs  max=137.9ms  p(90)=105.81µs p(95)=118.52µs p(99.9)=518.54µs
     http_req_sending...............: avg=25.43µs  min=5.22µs  med=14.38µs  max=114.85ms p(90)=19.74µs  p(95)=21.51µs  p(99.9)=477.43µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=111.62ms min=4.6ms   med=111.36ms max=311.65ms p(90)=135ms    p(95)=141.99ms p(99.9)=173.61ms
     http_reqs......................: 53595   444.395371/s
     iteration_duration.............: avg=112.18ms min=23.24ms med=111.73ms max=335.16ms p(90)=135.35ms p(95)=142.39ms p(99.9)=177.02ms
     iterations.....................: 53495   443.566198/s
     success_rate...................: 100.00% ✓ 53495      ✗ 0    
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

     checks.........................: 100.00% ✓ 101565     ✗ 0    
     data_received..................: 3.0 GB  25 MB/s
     data_sent......................: 41 MB   337 kB/s
     http_req_blocked...............: avg=5.62µs   min=1.08µs  med=2.86µs   max=3.3ms    p(90)=4.11µs   p(95)=4.6µs    p(99.9)=1.14ms  
     http_req_connecting............: avg=2.6µs    min=0s      med=0s       max=3.28ms   p(90)=0s       p(95)=0s       p(99.9)=1.12ms  
     http_req_duration..............: avg=176.51ms min=7.61ms  med=177.34ms max=383.49ms p(90)=189.65ms p(95)=194.59ms p(99.9)=262.41ms
       { expected_response:true }...: avg=176.51ms min=7.61ms  med=177.34ms max=383.49ms p(90)=189.65ms p(95)=194.59ms p(99.9)=262.41ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 33955
     http_req_receiving.............: avg=94.05µs  min=29.68µs med=81.63µs  max=163.65ms p(90)=111.63µs p(95)=122.36µs p(99.9)=515.67µs
     http_req_sending...............: avg=26.67µs  min=5.26µs  med=15.49µs  max=119.75ms p(90)=19.76µs  p(95)=21.34µs  p(99.9)=564.1µs 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=176.39ms min=7.54ms  med=177.14ms max=372.4ms  p(90)=189.55ms p(95)=194.47ms p(99.9)=262.02ms
     http_reqs......................: 33955   280.796488/s
     iteration_duration.............: avg=177.3ms  min=46.41ms med=178.93ms max=412.59ms p(90)=189.91ms p(95)=194.9ms  p(99.9)=263.96ms
     iterations.....................: 33855   279.969522/s
     success_rate...................: 100.00% ✓ 33855      ✗ 0    
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

     checks.........................: 100.00% ✓ 99234      ✗ 0    
     data_received..................: 2.9 GB  24 MB/s
     data_sent......................: 40 MB   330 kB/s
     http_req_blocked...............: avg=6.63µs   min=1.3µs   med=3.49µs   max=3.52ms   p(90)=4.84µs   p(95)=5.45µs   p(99.9)=1.51ms  
     http_req_connecting............: avg=2.9µs    min=0s      med=0s       max=3.48ms   p(90)=0s       p(95)=0s       p(99.9)=1.49ms  
     http_req_duration..............: avg=180.68ms min=5.82ms  med=168.67ms max=679.1ms  p(90)=214.27ms p(95)=261.98ms p(99.9)=559.42ms
       { expected_response:true }...: avg=180.68ms min=5.82ms  med=168.67ms max=679.1ms  p(90)=214.27ms p(95)=261.98ms p(99.9)=559.42ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 33178
     http_req_receiving.............: avg=89.98µs  min=32.01µs med=82.08µs  max=82.29ms  p(90)=111.89µs p(95)=122.93µs p(99.9)=565.78µs
     http_req_sending...............: avg=30.14µs  min=6.11µs  med=17µs     max=95.59ms  p(90)=21.91µs  p(95)=23.69µs  p(99.9)=515.05µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=180.56ms min=5.75ms  med=168.58ms max=678.96ms p(90)=214.17ms p(95)=261.83ms p(99.9)=559.31ms
     http_reqs......................: 33178   274.607988/s
     iteration_duration.............: avg=181.47ms min=40.15ms med=169.04ms max=679.33ms p(90)=214.6ms  p(95)=263.01ms p(99.9)=559.7ms 
     iterations.....................: 33078   273.780307/s
     success_rate...................: 100.00% ✓ 33078      ✗ 0    
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

     checks.........................: 100.00% ✓ 917577      ✗ 0     
     data_received..................: 27 GB   223 MB/s
     data_sent......................: 368 MB  3.1 MB/s
     http_req_blocked...............: avg=3.49µs  min=962ns   med=2.66µs  max=13.36ms  p(90)=4.24µs  p(95)=4.98µs   p(99.9)=37.25µs
     http_req_connecting............: avg=293ns   min=0s      med=0s      max=3.54ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=19.39ms min=1.69ms  med=18.94ms max=295.53ms p(90)=27.32ms p(95)=30.07ms  p(99.9)=50.03ms
       { expected_response:true }...: avg=19.39ms min=1.69ms  med=18.94ms max=295.53ms p(90)=27.32ms p(95)=30.07ms  p(99.9)=50.03ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 305959
     http_req_receiving.............: avg=96.08µs min=26.74µs med=53.03µs max=226.85ms p(90)=94.99µs p(95)=148.76µs p(99.9)=7.41ms 
     http_req_sending...............: avg=46.44µs min=4.91µs  med=10.32µs max=265.38ms p(90)=17.5µs  p(95)=95.86µs  p(99.9)=4.22ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=19.24ms min=1.64ms  med=18.82ms max=286.68ms p(90)=27.15ms p(95)=29.84ms  p(99.9)=49.14ms
     http_reqs......................: 305959  2544.921889/s
     iteration_duration.............: avg=19.6ms  min=2.93ms  med=19.14ms max=304.78ms p(90)=27.53ms p(95)=30.29ms  p(99.9)=50.53ms
     iterations.....................: 305859  2544.090104/s
     success_rate...................: 100.00% ✓ 305859      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (.net subgraphs) (16.6.0-p.13)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 901200      ✗ 0     
     data_received..................: 26 GB   219 MB/s
     data_sent......................: 361 MB  3.0 MB/s
     http_req_blocked...............: avg=3.28µs   min=882ns   med=2.41µs   max=16.47ms  p(90)=3.94µs  p(95)=4.64µs  p(99.9)=31.87µs
     http_req_connecting............: avg=299ns    min=0s      med=0s       max=4.02ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=19.74ms  min=1.5ms   med=18.85ms  max=289.66ms p(90)=28.42ms p(95)=32.04ms p(99.9)=53.12ms
       { expected_response:true }...: avg=19.74ms  min=1.5ms   med=18.85ms  max=289.66ms p(90)=28.42ms p(95)=32.04ms p(99.9)=53.12ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 300500
     http_req_receiving.............: avg=781.56µs min=51.68µs med=118.02µs max=145.67ms p(90)=1.98ms  p(95)=2.95ms  p(99.9)=23.05ms
     http_req_sending...............: avg=45.83µs  min=4.69µs  med=9.33µs   max=185.54ms p(90)=18.07µs p(95)=95.4µs  p(99.9)=4.02ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=18.91ms  min=1.41ms  med=18.02ms  max=287.86ms p(90)=27.43ms p(95)=30.96ms p(99.9)=51.07ms
     http_reqs......................: 300500  2500.053909/s
     iteration_duration.............: avg=19.96ms  min=2.34ms  med=19.05ms  max=310.58ms p(90)=28.64ms p(95)=32.28ms p(99.9)=53.61ms
     iterations.....................: 300400  2499.221944/s
     success_rate...................: 100.00% ✓ 300400      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.6.0-p.13)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 887832      ✗ 0     
     data_received..................: 26 GB   216 MB/s
     data_sent......................: 356 MB  3.0 MB/s
     http_req_blocked...............: avg=3.06µs   min=862ns   med=2.09µs  max=15.18ms  p(90)=3.57µs  p(95)=4.27µs  p(99.9)=30.94µs 
     http_req_connecting............: avg=314ns    min=0s      med=0s      max=3.63ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=20.04ms  min=1.54ms  med=16.8ms  max=306.15ms p(90)=33.01ms p(95)=40.31ms p(99.9)=142.98ms
       { expected_response:true }...: avg=20.04ms  min=1.54ms  med=16.8ms  max=306.15ms p(90)=33.01ms p(95)=40.31ms p(99.9)=142.98ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 296044
     http_req_receiving.............: avg=557.89µs min=50.78µs med=93.13µs max=181.69ms p(90)=1.08ms  p(95)=1.85ms  p(99.9)=25.72ms 
     http_req_sending...............: avg=40.67µs  min=4.69µs  med=8.85µs  max=137.5ms  p(90)=17.5µs  p(95)=79.28µs p(99.9)=2.98ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=19.44ms  min=1.42ms  med=16.28ms max=305.55ms p(90)=32.05ms p(95)=39.26ms p(99.9)=141.42ms
     http_reqs......................: 296044  2462.780713/s
     iteration_duration.............: avg=20.26ms  min=2.64ms  med=17ms    max=313.49ms p(90)=33.24ms p(95)=40.54ms p(99.9)=143.63ms
     iterations.....................: 295944  2461.948817/s
     success_rate...................: 100.00% ✓ 295944      ✗ 0     
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

     checks.........................: 100.00% ✓ 868509      ✗ 0     
     data_received..................: 25 GB   211 MB/s
     data_sent......................: 348 MB  2.9 MB/s
     http_req_blocked...............: avg=3.46µs   min=811ns   med=2.02µs  max=9.5ms    p(90)=3.69µs  p(95)=4.41µs  p(99.9)=36.97µs 
     http_req_connecting............: avg=959ns    min=0s      med=0s      max=9.15ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=20.5ms   min=1.6ms   med=17.3ms  max=504.05ms p(90)=33.5ms  p(95)=40.76ms p(99.9)=143.63ms
       { expected_response:true }...: avg=20.5ms   min=1.6ms   med=17.3ms  max=504.05ms p(90)=33.5ms  p(95)=40.76ms p(99.9)=143.63ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 289603
     http_req_receiving.............: avg=580.38µs min=50.71µs med=94.02µs max=182.99ms p(90)=1.09ms  p(95)=1.9ms   p(99.9)=28.07ms 
     http_req_sending...............: avg=39.82µs  min=4.32µs  med=8.54µs  max=91.69ms  p(90)=17.52µs p(95)=71.16µs p(99.9)=2.89ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=19.88ms  min=1.49ms  med=16.76ms max=503.74ms p(90)=32.5ms  p(95)=39.55ms p(99.9)=141.13ms
     http_reqs......................: 289603  2409.085523/s
     iteration_duration.............: avg=20.71ms  min=2.55ms  med=17.5ms  max=504.25ms p(90)=33.72ms p(95)=41ms    p(99.9)=144.57ms
     iterations.....................: 289503  2408.253665/s
     success_rate...................: 100.00% ✓ 289503      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (.net subgraphs) (16.6.0-p.13)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 788526      ✗ 0     
     data_received..................: 23 GB   192 MB/s
     data_sent......................: 316 MB  2.6 MB/s
     http_req_blocked...............: avg=2.98µs   min=912ns   med=2.11µs   max=9.26ms   p(90)=3.62µs  p(95)=4.32µs  p(99.9)=30.71µs 
     http_req_connecting............: avg=372ns    min=0s      med=0s       max=4.24ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=22.6ms   min=1.91ms  med=18.95ms  max=525.71ms p(90)=36.51ms p(95)=45.25ms p(99.9)=160.72ms
       { expected_response:true }...: avg=22.6ms   min=1.91ms  med=18.95ms  max=525.71ms p(90)=36.51ms p(95)=45.25ms p(99.9)=160.72ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 262942
     http_req_receiving.............: avg=620.87µs min=50.71µs med=100.83µs max=214.61ms p(90)=1.15ms  p(95)=1.95ms  p(99.9)=30.94ms 
     http_req_sending...............: avg=39.39µs  min=4.81µs  med=9.05µs   max=93.88ms  p(90)=16.98µs p(95)=47.29µs p(99.9)=3.02ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=21.94ms  min=1.81ms  med=18.37ms  max=525.64ms p(90)=35.46ms p(95)=44.04ms p(99.9)=159.47ms
     http_reqs......................: 262942  2186.7492/s
     iteration_duration.............: avg=22.81ms  min=3.04ms  med=19.15ms  max=525.89ms p(90)=36.74ms p(95)=45.48ms p(99.9)=162.04ms
     iterations.....................: 262842  2185.917553/s
     success_rate...................: 100.00% ✓ 262842      ✗ 0     
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

     checks.........................: 100.00% ✓ 594981      ✗ 0     
     data_received..................: 17 GB   145 MB/s
     data_sent......................: 238 MB  2.0 MB/s
     http_req_blocked...............: avg=3.25µs  min=861ns   med=2.19µs  max=8.84ms   p(90)=4.35µs  p(95)=5.43µs   p(99.9)=41.95µs
     http_req_connecting............: avg=436ns   min=0s      med=0s      max=3.37ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=30ms    min=2.19ms  med=29.55ms max=302.83ms p(90)=39.57ms p(95)=42.93ms  p(99.9)=66.45ms
       { expected_response:true }...: avg=30ms    min=2.19ms  med=29.55ms max=302.83ms p(90)=39.57ms p(95)=42.93ms  p(99.9)=66.45ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 198427
     http_req_receiving.............: avg=91.73µs min=26.87µs med=53.88µs max=53.13ms  p(90)=124.1µs p(95)=201.74µs p(99.9)=3.57ms 
     http_req_sending...............: avg=39.99µs min=4.7µs   med=9.34µs  max=178.73ms p(90)=23.14µs p(95)=105.63µs p(99.9)=2.66ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=29.87ms min=2.11ms  med=29.43ms max=302.18ms p(90)=39.42ms p(95)=42.76ms  p(99.9)=65.64ms
     http_reqs......................: 198427  1649.613926/s
     iteration_duration.............: avg=30.24ms min=4.8ms   med=29.76ms max=314.07ms p(90)=39.79ms p(95)=43.14ms  p(99.9)=66.9ms 
     iterations.....................: 198327  1648.782581/s
     success_rate...................: 100.00% ✓ 198327      ✗ 0     
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

     checks.........................: 100.00% ✓ 429438      ✗ 0     
     data_received..................: 13 GB   104 MB/s
     data_sent......................: 172 MB  1.4 MB/s
     http_req_blocked...............: avg=4.65µs  min=1.05µs  med=2.78µs  max=6.94ms   p(90)=4.33µs  p(95)=5.01µs   p(99.9)=39.64µs 
     http_req_connecting............: avg=1.52µs  min=0s      med=0s      max=6.91ms   p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=41.65ms min=2.14ms  med=41.26ms max=291.36ms p(90)=58.03ms p(95)=63.13ms  p(99.9)=86.98ms 
       { expected_response:true }...: avg=41.65ms min=2.14ms  med=41.26ms max=291.36ms p(90)=58.03ms p(95)=63.13ms  p(99.9)=86.98ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 143246
     http_req_receiving.............: avg=79.87µs min=27.68µs med=66.1µs  max=62.17ms  p(90)=105.8µs p(95)=122.89µs p(99.9)=863.09µs
     http_req_sending...............: avg=25.42µs min=5.03µs  med=12.31µs max=90.46ms  p(90)=18.62µs p(95)=22.29µs  p(99.9)=969.42µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=41.54ms min=2.07ms  med=41.16ms max=290.35ms p(90)=57.93ms p(95)=63.01ms  p(99.9)=86.59ms 
     http_reqs......................: 143246  1190.88296/s
     iteration_duration.............: avg=41.9ms  min=3.94ms  med=41.48ms max=301.15ms p(90)=58.25ms p(95)=63.35ms  p(99.9)=87.68ms 
     iterations.....................: 143146  1190.051605/s
     success_rate...................: 100.00% ✓ 143146      ✗ 0     
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

     checks.........................: 100.00% ✓ 207876     ✗ 0    
     data_received..................: 6.1 GB  50 MB/s
     data_sent......................: 83 MB   692 kB/s
     http_req_blocked...............: avg=4.72µs  min=1.21µs  med=3.13µs  max=4.05ms   p(90)=4.66µs   p(95)=5.3µs    p(99.9)=45.51µs 
     http_req_connecting............: avg=1.33µs  min=0s      med=0s      max=4.01ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=86.23ms min=3.77ms  med=84.11ms max=318.58ms p(90)=109.56ms p(95)=121.39ms p(99.9)=204.48ms
       { expected_response:true }...: avg=86.23ms min=3.77ms  med=84.11ms max=318.58ms p(90)=109.56ms p(95)=121.39ms p(99.9)=204.48ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 69392
     http_req_receiving.............: avg=85.39µs min=29.97µs med=73.92µs max=131.39ms p(90)=110.25µs p(95)=123.31µs p(99.9)=704.89µs
     http_req_sending...............: avg=25.24µs min=5.23µs  med=14.31µs max=138.72ms p(90)=21.1µs   p(95)=23.35µs  p(99.9)=620.68µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=86.12ms min=3.7ms   med=84ms    max=318.07ms p(90)=109.43ms p(95)=121.27ms p(99.9)=203.58ms
     http_reqs......................: 69392   575.828219/s
     iteration_duration.............: avg=86.6ms  min=18.38ms med=84.37ms max=339.46ms p(90)=109.81ms p(95)=121.73ms p(99.9)=208.63ms
     iterations.....................: 69292   574.9984/s
     success_rate...................: 100.00% ✓ 69292      ✗ 0    
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

     checks.........................: 100.00% ✓ 160476     ✗ 0    
     data_received..................: 4.7 GB  39 MB/s
     data_sent......................: 64 MB   533 kB/s
     http_req_blocked...............: avg=4.12µs   min=1.09µs  med=3.19µs   max=2.85ms   p(90)=4.7µs    p(95)=5.27µs   p(99.9)=100.17µs
     http_req_connecting............: avg=658ns    min=0s      med=0s       max=1.84ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=111.71ms min=5.36ms  med=109.58ms max=318.55ms p(90)=147.27ms p(95)=158.51ms p(99.9)=200.82ms
       { expected_response:true }...: avg=111.71ms min=5.36ms  med=109.58ms max=318.55ms p(90)=147.27ms p(95)=158.51ms p(99.9)=200.82ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 53592
     http_req_receiving.............: avg=88.31µs  min=28.5µs  med=82.02µs  max=80.93ms  p(90)=111.97µs p(95)=124.08µs p(99.9)=584.38µs
     http_req_sending...............: avg=26.54µs  min=5.17µs  med=17.34µs  max=95.48ms  p(90)=22.54µs  p(95)=24.41µs  p(99.9)=540.6µs 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=111.59ms min=5.2ms   med=109.47ms max=318.26ms p(90)=147.14ms p(95)=158.41ms p(99.9)=200.48ms
     http_reqs......................: 53592   444.173151/s
     iteration_duration.............: avg=112.19ms min=35.92ms med=109.9ms  max=337.06ms p(90)=147.61ms p(95)=158.84ms p(99.9)=203.21ms
     iterations.....................: 53492   443.344346/s
     success_rate...................: 100.00% ✓ 53492      ✗ 0    
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

     checks.........................: 100.00% ✓ 97509      ✗ 0    
     data_received..................: 2.9 GB  24 MB/s
     data_sent......................: 39 MB   324 kB/s
     http_req_blocked...............: avg=6.86µs   min=1.53µs  med=3.83µs   max=3.57ms   p(90)=5.39µs   p(95)=6.05µs   p(99.9)=1.37ms  
     http_req_connecting............: avg=2.75µs   min=0s      med=0s       max=3.53ms   p(90)=0s       p(95)=0s       p(99.9)=1.35ms  
     http_req_duration..............: avg=183.86ms min=5.98ms  med=169.41ms max=601.07ms p(90)=211.41ms p(95)=259.86ms p(99.9)=535.64ms
       { expected_response:true }...: avg=183.86ms min=5.98ms  med=169.41ms max=601.07ms p(90)=211.41ms p(95)=259.86ms p(99.9)=535.64ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32603
     http_req_receiving.............: avg=98.16µs  min=34.69µs med=91.6µs   max=62.43ms  p(90)=123.49µs p(95)=137.44µs p(99.9)=681.26µs
     http_req_sending...............: avg=28.33µs  min=6.63µs  med=19.37µs  max=68.4ms   p(90)=24.33µs  p(95)=26.38µs  p(99.9)=553.83µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=183.73ms min=5.84ms  med=169.28ms max=600.92ms p(90)=211.27ms p(95)=259.59ms p(99.9)=535.51ms
     http_reqs......................: 32603   269.542131/s
     iteration_duration.............: avg=184.7ms  min=32.69ms med=169.75ms max=601.37ms p(90)=211.84ms p(95)=261.37ms p(99.9)=536.12ms
     iterations.....................: 32503   268.71539/s
     success_rate...................: 100.00% ✓ 32503      ✗ 0    
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

     checks.........................: 100.00% ✓ 95595      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 38 MB   317 kB/s
     http_req_blocked...............: avg=6.44µs   min=1.34µs  med=3.46µs   max=3.51ms   p(90)=4.81µs   p(95)=5.38µs   p(99.9)=1.3ms   
     http_req_connecting............: avg=2.72µs   min=0s      med=0s       max=3.47ms   p(90)=0s       p(95)=0s       p(99.9)=1.28ms  
     http_req_duration..............: avg=187.51ms min=7.97ms  med=187.81ms max=412.41ms p(90)=198.47ms p(95)=203.04ms p(99.9)=272.24ms
       { expected_response:true }...: avg=187.51ms min=7.97ms  med=187.81ms max=412.41ms p(90)=198.47ms p(95)=203.04ms p(99.9)=272.24ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 31965
     http_req_receiving.............: avg=100.03µs min=32.29µs med=85.99µs  max=77.44ms  p(90)=115.67µs p(95)=127.14µs p(99.9)=591.75µs
     http_req_sending...............: avg=42.56µs  min=6.28µs  med=17.39µs  max=169.98ms p(90)=22.14µs  p(95)=23.96µs  p(99.9)=577.76µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=187.37ms min=7.83ms  med=187.67ms max=411.8ms  p(90)=198.34ms p(95)=202.9ms  p(99.9)=269.39ms
     http_reqs......................: 31965   264.19138/s
     iteration_duration.............: avg=188.39ms min=42.65ms med=188.24ms max=419.89ms p(90)=198.76ms p(95)=203.33ms p(99.9)=285.12ms
     iterations.....................: 31865   263.364878/s
     success_rate...................: 100.00% ✓ 31865      ✗ 0    
     vus............................: 3       min=3        max=50 
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

     checks.........................: 100.00% ✓ 7752     ✗ 0   
     data_received..................: 257 MB  2.0 MB/s
     data_sent......................: 3.2 MB  26 kB/s
     http_req_blocked...............: avg=38.74µs  min=1.52µs  med=3.93µs  max=4.05ms  p(90)=5.72µs   p(95)=6.65µs   p(99.9)=3.79ms  
     http_req_connecting............: avg=34.09µs  min=0s      med=0s      max=4.01ms  p(90)=0s       p(95)=0s       p(99.9)=3.76ms  
     http_req_duration..............: avg=2.25s    min=26.57ms med=2.27s   max=5.1s    p(90)=3.18s    p(95)=3.42s    p(99.9)=4.19s   
       { expected_response:true }...: avg=2.25s    min=26.57ms med=2.27s   max=5.1s    p(90)=3.18s    p(95)=3.42s    p(99.9)=4.19s   
     http_req_failed................: 0.00%   ✓ 0        ✗ 2684
     http_req_receiving.............: avg=105.25µs min=38.15µs med=97.37µs max=5.18ms  p(90)=139.43µs p(95)=157.89µs p(99.9)=331.08µs
     http_req_sending...............: avg=50.53µs  min=6.41µs  med=20.32µs max=12.76ms p(90)=25.96µs  p(95)=30.58µs  p(99.9)=7.37ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=2.25s    min=26.47ms med=2.26s   max=5.1s    p(90)=3.18s    p(95)=3.42s    p(99.9)=4.19s   
     http_reqs......................: 2684    21.35954/s
     iteration_duration.............: avg=2.34s    min=77.04ms med=2.29s   max=5.1s    p(90)=3.19s    p(95)=3.43s    p(99.9)=4.22s   
     iterations.....................: 2584    20.56373/s
     success_rate...................: 100.00% ✓ 2584     ✗ 0   
     vus............................: 36      min=0      max=50
     vus_max........................: 50      min=50     max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

