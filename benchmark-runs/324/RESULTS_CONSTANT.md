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
| hive-router | v0.0.84 | 2,942 | 3,192 | 2,897 | 3.4% |  |
| fusion-nightly-net11 | 16.6.2-p.4 | 2,744 | 2,898 | 2,736 | 2.1% |  |
| fusion-nightly | 16.6.2-p.4 | 2,633 | 2,765 | 2,623 | 1.9% |  |
| fusion | 16.6.1 | 2,579 | 2,703 | 2,563 | 1.9% |  |
| fusion-nightly-fed | 16.6.2-p.4 | 2,413 | 2,513 | 2,382 | 1.8% |  |
| grafbase | 0.53.5 | 2,166 | 2,291 | 2,146 | 2.3% |  |
| cosmo | 0.334.0 | 1,313 | 1,356 | 1,305 | 1.4% |  |
| hive-gateway-router-runtime | 2.10.8 | 604 | 622 | 602 | 1.2% |  |
| apollo-router | v2.16.1 | 444 | 465 | 441 | 2.0% |  |
| apollo-gateway | 2.14.3 | 283 | 288 | 282 | 0.7% |  |
| hive-gateway | 2.10.8 | 274 | 282 | 273 | 1.0% |  |
| feddi | 5ff8b6165878 | — | — | — | — | non-compatible response (1517 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| fusion-nightly-net11 | 16.6.2-p.4 | 2,579 | 2,692 | 2,569 | 1.7% |  |
| hive-router | v0.0.84 | 2,579 | 2,799 | 2,546 | 3.3% |  |
| fusion-nightly | 16.6.2-p.4 | 2,495 | 2,616 | 2,480 | 1.9% |  |
| fusion | 16.6.1 | 2,432 | 2,547 | 2,424 | 1.9% |  |
| fusion-nightly-fed | 16.6.2-p.4 | 2,210 | 2,326 | 2,198 | 2.0% |  |
| grafbase | 0.53.5 | 1,616 | 1,677 | 1,611 | 1.4% |  |
| cosmo | 0.334.0 | 1,225 | 1,259 | 1,212 | 1.4% |  |
| hive-gateway-router-runtime | 2.10.8 | 577 | 596 | 573 | 1.5% |  |
| apollo-router | v2.16.1 | 443 | 452 | 435 | 1.2% |  |
| apollo-gateway | 2.14.3 | 263 | 269 | 262 | 0.9% |  |
| hive-gateway | 2.10.8 | 263 | 270 | 262 | 1.0% |  |
| feddi | 5ff8b6165878 | 16 | 17 | 16 | 3.3% |  |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.84)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 1060593     ✗ 0     
     data_received..................: 31 GB   258 MB/s
     data_sent......................: 425 MB  3.5 MB/s
     http_req_blocked...............: avg=2.56µs  min=841ns   med=1.9µs   max=18.31ms  p(90)=3.11µs  p(95)=3.7µs    p(99.9)=27.73µs
     http_req_connecting............: avg=233ns   min=0s      med=0s      max=3.33ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=16.76ms min=1.35ms  med=16.16ms max=277.09ms p(90)=24.63ms p(95)=27.72ms  p(99.9)=47.53ms
       { expected_response:true }...: avg=16.76ms min=1.35ms  med=16.16ms max=277.09ms p(90)=24.63ms p(95)=27.72ms  p(99.9)=47.53ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 353631
     http_req_receiving.............: avg=84.89µs min=25.59µs med=45.29µs max=133.34ms p(90)=80.29µs p(95)=130.25µs p(99.9)=7.02ms 
     http_req_sending...............: avg=46.64µs min=4.55µs  med=8.29µs  max=251.14ms p(90)=14.2µs  p(95)=84.5µs   p(99.9)=6.2ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=16.63ms min=1.3ms   med=16.06ms max=274.72ms p(90)=24.46ms p(95)=27.48ms  p(99.9)=46.24ms
     http_reqs......................: 353631  2942.49588/s
     iteration_duration.............: avg=16.96ms min=2.02ms  med=16.35ms max=306.49ms p(90)=24.83ms p(95)=27.93ms  p(99.9)=48.14ms
     iterations.....................: 353531  2941.663799/s
     success_rate...................: 100.00% ✓ 353531      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (rust subgraphs) (16.6.2-p.4)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 989772      ✗ 0     
     data_received..................: 29 GB   241 MB/s
     data_sent......................: 397 MB  3.3 MB/s
     http_req_blocked...............: avg=3.16µs   min=891ns  med=1.9µs   max=12.83ms  p(90)=3.11µs  p(95)=3.7µs   p(99.9)=30.37µs
     http_req_connecting............: avg=793ns    min=0s     med=0s      max=8.65ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=17.96ms  min=1.9ms  med=17.08ms max=279.78ms p(90)=25.99ms p(95)=29.55ms p(99.9)=50.54ms
       { expected_response:true }...: avg=17.96ms  min=1.9ms  med=17.08ms max=279.78ms p(90)=25.99ms p(95)=29.55ms p(99.9)=50.54ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 330024
     http_req_receiving.............: avg=453.54µs min=50.3µs med=89.48µs max=96.03ms  p(90)=1.12ms  p(95)=1.75ms  p(99.9)=17.72ms
     http_req_sending...............: avg=44.11µs  min=4.51µs med=8.11µs  max=113.29ms p(90)=14.22µs p(95)=84.07µs p(99.9)=5.01ms 
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=17.47ms  min=1.82ms med=16.59ms max=279.02ms p(90)=25.39ms p(95)=28.89ms p(99.9)=48.91ms
     http_reqs......................: 330024  2744.713017/s
     iteration_duration.............: avg=18.17ms  min=2.59ms med=17.28ms max=294.52ms p(90)=26.19ms p(95)=29.79ms p(99.9)=51.13ms
     iterations.....................: 329924  2743.881346/s
     success_rate...................: 100.00% ✓ 329924      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (rust subgraphs) (16.6.2-p.4)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 949614      ✗ 0     
     data_received..................: 28 GB   231 MB/s
     data_sent......................: 381 MB  3.2 MB/s
     http_req_blocked...............: avg=3.22µs   min=1.05µs  med=2.43µs  max=12.55ms  p(90)=3.75µs  p(95)=4.35µs  p(99.9)=35.8µs  
     http_req_connecting............: avg=288ns    min=0s      med=0s      max=3.52ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=18.73ms  min=2.05ms  med=16.15ms max=280.97ms p(90)=30.51ms p(95)=36.79ms p(99.9)=118.61ms
       { expected_response:true }...: avg=18.73ms  min=2.05ms  med=16.15ms max=280.97ms p(90)=30.51ms p(95)=36.79ms p(99.9)=118.61ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 316638
     http_req_receiving.............: avg=557.32µs min=52.23µs med=91.74µs max=186.65ms p(90)=1.06ms  p(95)=1.98ms  p(99.9)=25.36ms 
     http_req_sending...............: avg=46.26µs  min=4.77µs  med=9.05µs  max=127.09ms p(90)=15.6µs  p(95)=95.52µs p(99.9)=4.49ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=18.12ms  min=1.9ms   med=15.62ms max=280.35ms p(90)=29.58ms p(95)=35.77ms p(99.9)=117.11ms
     http_reqs......................: 316638  2633.002446/s
     iteration_duration.............: avg=18.94ms  min=3.13ms  med=16.36ms max=292.59ms p(90)=30.75ms p(95)=37.04ms p(99.9)=119.83ms
     iterations.....................: 316538  2632.170896/s
     success_rate...................: 100.00% ✓ 316538      ✗ 0     
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

     checks.........................: 100.00% ✓ 930153      ✗ 0     
     data_received..................: 27 GB   226 MB/s
     data_sent......................: 373 MB  3.1 MB/s
     http_req_blocked...............: avg=2.43µs  min=862ns   med=1.81µs  max=5.99ms   p(90)=2.89µs  p(95)=3.42µs  p(99.9)=26.25µs 
     http_req_connecting............: avg=266ns   min=0s      med=0s      max=3.37ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=19.14ms min=2ms     med=16.38ms max=332.65ms p(90)=31.17ms p(95)=37.9ms  p(99.9)=123.97ms
       { expected_response:true }...: avg=19.14ms min=2ms     med=16.38ms max=332.65ms p(90)=31.17ms p(95)=37.9ms  p(99.9)=123.97ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 310151
     http_req_receiving.............: avg=575.2µs min=51.51µs med=90.23µs max=161.19ms p(90)=1.07ms  p(95)=1.9ms   p(99.9)=26.29ms 
     http_req_sending...............: avg=41.38µs min=4.37µs  med=7.88µs  max=199.21ms p(90)=13.47µs p(95)=62.86µs p(99.9)=3.52ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=18.53ms min=1.91ms  med=15.85ms max=332.55ms p(90)=30.21ms p(95)=36.8ms  p(99.9)=122.49ms
     http_reqs......................: 310151  2579.06345/s
     iteration_duration.............: avg=19.34ms min=3ms     med=16.56ms max=332.84ms p(90)=31.38ms p(95)=38.12ms p(99.9)=124.27ms
     iterations.....................: 310051  2578.231899/s
     success_rate...................: 100.00% ✓ 310051      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (rust subgraphs) (16.6.2-p.4)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 870006      ✗ 0     
     data_received..................: 26 GB   212 MB/s
     data_sent......................: 349 MB  2.9 MB/s
     http_req_blocked...............: avg=2.72µs   min=841ns   med=1.93µs  max=16.43ms  p(90)=3.1µs   p(95)=3.65µs  p(99.9)=29.57µs 
     http_req_connecting............: avg=289ns    min=0s      med=0s      max=3.41ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=20.47ms  min=1.69ms  med=16.75ms max=358.95ms p(90)=34.87ms p(95)=43.87ms p(99.9)=155.87ms
       { expected_response:true }...: avg=20.47ms  min=1.69ms  med=16.75ms max=358.95ms p(90)=34.87ms p(95)=43.87ms p(99.9)=155.87ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 290102
     http_req_receiving.............: avg=601.52µs min=51.08µs med=92.57µs max=196.08ms p(90)=1.08ms  p(95)=1.92ms  p(99.9)=29.67ms 
     http_req_sending...............: avg=40.57µs  min=4.67µs  med=8.14µs  max=177.95ms p(90)=13.89µs p(95)=59.41µs p(99.9)=3.61ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=19.83ms  min=1.57ms  med=16.23ms max=358.87ms p(90)=33.81ms p(95)=42.56ms p(99.9)=154.23ms
     http_reqs......................: 290102  2413.068196/s
     iteration_duration.............: avg=20.68ms  min=2.32ms  med=16.94ms max=359.14ms p(90)=35.08ms p(95)=44.09ms p(99.9)=156.8ms 
     iterations.....................: 290002  2412.236396/s
     success_rate...................: 100.00% ✓ 290002      ✗ 0     
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

     checks.........................: 100.00% ✓ 780972      ✗ 0     
     data_received..................: 23 GB   190 MB/s
     data_sent......................: 313 MB  2.6 MB/s
     http_req_blocked...............: avg=3.58µs  min=1.02µs  med=2.67µs  max=13.73ms  p(90)=4.3µs   p(95)=5.1µs    p(99.9)=39.32µs
     http_req_connecting............: avg=363ns   min=0s      med=0s      max=4.11ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=22.81ms min=1.76ms  med=22.56ms max=303.86ms p(90)=27.17ms p(95)=29.11ms  p(99.9)=49.12ms
       { expected_response:true }...: avg=22.81ms min=1.76ms  med=22.56ms max=303.86ms p(90)=27.17ms p(95)=29.11ms  p(99.9)=49.12ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 260424
     http_req_receiving.............: avg=93.84µs min=26.67µs med=57.11µs max=185.6ms  p(90)=97.59µs p(95)=131.32µs p(99.9)=6.99ms 
     http_req_sending...............: avg=39.54µs min=4.91µs  med=10.31µs max=139.33ms p(90)=17.13µs p(95)=58.21µs  p(99.9)=2.02ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=22.68ms min=1.69ms  med=22.46ms max=303.48ms p(90)=27.02ms p(95)=28.93ms  p(99.9)=48.17ms
     http_reqs......................: 260424  2166.172619/s
     iteration_duration.............: avg=23.03ms min=4.32ms  med=22.76ms max=321.88ms p(90)=27.38ms p(95)=29.34ms  p(99.9)=49.55ms
     iterations.....................: 260324  2165.340833/s
     success_rate...................: 100.00% ✓ 260324      ✗ 0     
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

     checks.........................: 100.00% ✓ 473481      ✗ 0     
     data_received..................: 14 GB   115 MB/s
     data_sent......................: 190 MB  1.6 MB/s
     http_req_blocked...............: avg=3.39µs  min=1.04µs med=2.49µs  max=3.94ms   p(90)=3.96µs  p(95)=4.63µs   p(99.9)=34.18µs 
     http_req_connecting............: avg=588ns   min=0s     med=0s      max=3.91ms   p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=37.77ms min=2.16ms med=37.36ms max=303.45ms p(90)=52.79ms p(95)=57.53ms  p(99.9)=79.88ms 
       { expected_response:true }...: avg=37.77ms min=2.16ms med=37.36ms max=303.45ms p(90)=52.79ms p(95)=57.53ms  p(99.9)=79.88ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 157927
     http_req_receiving.............: avg=76.11µs min=26.4µs med=61.74µs max=103.22ms p(90)=97.41µs p(95)=113.03µs p(99.9)=990.34µs
     http_req_sending...............: avg=25.54µs min=5.08µs med=11µs    max=99.04ms  p(90)=17.32µs p(95)=21.41µs  p(99.9)=990.44µs
     http_req_tls_handshaking.......: avg=0s      min=0s     med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=37.67ms min=2.04ms med=37.26ms max=302.54ms p(90)=52.69ms p(95)=57.42ms  p(99.9)=79.63ms 
     http_reqs......................: 157927  1313.003543/s
     iteration_duration.............: avg=38ms    min=3.31ms med=37.56ms max=321.42ms p(90)=53ms    p(95)=57.74ms  p(99.9)=80.34ms 
     iterations.....................: 157827  1312.172144/s
     success_rate...................: 100.00% ✓ 157827      ✗ 0     
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

     checks.........................: 100.00% ✓ 218028     ✗ 0    
     data_received..................: 6.4 GB  53 MB/s
     data_sent......................: 87 MB   726 kB/s
     http_req_blocked...............: avg=4.28µs  min=1.16µs  med=2.96µs  max=3.35ms   p(90)=4.38µs   p(95)=5.01µs   p(99.9)=44.16µs 
     http_req_connecting............: avg=1.05µs  min=0s      med=0s      max=3.31ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=82.22ms min=3.58ms  med=79.8ms  max=299.37ms p(90)=103.64ms p(95)=115.53ms p(99.9)=194.99ms
       { expected_response:true }...: avg=82.22ms min=3.58ms  med=79.8ms  max=299.37ms p(90)=103.64ms p(95)=115.53ms p(99.9)=194.99ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 72776
     http_req_receiving.............: avg=80.12µs min=29.63µs med=70.43µs max=68.53ms  p(90)=105.31µs p(95)=118.33µs p(99.9)=684.08µs
     http_req_sending...............: avg=21.41µs min=5.47µs  med=13.72µs max=82.73ms  p(90)=19.88µs  p(95)=22.2µs   p(99.9)=609.9µs 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=82.12ms min=3.52ms  med=79.69ms max=283.82ms p(90)=103.54ms p(95)=115.43ms p(99.9)=194.85ms
     http_reqs......................: 72776   604.064972/s
     iteration_duration.............: avg=82.57ms min=19.23ms med=80.04ms max=306.63ms p(90)=103.89ms p(95)=115.79ms p(99.9)=196.53ms
     iterations.....................: 72676   603.234939/s
     success_rate...................: 100.00% ✓ 72676      ✗ 0    
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

     checks.........................: 100.00% ✓ 160650     ✗ 0    
     data_received..................: 4.7 GB  39 MB/s
     data_sent......................: 64 MB   534 kB/s
     http_req_blocked...............: avg=7.32µs   min=1.31µs med=3.27µs   max=112.11ms p(90)=4.65µs   p(95)=5.2µs    p(99.9)=132.51µs
     http_req_connecting............: avg=1.74µs   min=0s     med=0s       max=3.81ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=111.61ms min=4.46ms med=111.36ms max=329.8ms  p(90)=134.81ms p(95)=141.71ms p(99.9)=175.97ms
       { expected_response:true }...: avg=111.61ms min=4.46ms med=111.36ms max=329.8ms  p(90)=134.81ms p(95)=141.71ms p(99.9)=175.97ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 53650
     http_req_receiving.............: avg=82.73µs  min=33.2µs med=76.22µs  max=64.22ms  p(90)=108.12µs p(95)=120.67µs p(99.9)=562.96µs
     http_req_sending...............: avg=29.19µs  min=5.85µs med=15.12µs  max=153.03ms p(90)=20.61µs  p(95)=22.46µs  p(99.9)=528.59µs
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=111.49ms min=4.37ms med=111.26ms max=329.38ms p(90)=134.7ms  p(95)=141.59ms p(99.9)=174.92ms
     http_reqs......................: 53650   444.852704/s
     iteration_duration.............: avg=112.07ms min=34.7ms med=111.63ms max=365.09ms p(90)=135.08ms p(95)=141.98ms p(99.9)=178.26ms
     iterations.....................: 53550   444.023529/s
     success_rate...................: 100.00% ✓ 53550      ✗ 0    
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

     checks.........................: 100.00% ✓ 102549     ✗ 0    
     data_received..................: 3.0 GB  25 MB/s
     data_sent......................: 41 MB   340 kB/s
     http_req_blocked...............: avg=5.3µs    min=1.33µs  med=3.23µs   max=3.18ms   p(90)=4.45µs   p(95)=4.96µs   p(99.9)=581.32µs
     http_req_connecting............: avg=1.87µs   min=0s      med=0s       max=3.15ms   p(90)=0s       p(95)=0s       p(99.9)=527.26µs
     http_req_duration..............: avg=174.87ms min=7.31ms  med=176.06ms max=311.88ms p(90)=184.2ms  p(95)=187.92ms p(99.9)=254.86ms
       { expected_response:true }...: avg=174.87ms min=7.31ms  med=176.06ms max=311.88ms p(90)=184.2ms  p(95)=187.92ms p(99.9)=254.86ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 34283
     http_req_receiving.............: avg=85.3µs   min=33.24µs med=79.82µs  max=32.43ms  p(90)=110.38µs p(95)=120.77µs p(99.9)=431.33µs
     http_req_sending...............: avg=26.13µs  min=6.05µs  med=16.11µs  max=65.91ms  p(90)=20.37µs  p(95)=22.13µs  p(99.9)=556.82µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=174.76ms min=7.23ms  med=175.95ms max=310.95ms p(90)=184.08ms p(95)=187.81ms p(99.9)=254.77ms
     http_reqs......................: 34283   283.535721/s
     iteration_duration.............: avg=175.62ms min=53.47ms med=176.44ms max=327.87ms p(90)=184.46ms p(95)=188.19ms p(99.9)=257.16ms
     iterations.....................: 34183   282.708677/s
     success_rate...................: 100.00% ✓ 34183      ✗ 0    
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

     checks.........................: 100.00% ✓ 99084      ✗ 0    
     data_received..................: 2.9 GB  24 MB/s
     data_sent......................: 40 MB   329 kB/s
     http_req_blocked...............: avg=5.74µs   min=1.05µs  med=3µs      max=3.41ms   p(90)=4.28µs   p(95)=4.8µs    p(99.9)=1.24ms  
     http_req_connecting............: avg=2.56µs   min=0s      med=0s       max=3.37ms   p(90)=0s       p(95)=0s       p(99.9)=1.21ms  
     http_req_duration..............: avg=180.99ms min=5.38ms  med=166.66ms max=653.74ms p(90)=216.18ms p(95)=261.41ms p(99.9)=597ms   
       { expected_response:true }...: avg=180.99ms min=5.38ms  med=166.66ms max=653.74ms p(90)=216.18ms p(95)=261.41ms p(99.9)=597ms   
     http_req_failed................: 0.00%   ✓ 0          ✗ 33128
     http_req_receiving.............: avg=86.82µs  min=30.9µs  med=81.49µs  max=20.27ms  p(90)=112.51µs p(95)=124.86µs p(99.9)=766.52µs
     http_req_sending...............: avg=22.31µs  min=5.11µs  med=15.5µs   max=55.19ms  p(90)=20.16µs  p(95)=21.82µs  p(99.9)=562.97µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=180.88ms min=5.29ms  med=166.56ms max=653.64ms p(90)=216.06ms p(95)=261.33ms p(99.9)=596.87ms
     http_reqs......................: 33128   274.031835/s
     iteration_duration.............: avg=181.8ms  min=38.61ms med=167.02ms max=653.98ms p(90)=216.65ms p(95)=263.2ms  p(99.9)=597.49ms
     iterations.....................: 33028   273.204644/s
     success_rate...................: 100.00% ✓ 33028      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (.net subgraphs) (16.6.2-p.4)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 929850      ✗ 0     
     data_received..................: 27 GB   226 MB/s
     data_sent......................: 373 MB  3.1 MB/s
     http_req_blocked...............: avg=3.57µs   min=891ns   med=1.98µs  max=16.81ms  p(90)=3.43µs  p(95)=4.17µs  p(99.9)=31.62µs
     http_req_connecting............: avg=886ns    min=0s      med=0s      max=8.8ms    p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=19.13ms  min=1.45ms  med=18.29ms max=272.02ms p(90)=27.7ms  p(95)=31.2ms  p(99.9)=51.62ms
       { expected_response:true }...: avg=19.13ms  min=1.45ms  med=18.29ms max=272.02ms p(90)=27.7ms  p(95)=31.2ms  p(99.9)=51.62ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 310050
     http_req_receiving.............: avg=534.98µs min=52.36µs med=97.54µs max=57ms     p(90)=1.33ms  p(95)=2.11ms  p(99.9)=18ms   
     http_req_sending...............: avg=42.08µs  min=4.56µs  med=8.43µs  max=157.05ms p(90)=16.74µs p(95)=84.74µs p(99.9)=3.3ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=18.55ms  min=1.37ms  med=17.72ms max=271.51ms p(90)=27ms    p(95)=30.46ms p(99.9)=50.14ms
     http_reqs......................: 310050  2579.70694/s
     iteration_duration.............: avg=19.34ms  min=2.6ms   med=18.49ms max=289.98ms p(90)=27.91ms p(95)=31.43ms p(99.9)=52.29ms
     iterations.....................: 309950  2578.874911/s
     success_rate...................: 100.00% ✓ 309950      ✗ 0     
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

     checks.........................: 100.00% ✓ 930186      ✗ 0     
     data_received..................: 27 GB   226 MB/s
     data_sent......................: 373 MB  3.1 MB/s
     http_req_blocked...............: avg=3.42µs  min=962ns   med=2.62µs  max=14.89ms  p(90)=4.32µs  p(95)=5.11µs   p(99.9)=37.6µs 
     http_req_connecting............: avg=328ns   min=0s      med=0s      max=3.62ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=19.11ms min=1.78ms  med=18.72ms max=275.9ms  p(90)=26.47ms p(95)=29.05ms  p(99.9)=49.1ms 
       { expected_response:true }...: avg=19.11ms min=1.78ms  med=18.72ms max=275.9ms  p(90)=26.47ms p(95)=29.05ms  p(99.9)=49.1ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 310162
     http_req_receiving.............: avg=96.73µs min=25.43µs med=51.51µs max=184.46ms p(90)=96.52µs p(95)=159.06µs p(99.9)=7.49ms 
     http_req_sending...............: avg=45.47µs min=4.91µs  med=10.62µs max=149.04ms p(90)=19.25µs p(95)=103.82µs p(99.9)=3.18ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=18.97ms min=1.72ms  med=18.6ms  max=275.45ms p(90)=26.3ms  p(95)=28.83ms  p(99.9)=48.04ms
     http_reqs......................: 310162  2579.787694/s
     iteration_duration.............: avg=19.34ms min=3.2ms   med=18.93ms max=298.43ms p(90)=26.68ms p(95)=29.28ms  p(99.9)=49.73ms
     iterations.....................: 310062  2578.955939/s
     success_rate...................: 100.00% ✓ 310062      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.6.2-p.4)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 899871      ✗ 0     
     data_received..................: 26 GB   219 MB/s
     data_sent......................: 361 MB  3.0 MB/s
     http_req_blocked...............: avg=2.84µs   min=882ns  med=2.05µs  max=11.51ms  p(90)=3.68µs  p(95)=4.44µs  p(99.9)=30.85µs 
     http_req_connecting............: avg=288ns    min=0s     med=0s      max=3.48ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=19.78ms  min=1.64ms med=16.7ms  max=347.13ms p(90)=32.23ms p(95)=39.38ms p(99.9)=136.84ms
       { expected_response:true }...: avg=19.78ms  min=1.64ms med=16.7ms  max=347.13ms p(90)=32.23ms p(95)=39.38ms p(99.9)=136.84ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 300057
     http_req_receiving.............: avg=567.77µs min=49.5µs med=90.75µs max=307.16ms p(90)=1.07ms  p(95)=1.88ms  p(99.9)=26.85ms 
     http_req_sending...............: avg=41.05µs  min=4.66µs med=8.6µs   max=87.33ms  p(90)=17.46µs p(95)=78.66µs p(99.9)=3.27ms  
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=19.17ms  min=1.55ms med=16.2ms  max=347.04ms p(90)=31.3ms  p(95)=38.32ms p(99.9)=132.14ms
     http_reqs......................: 300057  2495.863454/s
     iteration_duration.............: avg=19.99ms  min=2.65ms med=16.91ms max=351.69ms p(90)=32.46ms p(95)=39.62ms p(99.9)=137.56ms
     iterations.....................: 299957  2495.031657/s
     success_rate...................: 100.00% ✓ 299957      ✗ 0     
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

     checks.........................: 100.00% ✓ 877059      ✗ 0     
     data_received..................: 26 GB   213 MB/s
     data_sent......................: 351 MB  2.9 MB/s
     http_req_blocked...............: avg=2.8µs    min=841ns   med=2.03µs  max=17.71ms  p(90)=3.52µs  p(95)=4.23µs  p(99.9)=32.82µs 
     http_req_connecting............: avg=304ns    min=0s      med=0s      max=3.91ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=20.29ms  min=1.6ms   med=17.14ms max=338.83ms p(90)=33.02ms p(95)=40.36ms p(99.9)=140.17ms
       { expected_response:true }...: avg=20.29ms  min=1.6ms   med=17.14ms max=338.83ms p(90)=33.02ms p(95)=40.36ms p(99.9)=140.17ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 292453
     http_req_receiving.............: avg=565.67µs min=50.14µs med=94.32µs max=137.64ms p(90)=1.1ms   p(95)=1.9ms   p(99.9)=26.42ms 
     http_req_sending...............: avg=42.23µs  min=4.63µs  med=8.84µs  max=148.44ms p(90)=17.87µs p(95)=83.47µs p(99.9)=3.24ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=19.68ms  min=1.51ms  med=16.62ms max=338.72ms p(90)=32.02ms p(95)=39.27ms p(99.9)=139.02ms
     http_reqs......................: 292453  2432.767672/s
     iteration_duration.............: avg=20.51ms  min=2.66ms  med=17.34ms max=339ms    p(90)=33.24ms p(95)=40.61ms p(99.9)=141.08ms
     iterations.....................: 292353  2431.935823/s
     success_rate...................: 100.00% ✓ 292353      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (.net subgraphs) (16.6.2-p.4)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 796917      ✗ 0     
     data_received..................: 23 GB   194 MB/s
     data_sent......................: 319 MB  2.7 MB/s
     http_req_blocked...............: avg=3.08µs   min=931ns   med=2.16µs   max=13.37ms  p(90)=3.79µs  p(95)=4.53µs  p(99.9)=30.88µs 
     http_req_connecting............: avg=346ns    min=0s      med=0s       max=4.05ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=22.35ms  min=1.87ms  med=18.7ms   max=391.44ms p(90)=36.51ms p(95)=45.2ms  p(99.9)=158.19ms
       { expected_response:true }...: avg=22.35ms  min=1.87ms  med=18.7ms   max=391.44ms p(90)=36.51ms p(95)=45.2ms  p(99.9)=158.19ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 265739
     http_req_receiving.............: avg=629.21µs min=52.53µs med=102.12µs max=243.04ms p(90)=1.16ms  p(95)=2.04ms  p(99.9)=28.05ms 
     http_req_sending...............: avg=39.41µs  min=4.81µs  med=9.14µs   max=162.84ms p(90)=17.69µs p(95)=56.1µs  p(99.9)=2.7ms   
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=21.68ms  min=1.73ms  med=18.12ms  max=391.32ms p(90)=35.44ms p(95)=43.93ms p(99.9)=155.7ms 
     http_reqs......................: 265739  2210.178385/s
     iteration_duration.............: avg=22.57ms  min=2.92ms  med=18.9ms   max=391.64ms p(90)=36.73ms p(95)=45.43ms p(99.9)=159.48ms
     iterations.....................: 265639  2209.346674/s
     success_rate...................: 100.00% ✓ 265639      ✗ 0     
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

     checks.........................: 100.00% ✓ 582897      ✗ 0     
     data_received..................: 17 GB   142 MB/s
     data_sent......................: 234 MB  1.9 MB/s
     http_req_blocked...............: avg=3.3µs   min=882ns   med=2.22µs  max=5.94ms   p(90)=4.37µs   p(95)=5.43µs   p(99.9)=40.68µs
     http_req_connecting............: avg=470ns   min=0s      med=0s      max=3.43ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=30.63ms min=2.28ms  med=30.07ms max=321.26ms p(90)=40.51ms  p(95)=43.86ms  p(99.9)=66.79ms
       { expected_response:true }...: avg=30.63ms min=2.28ms  med=30.07ms max=321.26ms p(90)=40.51ms  p(95)=43.86ms  p(99.9)=66.79ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 194399
     http_req_receiving.............: avg=94.03µs min=27.36µs med=55.98µs max=197.85ms p(90)=125.37µs p(95)=200.47µs p(99.9)=3.66ms 
     http_req_sending...............: avg=39.3µs  min=4.85µs  med=9.43µs  max=163.92ms p(90)=23.97µs  p(95)=103.53µs p(99.9)=2.54ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=30.49ms min=2.15ms  med=29.95ms max=320.48ms p(90)=40.36ms  p(95)=43.69ms  p(99.9)=66.22ms
     http_reqs......................: 194399  1616.039639/s
     iteration_duration.............: avg=30.87ms min=5.23ms  med=30.29ms max=341.81ms p(90)=40.73ms  p(95)=44.07ms  p(99.9)=67.29ms
     iterations.....................: 194299  1615.208339/s
     success_rate...................: 100.00% ✓ 194299      ✗ 0     
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

     checks.........................: 100.00% ✓ 442059      ✗ 0     
     data_received..................: 13 GB   107 MB/s
     data_sent......................: 177 MB  1.5 MB/s
     http_req_blocked...............: avg=3.32µs  min=951ns   med=2.46µs  max=3.36ms   p(90)=4.18µs   p(95)=4.86µs   p(99.9)=36.01µs 
     http_req_connecting............: avg=495ns   min=0s      med=0s      max=3.31ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=40.46ms min=2.21ms  med=40.06ms max=295.13ms p(90)=56.33ms  p(95)=61.22ms  p(99.9)=84.73ms 
       { expected_response:true }...: avg=40.46ms min=2.21ms  med=40.06ms max=295.13ms p(90)=56.33ms  p(95)=61.22ms  p(99.9)=84.73ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 147453
     http_req_receiving.............: avg=79.8µs  min=27.39µs med=66.94µs max=135.19ms p(90)=106.84µs p(95)=123.15µs p(99.9)=793.48µs
     http_req_sending...............: avg=25.62µs min=4.94µs  med=11.67µs max=152.14ms p(90)=19.41µs  p(95)=22.96µs  p(99.9)=975.87µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=40.36ms min=2.09ms  med=39.96ms max=271.05ms p(90)=56.22ms  p(95)=61.1ms   p(99.9)=84.41ms 
     http_reqs......................: 147453  1225.789588/s
     iteration_duration.............: avg=40.71ms min=3.74ms  med=40.28ms max=320.01ms p(90)=56.54ms  p(95)=61.44ms  p(99.9)=85.16ms 
     iterations.....................: 147353  1224.958279/s
     success_rate...................: 100.00% ✓ 147353      ✗ 0     
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

     checks.........................: 100.00% ✓ 208293     ✗ 0    
     data_received..................: 6.1 GB  51 MB/s
     data_sent......................: 84 MB   693 kB/s
     http_req_blocked...............: avg=4.87µs  min=1.23µs  med=3.31µs  max=3.6ms    p(90)=4.85µs   p(95)=5.53µs   p(99.9)=43.59µs 
     http_req_connecting............: avg=1.3µs   min=0s      med=0s      max=3.56ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=86.05ms min=3.77ms  med=84.16ms max=327.73ms p(90)=104.6ms  p(95)=115.13ms p(99.9)=197.56ms
       { expected_response:true }...: avg=86.05ms min=3.77ms  med=84.16ms max=327.73ms p(90)=104.6ms  p(95)=115.13ms p(99.9)=197.56ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 69531
     http_req_receiving.............: avg=84µs    min=31.56µs med=76.34µs max=42.57ms  p(90)=112.65µs p(95)=126µs    p(99.9)=624.62µs
     http_req_sending...............: avg=22.72µs min=4.89µs  med=14.8µs  max=120.43ms p(90)=21.2µs   p(95)=23.44µs  p(99.9)=613.86µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=85.95ms min=3.67ms  med=84.05ms max=326.91ms p(90)=104.48ms p(95)=115ms    p(99.9)=197.37ms
     http_reqs......................: 69531   577.008825/s
     iteration_duration.............: avg=86.42ms min=25.82ms med=84.42ms max=353.73ms p(90)=104.86ms p(95)=115.41ms p(99.9)=198.77ms
     iterations.....................: 69431   576.178967/s
     success_rate...................: 100.00% ✓ 69431      ✗ 0    
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

     checks.........................: 100.00% ✓ 160203     ✗ 0    
     data_received..................: 4.7 GB  39 MB/s
     data_sent......................: 64 MB   532 kB/s
     http_req_blocked...............: avg=5.23µs   min=1.11µs  med=3.24µs   max=3.62ms   p(90)=4.75µs   p(95)=5.33µs   p(99.9)=75.25µs 
     http_req_connecting............: avg=1.77µs   min=0s      med=0s       max=3.58ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=111.9ms  min=5.27ms  med=109.66ms max=328.06ms p(90)=147.65ms p(95)=159ms    p(99.9)=202.94ms
       { expected_response:true }...: avg=111.9ms  min=5.27ms  med=109.66ms max=328.06ms p(90)=147.65ms p(95)=159ms    p(99.9)=202.94ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 53501
     http_req_receiving.............: avg=89.6µs   min=29.19µs med=81.08µs  max=125.15ms p(90)=111.79µs p(95)=124.49µs p(99.9)=550.69µs
     http_req_sending...............: avg=25.9µs   min=5.02µs  med=16.75µs  max=154.6ms  p(90)=22.03µs  p(95)=23.87µs  p(99.9)=528.69µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=111.78ms min=5.14ms  med=109.56ms max=327.66ms p(90)=147.53ms p(95)=158.9ms  p(99.9)=202.5ms 
     http_reqs......................: 53501   443.393186/s
     iteration_duration.............: avg=112.39ms min=24.5ms  med=109.99ms max=351.47ms p(90)=147.95ms p(95)=159.33ms p(99.9)=204.42ms
     iterations.....................: 53401   442.56443/s
     success_rate...................: 100.00% ✓ 53401      ✗ 0    
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

     checks.........................: 100.00% ✓ 95439      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 38 MB   317 kB/s
     http_req_blocked...............: avg=6µs      min=1.17µs  med=3.18µs   max=3.41ms   p(90)=4.55µs   p(95)=5.08µs   p(99.9)=1.26ms  
     http_req_connecting............: avg=2.62µs   min=0s      med=0s       max=3.37ms   p(90)=0s       p(95)=0s       p(99.9)=1.24ms  
     http_req_duration..............: avg=187.83ms min=8.01ms  med=187.51ms max=396.06ms p(90)=198.01ms p(95)=203.28ms p(99.9)=278.78ms
       { expected_response:true }...: avg=187.83ms min=8.01ms  med=187.51ms max=396.06ms p(90)=198.01ms p(95)=203.28ms p(99.9)=278.78ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 31913
     http_req_receiving.............: avg=89.61µs  min=30.81µs med=86.39µs  max=31.73ms  p(90)=116.16µs p(95)=127.13µs p(99.9)=518.31µs
     http_req_sending...............: avg=29.89µs  min=5.55µs  med=17.02µs  max=110.51ms p(90)=21.45µs  p(95)=23.25µs  p(99.9)=521.29µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=187.71ms min=7.87ms  med=187.39ms max=395.53ms p(90)=197.91ms p(95)=203.17ms p(99.9)=278.31ms
     http_reqs......................: 31913   263.756996/s
     iteration_duration.............: avg=188.7ms  min=49.98ms med=187.84ms max=404.36ms p(90)=198.28ms p(95)=203.64ms p(99.9)=284.2ms 
     iterations.....................: 31813   262.930509/s
     success_rate...................: 100.00% ✓ 31813      ✗ 0    
     vus............................: 5       min=5        max=50 
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

     checks.........................: 100.00% ✓ 95253      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 38 MB   316 kB/s
     http_req_blocked...............: avg=8.83µs   min=1.17µs  med=3.1µs    max=78.28ms  p(90)=4.47µs   p(95)=5µs      p(99.9)=1.46ms  
     http_req_connecting............: avg=3.02µs   min=0s      med=0s       max=4.08ms   p(90)=0s       p(95)=0s       p(99.9)=1.4ms   
     http_req_duration..............: avg=188.23ms min=5.93ms  med=173.21ms max=698.31ms p(90)=216.61ms p(95)=257.63ms p(99.9)=601.04ms
       { expected_response:true }...: avg=188.23ms min=5.93ms  med=173.21ms max=698.31ms p(90)=216.61ms p(95)=257.63ms p(99.9)=601.04ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 31851
     http_req_receiving.............: avg=93.73µs  min=31.29µs med=88.74µs  max=52.64ms  p(90)=118.78µs p(95)=129.76µs p(99.9)=542.43µs
     http_req_sending...............: avg=23.65µs  min=5.47µs  med=17.5µs   max=38.6ms   p(90)=21.84µs  p(95)=23.54µs  p(99.9)=540.27µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=188.11ms min=5.79ms  med=173.1ms  max=698.21ms p(90)=216.48ms p(95)=257.46ms p(99.9)=600.94ms
     http_reqs......................: 31851   263.379205/s
     iteration_duration.............: avg=189.07ms min=53.62ms med=173.55ms max=698.51ms p(90)=217.04ms p(95)=258.19ms p(99.9)=601.38ms
     iterations.....................: 31751   262.552294/s
     success_rate...................: 100.00% ✓ 31751      ✗ 0    
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

     checks.........................: 100.00% ✓ 6015      ✗ 0   
     data_received..................: 202 MB  1.6 MB/s
     data_sent......................: 2.5 MB  20 kB/s
     http_req_blocked...............: avg=59.15µs min=1.44µs  med=3.56µs  max=5.64ms  p(90)=5.23µs   p(95)=6.5µs    p(99.9)=4.77ms  
     http_req_connecting............: avg=52.53µs min=0s      med=0s      max=5.59ms  p(90)=0s       p(95)=0s       p(99.9)=4.71ms  
     http_req_duration..............: avg=2.87s   min=44.38ms med=2.97s   max=5.52s   p(90)=3.74s    p(95)=3.9s     p(99.9)=4.86s   
       { expected_response:true }...: avg=2.87s   min=44.38ms med=2.97s   max=5.52s   p(90)=3.74s    p(95)=3.9s     p(99.9)=4.86s   
     http_req_failed................: 0.00%   ✓ 0         ✗ 2105
     http_req_receiving.............: avg=95.04µs min=39.15µs med=89.29µs max=364.6µs p(90)=131.96µs p(95)=152.55µs p(99.9)=290.77µs
     http_req_sending...............: avg=46.54µs min=6.87µs  med=19.08µs max=3.66ms  p(90)=23.98µs  p(95)=29.58µs  p(99.9)=2.38ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=2.87s   min=44.23ms med=2.97s   max=5.52s   p(90)=3.74s    p(95)=3.9s     p(99.9)=4.86s   
     http_reqs......................: 2105    16.630923/s
     iteration_duration.............: avg=3.01s   min=1.32s   med=3s      max=5.52s   p(90)=3.76s    p(95)=3.93s    p(99.9)=4.86s   
     iterations.....................: 2005    15.840856/s
     success_rate...................: 100.00% ✓ 2005      ✗ 0   
     vus............................: 21      min=0       max=50
     vus_max........................: 50      min=50      max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

