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
| hive-router | v0.0.84 | 2,968 | 3,257 | 2,884 | 4.1% |  |
| fusion-nightly-net11 | 16.6.2-p.1 | 2,662 | 2,802 | 2,648 | 2.0% |  |
| fusion-nightly | 16.6.2-p.1 | 2,587 | 2,748 | 2,581 | 2.3% |  |
| fusion | 16.6.1 | 2,574 | 2,682 | 2,542 | 1.8% |  |
| fusion-nightly-fed | 16.6.2-p.1 | 2,395 | 2,480 | 2,377 | 1.3% |  |
| grafbase | 0.53.5 | 2,240 | 2,348 | 2,235 | 1.8% |  |
| cosmo | 0.334.0 | 1,277 | 1,328 | 1,264 | 1.7% |  |
| hive-gateway-router-runtime | 2.10.8 | 628 | 642 | 625 | 1.0% |  |
| apollo-router | v2.16.1 | 489 | 505 | 486 | 1.3% |  |
| hive-gateway | 2.10.8 | 279 | 286 | 278 | 0.9% |  |
| apollo-gateway | 2.14.3 | 275 | 282 | 274 | 0.9% |  |
| feddi | 5ff8b6165878 | — | — | — | — | non-compatible response (1114 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| fusion-nightly-net11 | 16.6.2-p.1 | 2,571 | 2,675 | 2,556 | 1.6% |  |
| hive-router | v0.0.84 | 2,491 | 2,673 | 2,453 | 3.0% |  |
| fusion-nightly | 16.6.2-p.1 | 2,459 | 2,588 | 2,455 | 1.9% |  |
| fusion | 16.6.1 | 2,384 | 2,491 | 2,365 | 1.8% |  |
| fusion-nightly-fed | 16.6.2-p.1 | 2,221 | 2,316 | 2,211 | 1.6% |  |
| grafbase | 0.53.5 | 1,632 | 1,695 | 1,629 | 1.4% |  |
| cosmo | 0.334.0 | 1,170 | 1,221 | 1,163 | 1.7% |  |
| hive-gateway-router-runtime | 2.10.8 | 596 | 615 | 592 | 1.2% |  |
| apollo-router | v2.16.1 | 404 | 424 | 400 | 2.0% |  |
| hive-gateway | 2.10.8 | 266 | 273 | 264 | 1.1% |  |
| apollo-gateway | 2.14.3 | 263 | 267 | 261 | 0.8% |  |
| feddi | 5ff8b6165878 | 17 | 17 | 16 | 3.1% |  |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.84)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 1069983     ✗ 0     
     data_received..................: 31 GB   260 MB/s
     data_sent......................: 429 MB  3.6 MB/s
     http_req_blocked...............: avg=2.8µs   min=861ns   med=2.05µs  max=17.74ms  p(90)=3.33µs  p(95)=3.93µs   p(99.9)=29.42µs
     http_req_connecting............: avg=112ns   min=0s      med=0s      max=1.89ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=16.61ms min=1.45ms  med=15.95ms max=281.85ms p(90)=24.12ms p(95)=27.19ms  p(99.9)=46.54ms
       { expected_response:true }...: avg=16.61ms min=1.45ms  med=15.95ms max=281.85ms p(90)=24.12ms p(95)=27.19ms  p(99.9)=46.54ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 356761
     http_req_receiving.............: avg=86.4µs  min=25.75µs med=47.11µs max=129.23ms p(90)=83.12µs p(95)=138.93µs p(99.9)=6.81ms 
     http_req_sending...............: avg=44.7µs  min=4.48µs  med=8.33µs  max=103.99ms p(90)=14.11µs p(95)=87.29µs  p(99.9)=5.2ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=16.48ms min=1.37ms  med=15.85ms max=281.59ms p(90)=23.96ms p(95)=26.95ms  p(99.9)=45.4ms 
     http_reqs......................: 356761  2968.252722/s
     iteration_duration.............: avg=16.81ms min=1.98ms  med=16.14ms max=291.57ms p(90)=24.32ms p(95)=27.42ms  p(99.9)=47.24ms
     iterations.....................: 356661  2967.420721/s
     success_rate...................: 100.00% ✓ 356661      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (rust subgraphs) (16.6.2-p.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 960090      ✗ 0     
     data_received..................: 28 GB   233 MB/s
     data_sent......................: 385 MB  3.2 MB/s
     http_req_blocked...............: avg=2.91µs   min=882ns   med=2.21µs  max=17.2ms   p(90)=3.45µs  p(95)=3.99µs  p(99.9)=32.27µs
     http_req_connecting............: avg=282ns    min=0s      med=0s      max=4.15ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=18.53ms  min=1.93ms  med=17.62ms max=284.5ms  p(90)=27.01ms p(95)=30.63ms p(99.9)=51.83ms
       { expected_response:true }...: avg=18.53ms  min=1.93ms  med=17.62ms max=284.5ms  p(90)=27.01ms p(95)=30.63ms p(99.9)=51.83ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 320130
     http_req_receiving.............: avg=483.73µs min=50.88µs med=93.89µs max=127.72ms p(90)=1.16ms  p(95)=1.81ms  p(99.9)=17.66ms
     http_req_sending...............: avg=44.31µs  min=4.42µs  med=8.53µs  max=134.6ms  p(90)=14.59µs p(95)=85.88µs p(99.9)=4.42ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=18ms     min=1.81ms  med=17.12ms max=270.3ms  p(90)=26.36ms p(95)=29.92ms p(99.9)=50.48ms
     http_reqs......................: 320130  2662.377766/s
     iteration_duration.............: avg=18.73ms  min=3.23ms  med=17.82ms max=305.89ms p(90)=27.22ms p(95)=30.86ms p(99.9)=52.25ms
     iterations.....................: 320030  2661.54611/s
     success_rate...................: 100.00% ✓ 320030      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (rust subgraphs) (16.6.2-p.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 933222      ✗ 0     
     data_received..................: 27 GB   227 MB/s
     data_sent......................: 374 MB  3.1 MB/s
     http_req_blocked...............: avg=2.92µs   min=862ns  med=1.97µs  max=20.78ms  p(90)=3.26µs  p(95)=3.89µs  p(99.9)=33.19µs 
     http_req_connecting............: avg=267ns    min=0s     med=0s      max=3.35ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=19.06ms  min=1.96ms med=16.51ms max=285.64ms p(90)=30.79ms p(95)=37.11ms p(99.9)=107.5ms 
       { expected_response:true }...: avg=19.06ms  min=1.96ms med=16.51ms max=285.64ms p(90)=30.79ms p(95)=37.11ms p(99.9)=107.5ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 311174
     http_req_receiving.............: avg=541.54µs min=51.2µs med=90.12µs max=135.73ms p(90)=1.04ms  p(95)=1.88ms  p(99.9)=24.81ms 
     http_req_sending...............: avg=45.37µs  min=4.7µs  med=8.41µs  max=147.71ms p(90)=15.14µs p(95)=85.51µs p(99.9)=5.3ms   
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=18.47ms  min=1.88ms med=15.99ms max=285.07ms p(90)=29.89ms p(95)=36.02ms p(99.9)=106.17ms
     http_reqs......................: 311174  2587.691336/s
     iteration_duration.............: avg=19.27ms  min=3.13ms med=16.7ms  max=301.86ms p(90)=31.01ms p(95)=37.36ms p(99.9)=108.08ms
     iterations.....................: 311074  2586.859746/s
     success_rate...................: 100.00% ✓ 311074      ✗ 0     
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

     checks.........................: 100.00% ✓ 928215      ✗ 0     
     data_received..................: 27 GB   226 MB/s
     data_sent......................: 372 MB  3.1 MB/s
     http_req_blocked...............: avg=3.19µs   min=1.09µs  med=2.33µs  max=16.98ms  p(90)=3.57µs  p(95)=4.15µs  p(99.9)=30.52µs 
     http_req_connecting............: avg=284ns    min=0s      med=0s      max=3.47ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=19.17ms  min=1.97ms  med=16.42ms max=313.39ms p(90)=31.41ms p(95)=38.09ms p(99.9)=119.02ms
       { expected_response:true }...: avg=19.17ms  min=1.97ms  med=16.42ms max=313.39ms p(90)=31.41ms p(95)=38.09ms p(99.9)=119.02ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 309505
     http_req_receiving.............: avg=583.63µs min=53.06µs med=93.63µs max=120.87ms p(90)=1.1ms   p(95)=2.02ms  p(99.9)=25.4ms  
     http_req_sending...............: avg=45.11µs  min=4.71µs  med=8.76µs  max=120.66ms p(90)=14.7µs  p(95)=87.75µs p(99.9)=4.46ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=18.54ms  min=1.87ms  med=15.85ms max=313.3ms  p(90)=30.44ms p(95)=36.96ms p(99.9)=117.97ms
     http_reqs......................: 309505  2574.072571/s
     iteration_duration.............: avg=19.38ms  min=2.97ms  med=16.62ms max=313.58ms p(90)=31.62ms p(95)=38.33ms p(99.9)=120ms   
     iterations.....................: 309405  2573.240897/s
     success_rate...................: 100.00% ✓ 309405      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (rust subgraphs) (16.6.2-p.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 863811      ✗ 0     
     data_received..................: 25 GB   211 MB/s
     data_sent......................: 346 MB  2.9 MB/s
     http_req_blocked...............: avg=2.63µs   min=911ns   med=1.96µs  max=12.27ms  p(90)=3.16µs  p(95)=3.76µs  p(99.9)=28.83µs 
     http_req_connecting............: avg=317ns    min=0s      med=0s      max=4.1ms    p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=20.62ms  min=1.74ms  med=16.63ms max=407.18ms p(90)=34.68ms p(95)=44.13ms p(99.9)=174.72ms
       { expected_response:true }...: avg=20.62ms  min=1.74ms  med=16.63ms max=407.18ms p(90)=34.68ms p(95)=44.13ms p(99.9)=174.72ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 288037
     http_req_receiving.............: avg=593.78µs min=49.77µs med=91.89µs max=187.8ms  p(90)=1.05ms  p(95)=1.87ms  p(99.9)=29.07ms 
     http_req_sending...............: avg=37.96µs  min=4.69µs  med=8.37µs  max=121.42ms p(90)=14.2µs  p(95)=53.72µs p(99.9)=2.59ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=19.99ms  min=1.64ms  med=16.1ms  max=406.85ms p(90)=33.64ms p(95)=42.89ms p(99.9)=173.21ms
     http_reqs......................: 288037  2395.833013/s
     iteration_duration.............: avg=20.82ms  min=2.4ms   med=16.82ms max=407.39ms p(90)=34.89ms p(95)=44.36ms p(99.9)=176.49ms
     iterations.....................: 287937  2395.001233/s
     success_rate...................: 100.00% ✓ 287937      ✗ 0     
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

     checks.........................: 100.00% ✓ 807666      ✗ 0     
     data_received..................: 24 GB   197 MB/s
     data_sent......................: 324 MB  2.7 MB/s
     http_req_blocked...............: avg=3.05µs  min=952ns  med=2.21µs  max=11.38ms  p(90)=3.73µs  p(95)=4.52µs  p(99.9)=37.36µs
     http_req_connecting............: avg=330ns   min=0s     med=0s      max=4.06ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=22.06ms min=1.74ms med=21.83ms max=319.6ms  p(90)=26.29ms p(95)=28.18ms p(99.9)=47.97ms
       { expected_response:true }...: avg=22.06ms min=1.74ms med=21.83ms max=319.6ms  p(90)=26.29ms p(95)=28.18ms p(99.9)=47.97ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 269322
     http_req_receiving.............: avg=88.66µs min=26.1µs med=52.91µs max=31.17ms  p(90)=91.88µs p(95)=119µs   p(99.9)=6.8ms  
     http_req_sending...............: avg=36.09µs min=4.7µs  med=9.44µs  max=155.47ms p(90)=16.01µs p(95)=26.83µs p(99.9)=2.12ms 
     http_req_tls_handshaking.......: avg=0s      min=0s     med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=21.94ms min=1.63ms med=21.73ms max=319.03ms p(90)=26.16ms p(95)=27.99ms p(99.9)=46.67ms
     http_reqs......................: 269322  2240.128889/s
     iteration_duration.............: avg=22.27ms min=3.72ms med=22.02ms max=329.23ms p(90)=26.5ms  p(95)=28.4ms  p(99.9)=48.46ms
     iterations.....................: 269222  2239.297123/s
     success_rate...................: 100.00% ✓ 269222      ✗ 0     
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

     checks.........................: 100.00% ✓ 460617      ✗ 0     
     data_received..................: 14 GB   112 MB/s
     data_sent......................: 185 MB  1.5 MB/s
     http_req_blocked...............: avg=3.39µs  min=1.03µs  med=2.53µs  max=3.5ms    p(90)=3.93µs  p(95)=4.57µs  p(99.9)=34.98µs 
     http_req_connecting............: avg=566ns   min=0s      med=0s      max=3.46ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=38.83ms min=1.99ms  med=38.41ms max=293.74ms p(90)=54.22ms p(95)=59.07ms p(99.9)=82.29ms 
       { expected_response:true }...: avg=38.83ms min=1.99ms  med=38.41ms max=293.74ms p(90)=54.22ms p(95)=59.07ms p(99.9)=82.29ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 153639
     http_req_receiving.............: avg=74.71µs min=27.84µs med=60.62µs max=148.79ms p(90)=95.18µs p(95)=110.8µs p(99.9)=968.79µs
     http_req_sending...............: avg=24.52µs min=4.94µs  med=10.52µs max=123.7ms  p(90)=15.98µs p(95)=19.76µs p(99.9)=993.06µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=38.74ms min=1.9ms   med=38.32ms max=292.9ms  p(90)=54.11ms p(95)=58.97ms p(99.9)=82.02ms 
     http_reqs......................: 153639  1277.5177/s
     iteration_duration.............: avg=39.07ms min=3.98ms  med=38.62ms max=318.83ms p(90)=54.41ms p(95)=59.27ms p(99.9)=83.07ms 
     iterations.....................: 153539  1276.686194/s
     success_rate...................: 100.00% ✓ 153539      ✗ 0     
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

     checks.........................: 100.00% ✓ 226740     ✗ 0    
     data_received..................: 6.6 GB  55 MB/s
     data_sent......................: 91 MB   754 kB/s
     http_req_blocked...............: avg=4.76µs  min=1.04µs  med=2.65µs  max=5.12ms   p(90)=4.28µs   p(95)=4.91µs   p(99.9)=41.96µs 
     http_req_connecting............: avg=1.79µs  min=0s      med=0s      max=5.06ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=79.07ms min=3.58ms  med=77.95ms max=298.39ms p(90)=99.98ms  p(95)=109.92ms p(99.9)=193.14ms
       { expected_response:true }...: avg=79.07ms min=3.58ms  med=77.95ms max=298.39ms p(90)=99.98ms  p(95)=109.92ms p(99.9)=193.14ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 75680
     http_req_receiving.............: avg=78.06µs min=26.21µs med=68.25µs max=47.59ms  p(90)=105.69µs p(95)=119.08µs p(99.9)=620.5µs 
     http_req_sending...............: avg=21.3µs  min=4.8µs   med=12.54µs max=87.1ms   p(90)=19.86µs  p(95)=22.25µs  p(99.9)=666.56µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=78.97ms min=3.48ms  med=77.86ms max=284.68ms p(90)=99.89ms  p(95)=109.8ms  p(99.9)=192.39ms
     http_reqs......................: 75680   628.098623/s
     iteration_duration.............: avg=79.4ms  min=16.18ms med=78.2ms  max=309.46ms p(90)=100.22ms p(95)=110.14ms p(99.9)=194.05ms
     iterations.....................: 75580   627.268683/s
     success_rate...................: 100.00% ✓ 75580      ✗ 0    
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

     checks.........................: 100.00% ✓ 176778     ✗ 0    
     data_received..................: 5.2 GB  43 MB/s
     data_sent......................: 71 MB   588 kB/s
     http_req_blocked...............: avg=5.05µs   min=1.1µs   med=3.43µs   max=3.37ms   p(90)=4.89µs   p(95)=5.47µs   p(99.9)=49.45µs 
     http_req_connecting............: avg=1.4µs    min=0s      med=0s       max=3.33ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=101.4ms  min=4.5ms   med=101.25ms max=318.1ms  p(90)=122.19ms p(95)=128.38ms p(99.9)=156.93ms
       { expected_response:true }...: avg=101.4ms  min=4.5ms   med=101.25ms max=318.1ms  p(90)=122.19ms p(95)=128.38ms p(99.9)=156.93ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 59026
     http_req_receiving.............: avg=81.6µs   min=30.79µs med=76.38µs  max=29.84ms  p(90)=107.62µs p(95)=119.89µs p(99.9)=483.39µs
     http_req_sending...............: avg=27.99µs  min=5.89µs  med=15.98µs  max=143.72ms p(90)=21.76µs  p(95)=23.63µs  p(99.9)=525.22µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=101.29ms min=4.44ms  med=101.14ms max=302.84ms p(90)=122.09ms p(95)=128.27ms p(99.9)=156.38ms
     http_reqs......................: 59026   489.481565/s
     iteration_duration.............: avg=101.83ms min=41.62ms med=101.53ms max=324.52ms p(90)=122.46ms p(95)=128.67ms p(99.9)=159.09ms
     iterations.....................: 58926   488.652301/s
     success_rate...................: 100.00% ✓ 58926      ✗ 0    
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

     checks.........................: 100.00% ✓ 101190     ✗ 0    
     data_received..................: 3.0 GB  25 MB/s
     data_sent......................: 41 MB   336 kB/s
     http_req_blocked...............: avg=5.81µs   min=1.57µs  med=3.61µs   max=4.33ms   p(90)=5.01µs   p(95)=5.6µs    p(99.9)=831.35µs
     http_req_connecting............: avg=1.89µs   min=0s      med=0s       max=4.23ms   p(90)=0s       p(95)=0s       p(99.9)=695.51µs
     http_req_duration..............: avg=177.21ms min=5.89ms  med=163.13ms max=643.98ms p(90)=209.32ms p(95)=258.36ms p(99.9)=550.45ms
       { expected_response:true }...: avg=177.21ms min=5.89ms  med=163.13ms max=643.98ms p(90)=209.32ms p(95)=258.36ms p(99.9)=550.45ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 33830
     http_req_receiving.............: avg=96.27µs  min=35.23µs med=89.39µs  max=79.43ms  p(90)=119.88µs p(95)=131.8µs  p(99.9)=683.69µs
     http_req_sending...............: avg=23.22µs  min=6.81µs  med=18µs     max=23.4ms   p(90)=22.79µs  p(95)=24.63µs  p(99.9)=719.86µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=177.09ms min=5.82ms  med=163.02ms max=643.89ms p(90)=209.2ms  p(95)=258.17ms p(99.9)=550.34ms
     http_reqs......................: 33830   279.869934/s
     iteration_duration.............: avg=177.99ms min=50.88ms med=163.47ms max=644.21ms p(90)=209.74ms p(95)=259.71ms p(99.9)=550.71ms
     iterations.....................: 33730   279.042651/s
     success_rate...................: 100.00% ✓ 33730      ✗ 0    
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

     checks.........................: 100.00% ✓ 99702      ✗ 0    
     data_received..................: 2.9 GB  24 MB/s
     data_sent......................: 40 MB   331 kB/s
     http_req_blocked...............: avg=5.72µs   min=1.06µs  med=2.89µs   max=3.41ms   p(90)=4.1µs    p(95)=4.58µs   p(99.9)=1.29ms  
     http_req_connecting............: avg=2.65µs   min=0s      med=0s       max=3.37ms   p(90)=0s       p(95)=0s       p(99.9)=1.26ms  
     http_req_duration..............: avg=179.83ms min=7.39ms  med=185.95ms max=375.21ms p(90)=219.84ms p(95)=226.07ms p(99.9)=287.11ms
       { expected_response:true }...: avg=179.83ms min=7.39ms  med=185.95ms max=375.21ms p(90)=219.84ms p(95)=226.07ms p(99.9)=287.11ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 33334
     http_req_receiving.............: avg=87.63µs  min=29.18µs med=78.35µs  max=116.39ms p(90)=108.56µs p(95)=119.62µs p(99.9)=483.71µs
     http_req_sending...............: avg=27.09µs  min=4.94µs  med=15.8µs   max=138.06ms p(90)=19.65µs  p(95)=21.14µs  p(99.9)=599.72µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=179.71ms min=7.32ms  med=185.85ms max=374.72ms p(90)=219.73ms p(95)=225.96ms p(99.9)=286.5ms 
     http_reqs......................: 33334   275.638443/s
     iteration_duration.............: avg=180.63ms min=34.61ms med=186.21ms max=382.91ms p(90)=220.15ms p(95)=226.39ms p(99.9)=290.04ms
     iterations.....................: 33234   274.811544/s
     success_rate...................: 100.00% ✓ 33234      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (.net subgraphs) (16.6.2-p.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 926811      ✗ 0     
     data_received..................: 27 GB   225 MB/s
     data_sent......................: 371 MB  3.1 MB/s
     http_req_blocked...............: avg=2.78µs   min=862ns   med=2.02µs  max=7.65ms   p(90)=3.73µs  p(95)=4.47µs  p(99.9)=31.47µs
     http_req_connecting............: avg=272ns    min=0s      med=0s      max=3.37ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=19.19ms  min=1.47ms  med=18.38ms max=294.69ms p(90)=27.68ms p(95)=31.18ms p(99.9)=52.19ms
       { expected_response:true }...: avg=19.19ms  min=1.47ms  med=18.38ms max=294.69ms p(90)=27.68ms p(95)=31.18ms p(99.9)=52.19ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 309037
     http_req_receiving.............: avg=535.89µs min=52.15µs med=99.1µs  max=215.98ms p(90)=1.35ms  p(95)=2.11ms  p(99.9)=18.07ms
     http_req_sending...............: avg=41.93µs  min=4.63µs  med=8.41µs  max=138.02ms p(90)=18.02µs p(95)=84µs    p(99.9)=3.25ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=18.61ms  min=1.38ms  med=17.81ms max=276.7ms  p(90)=26.99ms p(95)=30.46ms p(99.9)=50.18ms
     http_reqs......................: 309037  2571.135584/s
     iteration_duration.............: avg=19.41ms  min=2.54ms  med=18.58ms max=304.11ms p(90)=27.9ms  p(95)=31.41ms p(99.9)=52.81ms
     iterations.....................: 308937  2570.303601/s
     success_rate...................: 100.00% ✓ 308937      ✗ 0     
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

     checks.........................: 100.00% ✓ 898077      ✗ 0     
     data_received..................: 26 GB   218 MB/s
     data_sent......................: 360 MB  3.0 MB/s
     http_req_blocked...............: avg=3.03µs  min=821ns   med=2.16µs  max=13.82ms  p(90)=3.78µs  p(95)=4.54µs  p(99.9)=36.36µs
     http_req_connecting............: avg=323ns   min=0s      med=0s      max=3.54ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=19.81ms min=1.64ms  med=19.46ms max=288.53ms p(90)=27.77ms p(95)=30.29ms p(99.9)=48.95ms
       { expected_response:true }...: avg=19.81ms min=1.64ms  med=19.46ms max=288.53ms p(90)=27.77ms p(95)=30.29ms p(99.9)=48.95ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 299459
     http_req_receiving.............: avg=88.94µs min=24.47µs med=48.96µs max=147.51ms p(90)=89.82µs p(95)=130µs   p(99.9)=6.77ms 
     http_req_sending...............: avg=41.91µs min=4.69µs  med=9.39µs  max=102.16ms p(90)=17.06µs p(95)=76.84µs p(99.9)=3.23ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=19.68ms min=1.55ms  med=19.34ms max=287.92ms p(90)=27.62ms p(95)=30.09ms p(99.9)=48ms   
     http_reqs......................: 299459  2491.109707/s
     iteration_duration.............: avg=20.03ms min=3.36ms  med=19.65ms max=302.69ms p(90)=27.97ms p(95)=30.52ms p(99.9)=49.51ms
     iterations.....................: 299359  2490.277837/s
     success_rate...................: 100.00% ✓ 299359      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.6.2-p.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 886809      ✗ 0     
     data_received..................: 26 GB   216 MB/s
     data_sent......................: 355 MB  3.0 MB/s
     http_req_blocked...............: avg=3.64µs   min=1.03µs  med=2.7µs   max=8.38ms   p(90)=4.35µs  p(95)=5.13µs  p(99.9)=38.24µs 
     http_req_connecting............: avg=398ns    min=0s      med=0s      max=4.12ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=20.06ms  min=1.54ms  med=16.87ms max=316.76ms p(90)=33.05ms p(95)=40.44ms p(99.9)=135.18ms
       { expected_response:true }...: avg=20.06ms  min=1.54ms  med=16.87ms max=316.76ms p(90)=33.05ms p(95)=40.44ms p(99.9)=135.18ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 295703
     http_req_receiving.............: avg=570.07µs min=51.91µs med=96.92µs max=166ms    p(90)=1.08ms  p(95)=1.93ms  p(99.9)=27.87ms 
     http_req_sending...............: avg=48.74µs  min=4.91µs  med=9.97µs  max=184.43ms p(90)=18.81µs p(95)=95µs    p(99.9)=4.33ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=19.44ms  min=1.43ms  med=16.33ms max=316.66ms p(90)=32.08ms p(95)=39.35ms p(99.9)=133.74ms
     http_reqs......................: 295703  2459.800829/s
     iteration_duration.............: avg=20.28ms  min=2.74ms  med=17.08ms max=316.98ms p(90)=33.28ms p(95)=40.69ms p(99.9)=136.02ms
     iterations.....................: 295603  2458.968981/s
     success_rate...................: 100.00% ✓ 295603      ✗ 0     
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

     checks.........................: 100.00% ✓ 859692      ✗ 0     
     data_received..................: 25 GB   209 MB/s
     data_sent......................: 345 MB  2.9 MB/s
     http_req_blocked...............: avg=3.58µs   min=992ns   med=2.61µs   max=18.31ms  p(90)=4.15µs  p(95)=4.84µs  p(99.9)=38.55µs 
     http_req_connecting............: avg=467ns    min=0s      med=0s       max=5.21ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=20.7ms   min=1.6ms   med=17.25ms  max=358.67ms p(90)=34.16ms p(95)=42.02ms p(99.9)=146.81ms
       { expected_response:true }...: avg=20.7ms   min=1.6ms   med=17.25ms  max=358.67ms p(90)=34.16ms p(95)=42.02ms p(99.9)=146.81ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 286664
     http_req_receiving.............: avg=612.43µs min=50.98µs med=100.17µs max=163.86ms p(90)=1.14ms  p(95)=1.99ms  p(99.9)=28.04ms 
     http_req_sending...............: avg=43.52µs  min=4.75µs  med=9.79µs   max=128.73ms p(90)=17.56µs p(95)=87.57µs p(99.9)=3.82ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=20.05ms  min=1.52ms  med=16.69ms  max=358.14ms p(90)=33.07ms p(95)=40.79ms p(99.9)=145.62ms
     http_reqs......................: 286664  2384.653614/s
     iteration_duration.............: avg=20.92ms  min=2.79ms  med=17.46ms  max=358.82ms p(90)=34.38ms p(95)=42.26ms p(99.9)=148.26ms
     iterations.....................: 286564  2383.82175/s
     success_rate...................: 100.00% ✓ 286564      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (.net subgraphs) (16.6.2-p.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 800886      ✗ 0     
     data_received..................: 23 GB   195 MB/s
     data_sent......................: 321 MB  2.7 MB/s
     http_req_blocked...............: avg=3.67µs   min=1.09µs  med=2.89µs  max=7.72ms   p(90)=4.54µs  p(95)=5.3µs   p(99.9)=39.89µs 
     http_req_connecting............: avg=371ns    min=0s      med=0s      max=4ms      p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=22.23ms  min=1.88ms  med=18.76ms max=346.76ms p(90)=36.35ms p(95)=44.85ms p(99.9)=154.07ms
       { expected_response:true }...: avg=22.23ms  min=1.88ms  med=18.76ms max=346.76ms p(90)=36.35ms p(95)=44.85ms p(99.9)=154.07ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 267062
     http_req_receiving.............: avg=618.16µs min=53.22µs med=105.7µs max=285.82ms p(90)=1.17ms  p(95)=2.02ms  p(99.9)=29.86ms 
     http_req_sending...............: avg=44.99µs  min=5.02µs  med=10.71µs max=160.95ms p(90)=19.24µs p(95)=81.52µs p(99.9)=3.45ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=21.57ms  min=1.78ms  med=18.18ms max=346.18ms p(90)=35.31ms p(95)=43.63ms p(99.9)=152.51ms
     http_reqs......................: 267062  2221.075093/s
     iteration_duration.............: avg=22.46ms  min=2.9ms   med=18.98ms max=346.99ms p(90)=36.59ms p(95)=45.09ms p(99.9)=155.29ms
     iterations.....................: 266962  2220.243423/s
     success_rate...................: 100.00% ✓ 266962      ✗ 0     
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

     checks.........................: 100.00% ✓ 588723      ✗ 0     
     data_received..................: 17 GB   143 MB/s
     data_sent......................: 236 MB  2.0 MB/s
     http_req_blocked...............: avg=3.26µs  min=902ns   med=2.22µs  max=3.51ms   p(90)=4.42µs   p(95)=5.51µs   p(99.9)=42.97µs
     http_req_connecting............: avg=450ns   min=0s      med=0s      max=3.47ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=30.32ms min=2.25ms  med=29.88ms max=308.89ms p(90)=40.05ms  p(95)=43.44ms  p(99.9)=63.28ms
       { expected_response:true }...: avg=30.32ms min=2.25ms  med=29.88ms max=308.89ms p(90)=40.05ms  p(95)=43.44ms  p(99.9)=63.28ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 196341
     http_req_receiving.............: avg=92.17µs min=26.98µs med=53.94µs max=26.71ms  p(90)=123.93µs p(95)=197.89µs p(99.9)=3.95ms 
     http_req_sending...............: avg=39.53µs min=4.71µs  med=9.34µs  max=169.16ms p(90)=23.58µs  p(95)=102.1µs  p(99.9)=2.96ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=30.19ms min=2.12ms  med=29.76ms max=308.27ms p(90)=39.89ms  p(95)=43.27ms  p(99.9)=62.61ms
     http_reqs......................: 196341  1632.380088/s
     iteration_duration.............: avg=30.56ms min=7.49ms  med=30.1ms  max=319.67ms p(90)=40.27ms  p(95)=43.66ms  p(99.9)=63.64ms
     iterations.....................: 196241  1631.548688/s
     success_rate...................: 100.00% ✓ 196241      ✗ 0     
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

     checks.........................: 100.00% ✓ 422142      ✗ 0     
     data_received..................: 12 GB   102 MB/s
     data_sent......................: 169 MB  1.4 MB/s
     http_req_blocked...............: avg=3.82µs  min=1.13µs  med=2.91µs  max=3.59ms   p(90)=4.49µs   p(95)=5.2µs    p(99.9)=37.89µs 
     http_req_connecting............: avg=616ns   min=0s      med=0s      max=3.54ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=42.38ms min=2.24ms  med=41.96ms max=306.88ms p(90)=58.96ms  p(95)=64.04ms  p(99.9)=88.55ms 
       { expected_response:true }...: avg=42.38ms min=2.24ms  med=41.96ms max=306.88ms p(90)=58.96ms  p(95)=64.04ms  p(99.9)=88.55ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 140814
     http_req_receiving.............: avg=83.05µs min=26.89µs med=69.3µs  max=126.67ms p(90)=109.96µs p(95)=127.21µs p(99.9)=921.24µs
     http_req_sending...............: avg=26.79µs min=5.19µs  med=12.74µs max=92.28ms  p(90)=19.35µs  p(95)=23.11µs  p(99.9)=1ms     
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=42.27ms min=2.16ms  med=41.86ms max=291.97ms p(90)=58.84ms  p(95)=63.91ms  p(99.9)=88.13ms 
     http_reqs......................: 140814  1170.562647/s
     iteration_duration.............: avg=42.63ms min=3.89ms  med=42.19ms max=316.76ms p(90)=59.18ms  p(95)=64.26ms  p(99.9)=89.03ms 
     iterations.....................: 140714  1169.731364/s
     success_rate...................: 100.00% ✓ 140714      ✗ 0     
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

     checks.........................: 100.00% ✓ 215334     ✗ 0    
     data_received..................: 6.3 GB  52 MB/s
     data_sent......................: 86 MB   716 kB/s
     http_req_blocked...............: avg=4.2µs   min=1.04µs  med=2.7µs   max=3.9ms    p(90)=4.3µs    p(95)=4.96µs   p(99.9)=45.06µs 
     http_req_connecting............: avg=1.23µs  min=0s      med=0s      max=3.86ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=83.25ms min=3.76ms  med=81.34ms max=316.22ms p(90)=101.5ms  p(95)=111.96ms p(99.9)=195.72ms
       { expected_response:true }...: avg=83.25ms min=3.76ms  med=81.34ms max=316.22ms p(90)=101.5ms  p(95)=111.96ms p(99.9)=195.72ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 71878
     http_req_receiving.............: avg=80.41µs min=28.51µs med=71.81µs max=17.49ms  p(90)=110.02µs p(95)=124.03µs p(99.9)=657.53µs
     http_req_sending...............: avg=25.59µs min=4.79µs  med=12.87µs max=135.39ms p(90)=19.85µs  p(95)=22.12µs  p(99.9)=616.94µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=83.14ms min=3.69ms  med=81.24ms max=316.08ms p(90)=101.4ms  p(95)=111.84ms p(99.9)=195.65ms
     http_reqs......................: 71878   596.491522/s
     iteration_duration.............: avg=83.6ms  min=8.78ms  med=81.58ms max=326.84ms p(90)=101.75ms p(95)=112.21ms p(99.9)=196.44ms
     iterations.....................: 71778   595.661655/s
     success_rate...................: 100.00% ✓ 71778      ✗ 0    
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

     checks.........................: 100.00% ✓ 146058     ✗ 0    
     data_received..................: 4.3 GB  35 MB/s
     data_sent......................: 59 MB   485 kB/s
     http_req_blocked...............: avg=5.78µs   min=1.39µs  med=3.6µs    max=4.2ms    p(90)=5.02µs   p(95)=5.61µs   p(99.9)=370.9µs 
     http_req_connecting............: avg=1.91µs   min=0s      med=0s       max=4.16ms   p(90)=0s       p(95)=0s       p(99.9)=237.29µs
     http_req_duration..............: avg=122.76ms min=5.12ms  med=120.02ms max=324.55ms p(90)=162.83ms p(95)=176.15ms p(99.9)=224.97ms
       { expected_response:true }...: avg=122.76ms min=5.12ms  med=120.02ms max=324.55ms p(90)=162.83ms p(95)=176.15ms p(99.9)=224.97ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 48786
     http_req_receiving.............: avg=88.43µs  min=34.01µs med=81.5µs   max=57.27ms  p(90)=113.3µs  p(95)=125.65µs p(99.9)=495.02µs
     http_req_sending...............: avg=25.53µs  min=5.72µs  med=17.09µs  max=103.1ms  p(90)=22.32µs  p(95)=24.3µs   p(99.9)=631.51µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=122.64ms min=5.01ms  med=119.92ms max=324.17ms p(90)=162.74ms p(95)=176.01ms p(99.9)=224.58ms
     http_reqs......................: 48786   404.250411/s
     iteration_duration.............: avg=123.27ms min=25.25ms med=120.35ms max=332.29ms p(90)=163.13ms p(95)=176.44ms p(99.9)=226.82ms
     iterations.....................: 48686   403.421791/s
     success_rate...................: 100.00% ✓ 48686      ✗ 0    
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

     checks.........................: 100.00% ✓ 96180      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 39 MB   320 kB/s
     http_req_blocked...............: avg=7µs      min=1.48µs  med=3.8µs    max=4.07ms   p(90)=5.28µs   p(95)=5.89µs   p(99.9)=1.42ms  
     http_req_connecting............: avg=2.92µs   min=0s      med=0s       max=4.03ms   p(90)=0s       p(95)=0s       p(99.9)=1.39ms  
     http_req_duration..............: avg=186.36ms min=5.73ms  med=170.46ms max=680.88ms p(90)=215.93ms p(95)=261.45ms p(99.9)=581.52ms
       { expected_response:true }...: avg=186.36ms min=5.73ms  med=170.46ms max=680.88ms p(90)=215.93ms p(95)=261.45ms p(99.9)=581.52ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32160
     http_req_receiving.............: avg=101.96µs min=36.6µs  med=91.35µs  max=131.11ms p(90)=121.9µs  p(95)=134.8µs  p(99.9)=787.21µs
     http_req_sending...............: avg=32.82µs  min=6.78µs  med=18.84µs  max=91.05ms  p(90)=23.68µs  p(95)=25.66µs  p(99.9)=543.93µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=186.23ms min=5.59ms  med=170.33ms max=680.77ms p(90)=215.78ms p(95)=261.26ms p(99.9)=581.4ms 
     http_reqs......................: 32160   266.20861/s
     iteration_duration.............: avg=187.23ms min=27.43ms med=170.8ms  max=681.12ms p(90)=216.36ms p(95)=262.94ms p(99.9)=581.94ms
     iterations.....................: 32060   265.380846/s
     success_rate...................: 100.00% ✓ 32060      ✗ 0    
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

     checks.........................: 100.00% ✓ 95253      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 38 MB   316 kB/s
     http_req_blocked...............: avg=6.32µs   min=1.1µs   med=3.17µs   max=4.19ms   p(90)=4.45µs   p(95)=4.98µs   p(99.9)=1.36ms  
     http_req_connecting............: avg=2.94µs   min=0s      med=0s       max=4.15ms   p(90)=0s       p(95)=0s       p(99.9)=1.33ms  
     http_req_duration..............: avg=188.19ms min=7.79ms  med=188.63ms max=403.25ms p(90)=198.31ms p(95)=203.04ms p(99.9)=277.26ms
       { expected_response:true }...: avg=188.19ms min=7.79ms  med=188.63ms max=403.25ms p(90)=198.31ms p(95)=203.04ms p(99.9)=277.26ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 31851
     http_req_receiving.............: avg=96.64µs  min=30.25µs med=85.78µs  max=123.89ms p(90)=115.58µs p(95)=126.12µs p(99.9)=532.34µs
     http_req_sending...............: avg=28.23µs  min=5.5µs   med=16.59µs  max=69.26ms  p(90)=21µs     p(95)=22.91µs  p(99.9)=578.28µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=188.07ms min=7.65ms  med=188.52ms max=398.85ms p(90)=198.2ms  p(95)=202.91ms p(99.9)=276.66ms
     http_reqs......................: 31851   263.247519/s
     iteration_duration.............: avg=189.08ms min=53.91ms med=188.99ms max=416.92ms p(90)=198.58ms p(95)=203.35ms p(99.9)=285.82ms
     iterations.....................: 31751   262.421022/s
     success_rate...................: 100.00% ✓ 31751      ✗ 0    
     vus............................: 7       min=7        max=50 
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

     checks.........................: 100.00% ✓ 6270      ✗ 0   
     data_received..................: 210 MB  1.6 MB/s
     data_sent......................: 2.6 MB  21 kB/s
     http_req_blocked...............: avg=56.17µs min=1.5µs   med=3.63µs max=6.67ms  p(90)=5.23µs   p(95)=6.11µs  p(99.9)=4.5ms   
     http_req_connecting............: avg=50.81µs min=0s      med=0s     max=6.63ms  p(90)=0s       p(95)=0s      p(99.9)=4.42ms  
     http_req_duration..............: avg=2.77s   min=44.03ms med=2.82s  max=4.64s   p(90)=3.48s    p(95)=3.68s   p(99.9)=4.41s   
       { expected_response:true }...: avg=2.77s   min=44.03ms med=2.82s  max=4.64s   p(90)=3.48s    p(95)=3.68s   p(99.9)=4.41s   
     http_req_failed................: 0.00%   ✓ 0         ✗ 2190
     http_req_receiving.............: avg=95.76µs min=36.61µs med=88.7µs max=5.01ms  p(90)=126.59µs p(95)=143.1µs p(99.9)=555.76µs
     http_req_sending...............: avg=52.11µs min=7.33µs  med=18.8µs max=14.45ms p(90)=24.18µs  p(95)=28.97µs p(99.9)=2.6ms   
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s     max=0s      p(90)=0s       p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=2.77s   min=43.91ms med=2.82s  max=4.64s   p(90)=3.48s    p(95)=3.68s   p(99.9)=4.41s   
     http_reqs......................: 2190    17.224901/s
     iteration_duration.............: avg=2.9s    min=1.49s   med=2.85s  max=4.64s   p(90)=3.5s     p(95)=3.7s    p(99.9)=4.41s   
     iterations.....................: 2090    16.438376/s
     success_rate...................: 100.00% ✓ 2090      ✗ 0   
     vus............................: 20      min=0       max=50
     vus_max........................: 50      min=50      max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

