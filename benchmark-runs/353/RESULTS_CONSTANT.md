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
| hive-router | v0.0.84 | 3,089 | 3,349 | 3,020 | 3.4% |  |
| fusion-nightly-net11 | 16.7.0-p.8 | 2,691 | 2,824 | 2,680 | 1.9% |  |
| fusion | 16.6.6 | 2,645 | 2,755 | 2,635 | 1.5% |  |
| fusion-nightly | 16.7.0-p.8 | 2,581 | 2,697 | 2,564 | 1.7% |  |
| fusion-nightly-fed | 16.7.0-p.8 | 2,383 | 2,486 | 2,374 | 1.6% |  |
| grafbase | 0.53.5 | 2,134 | 2,251 | 2,123 | 2.0% |  |
| cosmo | 0.334.0 | 1,283 | 1,329 | 1,274 | 1.5% |  |
| hive-gateway-router-runtime | 2.10.8 | 624 | 641 | 619 | 1.1% |  |
| apollo-router | v2.16.1 | 450 | 468 | 445 | 2.0% |  |
| hive-gateway | 2.10.8 | 284 | 293 | 283 | 1.1% |  |
| apollo-gateway | 2.14.3 | 281 | 284 | 280 | 0.5% |  |
| feddi | 5ff8b6165878 | — | — | — | — | non-compatible response (1016 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| fusion-nightly-net11 | 16.7.0-p.8 | 2,540 | 2,635 | 2,535 | 1.5% |  |
| fusion-nightly | 16.7.0-p.8 | 2,482 | 2,592 | 2,473 | 1.7% |  |
| hive-router | v0.0.84 | 2,412 | 2,606 | 2,389 | 3.0% |  |
| fusion | 16.6.6 | 2,385 | 2,561 | 2,368 | 2.8% |  |
| fusion-nightly-fed | 16.7.0-p.8 | 2,278 | 2,385 | 2,268 | 1.8% |  |
| grafbase | 0.53.5 | 1,629 | 1,681 | 1,626 | 1.2% |  |
| cosmo | 0.334.0 | 1,241 | 1,287 | 1,237 | 1.5% |  |
| hive-gateway-router-runtime | 2.10.8 | 578 | 597 | 576 | 1.3% |  |
| apollo-router | v2.16.1 | 410 | 427 | 405 | 2.0% |  |
| apollo-gateway | 2.14.3 | 268 | 272 | 268 | 0.5% |  |
| hive-gateway | 2.10.8 | 264 | 271 | 263 | 0.9% |  |
| feddi | 5ff8b6165878 | 19 | 19 | 18 | 1.8% |  |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.84)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 1113588     ✗ 0     
     data_received..................: 33 GB   271 MB/s
     data_sent......................: 446 MB  3.7 MB/s
     http_req_blocked...............: avg=3.1µs   min=861ns   med=1.94µs  max=17.57ms  p(90)=3.27µs  p(95)=3.94µs   p(99.9)=32.59µs
     http_req_connecting............: avg=289ns   min=0s      med=0s      max=4.08ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=15.95ms min=1.43ms  med=15.22ms max=297.18ms p(90)=23.6ms  p(95)=26.98ms  p(99.9)=47.53ms
       { expected_response:true }...: avg=15.95ms min=1.43ms  med=15.22ms max=297.18ms p(90)=23.6ms  p(95)=26.98ms  p(99.9)=47.53ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 371296
     http_req_receiving.............: avg=93.81µs min=24.61µs med=42.77µs max=239.32ms p(90)=80.11µs p(95)=152.69µs p(99.9)=10.63ms
     http_req_sending...............: avg=47.23µs min=4.23µs  med=7.92µs  max=113.66ms p(90)=13.95µs p(95)=88.82µs  p(99.9)=8.32ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=15.81ms min=1.38ms  med=15.1ms  max=262.42ms p(90)=23.4ms  p(95)=26.68ms  p(99.9)=46.12ms
     http_reqs......................: 371296  3089.290562/s
     iteration_duration.............: avg=16.15ms min=1.9ms   med=15.4ms  max=309.48ms p(90)=23.81ms p(95)=27.22ms  p(99.9)=48.19ms
     iterations.....................: 371196  3088.458533/s
     success_rate...................: 100.00% ✓ 371196      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (rust subgraphs) (16.7.0-p.8)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 970839      ✗ 0     
     data_received..................: 28 GB   236 MB/s
     data_sent......................: 389 MB  3.2 MB/s
     http_req_blocked...............: avg=2.79µs  min=871ns   med=1.92µs   max=18.93ms  p(90)=3.23µs  p(95)=3.91µs  p(99.9)=26.99µs
     http_req_connecting............: avg=271ns   min=0s      med=0s       max=3.9ms    p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=18.31ms min=1.94ms  med=17.27ms  max=296.66ms p(90)=26.17ms p(95)=29.87ms p(99.9)=50.97ms
       { expected_response:true }...: avg=18.31ms min=1.94ms  med=17.27ms  max=296.66ms p(90)=26.17ms p(95)=29.87ms p(99.9)=50.97ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 323713
     http_req_receiving.............: avg=1.05ms  min=50.77µs med=134.18µs max=192.41ms p(90)=2.68ms  p(95)=3.65ms  p(99.9)=23.32ms
     http_req_sending...............: avg=43.71µs min=4.55µs  med=8.18µs   max=70.75ms  p(90)=15.94µs p(95)=85.02µs p(99.9)=4.54ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=17.22ms min=1.84ms  med=16.16ms  max=296.49ms p(90)=24.8ms  p(95)=28.41ms p(99.9)=48.44ms
     http_reqs......................: 323713  2691.919364/s
     iteration_duration.............: avg=18.53ms min=3.23ms  med=17.47ms  max=306.57ms p(90)=26.39ms p(95)=30.1ms  p(99.9)=51.63ms
     iterations.....................: 323613  2691.087788/s
     success_rate...................: 100.00% ✓ 323613      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (rust subgraphs) (16.6.6)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 954132      ✗ 0     
     data_received..................: 28 GB   232 MB/s
     data_sent......................: 382 MB  3.2 MB/s
     http_req_blocked...............: avg=2.92µs   min=931ns   med=2.34µs  max=17.66ms  p(90)=3.63µs  p(95)=4.23µs  p(99.9)=34.66µs 
     http_req_connecting............: avg=118ns    min=0s      med=0s      max=1.76ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=18.64ms  min=1.99ms  med=16.13ms max=262.18ms p(90)=30.27ms p(95)=36.46ms p(99.9)=116.09ms
       { expected_response:true }...: avg=18.64ms  min=1.99ms  med=16.13ms max=262.18ms p(90)=30.27ms p(95)=36.46ms p(99.9)=116.09ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 318144
     http_req_receiving.............: avg=542.22µs min=51.13µs med=91µs    max=140.31ms p(90)=1.06ms  p(95)=1.9ms   p(99.9)=24.5ms  
     http_req_sending...............: avg=45.38µs  min=4.67µs  med=8.88µs  max=151.06ms p(90)=15.76µs p(95)=90.49µs p(99.9)=4.32ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=18.05ms  min=1.88ms  med=15.61ms max=259.62ms p(90)=29.35ms p(95)=35.44ms p(99.9)=113.66ms
     http_reqs......................: 318144  2645.788233/s
     iteration_duration.............: avg=18.85ms  min=3.13ms  med=16.33ms max=346.89ms p(90)=30.5ms  p(95)=36.71ms p(99.9)=116.74ms
     iterations.....................: 318044  2644.956601/s
     success_rate...................: 100.00% ✓ 318044      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (rust subgraphs) (16.7.0-p.8)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 931143      ✗ 0     
     data_received..................: 27 GB   226 MB/s
     data_sent......................: 373 MB  3.1 MB/s
     http_req_blocked...............: avg=2.4µs    min=801ns   med=1.81µs  max=3.82ms   p(90)=2.81µs  p(95)=3.3µs   p(99.9)=26.53µs 
     http_req_connecting............: avg=302ns    min=0s      med=0s      max=3.78ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=19.12ms  min=2.01ms  med=16.33ms max=327.63ms p(90)=31.05ms p(95)=37.88ms p(99.9)=131.13ms
       { expected_response:true }...: avg=19.12ms  min=2.01ms  med=16.33ms max=327.63ms p(90)=31.05ms p(95)=37.88ms p(99.9)=131.13ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 310481
     http_req_receiving.............: avg=580.56µs min=50.97µs med=90.81µs max=186.6ms  p(90)=1.08ms  p(95)=1.96ms  p(99.9)=26.1ms  
     http_req_sending...............: avg=38.6µs   min=4.36µs  med=7.69µs  max=197.21ms p(90)=12.64µs p(95)=69.28µs p(99.9)=3.05ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=18.5ms   min=1.89ms  med=15.79ms max=327.49ms p(90)=30.06ms p(95)=36.73ms p(99.9)=129.14ms
     http_reqs......................: 310481  2581.636887/s
     iteration_duration.............: avg=19.32ms  min=3.13ms  med=16.52ms max=327.81ms p(90)=31.26ms p(95)=38.11ms p(99.9)=131.76ms
     iterations.....................: 310381  2580.805391/s
     success_rate...................: 100.00% ✓ 310381      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (rust subgraphs) (16.7.0-p.8)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 859449      ✗ 0     
     data_received..................: 25 GB   210 MB/s
     data_sent......................: 344 MB  2.9 MB/s
     http_req_blocked...............: avg=2.63µs   min=831ns   med=1.9µs   max=17.42ms  p(90)=3.06µs  p(95)=3.61µs  p(99.9)=26.23µs 
     http_req_connecting............: avg=333ns    min=0s      med=0s      max=4.13ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=20.73ms  min=1.69ms  med=16.47ms max=531.9ms  p(90)=34.99ms p(95)=44.75ms p(99.9)=189.54ms
       { expected_response:true }...: avg=20.73ms  min=1.69ms  med=16.47ms max=531.9ms  p(90)=34.99ms p(95)=44.75ms p(99.9)=189.54ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 286583
     http_req_receiving.............: avg=625.78µs min=49.31µs med=93.53µs max=305.28ms p(90)=1.06ms  p(95)=1.85ms  p(99.9)=33.5ms  
     http_req_sending...............: avg=34.45µs  min=4.65µs  med=8.23µs  max=31.59ms  p(90)=13.71µs p(95)=28.75µs p(99.9)=2.19ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=20.06ms  min=1.57ms  med=15.95ms max=531.8ms  p(90)=33.94ms p(95)=43.43ms p(99.9)=185.57ms
     http_reqs......................: 286583  2383.908297/s
     iteration_duration.............: avg=20.93ms  min=2.72ms  med=16.66ms max=532.05ms p(90)=35.2ms  p(95)=44.98ms p(99.9)=191.24ms
     iterations.....................: 286483  2383.076458/s
     success_rate...................: 100.00% ✓ 286483      ✗ 0     
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

     checks.........................: 100.00% ✓ 769716      ✗ 0     
     data_received..................: 23 GB   188 MB/s
     data_sent......................: 308 MB  2.6 MB/s
     http_req_blocked...............: avg=2.8µs   min=892ns   med=2.08µs  max=4ms      p(90)=3.4µs   p(95)=4.09µs   p(99.9)=32.73µs
     http_req_connecting............: avg=362ns   min=0s      med=0s      max=3.96ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=23.16ms min=1.76ms  med=22.93ms max=287.91ms p(90)=27.39ms p(95)=29.04ms  p(99.9)=46.8ms 
       { expected_response:true }...: avg=23.16ms min=1.76ms  med=22.93ms max=287.91ms p(90)=27.39ms p(95)=29.04ms  p(99.9)=46.8ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 256672
     http_req_receiving.............: avg=83.21µs min=26.65µs med=53.34µs max=129.58ms p(90)=89.08µs p(95)=112.23µs p(99.9)=4.82ms 
     http_req_sending...............: avg=32.62µs min=4.81µs  med=9.32µs  max=168.61ms p(90)=15.53µs p(95)=22.64µs  p(99.9)=1.57ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=23.05ms min=1.68ms  med=22.83ms max=287.37ms p(90)=27.27ms p(95)=28.88ms  p(99.9)=45.9ms 
     http_reqs......................: 256672  2134.769098/s
     iteration_duration.............: avg=23.37ms min=4.04ms  med=23.12ms max=300.54ms p(90)=27.59ms p(95)=29.24ms  p(99.9)=47.58ms
     iterations.....................: 256572  2133.937387/s
     success_rate...................: 100.00% ✓ 256572      ✗ 0     
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

     checks.........................: 100.00% ✓ 462738      ✗ 0     
     data_received..................: 14 GB   113 MB/s
     data_sent......................: 185 MB  1.5 MB/s
     http_req_blocked...............: avg=2.93µs  min=882ns   med=2.07µs  max=3.54ms   p(90)=3.5µs   p(95)=4.13µs   p(99.9)=31.25µs 
     http_req_connecting............: avg=553ns   min=0s      med=0s      max=3.5ms    p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=38.66ms min=1.97ms  med=38.29ms max=305.8ms  p(90)=54.12ms p(95)=58.91ms  p(99.9)=81.65ms 
       { expected_response:true }...: avg=38.66ms min=1.97ms  med=38.29ms max=305.8ms  p(90)=54.12ms p(95)=58.91ms  p(99.9)=81.65ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 154346
     http_req_receiving.............: avg=70.27µs min=26.52µs med=57.99µs max=115.69ms p(90)=93.28µs p(95)=108.57µs p(99.9)=815.74µs
     http_req_sending...............: avg=20.63µs min=4.64µs  med=9.55µs  max=131.4ms  p(90)=15.53µs p(95)=19.23µs  p(99.9)=898.13µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=38.57ms min=1.91ms  med=38.2ms  max=288.73ms p(90)=54.04ms p(95)=58.82ms  p(99.9)=81.57ms 
     http_reqs......................: 154346  1283.319547/s
     iteration_duration.............: avg=38.89ms min=3.82ms  med=38.48ms max=319.25ms p(90)=54.31ms p(95)=59.11ms  p(99.9)=81.99ms 
     iterations.....................: 154246  1282.48809/s
     success_rate...................: 100.00% ✓ 154246      ✗ 0     
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

     checks.........................: 100.00% ✓ 225291     ✗ 0    
     data_received..................: 6.6 GB  55 MB/s
     data_sent......................: 90 MB   750 kB/s
     http_req_blocked...............: avg=4.48µs  min=1.21µs  med=2.94µs  max=4.03ms   p(90)=4.43µs   p(95)=5.08µs   p(99.9)=42.15µs 
     http_req_connecting............: avg=1.28µs  min=0s      med=0s      max=3.98ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=79.55ms min=3.45ms  med=77.47ms max=326.26ms p(90)=98.22ms  p(95)=108.45ms p(99.9)=184.54ms
       { expected_response:true }...: avg=79.55ms min=3.45ms  med=77.47ms max=326.26ms p(90)=98.22ms  p(95)=108.45ms p(99.9)=184.54ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 75197
     http_req_receiving.............: avg=82.04µs min=29.79µs med=69.19µs max=138.45ms p(90)=107.22µs p(95)=121.43µs p(99.9)=680.27µs
     http_req_sending...............: avg=26.41µs min=5.51µs  med=13.74µs max=209ms    p(90)=20.29µs  p(95)=22.67µs  p(99.9)=617.14µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=79.44ms min=3.38ms  med=77.36ms max=303.54ms p(90)=98.12ms  p(95)=108.32ms p(99.9)=184.18ms
     http_reqs......................: 75197   624.188015/s
     iteration_duration.............: avg=79.9ms  min=21.12ms med=77.72ms max=341.6ms  p(90)=98.46ms  p(95)=108.72ms p(99.9)=186.41ms
     iterations.....................: 75097   623.357945/s
     success_rate...................: 100.00% ✓ 75097      ✗ 0    
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

     checks.........................: 100.00% ✓ 162552     ✗ 0    
     data_received..................: 4.8 GB  40 MB/s
     data_sent......................: 65 MB   541 kB/s
     http_req_blocked...............: avg=5.27µs   min=1.14µs  med=3.23µs   max=4.06ms   p(90)=4.61µs   p(95)=5.19µs   p(99.9)=104.04µs
     http_req_connecting............: avg=1.82µs   min=0s      med=0s       max=4.02ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=110.31ms min=4.58ms  med=110.07ms max=316ms    p(90)=133.26ms p(95)=140.13ms p(99.9)=171.4ms 
       { expected_response:true }...: avg=110.31ms min=4.58ms  med=110.07ms max=316ms    p(90)=133.26ms p(95)=140.13ms p(99.9)=171.4ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 54284
     http_req_receiving.............: avg=84.3µs   min=30.93µs med=74.07µs  max=129.31ms p(90)=105.46µs p(95)=117.34µs p(99.9)=538.75µs
     http_req_sending...............: avg=22.06µs  min=5.63µs  med=15.29µs  max=89.81ms  p(90)=21.04µs  p(95)=22.96µs  p(99.9)=515.54µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=110.2ms  min=4.47ms  med=109.97ms max=315.4ms  p(90)=133.16ms p(95)=140.04ms p(99.9)=171.18ms
     http_reqs......................: 54284   450.163258/s
     iteration_duration.............: avg=110.76ms min=22.16ms med=110.34ms max=325.95ms p(90)=133.53ms p(95)=140.4ms  p(99.9)=172.87ms
     iterations.....................: 54184   449.333984/s
     success_rate...................: 100.00% ✓ 54184      ✗ 0    
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

     checks.........................: 100.00% ✓ 102999     ✗ 0    
     data_received..................: 3.0 GB  25 MB/s
     data_sent......................: 41 MB   342 kB/s
     http_req_blocked...............: avg=6.68µs   min=1.44µs  med=3.63µs   max=3.93ms   p(90)=5.07µs   p(95)=5.69µs   p(99.9)=1.4ms   
     http_req_connecting............: avg=2.73µs   min=0s      med=0s       max=3.88ms   p(90)=0s       p(95)=0s       p(99.9)=1.32ms  
     http_req_duration..............: avg=174.1ms  min=5.7ms   med=158.8ms  max=671.77ms p(90)=200.74ms p(95)=236.74ms p(99.9)=581.62ms
       { expected_response:true }...: avg=174.1ms  min=5.7ms   med=158.8ms  max=671.77ms p(90)=200.74ms p(95)=236.74ms p(99.9)=581.62ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 34433
     http_req_receiving.............: avg=103.64µs min=36.75µs med=92.65µs  max=123.05ms p(90)=123.82µs p(95)=137.08µs p(99.9)=843.43µs
     http_req_sending...............: avg=25.64µs  min=6.94µs  med=18.59µs  max=36.26ms  p(90)=23.27µs  p(95)=25.16µs  p(99.9)=552.78µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=173.98ms min=5.55ms  med=158.68ms max=671.69ms p(90)=200.59ms p(95)=236.57ms p(99.9)=581.55ms
     http_reqs......................: 34433   284.521683/s
     iteration_duration.............: avg=174.9ms  min=38.93ms med=159.17ms max=671.98ms p(90)=201.1ms  p(95)=237.58ms p(99.9)=581.98ms
     iterations.....................: 34333   283.695377/s
     success_rate...................: 100.00% ✓ 34333      ✗ 0    
     vus............................: 8       min=8        max=50 
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

     checks.........................: 100.00% ✓ 101841     ✗ 0    
     data_received..................: 3.0 GB  25 MB/s
     data_sent......................: 41 MB   338 kB/s
     http_req_blocked...............: avg=6.26µs   min=1.45µs  med=3.41µs   max=4.03ms   p(90)=4.71µs   p(95)=5.23µs   p(99.9)=1.17ms  
     http_req_connecting............: avg=2.65µs   min=0s      med=0s       max=3.98ms   p(90)=0s       p(95)=0s       p(99.9)=1.15ms  
     http_req_duration..............: avg=176.05ms min=7.43ms  med=174.86ms max=389.88ms p(90)=196.93ms p(95)=201.32ms p(99.9)=271.7ms 
       { expected_response:true }...: avg=176.05ms min=7.43ms  med=174.86ms max=389.88ms p(90)=196.93ms p(95)=201.32ms p(99.9)=271.7ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 34047
     http_req_receiving.............: avg=88.02µs  min=33.27µs med=83.1µs   max=33.18ms  p(90)=113.92µs p(95)=125.04µs p(99.9)=495.14µs
     http_req_sending...............: avg=28.88µs  min=5.12µs  med=16.49µs  max=106.74ms p(90)=21.06µs  p(95)=22.8µs   p(99.9)=529.64µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=175.93ms min=7.34ms  med=174.75ms max=389.79ms p(90)=196.82ms p(95)=201.21ms p(99.9)=271.59ms
     http_reqs......................: 34047   281.510013/s
     iteration_duration.............: avg=176.85ms min=31.47ms med=175.16ms max=413.26ms p(90)=197.22ms p(95)=201.66ms p(99.9)=284.64ms
     iterations.....................: 33947   280.683185/s
     success_rate...................: 100.00% ✓ 33947      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (.net subgraphs) (16.7.0-p.8)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 916026      ✗ 0     
     data_received..................: 27 GB   223 MB/s
     data_sent......................: 367 MB  3.1 MB/s
     http_req_blocked...............: avg=3.47µs  min=842ns   med=2.12µs   max=9.72ms   p(90)=3.81µs  p(95)=4.59µs  p(99.9)=31.75µs
     http_req_connecting............: avg=840ns   min=0s      med=0s       max=9.69ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=19.42ms min=1.53ms  med=18.36ms  max=284.55ms p(90)=28.06ms p(95)=31.83ms p(99.9)=53.65ms
       { expected_response:true }...: avg=19.42ms min=1.53ms  med=18.36ms  max=284.55ms p(90)=28.06ms p(95)=31.83ms p(99.9)=53.65ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 305442
     http_req_receiving.............: avg=1.2ms   min=51.63µs med=155.94µs max=44.9ms   p(90)=3.1ms   p(95)=4.25ms  p(99.9)=25.28ms
     http_req_sending...............: avg=46.42µs min=4.63µs  med=8.75µs   max=240.96ms p(90)=19.01µs p(95)=91µs    p(99.9)=4.1ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=18.17ms min=1.44ms  med=17.07ms  max=283.9ms  p(90)=26.56ms p(95)=30.23ms p(99.9)=51.23ms
     http_reqs......................: 305442  2540.986877/s
     iteration_duration.............: avg=19.64ms min=2.67ms  med=18.57ms  max=319.65ms p(90)=28.28ms p(95)=32.06ms p(99.9)=54.08ms
     iterations.....................: 305342  2540.154972/s
     success_rate...................: 100.00% ✓ 305342      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.7.0-p.8)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 894741      ✗ 0     
     data_received..................: 26 GB   218 MB/s
     data_sent......................: 359 MB  3.0 MB/s
     http_req_blocked...............: avg=3.12µs   min=881ns   med=2.05µs  max=35.5ms   p(90)=3.49µs  p(95)=4.2µs   p(99.9)=32.64µs 
     http_req_connecting............: avg=540ns    min=0s      med=0s      max=35.45ms  p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=19.89ms  min=1.6ms   med=16.61ms max=334.62ms p(90)=32.66ms p(95)=40.2ms  p(99.9)=139.98ms
       { expected_response:true }...: avg=19.89ms  min=1.6ms   med=16.61ms max=334.62ms p(90)=32.66ms p(95)=40.2ms  p(99.9)=139.98ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 298347
     http_req_receiving.............: avg=562.09µs min=50.26µs med=91.23µs max=191.7ms  p(90)=1.06ms  p(95)=1.87ms  p(99.9)=26.75ms 
     http_req_sending...............: avg=42µs     min=4.57µs  med=8.69µs  max=141.35ms p(90)=17.04µs p(95)=80.93µs p(99.9)=3.63ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=19.28ms  min=1.48ms  med=16.09ms max=334.5ms  p(90)=31.69ms p(95)=39.05ms p(99.9)=139.23ms
     http_reqs......................: 298347  2482.150771/s
     iteration_duration.............: avg=20.1ms   min=2.64ms  med=16.81ms max=334.82ms p(90)=32.88ms p(95)=40.46ms p(99.9)=140.82ms
     iterations.....................: 298247  2481.318803/s
     success_rate...................: 100.00% ✓ 298247      ✗ 0     
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

     checks.........................: 100.00% ✓ 869817      ✗ 0     
     data_received..................: 25 GB   211 MB/s
     data_sent......................: 349 MB  2.9 MB/s
     http_req_blocked...............: avg=3.23µs  min=902ns   med=2.47µs  max=10.77ms  p(90)=4.03µs  p(95)=4.73µs   p(99.9)=39.1µs 
     http_req_connecting............: avg=320ns   min=0s      med=0s      max=3.85ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=20.47ms min=1.77ms  med=20.21ms max=287.22ms p(90)=28.49ms p(95)=30.86ms  p(99.9)=49.12ms
       { expected_response:true }...: avg=20.47ms min=1.77ms  med=20.21ms max=287.22ms p(90)=28.49ms p(95)=30.86ms  p(99.9)=49.12ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 290039
     http_req_receiving.............: avg=87.56µs min=26.03µs med=52.17µs max=106.35ms p(90)=92.5µs  p(95)=128.33µs p(99.9)=5.87ms 
     http_req_sending...............: avg=41.38µs min=4.31µs  med=10.18µs max=149.93ms p(90)=17.26µs p(95)=72.04µs  p(99.9)=2.69ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=20.34ms min=1.71ms  med=20.1ms  max=265.44ms p(90)=28.34ms p(95)=30.69ms  p(99.9)=47.99ms
     http_reqs......................: 290039  2412.52013/s
     iteration_duration.............: avg=20.68ms min=2.77ms  med=20.41ms max=301.35ms p(90)=28.69ms p(95)=31.07ms  p(99.9)=49.5ms 
     iterations.....................: 289939  2411.688338/s
     success_rate...................: 100.00% ✓ 289939      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (.net subgraphs) (16.6.6)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 860055      ✗ 0     
     data_received..................: 25 GB   209 MB/s
     data_sent......................: 345 MB  2.9 MB/s
     http_req_blocked...............: avg=2.96µs   min=832ns  med=2.11µs  max=11.52ms  p(90)=3.67µs  p(95)=4.35µs  p(99.9)=34.07µs 
     http_req_connecting............: avg=327ns    min=0s     med=0s      max=3.75ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=20.7ms   min=1.55ms med=17.16ms max=508.39ms p(90)=34.24ms p(95)=42.14ms p(99.9)=150.98ms
       { expected_response:true }...: avg=20.7ms   min=1.55ms med=17.16ms max=508.39ms p(90)=34.24ms p(95)=42.14ms p(99.9)=150.98ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 286785
     http_req_receiving.............: avg=625.36µs min=51µs   med=96.43µs max=214.67ms p(90)=1.16ms  p(95)=2.05ms  p(99.9)=29.27ms 
     http_req_sending...............: avg=40.9µs   min=4.55µs med=8.56µs  max=118.25ms p(90)=16.86µs p(95)=71.14µs p(99.9)=3.48ms  
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=20.03ms  min=1.42ms med=16.58ms max=508.01ms p(90)=33.16ms p(95)=40.85ms p(99.9)=150.25ms
     http_reqs......................: 286785  2385.818923/s
     iteration_duration.............: avg=20.91ms  min=2.5ms  med=17.36ms max=508.57ms p(90)=34.46ms p(95)=42.36ms p(99.9)=153.66ms
     iterations.....................: 286685  2384.987004/s
     success_rate...................: 100.00% ✓ 286685      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (.net subgraphs) (16.7.0-p.8)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 821595      ✗ 0     
     data_received..................: 24 GB   200 MB/s
     data_sent......................: 329 MB  2.7 MB/s
     http_req_blocked...............: avg=4.09µs   min=1.05µs  med=2.83µs  max=76.43ms  p(90)=4.54µs  p(95)=5.33µs  p(99.9)=41.73µs 
     http_req_connecting............: avg=338ns    min=0s      med=0s      max=3.72ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=21.66ms  min=1.91ms  med=18.46ms max=337.79ms p(90)=35.09ms p(95)=43.03ms p(99.9)=143.2ms 
       { expected_response:true }...: avg=21.66ms  min=1.91ms  med=18.46ms max=337.79ms p(90)=35.09ms p(95)=43.03ms p(99.9)=143.2ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 273965
     http_req_receiving.............: avg=581.12µs min=53.27µs med=104.1µs max=154.72ms p(90)=1.13ms  p(95)=2.02ms  p(99.9)=27.26ms 
     http_req_sending...............: avg=45.34µs  min=4.93µs  med=11.2µs  max=87.93ms  p(90)=20.96µs p(95)=97.46µs p(99.9)=3.33ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=21.03ms  min=1.82ms  med=17.91ms max=327.53ms p(90)=34.13ms p(95)=41.91ms p(99.9)=142.46ms
     http_reqs......................: 273965  2278.321039/s
     iteration_duration.............: avg=21.89ms  min=2.94ms  med=18.69ms max=366.15ms p(90)=35.33ms p(95)=43.28ms p(99.9)=143.74ms
     iterations.....................: 273865  2277.489429/s
     success_rate...................: 100.00% ✓ 273865      ✗ 0     
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

     checks.........................: 100.00% ✓ 587871      ✗ 0     
     data_received..................: 17 GB   143 MB/s
     data_sent......................: 236 MB  2.0 MB/s
     http_req_blocked...............: avg=3.2µs   min=842ns   med=2.18µs  max=3.36ms   p(90)=4.38µs   p(95)=5.47µs   p(99.9)=43.94µs
     http_req_connecting............: avg=426ns   min=0s      med=0s      max=3.33ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=30.36ms min=2.19ms  med=29.92ms max=277.14ms p(90)=40.43ms  p(95)=43.8ms   p(99.9)=65.67ms
       { expected_response:true }...: avg=30.36ms min=2.19ms  med=29.92ms max=277.14ms p(90)=40.43ms  p(95)=43.8ms   p(99.9)=65.67ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 196057
     http_req_receiving.............: avg=96.08µs min=27.22µs med=53.79µs max=163.34ms p(90)=125.32µs p(95)=210.69µs p(99.9)=4.22ms 
     http_req_sending...............: avg=43.09µs min=4.59µs  med=9.36µs  max=218.31ms p(90)=24.4µs   p(95)=110.17µs p(99.9)=3.21ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=30.22ms min=2.12ms  med=29.8ms  max=276.37ms p(90)=40.28ms  p(95)=43.62ms  p(99.9)=64.53ms
     http_reqs......................: 196057  1629.913852/s
     iteration_duration.............: avg=30.6ms  min=5.96ms  med=30.14ms max=300.89ms p(90)=40.65ms  p(95)=44.03ms  p(99.9)=66.26ms
     iterations.....................: 195957  1629.082505/s
     success_rate...................: 100.00% ✓ 195957      ✗ 0     
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

     checks.........................: 100.00% ✓ 447546      ✗ 0     
     data_received..................: 13 GB   109 MB/s
     data_sent......................: 179 MB  1.5 MB/s
     http_req_blocked...............: avg=3.61µs  min=1.02µs  med=2.97µs  max=2.56ms   p(90)=4.6µs    p(95)=5.3µs    p(99.9)=38.85µs 
     http_req_connecting............: avg=330ns   min=0s      med=0s      max=2.51ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=39.95ms min=2.14ms  med=39.56ms max=279.52ms p(90)=55.41ms  p(95)=60.32ms  p(99.9)=83.71ms 
       { expected_response:true }...: avg=39.95ms min=2.14ms  med=39.56ms max=279.52ms p(90)=55.41ms  p(95)=60.32ms  p(99.9)=83.71ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 149282
     http_req_receiving.............: avg=82.92µs min=27.16µs med=70.92µs max=64.72ms  p(90)=109.91µs p(95)=126.42µs p(99.9)=918.86µs
     http_req_sending...............: avg=28.43µs min=4.92µs  med=13.03µs max=132.22ms p(90)=20.24µs  p(95)=24.11µs  p(99.9)=1.14ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=39.84ms min=2.05ms  med=39.46ms max=278.98ms p(90)=55.3ms   p(95)=60.2ms   p(99.9)=83.54ms 
     http_reqs......................: 149282  1241.139801/s
     iteration_duration.............: avg=40.21ms min=3.99ms  med=39.79ms max=299.97ms p(90)=55.64ms  p(95)=60.55ms  p(99.9)=84.3ms  
     iterations.....................: 149182  1240.308395/s
     success_rate...................: 100.00% ✓ 149182      ✗ 0     
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

     checks.........................: 100.00% ✓ 208872     ✗ 0    
     data_received..................: 6.1 GB  51 MB/s
     data_sent......................: 84 MB   695 kB/s
     http_req_blocked...............: avg=4.96µs  min=1.25µs  med=3.33µs  max=4.24ms   p(90)=4.87µs   p(95)=5.55µs   p(99.9)=47.49µs 
     http_req_connecting............: avg=1.34µs  min=0s      med=0s      max=4.2ms    p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=85.82ms min=3.97ms  med=84.16ms max=327.64ms p(90)=105.21ms p(95)=115.54ms p(99.9)=198.36ms
       { expected_response:true }...: avg=85.82ms min=3.97ms  med=84.16ms max=327.64ms p(90)=105.21ms p(95)=115.54ms p(99.9)=198.36ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 69724
     http_req_receiving.............: avg=84.76µs min=31.78µs med=73.35µs max=115.36ms p(90)=109.3µs  p(95)=122.79µs p(99.9)=691.95µs
     http_req_sending...............: avg=26.31µs min=5.41µs  med=14.52µs max=179.81ms p(90)=21.22µs  p(95)=23.61µs  p(99.9)=626.82µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=85.71ms min=3.84ms  med=84.06ms max=326.9ms  p(90)=105.1ms  p(95)=115.43ms p(99.9)=197.84ms
     http_reqs......................: 69724   578.410372/s
     iteration_duration.............: avg=86.19ms min=21.09ms med=84.41ms max=349.31ms p(90)=105.48ms p(95)=115.82ms p(99.9)=199.55ms
     iterations.....................: 69624   577.5808/s
     success_rate...................: 100.00% ✓ 69624      ✗ 0    
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

     checks.........................: 100.00% ✓ 148338     ✗ 0    
     data_received..................: 4.3 GB  36 MB/s
     data_sent......................: 60 MB   493 kB/s
     http_req_blocked...............: avg=4.66µs   min=1.07µs  med=3.05µs   max=2.9ms    p(90)=4.4µs    p(95)=4.93µs   p(99.9)=121.13µs
     http_req_connecting............: avg=1.42µs   min=0s      med=0s       max=2.86ms   p(90)=0s       p(95)=0s       p(99.9)=69.29µs 
     http_req_duration..............: avg=120.88ms min=5.25ms  med=118.47ms max=312.11ms p(90)=159.63ms p(95)=171.81ms p(99.9)=221.86ms
       { expected_response:true }...: avg=120.88ms min=5.25ms  med=118.47ms max=312.11ms p(90)=159.63ms p(95)=171.81ms p(99.9)=221.86ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 49546
     http_req_receiving.............: avg=87.32µs  min=29.42µs med=79.14µs  max=131.4ms  p(90)=110.61µs p(95)=122.7µs  p(99.9)=454.35µs
     http_req_sending...............: avg=25.78µs  min=5.28µs  med=16.11µs  max=88.48ms  p(90)=21.28µs  p(95)=23.12µs  p(99.9)=573.85µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=120.76ms min=5.16ms  med=118.37ms max=308.06ms p(90)=159.52ms p(95)=171.71ms p(99.9)=221.38ms
     http_reqs......................: 49546   410.562794/s
     iteration_duration.............: avg=121.37ms min=28.07ms med=118.77ms max=323.42ms p(90)=159.94ms p(95)=172.11ms p(99.9)=223.63ms
     iterations.....................: 49446   409.734145/s
     success_rate...................: 100.00% ✓ 49446      ✗ 0    
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

     checks.........................: 100.00% ✓ 97236      ✗ 0    
     data_received..................: 2.8 GB  24 MB/s
     data_sent......................: 39 MB   323 kB/s
     http_req_blocked...............: avg=6.57µs   min=1.37µs  med=3.57µs   max=3.93ms   p(90)=4.98µs   p(95)=5.58µs   p(99.9)=1.04ms  
     http_req_connecting............: avg=2.74µs   min=0s      med=0s       max=3.91ms   p(90)=0s       p(95)=0s       p(99.9)=1.02ms  
     http_req_duration..............: avg=184.33ms min=7.97ms  med=182.6ms  max=392.98ms p(90)=199.55ms p(95)=204.11ms p(99.9)=277.78ms
       { expected_response:true }...: avg=184.33ms min=7.97ms  med=182.6ms  max=392.98ms p(90)=199.55ms p(95)=204.11ms p(99.9)=277.78ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32512
     http_req_receiving.............: avg=93.4µs   min=34.37µs med=88.61µs  max=24.64ms  p(90)=119.88µs p(95)=131.96µs p(99.9)=620.57µs
     http_req_sending...............: avg=43.44µs  min=6.33µs  med=18.32µs  max=145.39ms p(90)=23.27µs  p(95)=25.3µs   p(99.9)=878.34µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=184.2ms  min=7.87ms  med=182.47ms max=391.99ms p(90)=199.43ms p(95)=203.98ms p(99.9)=277.21ms
     http_reqs......................: 32512   268.721431/s
     iteration_duration.............: avg=185.2ms  min=52.81ms med=183.08ms max=413.21ms p(90)=199.84ms p(95)=204.43ms p(99.9)=284.94ms
     iterations.....................: 32412   267.894901/s
     success_rate...................: 100.00% ✓ 32412      ✗ 0    
     vus............................: 1       min=1        max=50 
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

     checks.........................: 100.00% ✓ 95655      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 38 MB   318 kB/s
     http_req_blocked...............: avg=7.11µs   min=1.48µs  med=3.67µs   max=3.81ms   p(90)=5.17µs   p(95)=5.84µs   p(99.9)=1.78ms  
     http_req_connecting............: avg=3.15µs   min=0s      med=0s       max=3.77ms   p(90)=0s       p(95)=0s       p(99.9)=1.76ms  
     http_req_duration..............: avg=187.43ms min=6.7ms   med=172.39ms max=669.45ms p(90)=216.71ms p(95)=270.09ms p(99.9)=553.24ms
       { expected_response:true }...: avg=187.43ms min=6.7ms   med=172.39ms max=669.45ms p(90)=216.71ms p(95)=270.09ms p(99.9)=553.24ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 31985
     http_req_receiving.............: avg=111.15µs min=36.89µs med=93.97µs  max=158.35ms p(90)=130.41µs p(95)=147.08µs p(99.9)=888.73µs
     http_req_sending...............: avg=34.73µs  min=6.31µs  med=18.8µs   max=65.05ms  p(90)=23.66µs  p(95)=25.65µs  p(99.9)=516.66µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=187.28ms min=6.57ms  med=172.28ms max=669.34ms p(90)=216.58ms p(95)=269.34ms p(99.9)=553.11ms
     http_reqs......................: 31985   264.501401/s
     iteration_duration.............: avg=188.28ms min=43.36ms med=172.73ms max=669.71ms p(90)=217.13ms p(95)=272.69ms p(99.9)=553.54ms
     iterations.....................: 31885   263.674447/s
     success_rate...................: 100.00% ✓ 31885      ✗ 0    
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

     checks.........................: 100.00% ✓ 7029      ✗ 0   
     data_received..................: 234 MB  1.9 MB/s
     data_sent......................: 2.9 MB  23 kB/s
     http_req_blocked...............: avg=90.44µs min=1.59µs  med=3.55µs  max=9.21ms  p(90)=5.2µs    p(95)=5.9µs    p(99.9)=8.95ms  
     http_req_connecting............: avg=82.61µs min=0s      med=0s      max=9.18ms  p(90)=0s       p(95)=0s       p(99.9)=8.9ms   
     http_req_duration..............: avg=2.47s   min=25.63ms med=2.57s   max=7.64s   p(90)=3.3s     p(95)=3.51s    p(99.9)=5.71s   
       { expected_response:true }...: avg=2.47s   min=25.63ms med=2.57s   max=7.64s   p(90)=3.3s     p(95)=3.51s    p(99.9)=5.71s   
     http_req_failed................: 0.00%   ✓ 0         ✗ 2443
     http_req_receiving.............: avg=98.35µs min=34.75µs med=90.69µs max=8.15ms  p(90)=131.92µs p(95)=146.99µs p(99.9)=375.51µs
     http_req_sending...............: avg=52.79µs min=6.65µs  med=18.46µs max=11.34ms p(90)=23.67µs  p(95)=28.49µs  p(99.9)=2.56ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=2.47s   min=25.47ms med=2.57s   max=7.64s   p(90)=3.3s     p(95)=3.51s    p(99.9)=5.71s   
     http_reqs......................: 2443    19.383861/s
     iteration_duration.............: avg=2.58s   min=402ms   med=2.6s    max=7.65s   p(90)=3.32s    p(95)=3.52s    p(99.9)=5.74s   
     iterations.....................: 2343    18.590416/s
     success_rate...................: 100.00% ✓ 2343      ✗ 0   
     vus............................: 11      min=0       max=50
     vus_max........................: 50      min=50      max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

