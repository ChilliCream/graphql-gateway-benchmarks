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
| hive-router | v0.0.84 | 2,914 | 3,131 | 2,857 | 3.1% |  |
| fusion-nightly-net11 | 16.6.2-p.8 | 2,678 | 2,829 | 2,644 | 2.5% |  |
| fusion | 16.6.1 | 2,619 | 2,762 | 2,599 | 2.1% |  |
| fusion-nightly | 16.6.2-p.8 | 2,584 | 2,716 | 2,564 | 2.1% |  |
| fusion-nightly-fed | 16.6.2-p.8 | 2,414 | 2,526 | 2,404 | 1.8% |  |
| grafbase | 0.53.5 | 2,181 | 2,271 | 2,169 | 1.6% |  |
| cosmo | 0.334.0 | 1,330 | 1,376 | 1,327 | 1.4% |  |
| hive-gateway-router-runtime | 2.10.8 | 637 | 653 | 635 | 0.9% |  |
| apollo-router | v2.16.1 | 446 | 467 | 442 | 2.1% |  |
| apollo-gateway | 2.14.3 | 277 | 283 | 276 | 0.8% |  |
| hive-gateway | 2.10.8 | 273 | 281 | 272 | 1.1% |  |
| feddi | 5ff8b6165878 | — | — | — | — | non-compatible response (1500 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.84 | 2,637 | 2,756 | 2,570 | 2.0% |  |
| fusion-nightly-net11 | 16.6.2-p.8 | 2,544 | 2,609 | 2,502 | 1.5% |  |
| fusion-nightly | 16.6.2-p.8 | 2,476 | 2,581 | 2,472 | 1.6% |  |
| fusion | 16.6.1 | 2,393 | 2,505 | 2,380 | 1.9% |  |
| fusion-nightly-fed | 16.6.2-p.8 | 2,233 | 2,340 | 2,230 | 1.7% |  |
| grafbase | 0.53.5 | 1,636 | 1,691 | 1,625 | 1.4% |  |
| cosmo | 0.334.0 | 1,237 | 1,280 | 1,234 | 1.3% |  |
| hive-gateway-router-runtime | 2.10.8 | 593 | 612 | 590 | 1.2% |  |
| apollo-router | v2.16.1 | 447 | 464 | 445 | 1.4% |  |
| apollo-gateway | 2.14.3 | 265 | 269 | 264 | 0.6% |  |
| hive-gateway | 2.10.8 | 261 | 270 | 259 | 1.3% |  |
| feddi | 5ff8b6165878 | 20 | 21 | 19 | 3.0% |  |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.84)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 1050471     ✗ 0     
     data_received..................: 31 GB   256 MB/s
     data_sent......................: 421 MB  3.5 MB/s
     http_req_blocked...............: avg=2.79µs  min=862ns   med=2.08µs  max=16.95ms  p(90)=3.4µs   p(95)=3.98µs   p(99.9)=28.43µs
     http_req_connecting............: avg=245ns   min=0s      med=0s      max=3.8ms    p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=16.92ms min=1.44ms  med=16.37ms max=266.34ms p(90)=24.82ms p(95)=27.83ms  p(99.9)=46.46ms
       { expected_response:true }...: avg=16.92ms min=1.44ms  med=16.37ms max=266.34ms p(90)=24.82ms p(95)=27.83ms  p(99.9)=46.46ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 350257
     http_req_receiving.............: avg=83.76µs min=26.77µs med=46.72µs max=103.2ms  p(90)=81.92µs p(95)=135.07µs p(99.9)=6.2ms  
     http_req_sending...............: avg=44.57µs min=4.62µs  med=8.37µs  max=154.37ms p(90)=14.33µs p(95)=86.84µs  p(99.9)=4.56ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=16.79ms min=1.37ms  med=16.26ms max=266.23ms p(90)=24.65ms p(95)=27.61ms  p(99.9)=45.49ms
     http_reqs......................: 350257  2914.311718/s
     iteration_duration.............: avg=17.12ms min=1.95ms  med=16.56ms max=289.77ms p(90)=25.02ms p(95)=28.05ms  p(99.9)=47.06ms
     iterations.....................: 350157  2913.479668/s
     success_rate...................: 100.00% ✓ 350157      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (rust subgraphs) (16.6.2-p.8)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 965697      ✗ 0     
     data_received..................: 28 GB   235 MB/s
     data_sent......................: 387 MB  3.2 MB/s
     http_req_blocked...............: avg=3.04µs   min=992ns   med=2.26µs  max=12.07ms  p(90)=3.48µs  p(95)=4.03µs  p(99.9)=32.82µs
     http_req_connecting............: avg=305ns    min=0s      med=0s      max=3.92ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=18.42ms  min=1.92ms  med=17.5ms  max=277.1ms  p(90)=26.84ms p(95)=30.51ms p(99.9)=52.29ms
       { expected_response:true }...: avg=18.42ms  min=1.92ms  med=17.5ms  max=277.1ms  p(90)=26.84ms p(95)=30.51ms p(99.9)=52.29ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 321999
     http_req_receiving.............: avg=487.58µs min=51.75µs med=94.06µs max=171.65ms p(90)=1.18ms  p(95)=1.84ms  p(99.9)=18.47ms
     http_req_sending...............: avg=44.92µs  min=4.34µs  med=8.32µs  max=203.62ms p(90)=14.7µs  p(95)=89.47µs p(99.9)=3.96ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=17.88ms  min=1.81ms  med=16.99ms max=276.75ms p(90)=26.18ms p(95)=29.8ms  p(99.9)=50.58ms
     http_reqs......................: 321999  2678.300946/s
     iteration_duration.............: avg=18.63ms  min=3.14ms  med=17.7ms  max=310.69ms p(90)=27.05ms p(95)=30.74ms p(99.9)=53.06ms
     iterations.....................: 321899  2677.469173/s
     success_rate...................: 100.00% ✓ 321899      ✗ 0     
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

     checks.........................: 100.00% ✓ 944853      ✗ 0     
     data_received..................: 28 GB   230 MB/s
     data_sent......................: 379 MB  3.1 MB/s
     http_req_blocked...............: avg=2.81µs   min=901ns   med=2.2µs   max=16.16ms  p(90)=3.42µs  p(95)=4.01µs  p(99.9)=35.28µs 
     http_req_connecting............: avg=131ns    min=0s      med=0s      max=2.14ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=18.82ms  min=2.03ms  med=16.27ms max=281.57ms p(90)=30.57ms p(95)=36.87ms p(99.9)=112.37ms
       { expected_response:true }...: avg=18.82ms  min=2.03ms  med=16.27ms max=281.57ms p(90)=30.57ms p(95)=36.87ms p(99.9)=112.37ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 315051
     http_req_receiving.............: avg=542.48µs min=50.39µs med=90.66µs max=142.78ms p(90)=1.04ms  p(95)=1.93ms  p(99.9)=24.51ms 
     http_req_sending...............: avg=44.99µs  min=4.69µs  med=8.76µs  max=198.1ms  p(90)=15.04µs p(95)=86.81µs p(99.9)=4.77ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=18.24ms  min=1.88ms  med=15.75ms max=281.32ms p(90)=29.67ms p(95)=35.9ms  p(99.9)=110.73ms
     http_reqs......................: 315051  2619.686566/s
     iteration_duration.............: avg=19.04ms  min=2.99ms  med=16.47ms max=290.55ms p(90)=30.79ms p(95)=37.11ms p(99.9)=113.1ms 
     iterations.....................: 314951  2618.855054/s
     success_rate...................: 100.00% ✓ 314951      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (rust subgraphs) (16.6.2-p.8)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 931986      ✗ 0     
     data_received..................: 27 GB   227 MB/s
     data_sent......................: 373 MB  3.1 MB/s
     http_req_blocked...............: avg=2.95µs   min=971ns   med=2.25µs  max=7.89ms   p(90)=3.46µs  p(95)=4.03µs  p(99.9)=32.33µs 
     http_req_connecting............: avg=323ns    min=0s      med=0s      max=3.59ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=19.09ms  min=2.02ms  med=16.43ms max=284.79ms p(90)=31.16ms p(95)=37.69ms p(99.9)=117.76ms
       { expected_response:true }...: avg=19.09ms  min=2.02ms  med=16.43ms max=284.79ms p(90)=31.16ms p(95)=37.69ms p(99.9)=117.76ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 310762
     http_req_receiving.............: avg=583.01µs min=51.69µs med=91.66µs max=158.48ms p(90)=1.09ms  p(95)=2.01ms  p(99.9)=25.27ms 
     http_req_sending...............: avg=41.99µs  min=4.64µs  med=8.49µs  max=196ms    p(90)=14.17µs p(95)=82.27µs p(99.9)=3.9ms   
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=18.47ms  min=1.9ms   med=15.88ms max=284.63ms p(90)=30.19ms p(95)=36.61ms p(99.9)=115.54ms
     http_reqs......................: 310762  2584.109139/s
     iteration_duration.............: avg=19.3ms   min=3.16ms  med=16.63ms max=296.22ms p(90)=31.38ms p(95)=37.92ms p(99.9)=118.75ms
     iterations.....................: 310662  2583.277599/s
     success_rate...................: 100.00% ✓ 310662      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (rust subgraphs) (16.6.2-p.8)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 870438      ✗ 0     
     data_received..................: 26 GB   212 MB/s
     data_sent......................: 349 MB  2.9 MB/s
     http_req_blocked...............: avg=3.03µs   min=972ns   med=2.46µs  max=12.24ms  p(90)=3.82µs  p(95)=4.44µs  p(99.9)=37.2µs  
     http_req_connecting............: avg=141ns    min=0s      med=0s      max=2.24ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=20.45ms  min=1.73ms  med=16.59ms max=382.62ms p(90)=34.53ms p(95)=43.74ms p(99.9)=166.87ms
       { expected_response:true }...: avg=20.45ms  min=1.73ms  med=16.59ms max=382.62ms p(90)=34.53ms p(95)=43.74ms p(99.9)=166.87ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 290246
     http_req_receiving.............: avg=592.88µs min=50.99µs med=95.14µs max=204.74ms p(90)=1.07ms  p(95)=1.91ms  p(99.9)=30.53ms 
     http_req_sending...............: avg=42.65µs  min=4.67µs  med=9.4µs   max=168.56ms p(90)=16.78µs p(95)=80.61µs p(99.9)=3.44ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=19.82ms  min=1.62ms  med=16.05ms max=382.55ms p(90)=33.47ms p(95)=42.53ms p(99.9)=164.57ms
     http_reqs......................: 290246  2414.321708/s
     iteration_duration.............: avg=20.66ms  min=2.59ms  med=16.79ms max=382.8ms  p(90)=34.75ms p(95)=43.96ms p(99.9)=167.67ms
     iterations.....................: 290146  2413.489889/s
     success_rate...................: 100.00% ✓ 290146      ✗ 0     
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

     checks.........................: 100.00% ✓ 786348      ✗ 0     
     data_received..................: 23 GB   192 MB/s
     data_sent......................: 315 MB  2.6 MB/s
     http_req_blocked...............: avg=3.17µs  min=971ns   med=2.23µs  max=10.53ms  p(90)=3.86µs  p(95)=4.66µs   p(99.9)=32.15µs
     http_req_connecting............: avg=459ns   min=0s      med=0s      max=4.07ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=22.66ms min=1.69ms  med=22.42ms max=292.59ms p(90)=26.96ms p(95)=28.79ms  p(99.9)=48.26ms
       { expected_response:true }...: avg=22.66ms min=1.69ms  med=22.42ms max=292.59ms p(90)=26.96ms p(95)=28.79ms  p(99.9)=48.26ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 262216
     http_req_receiving.............: avg=86.86µs min=26.97µs med=52.75µs max=115.63ms p(90)=91.13µs p(95)=117.23µs p(99.9)=5.94ms 
     http_req_sending...............: avg=37.21µs min=4.91µs  med=9.74µs  max=194.08ms p(90)=16.83µs p(95)=26.62µs  p(99.9)=2.42ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=22.54ms min=1.64ms  med=22.33ms max=289.29ms p(90)=26.83ms p(95)=28.62ms  p(99.9)=47.11ms
     http_reqs......................: 262216  2181.018234/s
     iteration_duration.............: avg=22.88ms min=3.92ms  med=22.62ms max=307.81ms p(90)=27.16ms p(95)=29.01ms  p(99.9)=48.91ms
     iterations.....................: 262116  2180.18647/s
     success_rate...................: 100.00% ✓ 262116      ✗ 0     
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

     checks.........................: 100.00% ✓ 479814      ✗ 0     
     data_received..................: 14 GB   117 MB/s
     data_sent......................: 192 MB  1.6 MB/s
     http_req_blocked...............: avg=2.98µs  min=972ns   med=2.11µs  max=3.87ms   p(90)=3.51µs  p(95)=4.13µs   p(99.9)=29.59µs 
     http_req_connecting............: avg=576ns   min=0s      med=0s      max=3.83ms   p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=37.28ms min=2.01ms  med=36.94ms max=295.43ms p(90)=51.94ms p(95)=56.36ms  p(99.9)=77.61ms 
       { expected_response:true }...: avg=37.28ms min=2.01ms  med=36.94ms max=295.43ms p(90)=51.94ms p(95)=56.36ms  p(99.9)=77.61ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 160038
     http_req_receiving.............: avg=67.96µs min=25.79µs med=55.58µs max=68.11ms  p(90)=90.3µs  p(95)=105.11µs p(99.9)=826.55µs
     http_req_sending...............: avg=21.89µs min=4.8µs   med=9.67µs  max=68.14ms  p(90)=16.35µs p(95)=20.49µs  p(99.9)=910.75µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=37.19ms min=1.93ms  med=36.85ms max=295.26ms p(90)=51.86ms p(95)=56.27ms  p(99.9)=77.29ms 
     http_reqs......................: 160038  1330.677145/s
     iteration_duration.............: avg=37.5ms  min=3.74ms  med=37.14ms max=303.01ms p(90)=52.14ms p(95)=56.56ms  p(99.9)=78ms    
     iterations.....................: 159938  1329.845669/s
     success_rate...................: 100.00% ✓ 159938      ✗ 0     
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

     checks.........................: 100.00% ✓ 230070     ✗ 0    
     data_received..................: 6.7 GB  56 MB/s
     data_sent......................: 92 MB   766 kB/s
     http_req_blocked...............: avg=3.9µs   min=1.03µs  med=2.41µs  max=4.22ms   p(90)=3.92µs   p(95)=4.54µs   p(99.9)=43.51µs 
     http_req_connecting............: avg=1.19µs  min=0s      med=0s      max=4.18ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=77.91ms min=3.54ms  med=76.16ms max=328.73ms p(90)=95.52ms  p(95)=104.9ms  p(99.9)=184.81ms
       { expected_response:true }...: avg=77.91ms min=3.54ms  med=76.16ms max=328.73ms p(90)=95.52ms  p(95)=104.9ms  p(99.9)=184.81ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 76790
     http_req_receiving.............: avg=80.98µs min=28.68µs med=66.75µs max=175.03ms p(90)=104.56µs p(95)=117.9µs  p(99.9)=610.29µs
     http_req_sending...............: avg=24.97µs min=5µs     med=12.22µs max=182.91ms p(90)=19.74µs  p(95)=21.98µs  p(99.9)=596.87µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=77.8ms  min=3.47ms  med=76.06ms max=328.22ms p(90)=95.41ms  p(95)=104.76ms p(99.9)=184.12ms
     http_reqs......................: 76790   637.44131/s
     iteration_duration.............: avg=78.24ms min=17.81ms med=76.39ms max=336.66ms p(90)=95.76ms  p(95)=105.19ms p(99.9)=187.56ms
     iterations.....................: 76690   636.611201/s
     success_rate...................: 100.00% ✓ 76690      ✗ 0    
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

     checks.........................: 100.00% ✓ 161301     ✗ 0    
     data_received..................: 4.7 GB  39 MB/s
     data_sent......................: 65 MB   536 kB/s
     http_req_blocked...............: avg=5.09µs   min=1.05µs  med=3.05µs   max=3.72ms   p(90)=4.37µs   p(95)=4.93µs   p(99.9)=82.68µs 
     http_req_connecting............: avg=1.82µs   min=0s      med=0s       max=3.68ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=111.18ms min=4.55ms  med=110.94ms max=314.6ms  p(90)=134.27ms p(95)=141.08ms p(99.9)=171.08ms
       { expected_response:true }...: avg=111.18ms min=4.55ms  med=110.94ms max=314.6ms  p(90)=134.27ms p(95)=141.08ms p(99.9)=171.08ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 53867
     http_req_receiving.............: avg=79.62µs  min=30.49µs med=71.55µs  max=106.47ms p(90)=103.67µs p(95)=115.52µs p(99.9)=562.59µs
     http_req_sending...............: avg=25.45µs  min=5.54µs  med=14.51µs  max=107.89ms p(90)=20.06µs  p(95)=21.85µs  p(99.9)=548.76µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=111.07ms min=4.49ms  med=110.84ms max=314.13ms p(90)=134.17ms p(95)=140.99ms p(99.9)=170.94ms
     http_reqs......................: 53867   446.637866/s
     iteration_duration.............: avg=111.62ms min=30.07ms med=111.21ms max=325.88ms p(90)=134.53ms p(95)=141.34ms p(99.9)=172.57ms
     iterations.....................: 53767   445.808717/s
     success_rate...................: 100.00% ✓ 53767      ✗ 0    
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

     checks.........................: 100.00% ✓ 100263     ✗ 0    
     data_received..................: 2.9 GB  24 MB/s
     data_sent......................: 40 MB   333 kB/s
     http_req_blocked...............: avg=8.25µs   min=1.38µs  med=3.39µs   max=6.6ms    p(90)=4.72µs   p(95)=5.31µs   p(99.9)=1.41ms  
     http_req_connecting............: avg=4.54µs   min=0s      med=0s       max=6.58ms   p(90)=0s       p(95)=0s       p(99.9)=1.3ms   
     http_req_duration..............: avg=178.83ms min=7.4ms   med=180.78ms max=365.28ms p(90)=200.14ms p(95)=208.21ms p(99.9)=269.26ms
       { expected_response:true }...: avg=178.83ms min=7.4ms   med=180.78ms max=365.28ms p(90)=200.14ms p(95)=208.21ms p(99.9)=269.26ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 33521
     http_req_receiving.............: avg=86.19µs  min=33.03µs med=82.55µs  max=5.91ms   p(90)=112.04µs p(95)=122.74µs p(99.9)=534.06µs
     http_req_sending...............: avg=23.56µs  min=6.23µs  med=16.8µs   max=18.06ms  p(90)=21.36µs  p(95)=23.11µs  p(99.9)=1.94ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=178.72ms min=7.32ms  med=180.67ms max=364.33ms p(90)=200.03ms p(95)=208.1ms  p(99.9)=269.17ms
     http_reqs......................: 33521   277.161655/s
     iteration_duration.............: avg=179.61ms min=23.3ms  med=181.12ms max=373.61ms p(90)=200.45ms p(95)=208.5ms  p(99.9)=270.15ms
     iterations.....................: 33421   276.334825/s
     success_rate...................: 100.00% ✓ 33421      ✗ 0    
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

     checks.........................: 100.00% ✓ 98787      ✗ 0    
     data_received..................: 2.9 GB  24 MB/s
     data_sent......................: 40 MB   328 kB/s
     http_req_blocked...............: avg=6.52µs   min=1.56µs  med=3.49µs   max=3.37ms   p(90)=4.85µs   p(95)=5.46µs   p(99.9)=1.47ms  
     http_req_connecting............: avg=2.78µs   min=0s      med=0s       max=3.33ms   p(90)=0s       p(95)=0s       p(99.9)=1.45ms  
     http_req_duration..............: avg=181.48ms min=5.88ms  med=166.65ms max=685.42ms p(90)=209.85ms p(95)=250.29ms p(99.9)=578.11ms
       { expected_response:true }...: avg=181.48ms min=5.88ms  med=166.65ms max=685.42ms p(90)=209.85ms p(95)=250.29ms p(99.9)=578.11ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 33029
     http_req_receiving.............: avg=93.02µs  min=37.89µs med=87.95µs  max=59ms     p(90)=118.37µs p(95)=130.2µs  p(99.9)=472.59µs
     http_req_sending...............: avg=30.82µs  min=6.71µs  med=17.19µs  max=65.25ms  p(90)=21.8µs   p(95)=23.55µs  p(99.9)=452.48µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=181.36ms min=5.81ms  med=166.54ms max=685.32ms p(90)=209.77ms p(95)=250.11ms p(99.9)=578.02ms
     http_reqs......................: 33029   273.395907/s
     iteration_duration.............: avg=182.3ms  min=32.16ms med=167ms    max=685.65ms p(90)=210.3ms  p(95)=252.36ms p(99.9)=578.49ms
     iterations.....................: 32929   272.568162/s
     success_rate...................: 100.00% ✓ 32929      ✗ 0    
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

     checks.........................: 100.00% ✓ 951063      ✗ 0     
     data_received..................: 28 GB   231 MB/s
     data_sent......................: 381 MB  3.2 MB/s
     http_req_blocked...............: avg=3.75µs  min=1.01µs med=2.63µs  max=122.65ms p(90)=4.25µs  p(95)=5.02µs   p(99.9)=40.75µs
     http_req_connecting............: avg=218ns   min=0s     med=0s      max=4.59ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=18.69ms min=1.73ms med=18.3ms  max=270.95ms p(90)=25.95ms p(95)=28.52ms  p(99.9)=48.66ms
       { expected_response:true }...: avg=18.69ms min=1.73ms med=18.3ms  max=270.95ms p(90)=25.95ms p(95)=28.52ms  p(99.9)=48.66ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 317121
     http_req_receiving.............: avg=93.81µs min=25.8µs med=50.59µs max=31.43ms  p(90)=94.7µs  p(95)=161.17µs p(99.9)=7.28ms 
     http_req_sending...............: avg=48.59µs min=4.8µs  med=10.12µs max=256.26ms p(90)=18.05µs p(95)=104.02µs p(99.9)=3.94ms 
     http_req_tls_handshaking.......: avg=0s      min=0s     med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=18.55ms min=1.63ms med=18.18ms max=270.11ms p(90)=25.79ms p(95)=28.29ms  p(99.9)=47.47ms
     http_reqs......................: 317121  2637.922784/s
     iteration_duration.............: avg=18.91ms min=3.07ms med=18.5ms  max=304.96ms p(90)=26.16ms p(95)=28.75ms  p(99.9)=49.19ms
     iterations.....................: 317021  2637.090949/s
     success_rate...................: 100.00% ✓ 317021      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (.net subgraphs) (16.6.2-p.8)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 917085      ✗ 0     
     data_received..................: 27 GB   223 MB/s
     data_sent......................: 368 MB  3.1 MB/s
     http_req_blocked...............: avg=2.85µs   min=811ns   med=2.04µs  max=15.2ms   p(90)=3.67µs  p(95)=4.42µs  p(99.9)=31.98µs
     http_req_connecting............: avg=277ns    min=0s      med=0s      max=3.45ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=19.4ms   min=1.47ms  med=18.62ms max=315.08ms p(90)=28.02ms p(95)=31.48ms p(99.9)=52.27ms
       { expected_response:true }...: avg=19.4ms   min=1.47ms  med=18.62ms max=315.08ms p(90)=28.02ms p(95)=31.48ms p(99.9)=52.27ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 305795
     http_req_receiving.............: avg=546.78µs min=50.05µs med=99.59µs max=77.52ms  p(90)=1.37ms  p(95)=2.13ms  p(99.9)=18.24ms
     http_req_sending...............: avg=40.66µs  min=4.45µs  med=8.35µs  max=74.98ms  p(90)=17.4µs  p(95)=82.58µs p(99.9)=3.44ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=18.81ms  min=1.39ms  med=18.03ms max=305.13ms p(90)=27.32ms p(95)=30.74ms p(99.9)=50.97ms
     http_reqs......................: 305795  2544.220362/s
     iteration_duration.............: avg=19.61ms  min=2.8ms   med=18.82ms max=324.82ms p(90)=28.23ms p(95)=31.72ms p(99.9)=52.82ms
     iterations.....................: 305695  2543.38836/s
     success_rate...................: 100.00% ✓ 305695      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.6.2-p.8)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 892776      ✗ 0     
     data_received..................: 26 GB   217 MB/s
     data_sent......................: 358 MB  3.0 MB/s
     http_req_blocked...............: avg=2.8µs    min=871ns  med=2.04µs  max=15.73ms  p(90)=3.63µs  p(95)=4.34µs  p(99.9)=35.76µs 
     http_req_connecting............: avg=141ns    min=0s     med=0s      max=2.28ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=19.94ms  min=1.53ms med=16.78ms max=377.77ms p(90)=32.51ms p(95)=39.79ms p(99.9)=140.79ms
       { expected_response:true }...: avg=19.94ms  min=1.53ms med=16.78ms max=377.77ms p(90)=32.51ms p(95)=39.79ms p(99.9)=140.79ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 297692
     http_req_receiving.............: avg=581.17µs min=50.4µs med=91.86µs max=313.24ms p(90)=1.08ms  p(95)=1.86ms  p(99.9)=27.25ms 
     http_req_sending...............: avg=41.92µs  min=4.26µs med=8.48µs  max=85.09ms  p(90)=16.94µs p(95)=79.91µs p(99.9)=3.73ms  
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=19.31ms  min=1.46ms med=16.27ms max=374.24ms p(90)=31.53ms p(95)=38.66ms p(99.9)=136.17ms
     http_reqs......................: 297692  2476.520234/s
     iteration_duration.............: avg=20.15ms  min=2.71ms med=16.98ms max=377.9ms  p(90)=32.73ms p(95)=40.03ms p(99.9)=141.75ms
     iterations.....................: 297592  2475.688327/s
     success_rate...................: 100.00% ✓ 297592      ✗ 0     
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

     checks.........................: 100.00% ✓ 862860      ✗ 0     
     data_received..................: 25 GB   210 MB/s
     data_sent......................: 346 MB  2.9 MB/s
     http_req_blocked...............: avg=2.88µs   min=881ns   med=2.12µs  max=15.34ms  p(90)=3.59µs  p(95)=4.29µs  p(99.9)=32.48µs 
     http_req_connecting............: avg=319ns    min=0s      med=0s      max=3.3ms    p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=20.63ms  min=1.57ms  med=16.96ms max=449.44ms p(90)=34.28ms p(95)=42.44ms p(99.9)=160.3ms 
       { expected_response:true }...: avg=20.63ms  min=1.57ms  med=16.96ms max=449.44ms p(90)=34.28ms p(95)=42.44ms p(99.9)=160.3ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 287720
     http_req_receiving.............: avg=599.08µs min=50.75µs med=95.64µs max=209.3ms  p(90)=1.1ms   p(95)=1.88ms  p(99.9)=29.11ms 
     http_req_sending...............: avg=41.34µs  min=4.57µs  med=8.58µs  max=233.68ms p(90)=15.66µs p(95)=57.75µs p(99.9)=3.13ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=19.99ms  min=1.46ms  med=16.43ms max=449.36ms p(90)=33.24ms p(95)=41.18ms p(99.9)=158.5ms 
     http_reqs......................: 287720  2393.505889/s
     iteration_duration.............: avg=20.85ms  min=2.67ms  med=17.16ms max=449.57ms p(90)=34.51ms p(95)=42.68ms p(99.9)=162.33ms
     iterations.....................: 287620  2392.674002/s
     success_rate...................: 100.00% ✓ 287620      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (.net subgraphs) (16.6.2-p.8)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 805251      ✗ 0     
     data_received..................: 24 GB   196 MB/s
     data_sent......................: 323 MB  2.7 MB/s
     http_req_blocked...............: avg=3.26µs   min=1.04µs  med=2.65µs   max=15.49ms  p(90)=4.1µs   p(95)=4.79µs  p(99.9)=37.5µs  
     http_req_connecting............: avg=144ns    min=0s      med=0s       max=1.62ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=22.11ms  min=1.87ms  med=18.51ms  max=337.57ms p(90)=36.41ms p(95)=45.19ms p(99.9)=155.48ms
       { expected_response:true }...: avg=22.11ms  min=1.87ms  med=18.51ms  max=337.57ms p(90)=36.41ms p(95)=45.19ms p(99.9)=155.48ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 268517
     http_req_receiving.............: avg=626.71µs min=52.86µs med=104.22µs max=168.42ms p(90)=1.15ms  p(95)=2.04ms  p(99.9)=30.12ms 
     http_req_sending...............: avg=43.37µs  min=5.01µs  med=10.42µs  max=142.16ms p(90)=18.32µs p(95)=88.18µs p(99.9)=3.29ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=21.44ms  min=1.75ms  med=17.94ms  max=337.49ms p(90)=35.33ms p(95)=43.87ms p(99.9)=153.77ms
     http_reqs......................: 268517  2233.183938/s
     iteration_duration.............: avg=22.34ms  min=3.11ms  med=18.72ms  max=349.05ms p(90)=36.64ms p(95)=45.42ms p(99.9)=156.1ms 
     iterations.....................: 268417  2232.352264/s
     success_rate...................: 100.00% ✓ 268417      ✗ 0     
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

     checks.........................: 100.00% ✓ 590250      ✗ 0     
     data_received..................: 17 GB   143 MB/s
     data_sent......................: 237 MB  2.0 MB/s
     http_req_blocked...............: avg=4.12µs   min=1.11µs  med=3.03µs  max=5.96ms   p(90)=5.27µs  p(95)=6.32µs   p(99.9)=49µs   
     http_req_connecting............: avg=479ns    min=0s      med=0s      max=3.87ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=30.22ms  min=2.28ms  med=29.81ms max=318.7ms  p(90)=40.19ms p(95)=43.58ms  p(99.9)=65.66ms
       { expected_response:true }...: avg=30.22ms  min=2.28ms  med=29.81ms max=318.7ms  p(90)=40.19ms p(95)=43.58ms  p(99.9)=65.66ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 196850
     http_req_receiving.............: avg=103.16µs min=28.26µs med=59.28µs max=55.52ms  p(90)=133.3µs p(95)=232.28µs p(99.9)=4.41ms 
     http_req_sending...............: avg=45.8µs   min=4.89µs  med=11.04µs max=77.48ms  p(90)=25.79µs p(95)=123.03µs p(99.9)=4.07ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=30.07ms  min=2.18ms  med=29.68ms max=318.06ms p(90)=40.03ms p(95)=43.39ms  p(99.9)=65.03ms
     http_reqs......................: 196850  1636.558573/s
     iteration_duration.............: avg=30.48ms  min=6.1ms   med=30.04ms max=344.78ms p(90)=40.42ms p(95)=43.81ms  p(99.9)=66.21ms
     iterations.....................: 196750  1635.7272/s
     success_rate...................: 100.00% ✓ 196750      ✗ 0     
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

     checks.........................: 100.00% ✓ 446292      ✗ 0     
     data_received..................: 13 GB   108 MB/s
     data_sent......................: 179 MB  1.5 MB/s
     http_req_blocked...............: avg=3.53µs  min=972ns   med=2.57µs  max=3.71ms   p(90)=4.22µs   p(95)=4.92µs   p(99.9)=35.16µs 
     http_req_connecting............: avg=646ns   min=0s      med=0s      max=3.68ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=40.07ms min=2.16ms  med=39.68ms max=299.49ms p(90)=55.56ms  p(95)=60.44ms  p(99.9)=84.07ms 
       { expected_response:true }...: avg=40.07ms min=2.16ms  med=39.68ms max=299.49ms p(90)=55.56ms  p(95)=60.44ms  p(99.9)=84.07ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 148864
     http_req_receiving.............: avg=77.65µs min=27.34µs med=65.09µs max=71.96ms  p(90)=104.87µs p(95)=121.43µs p(99.9)=900.67µs
     http_req_sending...............: avg=25.82µs min=4.78µs  med=11.67µs max=100.32ms p(90)=19.07µs  p(95)=22.89µs  p(99.9)=1.01ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=39.97ms min=2.08ms  med=39.59ms max=298.85ms p(90)=55.45ms  p(95)=60.33ms  p(99.9)=83.64ms 
     http_reqs......................: 148864  1237.61168/s
     iteration_duration.............: avg=40.32ms min=4.16ms  med=39.9ms  max=313.16ms p(90)=55.77ms  p(95)=60.65ms  p(99.9)=84.52ms 
     iterations.....................: 148764  1236.780309/s
     success_rate...................: 100.00% ✓ 148764      ✗ 0     
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

     checks.........................: 100.00% ✓ 214305     ✗ 0    
     data_received..................: 6.3 GB  52 MB/s
     data_sent......................: 86 MB   713 kB/s
     http_req_blocked...............: avg=5µs     min=1.02µs  med=2.72µs  max=8.66ms   p(90)=4.13µs   p(95)=4.75µs   p(99.9)=44.9µs  
     http_req_connecting............: avg=1.88µs  min=0s      med=0s      max=5.86ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=83.64ms min=3.78ms  med=81.82ms max=299.45ms p(90)=101.97ms p(95)=111.97ms p(99.9)=196.17ms
       { expected_response:true }...: avg=83.64ms min=3.78ms  med=81.82ms max=299.45ms p(90)=101.97ms p(95)=111.97ms p(99.9)=196.17ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 71535
     http_req_receiving.............: avg=82.04µs min=27.29µs med=71.36µs max=151.27ms p(90)=108.22µs p(95)=121.55µs p(99.9)=608.76µs
     http_req_sending...............: avg=21.93µs min=4.87µs  med=13.49µs max=119.31ms p(90)=20.34µs  p(95)=22.45µs  p(99.9)=618.06µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=83.54ms min=3.7ms   med=81.72ms max=299.34ms p(90)=101.87ms p(95)=111.87ms p(99.9)=195.35ms
     http_reqs......................: 71535   593.593899/s
     iteration_duration.............: avg=83.99ms min=15.22ms med=82.06ms max=313.76ms p(90)=102.22ms p(95)=112.27ms p(99.9)=197.91ms
     iterations.....................: 71435   592.764104/s
     success_rate...................: 100.00% ✓ 71435      ✗ 0    
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

     checks.........................: 100.00% ✓ 161682     ✗ 0    
     data_received..................: 4.7 GB  39 MB/s
     data_sent......................: 65 MB   537 kB/s
     http_req_blocked...............: avg=5.54µs   min=1.42µs  med=3.74µs   max=3.41ms   p(90)=5.32µs   p(95)=5.94µs   p(99.9)=83.34µs 
     http_req_connecting............: avg=1.57µs   min=0s      med=0s       max=3.37ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=110.87ms min=5.09ms  med=108.81ms max=330.24ms p(90)=146.11ms p(95)=157.04ms p(99.9)=200.09ms
       { expected_response:true }...: avg=110.87ms min=5.09ms  med=108.81ms max=330.24ms p(90)=146.11ms p(95)=157.04ms p(99.9)=200.09ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 53994
     http_req_receiving.............: avg=91.47µs  min=30.79µs med=83.48µs  max=106.78ms p(90)=115.27µs p(95)=128.6µs  p(99.9)=562.68µs
     http_req_sending...............: avg=24.93µs  min=5.98µs  med=17.71µs  max=83.73ms  p(90)=23.24µs  p(95)=25.16µs  p(99.9)=570.79µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=110.75ms min=4.97ms  med=108.7ms  max=329.71ms p(90)=145.99ms p(95)=156.89ms p(99.9)=199.94ms
     http_reqs......................: 53994   447.534516/s
     iteration_duration.............: avg=111.35ms min=30.97ms med=109.14ms max=340.78ms p(90)=146.42ms p(95)=157.35ms p(99.9)=201.09ms
     iterations.....................: 53894   446.705656/s
     success_rate...................: 100.00% ✓ 53894      ✗ 0    
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

     checks.........................: 100.00% ✓ 96024      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 39 MB   319 kB/s
     http_req_blocked...............: avg=6.01µs   min=1.07µs  med=3.05µs   max=3.23ms   p(90)=4.39µs   p(95)=4.92µs   p(99.9)=1.34ms  
     http_req_connecting............: avg=2.77µs   min=0s      med=0s       max=3.19ms   p(90)=0s       p(95)=0s       p(99.9)=1.32ms  
     http_req_duration..............: avg=186.72ms min=7.88ms  med=187.72ms max=396.23ms p(90)=197.6ms  p(95)=202.65ms p(99.9)=271.04ms
       { expected_response:true }...: avg=186.72ms min=7.88ms  med=187.72ms max=396.23ms p(90)=197.6ms  p(95)=202.65ms p(99.9)=271.04ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32108
     http_req_receiving.............: avg=90.02µs  min=31.95µs med=84.72µs  max=84.18ms  p(90)=114.74µs p(95)=125.01µs p(99.9)=479.32µs
     http_req_sending...............: avg=28.27µs  min=5.41µs  med=16.67µs  max=76.08ms  p(90)=21.21µs  p(95)=23.04µs  p(99.9)=523.83µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=186.6ms  min=7.76ms  med=187.6ms  max=395.77ms p(90)=197.47ms p(95)=202.51ms p(99.9)=270.94ms
     http_reqs......................: 32108   265.360963/s
     iteration_duration.............: avg=187.58ms min=41.74ms med=188.06ms max=403.24ms p(90)=197.88ms p(95)=202.94ms p(99.9)=277.42ms
     iterations.....................: 32008   264.534499/s
     success_rate...................: 100.00% ✓ 32008      ✗ 0    
     vus............................: 7       min=7        max=50 
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

     checks.........................: 100.00% ✓ 94695      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 38 MB   314 kB/s
     http_req_blocked...............: avg=6.67µs   min=1.2µs   med=3.25µs   max=4.07ms   p(90)=4.62µs   p(95)=5.22µs   p(99.9)=1.63ms  
     http_req_connecting............: avg=3.19µs   min=0s      med=0s       max=4.03ms   p(90)=0s       p(95)=0s       p(99.9)=1.54ms  
     http_req_duration..............: avg=189.35ms min=5.98ms  med=173.6ms  max=652.79ms p(90)=225.71ms p(95)=261.48ms p(99.9)=565.38ms
       { expected_response:true }...: avg=189.35ms min=5.98ms  med=173.6ms  max=652.79ms p(90)=225.71ms p(95)=261.48ms p(99.9)=565.38ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 31665
     http_req_receiving.............: avg=94.11µs  min=32.91µs med=88.69µs  max=49.47ms  p(90)=118.59µs p(95)=130.14µs p(99.9)=664.93µs
     http_req_sending...............: avg=24.39µs  min=5.32µs  med=17.48µs  max=74.21ms  p(90)=21.91µs  p(95)=23.63µs  p(99.9)=492.93µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=189.23ms min=5.85ms  med=173.48ms max=652.69ms p(90)=225.59ms p(95)=261.37ms p(99.9)=565.27ms
     http_reqs......................: 31665   261.76743/s
     iteration_duration.............: avg=190.2ms  min=59.48ms med=173.96ms max=653.01ms p(90)=226.06ms p(95)=263.01ms p(99.9)=565.66ms
     iterations.....................: 31565   260.940753/s
     success_rate...................: 100.00% ✓ 31565      ✗ 0    
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

     checks.........................: 100.00% ✓ 7584      ✗ 0   
     data_received..................: 252 MB  2.0 MB/s
     data_sent......................: 3.2 MB  25 kB/s
     http_req_blocked...............: avg=99.2µs   min=1.46µs   med=3.65µs  max=10.07ms p(90)=5.3µs    p(95)=6.28µs   p(99.9)=9.76ms  
     http_req_connecting............: avg=93.54µs  min=0s       med=0s      max=10.03ms p(90)=0s       p(95)=0s       p(99.9)=9.73ms  
     http_req_duration..............: avg=2.3s     min=27.6ms   med=2.36s   max=4.86s   p(90)=3.12s    p(95)=3.31s    p(99.9)=4.07s   
       { expected_response:true }...: avg=2.3s     min=27.6ms   med=2.36s   max=4.86s   p(90)=3.12s    p(95)=3.31s    p(99.9)=4.07s   
     http_req_failed................: 0.00%   ✓ 0         ✗ 2628
     http_req_receiving.............: avg=104.44µs min=30.58µs  med=92.35µs max=20.49ms p(90)=133.17µs p(95)=151.07µs p(99.9)=517.81µs
     http_req_sending...............: avg=64.42µs  min=6.07µs   med=18.65µs max=10.12ms p(90)=24.18µs  p(95)=28.33µs  p(99.9)=3.71ms  
     http_req_tls_handshaking.......: avg=0s       min=0s       med=0s      max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=2.3s     min=27.41ms  med=2.36s   max=4.86s   p(90)=3.12s    p(95)=3.31s    p(99.9)=4.07s   
     http_reqs......................: 2628    20.826555/s
     iteration_duration.............: avg=2.39s    min=226.65ms med=2.4s    max=4.86s   p(90)=3.14s    p(95)=3.32s    p(99.9)=4.08s   
     iterations.....................: 2528    20.034068/s
     success_rate...................: 100.00% ✓ 2528      ✗ 0   
     vus............................: 27      min=0       max=50
     vus_max........................: 50      min=50      max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

