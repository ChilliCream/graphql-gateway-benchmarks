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
| hive-router | v0.0.84 | 2,972 | 3,305 | 2,912 | 4.3% |  |
| fusion-nightly-net11 | 16.6.2-p.6 | 2,693 | 2,804 | 2,660 | 1.8% |  |
| fusion-nightly | 16.6.2-p.6 | 2,628 | 2,753 | 2,606 | 2.0% |  |
| fusion | 16.6.1 | 2,620 | 2,746 | 2,614 | 1.8% |  |
| fusion-nightly-fed | 16.6.2-p.6 | 2,482 | 2,574 | 2,466 | 1.4% |  |
| grafbase | 0.53.5 | 2,148 | 2,267 | 2,135 | 2.1% |  |
| cosmo | 0.334.0 | 1,280 | 1,334 | 1,271 | 1.7% |  |
| hive-gateway-router-runtime | 2.10.8 | 612 | 631 | 610 | 1.3% |  |
| apollo-router | v2.16.1 | 445 | 465 | 441 | 2.0% |  |
| apollo-gateway | 2.14.3 | 280 | 284 | 278 | 0.7% |  |
| hive-gateway | 2.10.8 | 276 | 282 | 274 | 1.0% |  |
| feddi | 5ff8b6165878 | — | — | — | — | non-compatible response (1190 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| fusion-nightly-net11 | 16.6.2-p.6 | 2,552 | 2,668 | 2,540 | 1.8% |  |
| fusion-nightly | 16.6.2-p.6 | 2,496 | 2,613 | 2,483 | 1.8% |  |
| fusion | 16.6.1 | 2,492 | 2,595 | 2,485 | 1.6% |  |
| hive-router | v0.0.84 | 2,417 | 2,621 | 2,373 | 3.6% |  |
| fusion-nightly-fed | 16.6.2-p.6 | 2,326 | 2,413 | 2,319 | 1.4% |  |
| grafbase | 0.53.5 | 1,680 | 1,736 | 1,678 | 1.2% |  |
| cosmo | 0.334.0 | 1,224 | 1,266 | 1,210 | 1.5% |  |
| hive-gateway-router-runtime | 2.10.8 | 576 | 598 | 574 | 1.3% |  |
| apollo-router | v2.16.1 | 450 | 468 | 449 | 1.4% |  |
| hive-gateway | 2.10.8 | 266 | 270 | 263 | 0.9% |  |
| apollo-gateway | 2.14.3 | 265 | 271 | 261 | 1.1% |  |
| feddi | 5ff8b6165878 | 19 | 20 | 18 | 3.5% |  |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.84)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 1071321     ✗ 0     
     data_received..................: 31 GB   261 MB/s
     data_sent......................: 429 MB  3.6 MB/s
     http_req_blocked...............: avg=3.15µs   min=982ns   med=2.37µs  max=17.93ms  p(90)=3.8µs   p(95)=4.46µs   p(99.9)=36.73µs
     http_req_connecting............: avg=248ns    min=0s      med=0s      max=3.77ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=16.58ms  min=1.43ms  med=15.82ms max=292.3ms  p(90)=24.41ms p(95)=27.77ms  p(99.9)=48.57ms
       { expected_response:true }...: avg=16.58ms  min=1.43ms  med=15.82ms max=292.3ms  p(90)=24.41ms p(95)=27.77ms  p(99.9)=48.57ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 357207
     http_req_receiving.............: avg=102.76µs min=25.33µs med=46.05µs max=272.24ms p(90)=87.09µs p(95)=166.61µs p(99.9)=8.06ms 
     http_req_sending...............: avg=48.58µs  min=4.7µs   med=8.94µs  max=65.31ms  p(90)=16.25µs p(95)=102.38µs p(99.9)=6.05ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=16.43ms  min=1.36ms  med=15.7ms  max=119.26ms p(90)=24.23ms p(95)=27.51ms  p(99.9)=47.41ms
     http_reqs......................: 357207  2972.039736/s
     iteration_duration.............: avg=16.79ms  min=2.02ms  med=16.01ms max=312.08ms p(90)=24.62ms p(95)=28ms     p(99.9)=49.26ms
     iterations.....................: 357107  2971.207714/s
     success_rate...................: 100.00% ✓ 357107      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (rust subgraphs) (16.6.2-p.6)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 971247      ✗ 0     
     data_received..................: 28 GB   236 MB/s
     data_sent......................: 389 MB  3.2 MB/s
     http_req_blocked...............: avg=2.48µs   min=842ns   med=1.8µs   max=13.04ms  p(90)=2.91µs  p(95)=3.44µs  p(99.9)=26.04µs
     http_req_connecting............: avg=266ns    min=0s      med=0s      max=3.43ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=18.32ms  min=1.92ms  med=17.5ms  max=295.35ms p(90)=26.52ms p(95)=29.93ms p(99.9)=50.79ms
       { expected_response:true }...: avg=18.32ms  min=1.92ms  med=17.5ms  max=295.35ms p(90)=26.52ms p(95)=29.93ms p(99.9)=50.79ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 323849
     http_req_receiving.............: avg=479.06µs min=50.05µs med=92.62µs max=150.64ms p(90)=1.15ms  p(95)=1.76ms  p(99.9)=17.1ms 
     http_req_sending...............: avg=39.63µs  min=4.51µs  med=7.85µs  max=113.39ms p(90)=13.81µs p(95)=78.99µs p(99.9)=2.88ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=17.8ms   min=1.83ms  med=16.98ms max=262.35ms p(90)=25.89ms p(95)=29.25ms p(99.9)=49.11ms
     http_reqs......................: 323849  2693.416064/s
     iteration_duration.............: avg=18.52ms  min=2.97ms  med=17.68ms max=322.21ms p(90)=26.72ms p(95)=30.15ms p(99.9)=51.39ms
     iterations.....................: 323749  2692.584375/s
     success_rate...................: 100.00% ✓ 323749      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (rust subgraphs) (16.6.2-p.6)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 947841      ✗ 0     
     data_received..................: 28 GB   230 MB/s
     data_sent......................: 380 MB  3.2 MB/s
     http_req_blocked...............: avg=2.61µs   min=881ns   med=1.87µs  max=16.86ms  p(90)=3.11µs  p(95)=3.71µs  p(99.9)=28.26µs 
     http_req_connecting............: avg=287ns    min=0s      med=0s      max=3.93ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=18.77ms  min=1.96ms  med=16.16ms max=294.11ms p(90)=30.63ms p(95)=37.07ms p(99.9)=106.62ms
       { expected_response:true }...: avg=18.77ms  min=1.96ms  med=16.16ms max=294.11ms p(90)=30.63ms p(95)=37.07ms p(99.9)=106.62ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 316047
     http_req_receiving.............: avg=552.14µs min=51.26µs med=86.08µs max=156.1ms  p(90)=1.05ms  p(95)=1.93ms  p(99.9)=25.09ms 
     http_req_sending...............: avg=44.24µs  min=4.76µs  med=8.19µs  max=220.66ms p(90)=14.71µs p(95)=80.73µs p(99.9)=4.85ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=18.17ms  min=1.88ms  med=15.63ms max=293.96ms p(90)=29.68ms p(95)=35.98ms p(99.9)=105.32ms
     http_reqs......................: 316047  2628.041466/s
     iteration_duration.............: avg=18.98ms  min=3.12ms  med=16.35ms max=303.9ms  p(90)=30.86ms p(95)=37.31ms p(99.9)=107.65ms
     iterations.....................: 315947  2627.209931/s
     success_rate...................: 100.00% ✓ 315947      ✗ 0     
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

     checks.........................: 100.00% ✓ 945201      ✗ 0     
     data_received..................: 28 GB   230 MB/s
     data_sent......................: 379 MB  3.1 MB/s
     http_req_blocked...............: avg=2.49µs   min=831ns   med=1.89µs  max=12.55ms  p(90)=3.14µs  p(95)=3.74µs  p(99.9)=29.3µs  
     http_req_connecting............: avg=188ns    min=0s      med=0s      max=2.95ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=18.82ms  min=1.98ms  med=16.26ms max=268.27ms p(90)=30.51ms p(95)=36.87ms p(99.9)=113.35ms
       { expected_response:true }...: avg=18.82ms  min=1.98ms  med=16.26ms max=268.27ms p(90)=30.51ms p(95)=36.87ms p(99.9)=113.35ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 315167
     http_req_receiving.............: avg=542.83µs min=50.51µs med=88.65µs max=135.51ms p(90)=1.05ms  p(95)=1.86ms  p(99.9)=24.29ms 
     http_req_sending...............: avg=42.31µs  min=4.35µs  med=8.03µs  max=180.74ms p(90)=14.27µs p(95)=79.65µs p(99.9)=4.01ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=18.24ms  min=1.86ms  med=15.75ms max=263.62ms p(90)=29.61ms p(95)=35.89ms p(99.9)=111.29ms
     http_reqs......................: 315167  2620.726487/s
     iteration_duration.............: avg=19.03ms  min=2.95ms  med=16.46ms max=291.27ms p(90)=30.73ms p(95)=37.1ms  p(99.9)=114.34ms
     iterations.....................: 315067  2619.894952/s
     success_rate...................: 100.00% ✓ 315067      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (rust subgraphs) (16.6.2-p.6)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 895227      ✗ 0     
     data_received..................: 26 GB   218 MB/s
     data_sent......................: 359 MB  3.0 MB/s
     http_req_blocked...............: avg=3µs      min=971ns   med=2.32µs  max=12.98ms  p(90)=3.64µs  p(95)=4.25µs  p(99.9)=33.89µs 
     http_req_connecting............: avg=291ns    min=0s      med=0s      max=3.45ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=19.88ms  min=1.7ms   med=16.17ms max=401.43ms p(90)=33.62ms p(95)=42.43ms p(99.9)=157.59ms
       { expected_response:true }...: avg=19.88ms  min=1.7ms   med=16.17ms max=401.43ms p(90)=33.62ms p(95)=42.43ms p(99.9)=157.59ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 298509
     http_req_receiving.............: avg=574.68µs min=51.94µs med=91.68µs max=192.89ms p(90)=1.04ms  p(95)=1.9ms   p(99.9)=28.55ms 
     http_req_sending...............: avg=43.57µs  min=4.73µs  med=8.81µs  max=136.18ms p(90)=15.23µs p(95)=80.74µs p(99.9)=3.89ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=19.26ms  min=1.58ms  med=15.65ms max=401.32ms p(90)=32.64ms p(95)=41.24ms p(99.9)=155.73ms
     http_reqs......................: 298509  2482.848043/s
     iteration_duration.............: avg=20.09ms  min=2.54ms  med=16.37ms max=401.64ms p(90)=33.85ms p(95)=42.69ms p(99.9)=158.22ms
     iterations.....................: 298409  2482.016293/s
     success_rate...................: 100.00% ✓ 298409      ✗ 0     
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

     checks.........................: 100.00% ✓ 774672      ✗ 0     
     data_received..................: 23 GB   189 MB/s
     data_sent......................: 310 MB  2.6 MB/s
     http_req_blocked...............: avg=2.95µs  min=902ns   med=2.19µs  max=12.5ms   p(90)=3.7µs   p(95)=4.42µs   p(99.9)=35.18µs
     http_req_connecting............: avg=320ns   min=0s      med=0s      max=3.42ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=23.01ms min=1.69ms  med=22.77ms max=289.4ms  p(90)=27.26ms p(95)=28.94ms  p(99.9)=47.61ms
       { expected_response:true }...: avg=23.01ms min=1.69ms  med=22.77ms max=289.4ms  p(90)=27.26ms p(95)=28.94ms  p(99.9)=47.61ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 258324
     http_req_receiving.............: avg=85.72µs min=27.08µs med=54.31µs max=141.03ms p(90)=92.01µs p(95)=116.57µs p(99.9)=4.98ms 
     http_req_sending...............: avg=35.6µs  min=4.64µs  med=9.66µs  max=146.35ms p(90)=16.47µs p(95)=24.98µs  p(99.9)=1.78ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=22.89ms min=1.64ms  med=22.67ms max=288.86ms p(90)=27.13ms p(95)=28.77ms  p(99.9)=46.47ms
     http_reqs......................: 258324  2148.650963/s
     iteration_duration.............: avg=23.22ms min=6.72ms  med=22.96ms max=305.32ms p(90)=27.45ms p(95)=29.15ms  p(99.9)=48.14ms
     iterations.....................: 258224  2147.819197/s
     success_rate...................: 100.00% ✓ 258224      ✗ 0     
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

     checks.........................: 100.00% ✓ 461739      ✗ 0     
     data_received..................: 14 GB   112 MB/s
     data_sent......................: 185 MB  1.5 MB/s
     http_req_blocked...............: avg=2.69µs  min=962ns   med=2µs     max=3.01ms   p(90)=3.31µs  p(95)=3.92µs   p(99.9)=26.99µs 
     http_req_connecting............: avg=389ns   min=0s      med=0s      max=2.96ms   p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=38.75ms min=2.07ms  med=38.36ms max=299.39ms p(90)=54.13ms p(95)=58.83ms  p(99.9)=81.4ms  
       { expected_response:true }...: avg=38.75ms min=2.07ms  med=38.36ms max=299.39ms p(90)=54.13ms p(95)=58.83ms  p(99.9)=81.4ms  
     http_req_failed................: 0.00%   ✓ 0           ✗ 154013
     http_req_receiving.............: avg=70.5µs  min=26.63µs med=57.32µs max=124.82ms p(90)=92.43µs p(95)=108.05µs p(99.9)=800.56µs
     http_req_sending...............: avg=22.21µs min=5.01µs  med=9.55µs  max=208.29ms p(90)=15.5µs  p(95)=19.32µs  p(99.9)=869.57µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=38.65ms min=1.98ms  med=38.27ms max=298.97ms p(90)=54.03ms p(95)=58.73ms  p(99.9)=81.18ms 
     http_reqs......................: 154013  1280.485899/s
     iteration_duration.............: avg=38.97ms min=3.71ms  med=38.55ms max=306.74ms p(90)=54.32ms p(95)=59.03ms  p(99.9)=81.85ms 
     iterations.....................: 153913  1279.654485/s
     success_rate...................: 100.00% ✓ 153913      ✗ 0     
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

     checks.........................: 100.00% ✓ 220998     ✗ 0    
     data_received..................: 6.5 GB  54 MB/s
     data_sent......................: 89 MB   735 kB/s
     http_req_blocked...............: avg=3.86µs  min=981ns   med=2.33µs  max=3.1ms    p(90)=3.83µs  p(95)=4.44µs   p(99.9)=39.66µs 
     http_req_connecting............: avg=1.22µs  min=0s      med=0s      max=3.07ms   p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=81.13ms min=3.68ms  med=79.68ms max=298.74ms p(90)=99.73ms p(95)=109.09ms p(99.9)=187.67ms
       { expected_response:true }...: avg=81.13ms min=3.68ms  med=79.68ms max=298.74ms p(90)=99.73ms p(95)=109.09ms p(99.9)=187.67ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 73766
     http_req_receiving.............: avg=74.2µs  min=28.52µs med=64.19µs max=53.77ms  p(90)=99.56µs p(95)=112.64µs p(99.9)=563.09µs
     http_req_sending...............: avg=19.13µs min=4.74µs  med=11.58µs max=62.75ms  p(90)=18.79µs p(95)=20.88µs  p(99.9)=552.48µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=81.04ms min=3.57ms  med=79.59ms max=298.24ms p(90)=99.64ms p(95)=108.98ms p(99.9)=187.12ms
     http_reqs......................: 73766   612.128671/s
     iteration_duration.............: avg=81.46ms min=24.75ms med=79.91ms max=321ms    p(90)=99.95ms p(95)=109.39ms p(99.9)=188.69ms
     iterations.....................: 73666   611.298846/s
     success_rate...................: 100.00% ✓ 73666      ✗ 0    
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

     checks.........................: 100.00% ✓ 160971     ✗ 0    
     data_received..................: 4.7 GB  39 MB/s
     data_sent......................: 65 MB   535 kB/s
     http_req_blocked...............: avg=4.55µs   min=1.09µs  med=2.62µs   max=3.96ms   p(90)=3.94µs   p(95)=4.46µs   p(99.9)=82.06µs 
     http_req_connecting............: avg=1.72µs   min=0s      med=0s       max=3.92ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=111.4ms  min=4.73ms  med=111.17ms max=337.67ms p(90)=134.35ms p(95)=141.1ms  p(99.9)=171.9ms 
       { expected_response:true }...: avg=111.4ms  min=4.73ms  med=111.17ms max=337.67ms p(90)=134.35ms p(95)=141.1ms  p(99.9)=171.9ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 53757
     http_req_receiving.............: avg=78.29µs  min=29.93µs med=67.63µs  max=184.88ms p(90)=100.3µs  p(95)=112.38µs p(99.9)=501.44µs
     http_req_sending...............: avg=18.11µs  min=5.35µs  med=13.02µs  max=86.61ms  p(90)=19.02µs  p(95)=20.87µs  p(99.9)=437.98µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=111.31ms min=4.62ms  med=111.09ms max=337ms    p(90)=134.27ms p(95)=141.02ms p(99.9)=171.76ms
     http_reqs......................: 53757   445.737623/s
     iteration_duration.............: avg=111.85ms min=24.94ms med=111.45ms max=348.34ms p(90)=134.61ms p(95)=141.34ms p(99.9)=173.33ms
     iterations.....................: 53657   444.908452/s
     success_rate...................: 100.00% ✓ 53657      ✗ 0    
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

     checks.........................: 100.00% ✓ 101349     ✗ 0    
     data_received..................: 3.0 GB  25 MB/s
     data_sent......................: 41 MB   336 kB/s
     http_req_blocked...............: avg=6.65µs   min=1.25µs  med=3.35µs   max=3.55ms   p(90)=4.59µs   p(95)=5.12µs   p(99.9)=1.64ms  
     http_req_connecting............: avg=3.08µs   min=0s      med=0s       max=3.5ms    p(90)=0s       p(95)=0s       p(99.9)=1.62ms  
     http_req_duration..............: avg=176.9ms  min=7.48ms  med=176.77ms max=388.67ms p(90)=261.37ms p(95)=269.7ms  p(99.9)=343.78ms
       { expected_response:true }...: avg=176.9ms  min=7.48ms  med=176.77ms max=388.67ms p(90)=261.37ms p(95)=269.7ms  p(99.9)=343.78ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 33883
     http_req_receiving.............: avg=89.85µs  min=31.98µs med=82.94µs  max=68.96ms  p(90)=114.06µs p(95)=124.97µs p(99.9)=428.11µs
     http_req_sending...............: avg=24.8µs   min=5.78µs  med=16.44µs  max=45.8ms   p(90)=20.93µs  p(95)=22.61µs  p(99.9)=511.02µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=176.78ms min=7.35ms  med=172.06ms max=388.55ms p(90)=261.26ms p(95)=269.6ms  p(99.9)=343.65ms
     http_reqs......................: 33883   280.177164/s
     iteration_duration.............: avg=177.69ms min=23.03ms med=186ms    max=388.93ms p(90)=261.68ms p(95)=270.01ms p(99.9)=347.81ms
     iterations.....................: 33783   279.350268/s
     success_rate...................: 100.00% ✓ 33783      ✗ 0    
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

     checks.........................: 100.00% ✓ 99948      ✗ 0    
     data_received..................: 2.9 GB  24 MB/s
     data_sent......................: 40 MB   332 kB/s
     http_req_blocked...............: avg=6.05µs   min=1.33µs  med=3.6µs    max=3.11ms   p(90)=5.07µs   p(95)=5.69µs   p(99.9)=849.08µs
     http_req_connecting............: avg=2.2µs    min=0s      med=0s       max=3.08ms   p(90)=0s       p(95)=0s       p(99.9)=827.13µs
     http_req_duration..............: avg=179.38ms min=5.45ms  med=164.42ms max=688.23ms p(90)=210.7ms  p(95)=254.92ms p(99.9)=589.3ms 
       { expected_response:true }...: avg=179.38ms min=5.45ms  med=164.42ms max=688.23ms p(90)=210.7ms  p(95)=254.92ms p(99.9)=589.3ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 33416
     http_req_receiving.............: avg=95.44µs  min=33.18µs med=89.4µs   max=44.28ms  p(90)=119.6µs  p(95)=131.07µs p(99.9)=727.25µs
     http_req_sending...............: avg=25.77µs  min=6.69µs  med=18.19µs  max=35.5ms   p(90)=22.87µs  p(95)=24.6µs   p(99.9)=554.96µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=179.26ms min=5.32ms  med=164.3ms  max=688.11ms p(90)=210.56ms p(95)=254.76ms p(99.9)=589.19ms
     http_reqs......................: 33416   276.582447/s
     iteration_duration.............: avg=180.18ms min=26.15ms med=164.78ms max=688.47ms p(90)=211.1ms  p(95)=255.93ms p(99.9)=589.56ms
     iterations.....................: 33316   275.754752/s
     success_rate...................: 100.00% ✓ 33316      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (.net subgraphs) (16.6.2-p.6)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 920043      ✗ 0     
     data_received..................: 27 GB   224 MB/s
     data_sent......................: 369 MB  3.1 MB/s
     http_req_blocked...............: avg=2.87µs  min=852ns   med=2.06µs  max=14.48ms  p(90)=3.7µs   p(95)=4.44µs  p(99.9)=31.21µs
     http_req_connecting............: avg=294ns   min=0s      med=0s      max=3.4ms    p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=19.33ms min=1.55ms  med=18.51ms max=306.05ms p(90)=27.91ms p(95)=31.4ms  p(99.9)=51.73ms
       { expected_response:true }...: avg=19.33ms min=1.55ms  med=18.51ms max=306.05ms p(90)=27.91ms p(95)=31.4ms  p(99.9)=51.73ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 306781
     http_req_receiving.............: avg=534.7µs min=50.57µs med=98.34µs max=168.28ms p(90)=1.36ms  p(95)=2.13ms  p(99.9)=17.81ms
     http_req_sending...............: avg=43.1µs  min=4.51µs  med=8.78µs  max=81.6ms   p(90)=18.73µs p(95)=86.34µs p(99.9)=3.84ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=18.75ms min=1.46ms  med=17.94ms max=298.5ms  p(90)=27.21ms p(95)=30.66ms p(99.9)=50.49ms
     http_reqs......................: 306781  2552.159302/s
     iteration_duration.............: avg=19.55ms min=2.63ms  med=18.72ms max=315.23ms p(90)=28.13ms p(95)=31.64ms p(99.9)=52.03ms
     iterations.....................: 306681  2551.327386/s
     success_rate...................: 100.00% ✓ 306681      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.6.2-p.6)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 900075      ✗ 0     
     data_received..................: 26 GB   219 MB/s
     data_sent......................: 361 MB  3.0 MB/s
     http_req_blocked...............: avg=3.35µs   min=962ns   med=2.63µs  max=6.98ms   p(90)=4.2µs   p(95)=4.93µs  p(99.9)=38.38µs 
     http_req_connecting............: avg=282ns    min=0s      med=0s      max=3.44ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=19.76ms  min=1.61ms  med=16.74ms max=283.64ms p(90)=32.35ms p(95)=39.47ms p(99.9)=133.88ms
       { expected_response:true }...: avg=19.76ms  min=1.61ms  med=16.74ms max=283.64ms p(90)=32.35ms p(95)=39.47ms p(99.9)=133.88ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 300125
     http_req_receiving.............: avg=567.18µs min=51.52µs med=97.26µs max=249.08ms p(90)=1.07ms  p(95)=1.92ms  p(99.9)=27.01ms 
     http_req_sending...............: avg=48.06µs  min=4.94µs  med=9.98µs  max=180.73ms p(90)=18.79µs p(95)=98.65µs p(99.9)=4.28ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=19.14ms  min=1.52ms  med=16.21ms max=282.94ms p(90)=31.38ms p(95)=38.33ms p(99.9)=132.02ms
     http_reqs......................: 300125  2496.683893/s
     iteration_duration.............: avg=19.98ms  min=2.74ms  med=16.95ms max=302.33ms p(90)=32.59ms p(95)=39.71ms p(99.9)=134.86ms
     iterations.....................: 300025  2495.852011/s
     success_rate...................: 100.00% ✓ 300025      ✗ 0     
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

     checks.........................: 100.00% ✓ 898563      ✗ 0     
     data_received..................: 26 GB   219 MB/s
     data_sent......................: 360 MB  3.0 MB/s
     http_req_blocked...............: avg=2.89µs   min=882ns   med=2.08µs  max=17.04ms  p(90)=3.61µs  p(95)=4.34µs  p(99.9)=31.72µs 
     http_req_connecting............: avg=297ns    min=0s      med=0s      max=3.85ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=19.8ms   min=1.62ms  med=16.52ms max=328.57ms p(90)=32.6ms  p(95)=40.09ms p(99.9)=143.78ms
       { expected_response:true }...: avg=19.8ms   min=1.62ms  med=16.52ms max=328.57ms p(90)=32.6ms  p(95)=40.09ms p(99.9)=143.78ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 299621
     http_req_receiving.............: avg=575.62µs min=50.84µs med=93.42µs max=275.82ms p(90)=1.05ms  p(95)=1.82ms  p(99.9)=28.41ms 
     http_req_sending...............: avg=40.22µs  min=4.7µs   med=8.77µs  max=32.1ms   p(90)=16.71µs p(95)=79.09µs p(99.9)=3.13ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=19.19ms  min=1.48ms  med=16.01ms max=328.48ms p(90)=31.62ms p(95)=38.92ms p(99.9)=139.66ms
     http_reqs......................: 299621  2492.632234/s
     iteration_duration.............: avg=20.02ms  min=2.33ms  med=16.72ms max=328.77ms p(90)=32.82ms p(95)=40.34ms p(99.9)=144.25ms
     iterations.....................: 299521  2491.800306/s
     success_rate...................: 100.00% ✓ 299521      ✗ 0     
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

     checks.........................: 100.00% ✓ 871470      ✗ 0     
     data_received..................: 25 GB   211 MB/s
     data_sent......................: 349 MB  2.9 MB/s
     http_req_blocked...............: avg=4.28µs  min=872ns   med=2.14µs  max=136.84ms p(90)=3.54µs  p(95)=4.26µs   p(99.9)=33.75µs
     http_req_connecting............: avg=1.71µs  min=0s      med=0s      max=136.8ms  p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=20.43ms min=1.64ms  med=20.17ms max=273.53ms p(90)=28.44ms p(95)=30.8ms   p(99.9)=49.13ms
       { expected_response:true }...: avg=20.43ms min=1.64ms  med=20.17ms max=273.53ms p(90)=28.44ms p(95)=30.8ms   p(99.9)=49.13ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 290590
     http_req_receiving.............: avg=84.86µs min=26.13µs med=49.55µs max=159.16ms p(90)=87.32µs p(95)=115.62µs p(99.9)=5.96ms 
     http_req_sending...............: avg=40.67µs min=4.64µs  med=9.41µs  max=97.69ms  p(90)=16.61µs p(95)=29.63µs  p(99.9)=3.01ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=20.31ms min=1.6ms   med=20.07ms max=262.87ms p(90)=28.31ms p(95)=30.64ms  p(99.9)=48.22ms
     http_reqs......................: 290590  2417.166116/s
     iteration_duration.............: avg=20.64ms min=3.01ms  med=20.37ms max=297.78ms p(90)=28.64ms p(95)=31.01ms  p(99.9)=49.58ms
     iterations.....................: 290490  2416.334303/s
     success_rate...................: 100.00% ✓ 290490      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (.net subgraphs) (16.6.2-p.6)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 838854      ✗ 0     
     data_received..................: 25 GB   204 MB/s
     data_sent......................: 336 MB  2.8 MB/s
     http_req_blocked...............: avg=3.06µs   min=942ns   med=2.28µs  max=6.26ms   p(90)=3.98µs  p(95)=4.73µs  p(99.9)=32.55µs 
     http_req_connecting............: avg=335ns    min=0s      med=0s      max=3.7ms    p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=21.23ms  min=1.9ms   med=17.91ms max=457.97ms p(90)=34.62ms p(95)=42.52ms p(99.9)=147.58ms
       { expected_response:true }...: avg=21.23ms  min=1.9ms   med=17.91ms max=457.97ms p(90)=34.62ms p(95)=42.52ms p(99.9)=147.58ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 279718
     http_req_receiving.............: avg=569.93µs min=50.43µs med=99.21µs max=188.15ms p(90)=1.1ms   p(95)=1.9ms   p(99.9)=26.9ms  
     http_req_sending...............: avg=40.79µs  min=4.72µs  med=9.27µs  max=119.17ms p(90)=18.48µs p(95)=80.1µs  p(99.9)=2.76ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=20.62ms  min=1.8ms   med=17.38ms max=457.86ms p(90)=33.67ms p(95)=41.45ms p(99.9)=145.61ms
     http_reqs......................: 279718  2326.265657/s
     iteration_duration.............: avg=21.44ms  min=3.07ms  med=18.11ms max=458.17ms p(90)=34.84ms p(95)=42.75ms p(99.9)=149.01ms
     iterations.....................: 279618  2325.43401/s
     success_rate...................: 100.00% ✓ 279618      ✗ 0     
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

     checks.........................: 100.00% ✓ 606165      ✗ 0     
     data_received..................: 18 GB   147 MB/s
     data_sent......................: 243 MB  2.0 MB/s
     http_req_blocked...............: avg=4.04µs   min=901ns   med=2.94µs  max=13.29ms  p(90)=5.25µs   p(95)=6.33µs   p(99.9)=48.41µs
     http_req_connecting............: avg=443ns    min=0s      med=0s      max=3.9ms    p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=29.43ms  min=2.28ms  med=28.99ms max=358.34ms p(90)=39.07ms  p(95)=42.5ms   p(99.9)=65.93ms
       { expected_response:true }...: avg=29.43ms  min=2.28ms  med=28.99ms max=358.34ms p(90)=39.07ms  p(95)=42.5ms   p(99.9)=65.93ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 202155
     http_req_receiving.............: avg=138.39µs min=26.94µs med=59.37µs max=316.86ms p(90)=132.79µs p(95)=230.96µs p(99.9)=6.66ms 
     http_req_sending...............: avg=46.78µs  min=4.71µs  med=11.01µs max=47.59ms  p(90)=26.19µs  p(95)=123.03µs p(99.9)=4.38ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=29.24ms  min=2.16ms  med=28.86ms max=87.51ms  p(90)=38.89ms  p(95)=42.27ms  p(99.9)=63.76ms
     http_reqs......................: 202155  1680.501789/s
     iteration_duration.............: avg=29.68ms  min=4.05ms  med=29.22ms max=367.17ms p(90)=39.3ms   p(95)=42.74ms  p(99.9)=66.29ms
     iterations.....................: 202055  1679.670495/s
     success_rate...................: 100.00% ✓ 202055      ✗ 0     
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

     checks.........................: 100.00% ✓ 441693      ✗ 0     
     data_received..................: 13 GB   107 MB/s
     data_sent......................: 177 MB  1.5 MB/s
     http_req_blocked...............: avg=4.75µs  min=1.08µs  med=2.87µs  max=132.86ms p(90)=4.47µs   p(95)=5.19µs  p(99.9)=40.05µs 
     http_req_connecting............: avg=650ns   min=0s      med=0s      max=3.43ms   p(90)=0s       p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=40.48ms min=2.15ms  med=40.03ms max=299.64ms p(90)=56.23ms  p(95)=61.21ms p(99.9)=84.5ms  
       { expected_response:true }...: avg=40.48ms min=2.15ms  med=40.03ms max=299.64ms p(90)=56.23ms  p(95)=61.21ms p(99.9)=84.5ms  
     http_req_failed................: 0.00%   ✓ 0           ✗ 147331
     http_req_receiving.............: avg=83.07µs min=28.93µs med=68.68µs max=83.9ms   p(90)=108.57µs p(95)=126.3µs p(99.9)=990.15µs
     http_req_sending...............: avg=26.38µs min=5.09µs  med=12.72µs max=72.12ms  p(90)=19.98µs  p(95)=24.05µs p(99.9)=1.01ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=40.37ms min=2.02ms  med=39.93ms max=299.08ms p(90)=56.12ms  p(95)=61.1ms  p(99.9)=84.34ms 
     http_reqs......................: 147331  1224.855911/s
     iteration_duration.............: avg=40.74ms min=3.88ms  med=40.26ms max=314.4ms  p(90)=56.45ms  p(95)=61.44ms p(99.9)=84.96ms 
     iterations.....................: 147231  1224.024548/s
     success_rate...................: 100.00% ✓ 147231      ✗ 0     
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

     checks.........................: 100.00% ✓ 208092     ✗ 0    
     data_received..................: 6.1 GB  51 MB/s
     data_sent......................: 83 MB   692 kB/s
     http_req_blocked...............: avg=4.02µs  min=1.04µs  med=2.41µs  max=3.85ms   p(90)=3.84µs   p(95)=4.43µs   p(99.9)=46.87µs 
     http_req_connecting............: avg=1.35µs  min=0s      med=0s      max=3.81ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=86.16ms min=3.88ms  med=84.46ms max=315.15ms p(90)=106.95ms p(95)=118.2ms  p(99.9)=208.79ms
       { expected_response:true }...: avg=86.16ms min=3.88ms  med=84.46ms max=315.15ms p(90)=106.95ms p(95)=118.2ms  p(99.9)=208.79ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 69464
     http_req_receiving.............: avg=82.88µs min=28.29µs med=71.66µs max=132.88ms p(90)=107.24µs p(95)=119.89µs p(99.9)=584.21µs
     http_req_sending...............: avg=23.06µs min=4.85µs  med=12.65µs max=101.55ms p(90)=19.75µs  p(95)=21.86µs  p(99.9)=570.56µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=86.06ms min=3.81ms  med=84.36ms max=314.86ms p(90)=106.83ms p(95)=118.05ms p(99.9)=208.41ms
     http_reqs......................: 69464   576.33199/s
     iteration_duration.............: avg=86.51ms min=23.39ms med=84.7ms  max=330.65ms p(90)=107.2ms  p(95)=118.46ms p(99.9)=209.89ms
     iterations.....................: 69364   575.502306/s
     success_rate...................: 100.00% ✓ 69364      ✗ 0    
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

     checks.........................: 100.00% ✓ 162807     ✗ 0    
     data_received..................: 4.8 GB  39 MB/s
     data_sent......................: 65 MB   541 kB/s
     http_req_blocked...............: avg=5.64µs   min=1.25µs  med=3.83µs   max=3.49ms   p(90)=5.37µs   p(95)=5.99µs   p(99.9)=93.99µs 
     http_req_connecting............: avg=1.54µs   min=0s      med=0s       max=3.45ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=110.08ms min=5.3ms   med=108ms    max=332.71ms p(90)=145.32ms p(95)=155.94ms p(99.9)=201.52ms
       { expected_response:true }...: avg=110.08ms min=5.3ms   med=108ms    max=332.71ms p(90)=145.32ms p(95)=155.94ms p(99.9)=201.52ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 54369
     http_req_receiving.............: avg=93.58µs  min=31.47µs med=85.6µs   max=112.4ms  p(90)=116.86µs p(95)=129.96µs p(99.9)=532.77µs
     http_req_sending...............: avg=31.26µs  min=5.77µs  med=18.38µs  max=151.78ms p(90)=23.75µs  p(95)=25.75µs  p(99.9)=537.76µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=109.96ms min=5.16ms  med=107.88ms max=332.15ms p(90)=145.21ms p(95)=155.82ms p(99.9)=199.89ms
     http_reqs......................: 54369   450.663981/s
     iteration_duration.............: avg=110.58ms min=20.28ms med=108.34ms max=347.16ms p(90)=145.62ms p(95)=156.29ms p(99.9)=203.65ms
     iterations.....................: 54269   449.835083/s
     success_rate...................: 100.00% ✓ 54269      ✗ 0    
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
     http_req_blocked...............: avg=6.1µs    min=1.12µs  med=3.24µs   max=3.46ms   p(90)=4.61µs   p(95)=5.15µs   p(99.9)=1.35ms  
     http_req_connecting............: avg=2.66µs   min=0s      med=0s       max=3.42ms   p(90)=0s       p(95)=0s       p(99.9)=1.33ms  
     http_req_duration..............: avg=186.4ms  min=6.19ms  med=171.61ms max=633.96ms p(90)=218.96ms p(95)=267.51ms p(99.9)=551.9ms 
       { expected_response:true }...: avg=186.4ms  min=6.19ms  med=171.61ms max=633.96ms p(90)=218.96ms p(95)=267.51ms p(99.9)=551.9ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 32163
     http_req_receiving.............: avg=94.62µs  min=32.79µs med=90.25µs  max=30.92ms  p(90)=120.48µs p(95)=132.8µs  p(99.9)=644.38µs
     http_req_sending...............: avg=28.39µs  min=5.47µs  med=16.98µs  max=71.41ms  p(90)=21.22µs  p(95)=23µs     p(99.9)=631.15µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=186.28ms min=6.09ms  med=171.5ms  max=633.87ms p(90)=218.84ms p(95)=267.39ms p(99.9)=551.8ms 
     http_reqs......................: 32163   266.104965/s
     iteration_duration.............: avg=187.24ms min=46.15ms med=171.96ms max=634.19ms p(90)=219.35ms p(95)=269.35ms p(99.9)=552.17ms
     iterations.....................: 32063   265.277602/s
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
  <summary>Summary for: apollo-gateway (.net subgraphs) (2.14.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 96036      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 39 MB   319 kB/s
     http_req_blocked...............: avg=7.12µs   min=1.19µs  med=3.62µs   max=4ms      p(90)=5.05µs   p(95)=5.68µs   p(99.9)=1.75ms  
     http_req_connecting............: avg=3.23µs   min=0s      med=0s       max=3.95ms   p(90)=0s       p(95)=0s       p(99.9)=1.72ms  
     http_req_duration..............: avg=186.65ms min=7.94ms  med=210.02ms max=398.75ms p(90)=236.34ms p(95)=244.61ms p(99.9)=312.35ms
       { expected_response:true }...: avg=186.65ms min=7.94ms  med=210.02ms max=398.75ms p(90)=236.34ms p(95)=244.61ms p(99.9)=312.35ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32112
     http_req_receiving.............: avg=96.66µs  min=32.61µs med=89.59µs  max=55.07ms  p(90)=120.65µs p(95)=133.02µs p(99.9)=711.81µs
     http_req_sending...............: avg=26.35µs  min=5.78µs  med=18.7µs   max=46.82ms  p(90)=23.41µs  p(95)=25.43µs  p(99.9)=555.54µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=186.53ms min=7.78ms  med=209.9ms  max=398.5ms  p(90)=236.2ms  p(95)=244.48ms p(99.9)=311.83ms
     http_reqs......................: 32112   265.415002/s
     iteration_duration.............: avg=187.51ms min=19.05ms med=210.49ms max=407.49ms p(90)=236.65ms p(95)=244.93ms p(99.9)=314.84ms
     iterations.....................: 32012   264.588473/s
     success_rate...................: 100.00% ✓ 32012      ✗ 0    
     vus............................: 4       min=4        max=50 
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

     checks.........................: 100.00% ✓ 7227      ✗ 0   
     data_received..................: 240 MB  1.9 MB/s
     data_sent......................: 3.0 MB  24 kB/s
     http_req_blocked...............: avg=56.89µs  min=1.21µs   med=3.75µs  max=4.22ms  p(90)=5.38µs   p(95)=6.13µs   p(99.9)=4.03ms
     http_req_connecting............: avg=51.33µs  min=0s       med=0s      max=4.17ms  p(90)=0s       p(95)=0s       p(99.9)=3.92ms
     http_req_duration..............: avg=2.41s    min=26.63ms  med=2.44s   max=4.44s   p(90)=3.31s    p(95)=3.54s    p(99.9)=4.29s 
       { expected_response:true }...: avg=2.41s    min=26.63ms  med=2.44s   max=4.44s   p(90)=3.31s    p(95)=3.54s    p(99.9)=4.29s 
     http_req_failed................: 0.00%   ✓ 0         ✗ 2509
     http_req_receiving.............: avg=100.69µs min=33.52µs  med=93.02µs max=6.08ms  p(90)=131.54µs p(95)=144.47µs p(99.9)=1.08ms
     http_req_sending...............: avg=71.44µs  min=6.43µs   med=19.11µs max=22.15ms p(90)=24.25µs  p(95)=29.06µs  p(99.9)=5.8ms 
     http_req_tls_handshaking.......: avg=0s       min=0s       med=0s      max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=2.41s    min=26.52ms  med=2.44s   max=4.44s   p(90)=3.31s    p(95)=3.54s    p(99.9)=4.29s 
     http_reqs......................: 2509    19.969753/s
     iteration_duration.............: avg=2.5s     min=272.58ms med=2.48s   max=4.44s   p(90)=3.33s    p(95)=3.54s    p(99.9)=4.31s 
     iterations.....................: 2409    19.173828/s
     success_rate...................: 100.00% ✓ 2409      ✗ 0   
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

