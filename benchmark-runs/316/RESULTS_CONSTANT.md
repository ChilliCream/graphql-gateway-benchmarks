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
| hive-router | v0.0.84 | 3,103 | 3,284 | 3,029 | 2.5% |  |
| fusion-nightly-net11 | 16.6.1-p.1 | 2,718 | 2,859 | 2,662 | 2.1% |  |
| fusion | 16.6.0 | 2,614 | 2,729 | 2,587 | 1.9% |  |
| fusion-nightly | 16.6.1-p.1 | 2,510 | 2,654 | 2,501 | 2.1% |  |
| fusion-nightly-fed | 16.6.1-p.1 | 2,506 | 2,565 | 2,488 | 1.0% |  |
| grafbase | 0.53.5 | 2,172 | 2,282 | 2,151 | 2.1% |  |
| hive-gateway-router-runtime | 2.10.8 | 634 | 653 | 633 | 1.1% |  |
| apollo-router | v2.16.1 | 487 | 503 | 483 | 1.3% |  |
| apollo-gateway | 2.14.3 | 281 | 285 | 278 | 0.8% |  |
| hive-gateway | 2.10.8 | 280 | 287 | 276 | 1.1% |  |
| cosmo | — | — | — | — | — | benchmark run failed |
| feddi | 5ff8b6165878 | — | — | — | — | non-compatible response (1389 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| fusion-nightly-net11 | 16.6.1-p.1 | 2,495 | 2,598 | 2,480 | 1.6% |  |
| fusion | 16.6.0 | 2,482 | 2,593 | 2,464 | 1.7% |  |
| hive-router | v0.0.84 | 2,400 | 2,567 | 2,386 | 2.7% |  |
| fusion-nightly | 16.6.1-p.1 | 2,349 | 2,483 | 2,334 | 2.1% |  |
| fusion-nightly-fed | 16.6.1-p.1 | 2,332 | 2,415 | 2,307 | 1.5% |  |
| grafbase | 0.53.5 | 1,620 | 1,675 | 1,616 | 1.2% |  |
| hive-gateway-router-runtime | 2.10.8 | 585 | 603 | 582 | 1.2% |  |
| apollo-router | v2.16.1 | 451 | 467 | 447 | 1.7% |  |
| hive-gateway | 2.10.8 | 267 | 275 | 266 | 1.1% |  |
| apollo-gateway | 2.14.3 | 263 | 268 | 263 | 0.7% |  |
| feddi | 5ff8b6165878 | 20 | 22 | 19 | 4.4% |  |
| cosmo | — | — | — | — | — | benchmark run failed |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.84)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 1118742     ✗ 0     
     data_received..................: 33 GB   272 MB/s
     data_sent......................: 448 MB  3.7 MB/s
     http_req_blocked...............: avg=2.63µs  min=832ns   med=1.92µs  max=17.29ms  p(90)=3.12µs  p(95)=3.71µs  p(99.9)=32.03µs
     http_req_connecting............: avg=256ns   min=0s      med=0s      max=3.52ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=15.88ms min=1.46ms  med=15.16ms max=297.66ms p(90)=23.19ms p(95)=26.35ms p(99.9)=46.58ms
       { expected_response:true }...: avg=15.88ms min=1.46ms  med=15.16ms max=297.66ms p(90)=23.19ms p(95)=26.35ms p(99.9)=46.58ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 373014
     http_req_receiving.............: avg=84.96µs min=23.83µs med=43.06µs max=159.96ms p(90)=81.52µs p(95)=154.7µs p(99.9)=6.97ms 
     http_req_sending...............: avg=48.66µs min=4.55µs  med=8.23µs  max=144.93ms p(90)=14.3µs  p(95)=93.14µs p(99.9)=7.8ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=15.74ms min=1.41ms  med=15.05ms max=297.3ms  p(90)=23.02ms p(95)=26.11ms p(99.9)=45.27ms
     http_reqs......................: 373014  3103.605043/s
     iteration_duration.............: avg=16.08ms min=1.97ms  med=15.35ms max=306.91ms p(90)=23.39ms p(95)=26.59ms p(99.9)=47.32ms
     iterations.....................: 372914  3102.773009/s
     success_rate...................: 100.00% ✓ 372914      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (rust subgraphs) (16.6.1-p.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 980292      ✗ 0     
     data_received..................: 29 GB   238 MB/s
     data_sent......................: 393 MB  3.3 MB/s
     http_req_blocked...............: avg=2.66µs   min=872ns   med=1.88µs  max=17.04ms  p(90)=3.12µs  p(95)=3.75µs  p(99.9)=26.83µs
     http_req_connecting............: avg=274ns    min=0s      med=0s      max=3.9ms    p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=18.14ms  min=1.95ms  med=17.25ms max=292.33ms p(90)=26.23ms p(95)=29.81ms p(99.9)=49.69ms
       { expected_response:true }...: avg=18.14ms  min=1.95ms  med=17.25ms max=292.33ms p(90)=26.23ms p(95)=29.81ms p(99.9)=49.69ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 326864
     http_req_receiving.............: avg=467.16µs min=49.74µs med=89.97µs max=109.65ms p(90)=1.14ms  p(95)=1.79ms  p(99.9)=17.52ms
     http_req_sending...............: avg=44.12µs  min=4.37µs  med=7.97µs  max=176.5ms  p(90)=14.55µs p(95)=80.69µs p(99.9)=4.9ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=17.63ms  min=1.84ms  med=16.75ms max=292.21ms p(90)=25.61ms p(95)=29.12ms p(99.9)=48.44ms
     http_reqs......................: 326864  2718.408967/s
     iteration_duration.............: avg=18.35ms  min=3.05ms  med=17.44ms max=301.74ms p(90)=26.44ms p(95)=30.03ms p(99.9)=50.21ms
     iterations.....................: 326764  2717.577303/s
     success_rate...................: 100.00% ✓ 326764      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (rust subgraphs) (16.6.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 942999      ✗ 0     
     data_received..................: 28 GB   229 MB/s
     data_sent......................: 378 MB  3.1 MB/s
     http_req_blocked...............: avg=2.53µs   min=842ns   med=1.84µs  max=14.77ms  p(90)=3µs     p(95)=3.58µs  p(99.9)=27.25µs 
     http_req_connecting............: avg=295ns    min=0s      med=0s      max=4.06ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=18.87ms  min=2.02ms  med=16.22ms max=278.89ms p(90)=30.65ms p(95)=37.12ms p(99.9)=123.53ms
       { expected_response:true }...: avg=18.87ms  min=2.02ms  med=16.22ms max=278.89ms p(90)=30.65ms p(95)=37.12ms p(99.9)=123.53ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 314433
     http_req_receiving.............: avg=542.58µs min=50.45µs med=87.9µs  max=178.65ms p(90)=1.04ms  p(95)=1.86ms  p(99.9)=24.72ms 
     http_req_sending...............: avg=43.76µs  min=4.36µs  med=7.93µs  max=204.2ms  p(90)=13.81µs p(95)=76.47µs p(99.9)=4.6ms   
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=18.29ms  min=1.92ms  med=15.7ms  max=278.81ms p(90)=29.74ms p(95)=36.07ms p(99.9)=121.84ms
     http_reqs......................: 314433  2614.752666/s
     iteration_duration.............: avg=19.07ms  min=3.15ms  med=16.41ms max=293.42ms p(90)=30.87ms p(95)=37.36ms p(99.9)=124.15ms
     iterations.....................: 314333  2613.921089/s
     success_rate...................: 100.00% ✓ 314333      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (rust subgraphs) (16.6.1-p.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 905361      ✗ 0     
     data_received..................: 27 GB   220 MB/s
     data_sent......................: 363 MB  3.0 MB/s
     http_req_blocked...............: avg=3.17µs  min=1.05µs  med=2.4µs   max=17.42ms  p(90)=3.67µs  p(95)=4.25µs  p(99.9)=35.04µs 
     http_req_connecting............: avg=273ns   min=0s      med=0s      max=3.32ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=19.65ms min=2.01ms  med=16.86ms max=315.89ms p(90)=32ms    p(95)=38.84ms p(99.9)=121.76ms
       { expected_response:true }...: avg=19.65ms min=2.01ms  med=16.86ms max=315.89ms p(90)=32ms    p(95)=38.84ms p(99.9)=121.76ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 301887
     http_req_receiving.............: avg=587.6µs min=51.97µs med=94.8µs  max=216.35ms p(90)=1.1ms   p(95)=2.02ms  p(99.9)=26.83ms 
     http_req_sending...............: avg=43.08µs min=4.7µs   med=8.86µs  max=37.74ms  p(90)=15.15µs p(95)=91.2µs  p(99.9)=3.89ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=19.02ms min=1.9ms   med=16.31ms max=315.8ms  p(90)=31.01ms p(95)=37.7ms  p(99.9)=120.14ms
     http_reqs......................: 301887  2510.451212/s
     iteration_duration.............: avg=19.87ms min=3.09ms  med=17.06ms max=316.09ms p(90)=32.22ms p(95)=39.09ms p(99.9)=122.54ms
     iterations.....................: 301787  2509.619625/s
     success_rate...................: 100.00% ✓ 301787      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (rust subgraphs) (16.6.1-p.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 903528      ✗ 0     
     data_received..................: 27 GB   220 MB/s
     data_sent......................: 362 MB  3.0 MB/s
     http_req_blocked...............: avg=2.58µs   min=861ns   med=1.94µs  max=6.15ms   p(90)=3.14µs  p(95)=3.73µs  p(99.9)=29.84µs 
     http_req_connecting............: avg=299ns    min=0s      med=0s      max=3.99ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=19.7ms   min=1.73ms  med=15.94ms max=365ms    p(90)=33.72ms p(95)=42.69ms p(99.9)=159.05ms
       { expected_response:true }...: avg=19.7ms   min=1.73ms  med=15.94ms max=365ms    p(90)=33.72ms p(95)=42.69ms p(99.9)=159.05ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 301276
     http_req_receiving.............: avg=589.02µs min=49.18µs med=89.06µs max=305.54ms p(90)=1.01ms  p(95)=1.79ms  p(99.9)=31.19ms 
     http_req_sending...............: avg=38.84µs  min=4.69µs  med=8.26µs  max=46.61ms  p(90)=14.34µs p(95)=58.01µs p(99.9)=3.14ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=19.08ms  min=1.62ms  med=15.46ms max=342.4ms  p(90)=32.75ms p(95)=41.53ms p(99.9)=155.94ms
     http_reqs......................: 301276  2506.053355/s
     iteration_duration.............: avg=19.91ms  min=2.51ms  med=16.14ms max=375.25ms p(90)=33.94ms p(95)=42.93ms p(99.9)=159.39ms
     iterations.....................: 301176  2505.221541/s
     success_rate...................: 100.00% ✓ 301176      ✗ 0     
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

     checks.........................: 100.00% ✓ 783354      ✗ 0     
     data_received..................: 23 GB   191 MB/s
     data_sent......................: 314 MB  2.6 MB/s
     http_req_blocked...............: avg=3.23µs  min=972ns   med=2.48µs  max=14.67ms  p(90)=3.97µs  p(95)=4.69µs   p(99.9)=37.58µs
     http_req_connecting............: avg=280ns   min=0s      med=0s      max=3.1ms    p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=22.75ms min=1.75ms  med=22.52ms max=280.5ms  p(90)=27.02ms p(95)=28.84ms  p(99.9)=48.09ms
       { expected_response:true }...: avg=22.75ms min=1.75ms  med=22.52ms max=280.5ms  p(90)=27.02ms p(95)=28.84ms  p(99.9)=48.09ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 261218
     http_req_receiving.............: avg=90.16µs min=27.97µs med=56.66µs max=143.19ms p(90)=94.27µs p(95)=121.03µs p(99.9)=5.82ms 
     http_req_sending...............: avg=38.72µs min=4.95µs  med=10.06µs max=196.69ms p(90)=16.74µs p(95)=28.81µs  p(99.9)=2.12ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=22.62ms min=1.65ms  med=22.42ms max=279.44ms p(90)=26.89ms p(95)=28.67ms  p(99.9)=46.75ms
     http_reqs......................: 261218  2172.833614/s
     iteration_duration.............: avg=22.96ms min=4.16ms  med=22.72ms max=295.83ms p(90)=27.23ms p(95)=29.06ms  p(99.9)=48.6ms 
     iterations.....................: 261118  2172.001805/s
     success_rate...................: 100.00% ✓ 261118      ✗ 0     
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

     checks.........................: 100.00% ✓ 228849     ✗ 0    
     data_received..................: 6.7 GB  56 MB/s
     data_sent......................: 92 MB   762 kB/s
     http_req_blocked...............: avg=5.14µs  min=1.05µs  med=2.5µs   max=10.48ms  p(90)=4.07µs   p(95)=4.71µs   p(99.9)=44.88µs 
     http_req_connecting............: avg=2.29µs  min=0s      med=0s      max=10.41ms  p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=78.32ms min=3.63ms  med=76.5ms  max=287.98ms p(90)=95.54ms  p(95)=104.12ms p(99.9)=180.05ms
       { expected_response:true }...: avg=78.32ms min=3.63ms  med=76.5ms  max=287.98ms p(90)=95.54ms  p(95)=104.12ms p(99.9)=180.05ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 76383
     http_req_receiving.............: avg=75.72µs min=27.52µs med=65.84µs max=65.86ms  p(90)=104.07µs p(95)=117.66µs p(99.9)=632.53µs
     http_req_sending...............: avg=24.14µs min=5.14µs  med=12.67µs max=129.65ms p(90)=20.28µs  p(95)=22.42µs  p(99.9)=651.43µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=78.22ms min=3.58ms  med=76.41ms max=287.45ms p(90)=95.44ms  p(95)=104.03ms p(99.9)=179.79ms
     http_reqs......................: 76383   634.046774/s
     iteration_duration.............: avg=78.66ms min=15.17ms med=76.73ms max=308.91ms p(90)=95.8ms   p(95)=104.42ms p(99.9)=181.55ms
     iterations.....................: 76283   633.216685/s
     success_rate...................: 100.00% ✓ 76283      ✗ 0    
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

     checks.........................: 100.00% ✓ 176046     ✗ 0    
     data_received..................: 5.2 GB  43 MB/s
     data_sent......................: 71 MB   585 kB/s
     http_req_blocked...............: avg=4.52µs   min=1.1µs   med=2.77µs   max=3.69ms   p(90)=4.24µs   p(95)=4.76µs   p(99.9)=56.23µs 
     http_req_connecting............: avg=1.53µs   min=0s      med=0s       max=3.65ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=101.84ms min=4.74ms  med=101.59ms max=317.71ms p(90)=122.73ms p(95)=128.81ms p(99.9)=158.75ms
       { expected_response:true }...: avg=101.84ms min=4.74ms  med=101.59ms max=317.71ms p(90)=122.73ms p(95)=128.81ms p(99.9)=158.75ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 58782
     http_req_receiving.............: avg=80.83µs  min=27.44µs med=74.68µs  max=62.99ms  p(90)=105.96µs p(95)=118.98µs p(99.9)=546.54µs
     http_req_sending...............: avg=25.99µs  min=4.76µs  med=14.45µs  max=184.85ms p(90)=20.32µs  p(95)=22.17µs  p(99.9)=508.27µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=101.73ms min=4.59ms  med=101.5ms  max=317.19ms p(90)=122.64ms p(95)=128.7ms  p(99.9)=158.17ms
     http_reqs......................: 58782   487.484558/s
     iteration_duration.............: avg=102.26ms min=21.51ms med=101.87ms max=325.55ms p(90)=122.97ms p(95)=129.07ms p(99.9)=160.11ms
     iterations.....................: 58682   486.655249/s
     success_rate...................: 100.00% ✓ 58682      ✗ 0    
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

     checks.........................: 100.00% ✓ 101991     ✗ 0    
     data_received..................: 3.0 GB  25 MB/s
     data_sent......................: 41 MB   338 kB/s
     http_req_blocked...............: avg=5.24µs   min=1.14µs  med=2.95µs   max=3.49ms   p(90)=4.23µs   p(95)=4.74µs   p(99.9)=788.6µs 
     http_req_connecting............: avg=2.1µs    min=0s      med=0s       max=3.46ms   p(90)=0s       p(95)=0s       p(99.9)=770.34µs
     http_req_duration..............: avg=175.82ms min=7.52ms  med=176.78ms max=369.47ms p(90)=188.16ms p(95)=191.75ms p(99.9)=258.97ms
       { expected_response:true }...: avg=175.82ms min=7.52ms  med=176.78ms max=369.47ms p(90)=188.16ms p(95)=191.75ms p(99.9)=258.97ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 34097
     http_req_receiving.............: avg=83.73µs  min=29.76µs med=81.55µs  max=4.91ms   p(90)=111.17µs p(95)=122.29µs p(99.9)=473.88µs
     http_req_sending...............: avg=22.88µs  min=5.1µs   med=15.41µs  max=66.6ms   p(90)=19.62µs  p(95)=21.32µs  p(99.9)=463.18µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=175.71ms min=7.36ms  med=176.67ms max=365.07ms p(90)=188.05ms p(95)=191.64ms p(99.9)=258.83ms
     http_reqs......................: 34097   281.879697/s
     iteration_duration.............: avg=176.6ms  min=39.91ms med=177.15ms max=379.64ms p(90)=188.43ms p(95)=192.05ms p(99.9)=260.38ms
     iterations.....................: 33997   281.052998/s
     success_rate...................: 100.00% ✓ 33997      ✗ 0    
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

     checks.........................: 100.00% ✓ 101229     ✗ 0    
     data_received..................: 3.0 GB  25 MB/s
     data_sent......................: 41 MB   336 kB/s
     http_req_blocked...............: avg=6.47µs   min=1.33µs  med=3.62µs   max=3.58ms   p(90)=5.06µs   p(95)=5.66µs   p(99.9)=1.15ms  
     http_req_connecting............: avg=2.59µs   min=0s      med=0s       max=3.54ms   p(90)=0s       p(95)=0s       p(99.9)=1.12ms  
     http_req_duration..............: avg=177.12ms min=5.9ms   med=161.15ms max=657ms    p(90)=208.17ms p(95)=242.32ms p(99.9)=574.85ms
       { expected_response:true }...: avg=177.12ms min=5.9ms   med=161.15ms max=657ms    p(90)=208.17ms p(95)=242.32ms p(99.9)=574.85ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 33843
     http_req_receiving.............: avg=96.4µs   min=34.95µs med=90.59µs  max=44.09ms  p(90)=120.64µs p(95)=132.93µs p(99.9)=733.65µs
     http_req_sending...............: avg=25.26µs  min=5.14µs  med=17.81µs  max=32.71ms  p(90)=22.6µs   p(95)=24.27µs  p(99.9)=510.36µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=177ms    min=5.77ms  med=161.04ms max=656.87ms p(90)=208.04ms p(95)=242.22ms p(99.9)=574.75ms
     http_reqs......................: 33843   280.117931/s
     iteration_duration.............: avg=177.9ms  min=33.38ms med=161.5ms  max=657.28ms p(90)=208.5ms  p(95)=243.09ms p(99.9)=575.15ms
     iterations.....................: 33743   279.290233/s
     success_rate...................: 100.00% ✓ 33743      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (.net subgraphs) (16.6.1-p.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 899529      ✗ 0     
     data_received..................: 26 GB   219 MB/s
     data_sent......................: 360 MB  3.0 MB/s
     http_req_blocked...............: avg=2.75µs   min=852ns   med=1.9µs   max=15.06ms  p(90)=3.25µs  p(95)=3.92µs  p(99.9)=28.56µs
     http_req_connecting............: avg=291ns    min=0s      med=0s      max=3.89ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=19.78ms  min=1.51ms  med=18.95ms max=279.35ms p(90)=28.7ms  p(95)=32.25ms p(99.9)=53.37ms
       { expected_response:true }...: avg=19.78ms  min=1.51ms  med=18.95ms max=279.35ms p(90)=28.7ms  p(95)=32.25ms p(99.9)=53.37ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 299943
     http_req_receiving.............: avg=548.39µs min=49.44µs med=98.71µs max=258.29ms p(90)=1.35ms  p(95)=2.1ms   p(99.9)=18.91ms
     http_req_sending...............: avg=39.74µs  min=4.51µs  med=8.05µs  max=142.23ms p(90)=15.49µs p(95)=72µs    p(99.9)=2.8ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=19.2ms   min=1.39ms  med=18.38ms max=278.67ms p(90)=27.99ms p(95)=31.5ms  p(99.9)=51.35ms
     http_reqs......................: 299943  2495.426733/s
     iteration_duration.............: avg=20ms     min=2.76ms  med=19.15ms max=311.62ms p(90)=28.91ms p(95)=32.47ms p(99.9)=53.79ms
     iterations.....................: 299843  2494.594766/s
     success_rate...................: 100.00% ✓ 299843      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (.net subgraphs) (16.6.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 894837      ✗ 0     
     data_received..................: 26 GB   218 MB/s
     data_sent......................: 359 MB  3.0 MB/s
     http_req_blocked...............: avg=2.86µs   min=862ns   med=2.04µs  max=12.45ms  p(90)=3.58µs  p(95)=4.31µs  p(99.9)=32.87µs 
     http_req_connecting............: avg=304ns    min=0s      med=0s      max=3.86ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=19.89ms  min=1.63ms  med=16.72ms max=421.71ms p(90)=32.45ms p(95)=39.86ms p(99.9)=141.67ms
       { expected_response:true }...: avg=19.89ms  min=1.63ms  med=16.72ms max=421.71ms p(90)=32.45ms p(95)=39.86ms p(99.9)=141.67ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 298379
     http_req_receiving.............: avg=558.99µs min=49.45µs med=93.21µs max=182.53ms p(90)=1.07ms  p(95)=1.86ms  p(99.9)=26.79ms 
     http_req_sending...............: avg=40µs     min=4.69µs  med=8.71µs  max=168.71ms p(90)=17.34µs p(95)=82.13µs p(99.9)=2.93ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=19.29ms  min=1.51ms  med=16.21ms max=421.51ms p(90)=31.48ms p(95)=38.76ms p(99.9)=140.15ms
     http_reqs......................: 298379  2482.102063/s
     iteration_duration.............: avg=20.1ms   min=2.12ms  med=16.93ms max=421.91ms p(90)=32.68ms p(95)=40.09ms p(99.9)=142.5ms 
     iterations.....................: 298279  2481.270201/s
     success_rate...................: 100.00% ✓ 298279      ✗ 0     
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

     checks.........................: 100.00% ✓ 865569      ✗ 0     
     data_received..................: 25 GB   210 MB/s
     data_sent......................: 347 MB  2.9 MB/s
     http_req_blocked...............: avg=2.77µs  min=931ns   med=2.09µs  max=3.94ms   p(90)=3.48µs  p(95)=4.18µs   p(99.9)=33.96µs
     http_req_connecting............: avg=305ns   min=0s      med=0s      max=3.89ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=20.57ms min=1.76ms  med=20.38ms max=250.97ms p(90)=28.55ms p(95)=30.92ms  p(99.9)=48.27ms
       { expected_response:true }...: avg=20.57ms min=1.76ms  med=20.38ms max=250.97ms p(90)=28.55ms p(95)=30.92ms  p(99.9)=48.27ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 288623
     http_req_receiving.............: avg=82.96µs min=26.17µs med=49.33µs max=32.53ms  p(90)=86.89µs p(95)=115.28µs p(99.9)=5.92ms 
     http_req_sending...............: avg=39.49µs min=4.83µs  med=9.24µs  max=207.84ms p(90)=16.22µs p(95)=31.67µs  p(99.9)=2.54ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=20.45ms min=1.67ms  med=20.28ms max=238.89ms p(90)=28.42ms p(95)=30.75ms  p(99.9)=47.11ms
     http_reqs......................: 288623  2400.752891/s
     iteration_duration.............: avg=20.78ms min=3.6ms   med=20.58ms max=344.27ms p(90)=28.76ms p(95)=31.14ms  p(99.9)=48.7ms 
     iterations.....................: 288523  2399.921096/s
     success_rate...................: 100.00% ✓ 288523      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.6.1-p.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 846987      ✗ 0     
     data_received..................: 25 GB   206 MB/s
     data_sent......................: 339 MB  2.8 MB/s
     http_req_blocked...............: avg=3.18µs   min=1.03µs  med=2.61µs   max=6.66ms   p(90)=4.05µs  p(95)=4.7µs   p(99.9)=39.33µs 
     http_req_connecting............: avg=139ns    min=0s      med=0s       max=2.14ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=21.01ms  min=1.61ms  med=17.44ms  max=691.7ms  p(90)=34.47ms p(95)=42.64ms p(99.9)=156.84ms
       { expected_response:true }...: avg=21.01ms  min=1.61ms  med=17.44ms  max=691.7ms  p(90)=34.47ms p(95)=42.64ms p(99.9)=156.84ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 282429
     http_req_receiving.............: avg=627.83µs min=53.55µs med=103.24µs max=172.13ms p(90)=1.15ms  p(95)=2.01ms  p(99.9)=29.14ms 
     http_req_sending...............: avg=45.35µs  min=4.69µs  med=10.16µs  max=183.46ms p(90)=17.43µs p(95)=90.77µs p(99.9)=3.51ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=20.34ms  min=1.53ms  med=16.86ms  max=691.36ms p(90)=33.42ms p(95)=41.38ms p(99.9)=154.67ms
     http_reqs......................: 282429  2349.186591/s
     iteration_duration.............: avg=21.24ms  min=2.56ms  med=17.65ms  max=691.95ms p(90)=34.7ms  p(95)=42.89ms p(99.9)=157.78ms
     iterations.....................: 282329  2348.354812/s
     success_rate...................: 100.00% ✓ 282329      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (.net subgraphs) (16.6.1-p.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 841242     ✗ 0     
     data_received..................: 25 GB   205 MB/s
     data_sent......................: 337 MB  2.8 MB/s
     http_req_blocked...............: avg=3.13µs   min=812ns  med=2.14µs  max=16.71ms  p(90)=3.87µs  p(95)=4.63µs  p(99.9)=35.04µs 
     http_req_connecting............: avg=319ns    min=0s     med=0s      max=3.33ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=21.16ms  min=1.98ms med=18.14ms max=293.2ms  p(90)=34.55ms p(95)=42.09ms p(99.9)=124.07ms
       { expected_response:true }...: avg=21.16ms  min=1.98ms med=18.14ms max=293.2ms  p(90)=34.55ms p(95)=42.09ms p(99.9)=124.07ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 280514
     http_req_receiving.............: avg=574.33µs min=51.7µs med=98.47µs max=200.27ms p(90)=1.12ms  p(95)=1.93ms  p(99.9)=26.85ms 
     http_req_sending...............: avg=40.47µs  min=4.39µs med=9.13µs  max=225.23ms p(90)=19.22µs p(95)=69.6µs  p(99.9)=2.89ms  
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=20.55ms  min=1.85ms med=17.62ms max=289.77ms p(90)=33.55ms p(95)=40.96ms p(99.9)=122.45ms
     http_reqs......................: 280514  2332.75377/s
     iteration_duration.............: avg=21.38ms  min=3.06ms med=18.35ms max=308.51ms p(90)=34.77ms p(95)=42.32ms p(99.9)=125.13ms
     iterations.....................: 280414  2331.92217/s
     success_rate...................: 100.00% ✓ 280414     ✗ 0     
     vus............................: 50      min=50       max=50  
     vus_max........................: 50      min=50       max=50
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

     checks.........................: 100.00% ✓ 584655      ✗ 0     
     data_received..................: 17 GB   142 MB/s
     data_sent......................: 234 MB  1.9 MB/s
     http_req_blocked...............: avg=3.89µs  min=812ns   med=2.11µs  max=11.44ms  p(90)=4.27µs   p(95)=5.29µs   p(99.9)=44.15µs
     http_req_connecting............: avg=1µs     min=0s      med=0s      max=11.31ms  p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=30.54ms min=2.28ms  med=30.11ms max=284.13ms p(90)=40.4ms   p(95)=43.84ms  p(99.9)=63.65ms
       { expected_response:true }...: avg=30.54ms min=2.28ms  med=30.11ms max=284.13ms p(90)=40.4ms   p(95)=43.84ms  p(99.9)=63.65ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 194985
     http_req_receiving.............: avg=91.93µs min=27.01µs med=53.61µs max=151.2ms  p(90)=122.87µs p(95)=197.66µs p(99.9)=3.46ms 
     http_req_sending...............: avg=40.57µs min=4.53µs  med=9.04µs  max=170.69ms p(90)=23.61µs  p(95)=105.1µs  p(99.9)=3.59ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=30.4ms  min=2.2ms   med=30ms    max=279.4ms  p(90)=40.24ms  p(95)=43.65ms  p(99.9)=62.76ms
     http_reqs......................: 194985  1620.940963/s
     iteration_duration.............: avg=30.77ms min=7.05ms  med=30.33ms max=302.47ms p(90)=40.62ms  p(95)=44.05ms  p(99.9)=64.11ms
     iterations.....................: 194885  1620.109647/s
     success_rate...................: 100.00% ✓ 194885      ✗ 0     
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

     checks.........................: 100.00% ✓ 211359     ✗ 0    
     data_received..................: 6.2 GB  51 MB/s
     data_sent......................: 85 MB   703 kB/s
     http_req_blocked...............: avg=4.83µs  min=1.28µs  med=3.33µs  max=3.57ms   p(90)=4.86µs   p(95)=5.56µs   p(99.9)=45.03µs 
     http_req_connecting............: avg=1.23µs  min=0s      med=0s      max=3.53ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=84.79ms min=4.07ms  med=83.11ms max=341.47ms p(90)=104.64ms p(95)=115.13ms p(99.9)=199.67ms
       { expected_response:true }...: avg=84.79ms min=4.07ms  med=83.11ms max=341.47ms p(90)=104.64ms p(95)=115.13ms p(99.9)=199.67ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 70553
     http_req_receiving.............: avg=89.22µs min=32.73µs med=79.33µs max=62.59ms  p(90)=115.74µs p(95)=130.59µs p(99.9)=698.07µs
     http_req_sending...............: avg=31.03µs min=5.78µs  med=15.64µs max=159.55ms p(90)=22.55µs  p(95)=24.84µs  p(99.9)=615.25µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=84.67ms min=3.99ms  med=83ms    max=340.88ms p(90)=104.53ms p(95)=114.97ms p(99.9)=199.43ms
     http_reqs......................: 70553   585.343179/s
     iteration_duration.............: avg=85.17ms min=15.27ms med=83.38ms max=350.55ms p(90)=104.91ms p(95)=115.49ms p(99.9)=200.99ms
     iterations.....................: 70453   584.513528/s
     success_rate...................: 100.00% ✓ 70453      ✗ 0    
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

     checks.........................: 100.00% ✓ 162960     ✗ 0    
     data_received..................: 4.8 GB  39 MB/s
     data_sent......................: 65 MB   542 kB/s
     http_req_blocked...............: avg=6.48µs   min=1.52µs  med=3.91µs   max=5.34ms   p(90)=5.48µs   p(95)=6.1µs    p(99.9)=84.37µs 
     http_req_connecting............: avg=2.21µs   min=0s      med=0s       max=5.28ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=109.99ms min=5.3ms   med=107.81ms max=312.01ms p(90)=145.11ms p(95)=156.09ms p(99.9)=199.39ms
       { expected_response:true }...: avg=109.99ms min=5.3ms   med=107.81ms max=312.01ms p(90)=145.11ms p(95)=156.09ms p(99.9)=199.39ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 54420
     http_req_receiving.............: avg=93.67µs  min=33.05µs med=86.45µs  max=111.98ms p(90)=117.91µs p(95)=130.81µs p(99.9)=568.1µs 
     http_req_sending...............: avg=25.98µs  min=6.32µs  med=18.14µs  max=85.69ms  p(90)=23.64µs  p(95)=25.72µs  p(99.9)=631.91µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=109.87ms min=5.16ms  med=107.7ms  max=310.31ms p(90)=145ms    p(95)=155.92ms p(99.9)=199.11ms
     http_reqs......................: 54420   451.063235/s
     iteration_duration.............: avg=110.47ms min=25.23ms med=108.13ms max=320.72ms p(90)=145.42ms p(95)=156.39ms p(99.9)=200.74ms
     iterations.....................: 54320   450.23438/s
     success_rate...................: 100.00% ✓ 54320      ✗ 0    
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

     checks.........................: 100.00% ✓ 96612      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 39 MB   321 kB/s
     http_req_blocked...............: avg=7.2µs    min=1.26µs  med=3.79µs   max=3.78ms   p(90)=5.32µs   p(95)=5.95µs   p(99.9)=1.73ms  
     http_req_connecting............: avg=3.11µs   min=0s      med=0s       max=3.73ms   p(90)=0s       p(95)=0s       p(99.9)=1.7ms   
     http_req_duration..............: avg=185.59ms min=5.64ms  med=171.43ms max=696.09ms p(90)=215.73ms p(95)=264.9ms  p(99.9)=570.03ms
       { expected_response:true }...: avg=185.59ms min=5.64ms  med=171.43ms max=696.09ms p(90)=215.73ms p(95)=264.9ms  p(99.9)=570.03ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32304
     http_req_receiving.............: avg=97.82µs  min=34.94µs med=92.28µs  max=27.37ms  p(90)=123.45µs p(95)=136.35µs p(99.9)=674.45µs
     http_req_sending...............: avg=27.87µs  min=5.36µs  med=19.17µs  max=59.44ms  p(90)=24.03µs  p(95)=25.93µs  p(99.9)=409.51µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=185.46ms min=5.55ms  med=171.3ms  max=695.99ms p(90)=215.62ms p(95)=264.78ms p(99.9)=569.93ms
     http_reqs......................: 32304   267.1353/s
     iteration_duration.............: avg=186.44ms min=48.57ms med=171.81ms max=696.35ms p(90)=216.13ms p(95)=266.53ms p(99.9)=570.53ms
     iterations.....................: 32204   266.308359/s
     success_rate...................: 100.00% ✓ 32204      ✗ 0    
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

     checks.........................: 100.00% ✓ 95337      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 38 MB   316 kB/s
     http_req_blocked...............: avg=5.92µs   min=1.2µs   med=3.04µs   max=3.52ms   p(90)=4.36µs   p(95)=4.89µs   p(99.9)=1.32ms  
     http_req_connecting............: avg=2.71µs   min=0s      med=0s       max=3.48ms   p(90)=0s       p(95)=0s       p(99.9)=1.29ms  
     http_req_duration..............: avg=188.05ms min=7.9ms   med=192.68ms max=404.88ms p(90)=200.26ms p(95)=204.93ms p(99.9)=278.31ms
       { expected_response:true }...: avg=188.05ms min=7.9ms   med=192.68ms max=404.88ms p(90)=200.26ms p(95)=204.93ms p(99.9)=278.31ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 31879
     http_req_receiving.............: avg=88.8µs   min=30.48µs med=86.45µs  max=9.94ms   p(90)=115.66µs p(95)=127.05µs p(99.9)=575.38µs
     http_req_sending...............: avg=35.39µs  min=5.11µs  med=16.52µs  max=114.18ms p(90)=20.68µs  p(95)=22.48µs  p(99.9)=519.13µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=187.93ms min=7.8ms   med=192.57ms max=395.9ms  p(90)=200.13ms p(95)=204.82ms p(99.9)=278.17ms
     http_reqs......................: 31879   263.482867/s
     iteration_duration.............: avg=188.91ms min=43.63ms med=192.94ms max=417.78ms p(90)=200.53ms p(95)=205.21ms p(99.9)=279.41ms
     iterations.....................: 31779   262.656358/s
     success_rate...................: 100.00% ✓ 31779      ✗ 0    
     vus............................: 2       min=2        max=50 
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

     checks.........................: 100.00% ✓ 7548      ✗ 0   
     data_received..................: 250 MB  2.0 MB/s
     data_sent......................: 3.1 MB  25 kB/s
     http_req_blocked...............: avg=89.75µs min=1.04µs   med=3.31µs  max=8.09ms  p(90)=4.93µs   p(95)=5.9µs    p(99.9)=7.27ms  
     http_req_connecting............: avg=84.09µs min=0s       med=0s      max=8.04ms  p(90)=0s       p(95)=0s       p(99.9)=7.24ms  
     http_req_duration..............: avg=2.32s   min=24.92ms  med=2.33s   max=4.87s   p(90)=3.16s    p(95)=3.48s    p(99.9)=4.21s   
       { expected_response:true }...: avg=2.32s   min=24.92ms  med=2.33s   max=4.87s   p(90)=3.16s    p(95)=3.48s    p(99.9)=4.21s   
     http_req_failed................: 0.00%   ✓ 0         ✗ 2616
     http_req_receiving.............: avg=118.1µs min=31.4µs   med=93.99µs max=48.37ms p(90)=135.11µs p(95)=154.16µs p(99.9)=474.74µs
     http_req_sending...............: avg=73.82µs min=5.27µs   med=18.1µs  max=22.54ms p(90)=23.42µs  p(95)=27.33µs  p(99.9)=4.69ms  
     http_req_tls_handshaking.......: avg=0s      min=0s       med=0s      max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=2.32s   min=24.79ms  med=2.33s   max=4.87s   p(90)=3.16s    p(95)=3.48s    p(99.9)=4.21s   
     http_reqs......................: 2616    20.771366/s
     iteration_duration.............: avg=2.41s   min=326.08ms med=2.35s   max=4.87s   p(90)=3.18s    p(95)=3.5s     p(99.9)=4.23s   
     iterations.....................: 2516    19.977353/s
     success_rate...................: 100.00% ✓ 2516      ✗ 0   
     vus............................: 38      min=0       max=50
     vus_max........................: 50      min=50      max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

