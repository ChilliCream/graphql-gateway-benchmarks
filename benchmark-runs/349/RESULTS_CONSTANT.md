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
| hive-router | v0.0.84 | 2,909 | 3,179 | 2,880 | 3.7% |  |
| fusion-nightly-net11 | 16.7.0-p.6 | 2,643 | 2,769 | 2,632 | 1.7% |  |
| fusion-nightly | 16.7.0-p.6 | 2,642 | 2,756 | 2,630 | 1.7% |  |
| fusion | 16.6.6 | 2,578 | 2,698 | 2,556 | 1.9% |  |
| fusion-nightly-fed | 16.7.0-p.6 | 2,506 | 2,577 | 2,481 | 1.2% |  |
| grafbase | 0.53.5 | 2,209 | 2,321 | 2,187 | 2.0% |  |
| cosmo | 0.334.0 | 1,322 | 1,373 | 1,317 | 1.5% |  |
| hive-gateway-router-runtime | 2.10.8 | 624 | 641 | 619 | 1.1% |  |
| apollo-router | v2.16.1 | 456 | 470 | 441 | 2.2% |  |
| apollo-gateway | 2.14.3 | 283 | 287 | 281 | 0.6% |  |
| hive-gateway | 2.10.8 | 273 | 285 | 269 | 1.7% |  |
| feddi | 5ff8b6165878 | 0 | 0 | 0 | 0.0% |  |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| fusion-nightly-net11 | 16.7.0-p.6 | 2,517 | 2,621 | 2,511 | 1.6% |  |
| fusion-nightly | 16.7.0-p.6 | 2,445 | 2,555 | 2,377 | 2.5% |  |
| hive-router | v0.0.84 | 2,394 | 2,578 | 2,351 | 3.2% |  |
| fusion | 16.6.6 | 2,392 | 2,515 | 2,379 | 2.0% |  |
| fusion-nightly-fed | 16.7.0-p.6 | 2,226 | 2,334 | 2,214 | 1.9% |  |
| grafbase | 0.53.5 | 1,613 | 1,677 | 1,609 | 1.5% |  |
| cosmo | 0.334.0 | 1,190 | 1,239 | 1,185 | 1.7% |  |
| hive-gateway-router-runtime | 2.10.8 | 569 | 592 | 567 | 1.4% |  |
| apollo-router | v2.16.1 | 449 | 465 | 448 | 1.5% |  |
| hive-gateway | 2.10.8 | 270 | 277 | 267 | 1.2% |  |
| apollo-gateway | 2.14.3 | 265 | 268 | 262 | 0.8% |  |
| feddi | 5ff8b6165878 | 17 | 18 | 17 | 2.6% |  |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.84)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 1048641     ✗ 0     
     data_received..................: 31 GB   255 MB/s
     data_sent......................: 420 MB  3.5 MB/s
     http_req_blocked...............: avg=2.61µs  min=882ns   med=1.87µs  max=15.65ms  p(90)=3.02µs  p(95)=3.58µs   p(99.9)=25.73µs
     http_req_connecting............: avg=269ns   min=0s      med=0s      max=3.97ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=16.95ms min=1.45ms  med=16.36ms max=279.44ms p(90)=24.88ms p(95)=27.94ms  p(99.9)=46.05ms
       { expected_response:true }...: avg=16.95ms min=1.45ms  med=16.36ms max=279.44ms p(90)=24.88ms p(95)=27.94ms  p(99.9)=46.05ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 349647
     http_req_receiving.............: avg=83.83µs min=25.09µs med=43.1µs  max=247.37ms p(90)=76.14µs p(95)=120.81µs p(99.9)=7.09ms 
     http_req_sending...............: avg=43.16µs min=4.49µs  med=7.93µs  max=194.35ms p(90)=13.56µs p(95)=78.87µs  p(99.9)=4.79ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=16.83ms min=1.37ms  med=16.25ms max=265.04ms p(90)=24.72ms p(95)=27.74ms  p(99.9)=44.91ms
     http_reqs......................: 349647  2909.110545/s
     iteration_duration.............: avg=17.15ms min=1.87ms  med=16.54ms max=309.49ms p(90)=25.09ms p(95)=28.17ms  p(99.9)=46.69ms
     iterations.....................: 349547  2908.278531/s
     success_rate...................: 100.00% ✓ 349547      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (rust subgraphs) (16.7.0-p.6)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 953496      ✗ 0     
     data_received..................: 28 GB   232 MB/s
     data_sent......................: 382 MB  3.2 MB/s
     http_req_blocked...............: avg=2.66µs  min=832ns   med=1.96µs   max=7.3ms    p(90)=3.39µs  p(95)=4.13µs  p(99.9)=31.88µs
     http_req_connecting............: avg=279ns   min=0s      med=0s       max=3.94ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=18.65ms min=1.94ms  med=17.59ms  max=297.71ms p(90)=26.54ms p(95)=30.27ms p(99.9)=51.49ms
       { expected_response:true }...: avg=18.65ms min=1.94ms  med=17.59ms  max=297.71ms p(90)=26.54ms p(95)=30.27ms p(99.9)=51.49ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 317932
     http_req_receiving.............: avg=1.07ms  min=49.95µs med=143.56µs max=126.51ms p(90)=2.71ms  p(95)=3.69ms  p(99.9)=24.12ms
     http_req_sending...............: avg=47.6µs  min=4.21µs  med=8.35µs   max=150.62ms p(90)=17.14µs p(95)=85.94µs p(99.9)=5.28ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=17.53ms min=1.86ms  med=16.45ms  max=277.03ms p(90)=25.16ms p(95)=28.79ms p(99.9)=49.12ms
     http_reqs......................: 317932  2643.621861/s
     iteration_duration.............: avg=18.87ms min=3.28ms  med=17.79ms  max=307.24ms p(90)=26.75ms p(95)=30.51ms p(99.9)=52.17ms
     iterations.....................: 317832  2642.790356/s
     success_rate...................: 100.00% ✓ 317832      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (rust subgraphs) (16.7.0-p.6)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 953241      ✗ 0     
     data_received..................: 28 GB   232 MB/s
     data_sent......................: 382 MB  3.2 MB/s
     http_req_blocked...............: avg=2.51µs   min=872ns   med=1.88µs  max=12.64ms  p(90)=3.11µs  p(95)=3.72µs  p(99.9)=27.06µs 
     http_req_connecting............: avg=149ns    min=0s      med=0s      max=2.79ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=18.67ms  min=2ms     med=16.12ms max=279.03ms p(90)=30.23ms p(95)=36.53ms p(99.9)=119.49ms
       { expected_response:true }...: avg=18.67ms  min=2ms     med=16.12ms max=279.03ms p(90)=30.23ms p(95)=36.53ms p(99.9)=119.49ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 317847
     http_req_receiving.............: avg=546.54µs min=51.28µs med=89.43µs max=209.18ms p(90)=1.06ms  p(95)=1.9ms   p(99.9)=24.11ms 
     http_req_sending...............: avg=42.84µs  min=4.44µs  med=8.01µs  max=175.03ms p(90)=14.31µs p(95)=80.48µs p(99.9)=4.39ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=18.08ms  min=1.91ms  med=15.61ms max=265.87ms p(90)=29.29ms p(95)=35.46ms p(99.9)=117.48ms
     http_reqs......................: 317847  2642.85038/s
     iteration_duration.............: avg=18.87ms  min=3.01ms  med=16.31ms max=288.21ms p(90)=30.45ms p(95)=36.77ms p(99.9)=119.99ms
     iterations.....................: 317747  2642.018895/s
     success_rate...................: 100.00% ✓ 317747      ✗ 0     
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

     checks.........................: 100.00% ✓ 929643      ✗ 0     
     data_received..................: 27 GB   226 MB/s
     data_sent......................: 373 MB  3.1 MB/s
     http_req_blocked...............: avg=2.54µs   min=862ns   med=1.83µs  max=16.11ms  p(90)=2.88µs  p(95)=3.4µs   p(99.9)=25.46µs 
     http_req_connecting............: avg=281ns    min=0s      med=0s      max=3.13ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=19.15ms  min=1.97ms  med=16.42ms max=302.72ms p(90)=31.17ms p(95)=37.78ms p(99.9)=120.92ms
       { expected_response:true }...: avg=19.15ms  min=1.97ms  med=16.42ms max=302.72ms p(90)=31.17ms p(95)=37.78ms p(99.9)=120.92ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 309981
     http_req_receiving.............: avg=568.89µs min=50.75µs med=89.28µs max=199.06ms p(90)=1.08ms  p(95)=1.91ms  p(99.9)=25.61ms 
     http_req_sending...............: avg=39.79µs  min=4.26µs  med=7.9µs   max=108.96ms p(90)=13.41µs p(95)=72.47µs p(99.9)=3.82ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=18.54ms  min=1.87ms  med=15.9ms  max=302.61ms p(90)=30.18ms p(95)=36.71ms p(99.9)=119.48ms
     http_reqs......................: 309981  2578.004149/s
     iteration_duration.............: avg=19.35ms  min=3.17ms  med=16.61ms max=316.72ms p(90)=31.38ms p(95)=38.03ms p(99.9)=122.34ms
     iterations.....................: 309881  2577.172483/s
     success_rate...................: 100.00% ✓ 309881      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (rust subgraphs) (16.7.0-p.6)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 903531      ✗ 0     
     data_received..................: 27 GB   220 MB/s
     data_sent......................: 362 MB  3.0 MB/s
     http_req_blocked...............: avg=3.05µs   min=932ns   med=2.35µs  max=10.88ms  p(90)=3.69µs  p(95)=4.32µs  p(99.9)=31.98µs 
     http_req_connecting............: avg=297ns    min=0s      med=0s      max=4.08ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=19.69ms  min=1.68ms  med=16.01ms max=330.78ms p(90)=34.01ms p(95)=42.61ms p(99.9)=146.57ms
       { expected_response:true }...: avg=19.69ms  min=1.68ms  med=16.01ms max=330.78ms p(90)=34.01ms p(95)=42.61ms p(99.9)=146.57ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 301277
     http_req_receiving.............: avg=580.79µs min=51.45µs med=92.76µs max=304.28ms p(90)=1.05ms  p(95)=1.91ms  p(99.9)=28.63ms 
     http_req_sending...............: avg=41.1µs   min=4.63µs  med=8.97µs  max=76.16ms  p(90)=15.52µs p(95)=76.42µs p(99.9)=3.32ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=19.07ms  min=1.53ms  med=15.49ms max=330.68ms p(90)=32.99ms p(95)=41.51ms p(99.9)=144.62ms
     http_reqs......................: 301277  2506.221533/s
     iteration_duration.............: avg=19.91ms  min=2.7ms   med=16.21ms max=330.97ms p(90)=34.22ms p(95)=42.84ms p(99.9)=147.63ms
     iterations.....................: 301177  2505.389666/s
     success_rate...................: 100.00% ✓ 301177      ✗ 0     
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

     checks.........................: 100.00% ✓ 796452      ✗ 0     
     data_received..................: 23 GB   194 MB/s
     data_sent......................: 319 MB  2.7 MB/s
     http_req_blocked...............: avg=2.93µs  min=912ns   med=2.16µs  max=7.33ms   p(90)=3.72µs  p(95)=4.5µs    p(99.9)=34.77µs
     http_req_connecting............: avg=327ns   min=0s      med=0s      max=3.36ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=22.37ms min=1.71ms  med=22.15ms max=282.57ms p(90)=26.52ms p(95)=28.23ms  p(99.9)=47.96ms
       { expected_response:true }...: avg=22.37ms min=1.71ms  med=22.15ms max=282.57ms p(90)=26.52ms p(95)=28.23ms  p(99.9)=47.96ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 265584
     http_req_receiving.............: avg=86.1µs  min=27.16µs med=55.03µs max=182.89ms p(90)=94.12µs p(95)=119.38µs p(99.9)=5.08ms 
     http_req_sending...............: avg=35.51µs min=4.7µs   med=9.37µs  max=152.98ms p(90)=16.29µs p(95)=27.01µs  p(99.9)=1.78ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=22.25ms min=1.66ms  med=22.05ms max=282.03ms p(90)=26.39ms p(95)=28.07ms  p(99.9)=46.87ms
     http_reqs......................: 265584  2209.084906/s
     iteration_duration.............: avg=22.59ms min=3.72ms  med=22.34ms max=293.45ms p(90)=26.72ms p(95)=28.44ms  p(99.9)=48.38ms
     iterations.....................: 265484  2208.253122/s
     success_rate...................: 100.00% ✓ 265484      ✗ 0     
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

     checks.........................: 100.00% ✓ 476769      ✗ 0     
     data_received..................: 14 GB   116 MB/s
     data_sent......................: 191 MB  1.6 MB/s
     http_req_blocked...............: avg=3.83µs  min=872ns   med=2.09µs  max=7.88ms   p(90)=3.61µs  p(95)=4.27µs   p(99.9)=33.18µs 
     http_req_connecting............: avg=1.37µs  min=0s      med=0s      max=7.84ms   p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=37.52ms min=2.05ms  med=37.15ms max=292.15ms p(90)=52.37ms p(95)=56.96ms  p(99.9)=78.69ms 
       { expected_response:true }...: avg=37.52ms min=2.05ms  med=37.15ms max=292.15ms p(90)=52.37ms p(95)=56.96ms  p(99.9)=78.69ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 159023
     http_req_receiving.............: avg=71.45µs min=27.04µs med=59.02µs max=102.4ms  p(90)=95.5µs  p(95)=111.18µs p(99.9)=827.32µs
     http_req_sending...............: avg=25.77µs min=4.72µs  med=10.08µs max=235.59ms p(90)=17.01µs p(95)=20.92µs  p(99.9)=1.11ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=37.42ms min=1.94ms  med=37.06ms max=289.35ms p(90)=52.27ms p(95)=56.86ms  p(99.9)=78.44ms 
     http_reqs......................: 159023  1322.133547/s
     iteration_duration.............: avg=37.74ms min=3.07ms  med=37.34ms max=303.22ms p(90)=52.58ms p(95)=57.16ms  p(99.9)=79.08ms 
     iterations.....................: 158923  1321.302137/s
     success_rate...................: 100.00% ✓ 158923      ✗ 0     
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

     checks.........................: 100.00% ✓ 225420     ✗ 0    
     data_received..................: 6.6 GB  55 MB/s
     data_sent......................: 90 MB   750 kB/s
     http_req_blocked...............: avg=4.6µs   min=1.17µs  med=3µs     max=4.3ms    p(90)=4.56µs   p(95)=5.24µs   p(99.9)=42.95µs 
     http_req_connecting............: avg=1.32µs  min=0s      med=0s      max=4.26ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=79.51ms min=3.58ms  med=77.68ms max=319.99ms p(90)=101.98ms p(95)=112.63ms p(99.9)=188.24ms
       { expected_response:true }...: avg=79.51ms min=3.58ms  med=77.68ms max=319.99ms p(90)=101.98ms p(95)=112.63ms p(99.9)=188.24ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 75240
     http_req_receiving.............: avg=81µs    min=29.61µs med=68.62µs max=170.13ms p(90)=105.65µs p(95)=119.13µs p(99.9)=615.66µs
     http_req_sending...............: avg=22.28µs min=5.52µs  med=13.92µs max=92.79ms  p(90)=20.83µs  p(95)=23.23µs  p(99.9)=629.71µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=79.41ms min=3.49ms  med=77.58ms max=319.34ms p(90)=101.88ms p(95)=112.53ms p(99.9)=188.02ms
     http_reqs......................: 75240   624.517258/s
     iteration_duration.............: avg=79.86ms min=10.8ms  med=77.93ms max=338.17ms p(90)=102.22ms p(95)=112.91ms p(99.9)=189.62ms
     iterations.....................: 75140   623.687224/s
     success_rate...................: 100.00% ✓ 75140      ✗ 0    
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

     checks.........................: 100.00% ✓ 165036     ✗ 0    
     data_received..................: 4.8 GB  40 MB/s
     data_sent......................: 66 MB   549 kB/s
     http_req_blocked...............: avg=4.61µs   min=1.03µs  med=2.74µs   max=3.94ms   p(90)=4.09µs   p(95)=4.59µs   p(99.9)=51.78µs 
     http_req_connecting............: avg=1.67µs   min=0s      med=0s       max=3.9ms    p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=108.65ms min=4.59ms  med=108.28ms max=343.34ms p(90)=131.49ms p(95)=138.37ms p(99.9)=172.22ms
       { expected_response:true }...: avg=108.65ms min=4.59ms  med=108.28ms max=343.34ms p(90)=131.49ms p(95)=138.37ms p(99.9)=172.22ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 55112
     http_req_receiving.............: avg=83.57µs  min=28.37µs med=74.16µs  max=111.73ms p(90)=105.89µs p(95)=118.4µs  p(99.9)=533.09µs
     http_req_sending...............: avg=26.69µs  min=5.21µs  med=14.82µs  max=166.57ms p(90)=20.6µs   p(95)=22.28µs  p(99.9)=532.08µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=108.54ms min=4.46ms  med=108.18ms max=343.19ms p(90)=131.38ms p(95)=138.26ms p(99.9)=171.56ms
     http_reqs......................: 55112   456.9698/s
     iteration_duration.............: avg=109.09ms min=18.55ms med=108.54ms max=350.75ms p(90)=131.74ms p(95)=138.62ms p(99.9)=174.27ms
     iterations.....................: 55012   456.140634/s
     success_rate...................: 100.00% ✓ 55012      ✗ 0    
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

     checks.........................: 100.00% ✓ 102399     ✗ 0    
     data_received..................: 3.0 GB  25 MB/s
     data_sent......................: 41 MB   340 kB/s
     http_req_blocked...............: avg=6.34µs   min=1.42µs  med=3.39µs   max=3.52ms   p(90)=4.72µs   p(95)=5.28µs   p(99.9)=1.33ms  
     http_req_connecting............: avg=2.69µs   min=0s      med=0s       max=3.47ms   p(90)=0s       p(95)=0s       p(99.9)=1.3ms   
     http_req_duration..............: avg=175.07ms min=7.37ms  med=184.12ms max=381.4ms  p(90)=196.05ms p(95)=201.74ms p(99.9)=280.46ms
       { expected_response:true }...: avg=175.07ms min=7.37ms  med=184.12ms max=381.4ms  p(90)=196.05ms p(95)=201.74ms p(99.9)=280.46ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 34233
     http_req_receiving.............: avg=93.44µs  min=33.02µs med=83.07µs  max=168.36ms p(90)=113.62µs p(95)=125.5µs  p(99.9)=580.53µs
     http_req_sending...............: avg=32.94µs  min=6.13µs  med=17.06µs  max=137.34ms p(90)=21.86µs  p(95)=23.66µs  p(99.9)=555.1µs 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=174.95ms min=7.27ms  med=184.02ms max=374.52ms p(90)=195.93ms p(95)=201.62ms p(99.9)=280.06ms
     http_reqs......................: 34233   283.115355/s
     iteration_duration.............: avg=175.86ms min=25.33ms med=184.4ms  max=388.46ms p(90)=196.35ms p(95)=202.07ms p(99.9)=283.24ms
     iterations.....................: 34133   282.28833/s
     success_rate...................: 100.00% ✓ 34133      ✗ 0    
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

     checks.........................: 100.00% ✓ 99036      ✗ 0    
     data_received..................: 2.9 GB  24 MB/s
     data_sent......................: 40 MB   329 kB/s
     http_req_blocked...............: avg=5.84µs   min=1.15µs  med=3µs      max=3.22ms   p(90)=4.33µs   p(95)=4.9µs    p(99.9)=1.25ms  
     http_req_connecting............: avg=2.55µs   min=0s      med=0s       max=3.18ms   p(90)=0s       p(95)=0s       p(99.9)=1.12ms  
     http_req_duration..............: avg=181.05ms min=5.52ms  med=165.54ms max=692.3ms  p(90)=209.41ms p(95)=243.35ms p(99.9)=585.07ms
       { expected_response:true }...: avg=181.05ms min=5.52ms  med=165.54ms max=692.3ms  p(90)=209.41ms p(95)=243.35ms p(99.9)=585.07ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 33112
     http_req_receiving.............: avg=88.84µs  min=31.22µs med=84.95µs  max=91.38ms  p(90)=113.33µs p(95)=124.74µs p(99.9)=494.91µs
     http_req_sending...............: avg=28.07µs  min=4.75µs  med=16.23µs  max=97.25ms  p(90)=20.4µs   p(95)=21.91µs  p(99.9)=526.89µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=180.93ms min=5.39ms  med=165.44ms max=692.19ms p(90)=209.3ms  p(95)=243.27ms p(99.9)=584.99ms
     http_reqs......................: 33112   273.775692/s
     iteration_duration.............: avg=181.84ms min=36.26ms med=165.85ms max=692.56ms p(90)=209.77ms p(95)=244.33ms p(99.9)=585.29ms
     iterations.....................: 33012   272.948875/s
     success_rate...................: 100.00% ✓ 33012      ✗ 0    
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
data_received..................: 2.0 MB 34 kB/s
     data_sent......................: 26 kB  440 B/s
     http_req_blocked...............: avg=11.29µs  min=2.52µs  med=3.29µs  max=168.97µs p(90)=4.05µs   p(95)=6.57µs   p(99.9)=165.72µs
     http_req_connecting............: avg=4.2µs    min=0s      med=0s      max=88.27µs  p(90)=0s       p(95)=0s       p(99.9)=86.5µs  
     http_req_duration..............: avg=1.46s    min=23.63ms med=33.84ms max=30.02s   p(90)=42.74ms  p(95)=46.51ms  p(99.9)=29.42s  
       { expected_response:true }...: avg=1.46s    min=23.63ms med=33.84ms max=30.02s   p(90)=42.74ms  p(95)=46.51ms  p(99.9)=29.42s  
     http_req_failed................: 0.00%  ✓ 0        ✗ 21  
     http_req_receiving.............: avg=154.67µs min=98.12µs med=131.1µs max=363.76µs p(90)=196.64µs p(95)=261.59µs p(99.9)=361.71µs
     http_req_sending...............: avg=20.46µs  min=16.43µs med=18.97µs max=48.44µs  p(90)=21.42µs  p(95)=26.5µs   p(99.9)=48µs    
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=1.46s    min=23.5ms  med=33.68ms max=30.02s   p(90)=42.61ms  p(95)=46.23ms  p(99.9)=29.42s  
     http_reqs......................: 21     0.349994/s
     vus............................: 0      min=0      max=0 
     vus_max........................: 50     min=50     max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (.net subgraphs) (16.7.0-p.6)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 907539      ✗ 0     
     data_received..................: 27 GB   221 MB/s
     data_sent......................: 364 MB  3.0 MB/s
     http_req_blocked...............: avg=3.75µs  min=1µs     med=2.69µs   max=19.4ms   p(90)=4.46µs  p(95)=5.27µs   p(99.9)=37.31µs
     http_req_connecting............: avg=315ns   min=0s      med=0s       max=3.7ms    p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=19.59ms min=1.49ms  med=18.42ms  max=282.53ms p(90)=28.69ms p(95)=32.72ms  p(99.9)=55.37ms
       { expected_response:true }...: avg=19.59ms min=1.49ms  med=18.42ms  max=282.53ms p(90)=28.69ms p(95)=32.72ms  p(99.9)=55.37ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 302613
     http_req_receiving.............: avg=1.2ms   min=53.39µs med=129.19µs max=169.3ms  p(90)=3.17ms  p(95)=4.48ms   p(99.9)=26.86ms
     http_req_sending...............: avg=51.53µs min=4.72µs  med=10.16µs  max=182.49ms p(90)=20.71µs p(95)=103.15µs p(99.9)=5.31ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=18.34ms min=1.38ms  med=17.12ms  max=282.02ms p(90)=27.15ms p(95)=31.11ms  p(99.9)=52.96ms
     http_reqs......................: 302613  2517.811018/s
     iteration_duration.............: avg=19.82ms min=2.48ms  med=18.64ms  max=306.74ms p(90)=28.92ms p(95)=32.97ms  p(99.9)=55.97ms
     iterations.....................: 302513  2516.978995/s
     success_rate...................: 100.00% ✓ 302513      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.7.0-p.6)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 881532      ✗ 0     
     data_received..................: 26 GB   214 MB/s
     data_sent......................: 353 MB  2.9 MB/s
     http_req_blocked...............: avg=3.17µs   min=862ns   med=2.07µs  max=11.96ms  p(90)=3.68µs  p(95)=4.42µs  p(99.9)=34.2µs  
     http_req_connecting............: avg=527ns    min=0s      med=0s      max=7.23ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=20.19ms  min=1.63ms  med=16.94ms max=352.65ms p(90)=33.04ms p(95)=40.5ms  p(99.9)=142.24ms
       { expected_response:true }...: avg=20.19ms  min=1.63ms  med=16.94ms max=352.65ms p(90)=33.04ms p(95)=40.5ms  p(99.9)=142.24ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 293944
     http_req_receiving.............: avg=569.87µs min=51.57µs med=95.52µs max=183.8ms  p(90)=1.09ms  p(95)=1.88ms  p(99.9)=26.92ms 
     http_req_sending...............: avg=41.24µs  min=4.54µs  med=8.5µs   max=199.2ms  p(90)=17.47µs p(95)=79.49µs p(99.9)=2.98ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=19.58ms  min=1.51ms  med=16.41ms max=352.55ms p(90)=32.07ms p(95)=39.41ms p(99.9)=141.44ms
     http_reqs......................: 293944  2445.294547/s
     iteration_duration.............: avg=20.4ms   min=2.56ms  med=17.14ms max=352.84ms p(90)=33.27ms p(95)=40.73ms p(99.9)=143.31ms
     iterations.....................: 293844  2444.462656/s
     success_rate...................: 100.00% ✓ 293844      ✗ 0     
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

     checks.........................: 100.00% ✓ 863376      ✗ 0     
     data_received..................: 25 GB   209 MB/s
     data_sent......................: 346 MB  2.9 MB/s
     http_req_blocked...............: avg=3.49µs  min=982ns   med=2.64µs  max=11.94ms  p(90)=4.15µs  p(95)=4.86µs   p(99.9)=38.46µs
     http_req_connecting............: avg=352ns   min=0s      med=0s      max=3.73ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=20.62ms min=1.69ms  med=20.41ms max=284.6ms  p(90)=28.68ms p(95)=31.12ms  p(99.9)=49.75ms
       { expected_response:true }...: avg=20.62ms min=1.69ms  med=20.41ms max=284.6ms  p(90)=28.68ms p(95)=31.12ms  p(99.9)=49.75ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 287892
     http_req_receiving.............: avg=89.55µs min=25.59µs med=53.61µs max=35.54ms  p(90)=94.53µs p(95)=131.03µs p(99.9)=6.13ms 
     http_req_sending...............: avg=39.45µs min=5.03µs  med=10.54µs max=136.21ms p(90)=17.69µs p(95)=73.58µs  p(99.9)=2.1ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=20.49ms min=1.65ms  med=20.29ms max=284.15ms p(90)=28.54ms p(95)=30.94ms  p(99.9)=48.73ms
     http_reqs......................: 287892  2394.611791/s
     iteration_duration.............: avg=20.83ms min=3.18ms  med=20.61ms max=294.92ms p(90)=28.89ms p(95)=31.34ms  p(99.9)=50.24ms
     iterations.....................: 287792  2393.780016/s
     success_rate...................: 100.00% ✓ 287792      ✗ 0     
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

     checks.........................: 100.00% ✓ 862656      ✗ 0     
     data_received..................: 25 GB   210 MB/s
     data_sent......................: 346 MB  2.9 MB/s
     http_req_blocked...............: avg=3.46µs   min=1.02µs  med=2.63µs   max=10.88ms  p(90)=4.17µs  p(95)=4.89µs  p(99.9)=33.8µs  
     http_req_connecting............: avg=296ns    min=0s      med=0s       max=3.42ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=20.63ms  min=1.62ms  med=17.25ms  max=372.83ms p(90)=33.97ms p(95)=41.64ms p(99.9)=144.94ms
       { expected_response:true }...: avg=20.63ms  min=1.62ms  med=17.25ms  max=372.83ms p(90)=33.97ms p(95)=41.64ms p(99.9)=144.94ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 287652
     http_req_receiving.............: avg=610.33µs min=53.44µs med=100.28µs max=173.96ms p(90)=1.13ms  p(95)=1.99ms  p(99.9)=28.94ms 
     http_req_sending...............: avg=45.44µs  min=4.96µs  med=9.98µs   max=206.63ms p(90)=17.9µs  p(95)=90.36µs p(99.9)=3.64ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=19.97ms  min=1.52ms  med=16.7ms   max=370.78ms p(90)=32.9ms  p(95)=40.47ms p(99.9)=142.76ms
     http_reqs......................: 287652  2392.847503/s
     iteration_duration.............: avg=20.85ms  min=2.52ms  med=17.46ms  max=372.96ms p(90)=34.21ms p(95)=41.89ms p(99.9)=145.99ms
     iterations.....................: 287552  2392.015648/s
     success_rate...................: 100.00% ✓ 287552      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (.net subgraphs) (16.7.0-p.6)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 802779      ✗ 0     
     data_received..................: 24 GB   195 MB/s
     data_sent......................: 322 MB  2.7 MB/s
     http_req_blocked...............: avg=3.14µs   min=862ns   med=2.06µs   max=18.26ms  p(90)=3.46µs  p(95)=4.11µs  p(99.9)=34.46µs 
     http_req_connecting............: avg=614ns    min=0s      med=0s       max=6.4ms    p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=22.19ms  min=1.82ms  med=18.39ms  max=390.31ms p(90)=36.66ms p(95)=45.54ms p(99.9)=163.47ms
       { expected_response:true }...: avg=22.19ms  min=1.82ms  med=18.39ms  max=390.31ms p(90)=36.66ms p(95)=45.54ms p(99.9)=163.47ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 267693
     http_req_receiving.............: avg=622.16µs min=51.77µs med=100.88µs max=207.6ms  p(90)=1.13ms  p(95)=1.95ms  p(99.9)=29.11ms 
     http_req_sending...............: avg=36.2µs   min=4.79µs  med=8.97µs   max=94.36ms  p(90)=17.17µs p(95)=44.68µs p(99.9)=2.39ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=21.53ms  min=1.71ms  med=17.81ms  max=390.21ms p(90)=35.58ms p(95)=44.35ms p(99.9)=161.74ms
     http_reqs......................: 267693  2226.552497/s
     iteration_duration.............: avg=22.41ms  min=2.82ms  med=18.6ms   max=390.46ms p(90)=36.88ms p(95)=45.75ms p(99.9)=165.99ms
     iterations.....................: 267593  2225.720742/s
     success_rate...................: 100.00% ✓ 267593      ✗ 0     
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

     checks.........................: 100.00% ✓ 581997      ✗ 0     
     data_received..................: 17 GB   141 MB/s
     data_sent......................: 233 MB  1.9 MB/s
     http_req_blocked...............: avg=3.39µs  min=931ns   med=2.25µs  max=8.7ms    p(90)=4.28µs   p(95)=5.31µs   p(99.9)=47.37µs
     http_req_connecting............: avg=491ns   min=0s      med=0s      max=4.1ms    p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=30.67ms min=2.34ms  med=30.18ms max=328.19ms p(90)=40.54ms  p(95)=43.93ms  p(99.9)=64.8ms 
       { expected_response:true }...: avg=30.67ms min=2.34ms  med=30.18ms max=328.19ms p(90)=40.54ms  p(95)=43.93ms  p(99.9)=64.8ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 194099
     http_req_receiving.............: avg=94.39µs min=28.09µs med=55.59µs max=89.92ms  p(90)=125.65µs p(95)=198.69µs p(99.9)=3.67ms 
     http_req_sending...............: avg=40.11µs min=4.83µs  med=9.57µs  max=112.44ms p(90)=24.24µs  p(95)=105µs    p(99.9)=2.97ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=30.54ms min=2.25ms  med=30.06ms max=327.61ms p(90)=40.39ms  p(95)=43.75ms  p(99.9)=64.41ms
     http_reqs......................: 194099  1613.627114/s
     iteration_duration.............: avg=30.91ms min=6.94ms  med=30.4ms  max=338.8ms  p(90)=40.75ms  p(95)=44.15ms  p(99.9)=65.12ms
     iterations.....................: 193999  1612.795772/s
     success_rate...................: 100.00% ✓ 193999      ✗ 0     
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

     checks.........................: 100.00% ✓ 429366      ✗ 0     
     data_received..................: 13 GB   104 MB/s
     data_sent......................: 172 MB  1.4 MB/s
     http_req_blocked...............: avg=4.14µs  min=1.1µs   med=3.13µs  max=4.44ms   p(90)=4.76µs   p(95)=5.48µs   p(99.9)=38.87µs 
     http_req_connecting............: avg=663ns   min=0s      med=0s      max=4.16ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=41.65ms min=2.11ms  med=41.28ms max=304.46ms p(90)=57.92ms  p(95)=62.86ms  p(99.9)=86.98ms 
       { expected_response:true }...: avg=41.65ms min=2.11ms  med=41.28ms max=304.46ms p(90)=57.92ms  p(95)=62.86ms  p(99.9)=86.98ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 143222
     http_req_receiving.............: avg=83.1µs  min=25.88µs med=69.08µs max=69.76ms  p(90)=109.42µs p(95)=127.69µs p(99.9)=968.4µs 
     http_req_sending...............: avg=29.91µs min=5.42µs  med=12.86µs max=194.68ms p(90)=19.75µs  p(95)=23.76µs  p(99.9)=993.62µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=41.54ms min=2.03ms  med=41.17ms max=304.06ms p(90)=57.81ms  p(95)=62.74ms  p(99.9)=86.66ms 
     http_reqs......................: 143222  1190.675666/s
     iteration_duration.............: avg=41.91ms min=3.79ms  med=41.5ms  max=314.27ms p(90)=58.15ms  p(95)=63.09ms  p(99.9)=87.48ms 
     iterations.....................: 143122  1189.844317/s
     success_rate...................: 100.00% ✓ 143122      ✗ 0     
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

     checks.........................: 100.00% ✓ 205572     ✗ 0    
     data_received..................: 6.0 GB  50 MB/s
     data_sent......................: 82 MB   684 kB/s
     http_req_blocked...............: avg=7.5µs   min=1.23µs  med=3.22µs  max=9.13ms   p(90)=4.71µs   p(95)=5.37µs   p(99.9)=49.21µs 
     http_req_connecting............: avg=3.9µs   min=0s      med=0s      max=9.09ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=87.2ms  min=4ms     med=85.47ms max=311.37ms p(90)=106.77ms p(95)=117.5ms  p(99.9)=203.94ms
       { expected_response:true }...: avg=87.2ms  min=4ms     med=85.47ms max=311.37ms p(90)=106.77ms p(95)=117.5ms  p(99.9)=203.94ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 68624
     http_req_receiving.............: avg=85.03µs min=30.06µs med=75.07µs max=95.32ms  p(90)=110.06µs p(95)=122.96µs p(99.9)=650.73µs
     http_req_sending...............: avg=25.11µs min=5.33µs  med=14.25µs max=95.22ms  p(90)=20.83µs  p(95)=23.07µs  p(99.9)=849.44µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=87.09ms min=3.9ms   med=85.37ms max=308.49ms p(90)=106.66ms p(95)=117.35ms p(99.9)=203.34ms
     http_reqs......................: 68624   569.311751/s
     iteration_duration.............: avg=87.57ms min=25.02ms med=85.72ms max=329.02ms p(90)=107.01ms p(95)=117.79ms p(99.9)=205.53ms
     iterations.....................: 68524   568.482141/s
     success_rate...................: 100.00% ✓ 68524      ✗ 0    
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

     checks.........................: 100.00% ✓ 162285     ✗ 0    
     data_received..................: 4.7 GB  39 MB/s
     data_sent......................: 65 MB   539 kB/s
     http_req_blocked...............: avg=4.82µs   min=1.1µs   med=3.24µs   max=3.22ms   p(90)=4.75µs   p(95)=5.31µs   p(99.9)=93.9µs  
     http_req_connecting............: avg=1.36µs   min=0s      med=0s       max=3.2ms    p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=110.47ms min=5.26ms  med=108.3ms  max=316.53ms p(90)=146.15ms p(95)=157.2ms  p(99.9)=202.28ms
       { expected_response:true }...: avg=110.47ms min=5.26ms  med=108.3ms  max=316.53ms p(90)=146.15ms p(95)=157.2ms  p(99.9)=202.28ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 54195
     http_req_receiving.............: avg=86.2µs   min=30µs    med=83.25µs  max=34.21ms  p(90)=113.64µs p(95)=126.51µs p(99.9)=533.59µs
     http_req_sending...............: avg=36.53µs  min=5.18µs  med=16.66µs  max=171.63ms p(90)=21.9µs   p(95)=23.81µs  p(99.9)=887.56µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=110.34ms min=5.16ms  med=108.19ms max=315.2ms  p(90)=146.03ms p(95)=157.05ms p(99.9)=201.71ms
     http_reqs......................: 54195   449.204743/s
     iteration_duration.............: avg=110.94ms min=22.61ms med=108.6ms  max=335.45ms p(90)=146.45ms p(95)=157.51ms p(99.9)=204.5ms 
     iterations.....................: 54095   448.375876/s
     success_rate...................: 100.00% ✓ 54095      ✗ 0    
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

     checks.........................: 100.00% ✓ 97890      ✗ 0    
     data_received..................: 2.9 GB  24 MB/s
     data_sent......................: 39 MB   325 kB/s
     http_req_blocked...............: avg=6.87µs   min=1.44µs  med=3.74µs   max=3.65ms   p(90)=5.18µs   p(95)=5.81µs   p(99.9)=1.55ms  
     http_req_connecting............: avg=2.87µs   min=0s      med=0s       max=3.61ms   p(90)=0s       p(95)=0s       p(99.9)=1.53ms  
     http_req_duration..............: avg=183.12ms min=6.22ms  med=167.9ms  max=624.22ms p(90)=212.33ms p(95)=258.72ms p(99.9)=549.16ms
       { expected_response:true }...: avg=183.12ms min=6.22ms  med=167.9ms  max=624.22ms p(90)=212.33ms p(95)=258.72ms p(99.9)=549.16ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32730
     http_req_receiving.............: avg=102.47µs min=34.5µs  med=94.33µs  max=74.22ms  p(90)=126.77µs p(95)=140.87µs p(99.9)=617.16µs
     http_req_sending...............: avg=27.76µs  min=6.53µs  med=19.14µs  max=41.65ms  p(90)=23.87µs  p(95)=25.8µs   p(99.9)=425.75µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=182.99ms min=6.12ms  med=167.77ms max=624.06ms p(90)=212.22ms p(95)=258.53ms p(99.9)=549.05ms
     http_reqs......................: 32730   270.804703/s
     iteration_duration.............: avg=183.98ms min=42.88ms med=168.27ms max=624.5ms  p(90)=212.76ms p(95)=260.69ms p(99.9)=549.49ms
     iterations.....................: 32630   269.977313/s
     success_rate...................: 100.00% ✓ 32630      ✗ 0    
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

     checks.........................: 100.00% ✓ 96039      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 39 MB   319 kB/s
     http_req_blocked...............: avg=6.17µs   min=1.15µs  med=3.21µs   max=3.45ms   p(90)=4.48µs   p(95)=5.01µs   p(99.9)=1.35ms  
     http_req_connecting............: avg=2.76µs   min=0s      med=0s       max=3.4ms    p(90)=0s       p(95)=0s       p(99.9)=1.33ms  
     http_req_duration..............: avg=186.68ms min=7.78ms  med=185.65ms max=361.09ms p(90)=212.57ms p(95)=217.18ms p(99.9)=292.75ms
       { expected_response:true }...: avg=186.68ms min=7.78ms  med=185.65ms max=361.09ms p(90)=212.57ms p(95)=217.18ms p(99.9)=292.75ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32113
     http_req_receiving.............: avg=88.77µs  min=30.44µs med=87.14µs  max=3ms      p(90)=115.94µs p(95)=126.95µs p(99.9)=393.78µs
     http_req_sending...............: avg=28µs     min=5.4µs   med=16.88µs  max=67.97ms  p(90)=21.01µs  p(95)=22.86µs  p(99.9)=584.3µs 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=186.56ms min=7.68ms  med=185.53ms max=360.64ms p(90)=212.46ms p(95)=217.07ms p(99.9)=292.6ms 
     http_reqs......................: 32113   265.445188/s
     iteration_duration.............: avg=187.52ms min=27.44ms med=185.99ms max=381.7ms  p(90)=212.84ms p(95)=217.46ms p(99.9)=295.59ms
     iterations.....................: 32013   264.618591/s
     success_rate...................: 100.00% ✓ 32013      ✗ 0    
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

     checks.........................: 100.00% ✓ 6306      ✗ 0   
     data_received..................: 211 MB  1.7 MB/s
     data_sent......................: 2.6 MB  21 kB/s
     http_req_blocked...............: avg=45.22µs  min=1.47µs  med=3.52µs  max=3.53ms  p(90)=5.1µs   p(95)=5.99µs   p(99.9)=3.26ms
     http_req_connecting............: avg=40.99µs  min=0s      med=0s      max=3.49ms  p(90)=0s      p(95)=0s       p(99.9)=3.22ms
     http_req_duration..............: avg=2.74s    min=34.49ms med=2.82s   max=5.37s   p(90)=3.56s   p(95)=3.77s    p(99.9)=5.19s 
       { expected_response:true }...: avg=2.74s    min=34.49ms med=2.82s   max=5.37s   p(90)=3.56s   p(95)=3.77s    p(99.9)=5.19s 
     http_req_failed................: 0.00%   ✓ 0         ✗ 2202
     http_req_receiving.............: avg=102.53µs min=31.8µs  med=88.46µs max=11.06ms p(90)=131.9µs p(95)=149.18µs p(99.9)=2.42ms
     http_req_sending...............: avg=56.13µs  min=6.41µs  med=17.73µs max=24.65ms p(90)=23.62µs p(95)=30.2µs   p(99.9)=4.52ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s      p(90)=0s      p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=2.74s    min=34.31ms med=2.82s   max=5.37s   p(90)=3.56s   p(95)=3.77s    p(99.9)=5.19s 
     http_reqs......................: 2202    17.37682/s
     iteration_duration.............: avg=2.87s    min=925.5ms med=2.85s   max=5.37s   p(90)=3.57s   p(95)=3.8s     p(99.9)=5.19s 
     iterations.....................: 2102    16.587682/s
     success_rate...................: 100.00% ✓ 2102      ✗ 0   
     vus............................: 26      min=0       max=50
     vus_max........................: 50      min=50      max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

