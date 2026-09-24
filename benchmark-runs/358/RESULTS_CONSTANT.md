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
| hive-router | v0.0.84 | 2,888 | 3,119 | 2,840 | 3.2% |  |
| fusion-nightly-net11 | 16.7.0-p.10 | 2,673 | 2,826 | 2,660 | 2.2% |  |
| fusion | 16.6.6 | 2,671 | 2,806 | 2,660 | 1.9% |  |
| fusion-nightly | 16.7.0-p.10 | 2,539 | 2,687 | 2,518 | 2.3% |  |
| fusion-nightly-fed | 16.7.0-p.10 | 2,445 | 2,529 | 2,437 | 1.3% |  |
| grafbase | 0.53.5 | 2,234 | 2,346 | 2,225 | 1.9% |  |
| cosmo | 0.334.0 | 1,336 | 1,375 | 1,329 | 1.1% |  |
| hive-gateway-router-runtime | 2.10.8 | 620 | 639 | 615 | 1.2% |  |
| apollo-router | v2.16.1 | 486 | 504 | 485 | 1.3% |  |
| hive-gateway | 2.10.8 | 282 | 290 | 279 | 1.2% |  |
| apollo-gateway | 2.14.3 | 279 | 284 | 278 | 0.7% |  |
| feddi | 5ff8b6165878 | 1 | 1 | 1 | 0.0% |  |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.84 | 2,559 | 2,706 | 2,532 | 2.4% |  |
| fusion-nightly-net11 | 16.7.0-p.10 | 2,509 | 2,620 | 2,504 | 1.7% |  |
| fusion-nightly | 16.7.0-p.10 | 2,460 | 2,562 | 2,363 | 2.2% |  |
| fusion | 16.6.6 | 2,457 | 2,533 | 2,421 | 1.5% |  |
| fusion-nightly-fed | 16.7.0-p.10 | 2,219 | 2,316 | 2,209 | 1.6% |  |
| grafbase | 0.53.5 | 1,627 | 1,694 | 1,619 | 1.6% |  |
| cosmo | 0.334.0 | 1,226 | 1,270 | 1,218 | 1.4% |  |
| hive-gateway-router-runtime | 2.10.8 | 562 | 588 | 560 | 1.6% |  |
| apollo-router | v2.16.1 | 412 | 431 | 407 | 1.9% |  |
| apollo-gateway | 2.14.3 | 270 | 272 | 268 | 0.5% |  |
| hive-gateway | 2.10.8 | 260 | 267 | 258 | 1.1% |  |
| feddi | 5ff8b6165878 | 20 | 20 | 20 | 0.0% |  |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.84)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 1040955     ✗ 0     
     data_received..................: 30 GB   253 MB/s
     data_sent......................: 417 MB  3.5 MB/s
     http_req_blocked...............: avg=3.52µs  min=952ns   med=2.33µs  max=12.08ms  p(90)=3.62µs  p(95)=4.21µs  p(99.9)=33.19µs
     http_req_connecting............: avg=692ns   min=0s      med=0s      max=11.93ms  p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=17.07ms min=1.4ms   med=16.35ms max=293.95ms p(90)=25.28ms p(95)=28.53ms p(99.9)=47.67ms
       { expected_response:true }...: avg=17.07ms min=1.4ms   med=16.35ms max=293.95ms p(90)=25.28ms p(95)=28.53ms p(99.9)=47.67ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 347085
     http_req_receiving.............: avg=88.49µs min=25.19µs med=46.19µs max=148.9ms  p(90)=82.72µs p(95)=156µs   p(99.9)=7.2ms  
     http_req_sending...............: avg=47.69µs min=4.75µs  med=8.74µs  max=121.01ms p(90)=14.94µs p(95)=96.77µs p(99.9)=7.3ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=16.94ms min=1.36ms  med=16.24ms max=292.92ms p(90)=25.11ms p(95)=28.29ms p(99.9)=46.83ms
     http_reqs......................: 347085  2888.113747/s
     iteration_duration.............: avg=17.28ms min=2.12ms  med=16.55ms max=318.34ms p(90)=25.49ms p(95)=28.75ms p(99.9)=48.41ms
     iterations.....................: 346985  2887.281641/s
     success_rate...................: 100.00% ✓ 346985      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (rust subgraphs) (16.7.0-p.10)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 964002      ✗ 0     
     data_received..................: 28 GB   234 MB/s
     data_sent......................: 386 MB  3.2 MB/s
     http_req_blocked...............: avg=2.67µs  min=852ns   med=1.96µs  max=15.47ms  p(90)=3.23µs  p(95)=3.88µs  p(99.9)=26.86µs
     http_req_connecting............: avg=262ns   min=0s      med=0s      max=3.42ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=18.44ms min=1.97ms  med=17.35ms max=291.75ms p(90)=26.39ms p(95)=30.09ms p(99.9)=51.55ms
       { expected_response:true }...: avg=18.44ms min=1.97ms  med=17.35ms max=291.75ms p(90)=26.39ms p(95)=30.09ms p(99.9)=51.55ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 321434
     http_req_receiving.............: avg=1.05ms  min=50.92µs med=131µs   max=219.89ms p(90)=2.68ms  p(95)=3.66ms  p(99.9)=24.35ms
     http_req_sending...............: avg=46.16µs min=4.56µs  med=8.29µs  max=141.82ms p(90)=15.71µs p(95)=86.38µs p(99.9)=5.7ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=17.34ms min=1.83ms  med=16.24ms max=273.47ms p(90)=25.06ms p(95)=28.64ms p(99.9)=49.1ms 
     http_reqs......................: 321434  2673.254536/s
     iteration_duration.............: avg=18.66ms min=3.08ms  med=17.55ms max=302.3ms  p(90)=26.61ms p(95)=30.33ms p(99.9)=52.16ms
     iterations.....................: 321334  2672.42287/s
     success_rate...................: 100.00% ✓ 321334      ✗ 0     
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

     checks.........................: 100.00% ✓ 963351      ✗ 0     
     data_received..................: 28 GB   234 MB/s
     data_sent......................: 386 MB  3.2 MB/s
     http_req_blocked...............: avg=3.33µs   min=1µs     med=2.39µs  max=21.81ms  p(90)=3.67µs  p(95)=4.28µs  p(99.9)=31.51µs 
     http_req_connecting............: avg=306ns    min=0s      med=0s      max=4.2ms    p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=18.46ms  min=1.99ms  med=15.96ms max=288.26ms p(90)=29.94ms p(95)=36.13ms p(99.9)=107.92ms
       { expected_response:true }...: avg=18.46ms  min=1.99ms  med=15.96ms max=288.26ms p(90)=29.94ms p(95)=36.13ms p(99.9)=107.92ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 321217
     http_req_receiving.............: avg=549.01µs min=49.59µs med=89.55µs max=240.3ms  p(90)=1.05ms  p(95)=1.93ms  p(99.9)=24.12ms 
     http_req_sending...............: avg=45.63µs  min=4.56µs  med=8.91µs  max=169.87ms p(90)=14.99µs p(95)=90.12µs p(99.9)=3.99ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=17.86ms  min=1.89ms  med=15.44ms max=288ms    p(90)=29.04ms p(95)=35.13ms p(99.9)=106.53ms
     http_reqs......................: 321217  2671.072674/s
     iteration_duration.............: avg=18.67ms  min=2.97ms  med=16.16ms max=305.24ms p(90)=30.15ms p(95)=36.37ms p(99.9)=109.22ms
     iterations.....................: 321117  2670.241126/s
     success_rate...................: 100.00% ✓ 321117      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (rust subgraphs) (16.7.0-p.10)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 915918      ✗ 0     
     data_received..................: 27 GB   223 MB/s
     data_sent......................: 367 MB  3.1 MB/s
     http_req_blocked...............: avg=2.72µs   min=872ns   med=1.92µs  max=16.34ms  p(90)=3.07µs  p(95)=3.63µs  p(99.9)=30.09µs 
     http_req_connecting............: avg=376ns    min=0s      med=0s      max=6.98ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=19.43ms  min=2.01ms  med=16.7ms  max=283.89ms p(90)=31.51ms p(95)=38.16ms p(99.9)=123.15ms
       { expected_response:true }...: avg=19.43ms  min=2.01ms  med=16.7ms  max=283.89ms p(90)=31.51ms p(95)=38.16ms p(99.9)=123.15ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 305406
     http_req_receiving.............: avg=577.84µs min=51.35µs med=92.74µs max=109.13ms p(90)=1.1ms   p(95)=1.99ms  p(99.9)=24.68ms 
     http_req_sending...............: avg=42.41µs  min=4.35µs  med=8.27µs  max=126.75ms p(90)=14.26µs p(95)=79.11µs p(99.9)=4.53ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=18.81ms  min=1.9ms   med=16.15ms max=277.09ms p(90)=30.55ms p(95)=37.04ms p(99.9)=122.03ms
     http_reqs......................: 305406  2539.611964/s
     iteration_duration.............: avg=19.64ms  min=3.18ms  med=16.89ms max=315.36ms p(90)=31.72ms p(95)=38.39ms p(99.9)=123.83ms
     iterations.....................: 305306  2538.780412/s
     success_rate...................: 100.00% ✓ 305306      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (rust subgraphs) (16.7.0-p.10)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 881508      ✗ 0     
     data_received..................: 26 GB   215 MB/s
     data_sent......................: 353 MB  2.9 MB/s
     http_req_blocked...............: avg=3.28µs   min=932ns   med=2.44µs  max=18.14ms  p(90)=3.79µs  p(95)=4.41µs  p(99.9)=35.31µs 
     http_req_connecting............: avg=316ns    min=0s      med=0s      max=4.08ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=20.19ms  min=1.69ms  med=16.4ms  max=447.07ms p(90)=34.04ms p(95)=42.97ms p(99.9)=167.19ms
       { expected_response:true }...: avg=20.19ms  min=1.69ms  med=16.4ms  max=447.07ms p(90)=34.04ms p(95)=42.97ms p(99.9)=167.19ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 293936
     http_req_receiving.............: avg=579.36µs min=50.85µs med=94.27µs max=259.32ms p(90)=1.03ms  p(95)=1.84ms  p(99.9)=30.17ms 
     http_req_sending...............: avg=42.03µs  min=4.63µs  med=9.19µs  max=183.57ms p(90)=15.91µs p(95)=80.72µs p(99.9)=3.53ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=19.57ms  min=1.57ms  med=15.87ms max=446.97ms p(90)=33.05ms p(95)=41.76ms p(99.9)=165.15ms
     http_reqs......................: 293936  2445.125006/s
     iteration_duration.............: avg=20.41ms  min=2.74ms  med=16.6ms  max=447.26ms p(90)=34.27ms p(95)=43.21ms p(99.9)=168.64ms
     iterations.....................: 293836  2444.29315/s
     success_rate...................: 100.00% ✓ 293836      ✗ 0     
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

     checks.........................: 100.00% ✓ 805731      ✗ 0     
     data_received..................: 24 GB   196 MB/s
     data_sent......................: 323 MB  2.7 MB/s
     http_req_blocked...............: avg=2.95µs  min=921ns   med=2.11µs  max=13.82ms  p(90)=3.58µs  p(95)=4.33µs   p(99.9)=34.42µs
     http_req_connecting............: avg=330ns   min=0s      med=0s      max=3.96ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=22.12ms min=1.71ms  med=21.87ms max=295.72ms p(90)=26.28ms p(95)=28.07ms  p(99.9)=47.43ms
       { expected_response:true }...: avg=22.12ms min=1.71ms  med=21.87ms max=295.72ms p(90)=26.28ms p(95)=28.07ms  p(99.9)=47.43ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 268677
     http_req_receiving.............: avg=84.91µs min=26.26µs med=51.36µs max=194.51ms p(90)=89.03µs p(95)=113.59µs p(99.9)=5.88ms 
     http_req_sending...............: avg=37.42µs min=4.77µs  med=9.73µs  max=170.8ms  p(90)=16.83µs p(95)=25.65µs  p(99.9)=1.75ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=22ms    min=1.61ms  med=21.77ms max=282.29ms p(90)=26.15ms p(95)=27.9ms   p(99.9)=46.22ms
     http_reqs......................: 268677  2234.828345/s
     iteration_duration.............: avg=22.33ms min=3.92ms  med=22.06ms max=305.51ms p(90)=26.48ms p(95)=28.28ms  p(99.9)=47.87ms
     iterations.....................: 268577  2233.996555/s
     success_rate...................: 100.00% ✓ 268577      ✗ 0     
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

     checks.........................: 100.00% ✓ 481953      ✗ 0     
     data_received..................: 14 GB   117 MB/s
     data_sent......................: 193 MB  1.6 MB/s
     http_req_blocked...............: avg=3.16µs  min=1.05µs  med=2.44µs  max=3.25ms   p(90)=3.87µs  p(95)=4.49µs  p(99.9)=34.26µs 
     http_req_connecting............: avg=410ns   min=0s      med=0s      max=3.23ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=37.11ms min=1.88ms  med=36.73ms max=276.75ms p(90)=51.82ms p(95)=56.36ms p(99.9)=79.01ms 
       { expected_response:true }...: avg=37.11ms min=1.88ms  med=36.73ms max=276.75ms p(90)=51.82ms p(95)=56.36ms p(99.9)=79.01ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 160751
     http_req_receiving.............: avg=71.91µs min=24.77µs med=59.29µs max=27.3ms   p(90)=94.06µs p(95)=109µs   p(99.9)=870.17µs
     http_req_sending...............: avg=24.96µs min=4.87µs  med=10.52µs max=118.49ms p(90)=16.48µs p(95)=20.54µs p(99.9)=1.01ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=37.01ms min=1.79ms  med=36.64ms max=275.81ms p(90)=51.71ms p(95)=56.25ms p(99.9)=78.84ms 
     http_reqs......................: 160751  1336.627596/s
     iteration_duration.............: avg=37.34ms min=3.44ms  med=36.94ms max=298.05ms p(90)=52.02ms p(95)=56.56ms p(99.9)=79.47ms 
     iterations.....................: 160651  1335.796107/s
     success_rate...................: 100.00% ✓ 160651      ✗ 0     
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

     checks.........................: 100.00% ✓ 223806     ✗ 0    
     data_received..................: 6.6 GB  55 MB/s
     data_sent......................: 90 MB   745 kB/s
     http_req_blocked...............: avg=4.05µs  min=972ns   med=2.51µs  max=3.35ms   p(90)=4.11µs  p(95)=4.73µs   p(99.9)=45.01µs 
     http_req_connecting............: avg=1.24µs  min=0s      med=0s      max=3.33ms   p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=80.09ms min=3.65ms  med=78.04ms max=286.68ms p(90)=98.86ms p(95)=109.01ms p(99.9)=186.47ms
       { expected_response:true }...: avg=80.09ms min=3.65ms  med=78.04ms max=286.68ms p(90)=98.86ms p(95)=109.01ms p(99.9)=186.47ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 74702
     http_req_receiving.............: avg=78.41µs min=26.83µs med=64.85µs max=157.57ms p(90)=102.1µs p(95)=115.95µs p(99.9)=596.37µs
     http_req_sending...............: avg=19.31µs min=4.8µs   med=12.14µs max=63.35ms  p(90)=19.34µs p(95)=21.46µs  p(99.9)=565.68µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=80ms    min=3.54ms  med=77.95ms max=286.11ms p(90)=98.75ms p(95)=108.9ms  p(99.9)=185.69ms
     http_reqs......................: 74702   620.038912/s
     iteration_duration.............: avg=80.43ms min=24.73ms med=78.28ms max=306.25ms p(90)=99.11ms p(95)=109.29ms p(99.9)=187.97ms
     iterations.....................: 74602   619.208895/s
     success_rate...................: 100.00% ✓ 74602      ✗ 0    
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

     checks.........................: 100.00% ✓ 175824     ✗ 0    
     data_received..................: 5.2 GB  43 MB/s
     data_sent......................: 71 MB   585 kB/s
     http_req_blocked...............: avg=4.43µs   min=1.03µs  med=2.84µs   max=3.37ms   p(90)=4.28µs   p(95)=4.8µs    p(99.9)=58.47µs 
     http_req_connecting............: avg=1.39µs   min=0s      med=0s       max=3.34ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=101.96ms min=4.4ms   med=101.75ms max=318.64ms p(90)=123.12ms p(95)=129.31ms p(99.9)=159.92ms
       { expected_response:true }...: avg=101.96ms min=4.4ms   med=101.75ms max=318.64ms p(90)=123.12ms p(95)=129.31ms p(99.9)=159.92ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 58708
     http_req_receiving.............: avg=82.4µs   min=28.05µs med=73.73µs  max=185.78ms p(90)=106.12µs p(95)=119.78µs p(99.9)=560.48µs
     http_req_sending...............: avg=23.46µs  min=5.15µs  med=14.91µs  max=121.97ms p(90)=20.9µs   p(95)=22.74µs  p(99.9)=487.17µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=101.86ms min=4.34ms  med=101.65ms max=318.08ms p(90)=123.01ms p(95)=129.21ms p(99.9)=158.63ms
     http_reqs......................: 58708   486.915146/s
     iteration_duration.............: avg=102.39ms min=14.01ms med=102.01ms max=332.2ms  p(90)=123.37ms p(95)=129.6ms  p(99.9)=161ms   
     iterations.....................: 58608   486.085761/s
     success_rate...................: 100.00% ✓ 58608      ✗ 0    
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

     checks.........................: 100.00% ✓ 101907     ✗ 0    
     data_received..................: 3.0 GB  25 MB/s
     data_sent......................: 41 MB   339 kB/s
     http_req_blocked...............: avg=6.73µs   min=1.56µs  med=3.62µs   max=4.17ms   p(90)=5.1µs    p(95)=5.76µs   p(99.9)=1.4ms   
     http_req_connecting............: avg=2.84µs   min=0s      med=0s       max=4.13ms   p(90)=0s       p(95)=0s       p(99.9)=1.34ms  
     http_req_duration..............: avg=175.92ms min=5.35ms  med=160.45ms max=695.84ms p(90)=204.38ms p(95)=238.68ms p(99.9)=632.18ms
       { expected_response:true }...: avg=175.92ms min=5.35ms  med=160.45ms max=695.84ms p(90)=204.38ms p(95)=238.68ms p(99.9)=632.18ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 34069
     http_req_receiving.............: avg=105.71µs min=34.89µs med=91.28µs  max=91.19ms  p(90)=122.81µs p(95)=135.42µs p(99.9)=892.13µs
     http_req_sending...............: avg=32.76µs  min=6.73µs  med=18.69µs  max=99.25ms  p(90)=23.42µs  p(95)=25.34µs  p(99.9)=528.04µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=175.79ms min=5.27ms  med=160.33ms max=695.75ms p(90)=204.21ms p(95)=238.48ms p(99.9)=632.04ms
     http_reqs......................: 34069   282.037509/s
     iteration_duration.............: avg=176.73ms min=36.85ms med=160.82ms max=696.17ms p(90)=204.8ms  p(95)=239.65ms p(99.9)=632.49ms
     iterations.....................: 33969   281.209667/s
     success_rate...................: 100.00% ✓ 33969      ✗ 0    
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

     checks.........................: 100.00% ✓ 101064     ✗ 0    
     data_received..................: 3.0 GB  25 MB/s
     data_sent......................: 41 MB   336 kB/s
     http_req_blocked...............: avg=6.31µs   min=1.39µs  med=3.37µs   max=4.17ms   p(90)=4.64µs   p(95)=5.18µs   p(99.9)=1.12ms  
     http_req_connecting............: avg=2.67µs   min=0s      med=0s       max=4.12ms   p(90)=0s       p(95)=0s       p(99.9)=1.07ms  
     http_req_duration..............: avg=177.4ms  min=7.54ms  med=170.75ms max=379.52ms p(90)=198.06ms p(95)=204.84ms p(99.9)=269.28ms
       { expected_response:true }...: avg=177.4ms  min=7.54ms  med=170.75ms max=379.52ms p(90)=198.06ms p(95)=204.84ms p(99.9)=269.28ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 33788
     http_req_receiving.............: avg=88.9µs   min=32.89µs med=80.5µs   max=107.48ms p(90)=110.96µs p(95)=122.06µs p(99.9)=443.15µs
     http_req_sending...............: avg=33.55µs  min=6.16µs  med=16.66µs  max=110.81ms p(90)=21.18µs  p(95)=22.95µs  p(99.9)=550.57µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=177.28ms min=7.4ms   med=170.65ms max=379.31ms p(90)=197.96ms p(95)=204.72ms p(99.9)=269.09ms
     http_reqs......................: 33788   279.400319/s
     iteration_duration.............: avg=178.19ms min=46.07ms med=171.03ms max=395.27ms p(90)=198.35ms p(95)=205.13ms p(99.9)=271.15ms
     iterations.....................: 33688   278.573398/s
     success_rate...................: 100.00% ✓ 33688      ✗ 0    
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
data_received..................: 8.0 MB 134 kB/s
     data_sent......................: 102 kB 1.7 kB/s
     http_req_blocked...............: avg=6.25µs   min=2.41µs  med=3.36µs  max=173.62µs p(90)=4.66µs   p(95)=6.06µs   p(99.9)=163.5µs 
     http_req_connecting............: avg=1.19µs   min=0s      med=0s      max=100.32µs p(90)=0s       p(95)=0s       p(99.9)=91.99µs 
     http_req_duration..............: avg=391.58ms min=25.55ms med=35.1ms  max=30.02s   p(90)=42.08ms  p(95)=44.45ms  p(99.9)=27.54s  
       { expected_response:true }...: avg=391.58ms min=25.55ms med=35.1ms  max=30.02s   p(90)=42.08ms  p(95)=44.45ms  p(99.9)=27.54s  
     http_req_failed................: 0.00%  ✓ 0        ✗ 84  
     http_req_receiving.............: avg=115.8µs  min=68.48µs med=94.16µs max=337.33µs p(90)=163.25µs p(95)=195.63µs p(99.9)=334.35µs
     http_req_sending...............: avg=22.47µs  min=11.96µs med=17.55µs max=213.77µs p(90)=22.98µs  p(95)=28.17µs  p(99.9)=209.97µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=391.44ms min=25.44ms med=35ms    max=30.02s   p(90)=41.98ms  p(95)=44.26ms  p(99.9)=27.54s  
     http_reqs......................: 84     1.399978/s
     vus............................: 0      min=0      max=0 
     vus_max........................: 50     min=50     max=50
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

     checks.........................: 100.00% ✓ 923079      ✗ 0     
     data_received..................: 27 GB   224 MB/s
     data_sent......................: 370 MB  3.1 MB/s
     http_req_blocked...............: avg=2.84µs  min=852ns   med=2.08µs  max=16.8ms   p(90)=3.6µs   p(95)=4.35µs   p(99.9)=33.52µs
     http_req_connecting............: avg=302ns   min=0s      med=0s      max=3.84ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=19.28ms min=1.77ms  med=18.95ms max=298.86ms p(90)=26.87ms p(95)=29.38ms  p(99.9)=48.44ms
       { expected_response:true }...: avg=19.28ms min=1.77ms  med=18.95ms max=298.86ms p(90)=26.87ms p(95)=29.38ms  p(99.9)=48.44ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 307793
     http_req_receiving.............: avg=87.96µs min=25.69µs med=48.51µs max=57.26ms  p(90)=89.59µs p(95)=125.83µs p(99.9)=7.09ms 
     http_req_sending...............: avg=41.83µs min=4.43µs  med=8.92µs  max=121.56ms p(90)=16.81µs p(95)=65.07µs  p(99.9)=3.58ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=19.15ms min=1.71ms  med=18.84ms max=298.64ms p(90)=26.72ms p(95)=29.17ms  p(99.9)=47.54ms
     http_reqs......................: 307793  2559.852544/s
     iteration_duration.............: avg=19.49ms min=3.17ms  med=19.14ms max=322.6ms  p(90)=27.07ms p(95)=29.6ms   p(99.9)=48.9ms 
     iterations.....................: 307693  2559.020864/s
     success_rate...................: 100.00% ✓ 307693      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (.net subgraphs) (16.7.0-p.10)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 904773      ✗ 0     
     data_received..................: 26 GB   220 MB/s
     data_sent......................: 363 MB  3.0 MB/s
     http_req_blocked...............: avg=2.79µs  min=861ns   med=2.04µs   max=8.05ms   p(90)=3.72µs  p(95)=4.53µs  p(99.9)=30.94µs
     http_req_connecting............: avg=285ns   min=0s      med=0s       max=3.49ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=19.66ms min=1.55ms  med=18.6ms   max=294.11ms p(90)=28.42ms p(95)=32.16ms p(99.9)=53.91ms
       { expected_response:true }...: avg=19.66ms min=1.55ms  med=18.6ms   max=294.11ms p(90)=28.42ms p(95)=32.16ms p(99.9)=53.91ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 301691
     http_req_receiving.............: avg=1.21ms  min=49.32µs med=162.87µs max=277.86ms p(90)=3.13ms  p(95)=4.3ms   p(99.9)=25.26ms
     http_req_sending...............: avg=45.25µs min=4.74µs  med=8.83µs   max=148.9ms  p(90)=19.77µs p(95)=90.59µs p(99.9)=4.56ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=18.4ms  min=1.46ms  med=17.31ms  max=285.56ms p(90)=26.85ms p(95)=30.55ms p(99.9)=51.51ms
     http_reqs......................: 301691  2509.833579/s
     iteration_duration.............: avg=19.88ms min=2.85ms  med=18.81ms  max=306.48ms p(90)=28.64ms p(95)=32.4ms  p(99.9)=54.36ms
     iterations.....................: 301591  2509.001657/s
     success_rate...................: 100.00% ✓ 301591      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.7.0-p.10)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 887034      ✗ 0     
     data_received..................: 26 GB   216 MB/s
     data_sent......................: 355 MB  3.0 MB/s
     http_req_blocked...............: avg=3.58µs   min=1.1µs   med=2.8µs   max=11.54ms  p(90)=4.35µs  p(95)=5.08µs  p(99.9)=38.8µs  
     http_req_connecting............: avg=263ns    min=0s      med=0s      max=3.38ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=20.05ms  min=1.56ms  med=16.77ms max=300.77ms p(90)=33.16ms p(95)=40.52ms p(99.9)=137.86ms
       { expected_response:true }...: avg=20.05ms  min=1.56ms  med=16.77ms max=300.77ms p(90)=33.16ms p(95)=40.52ms p(99.9)=137.86ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 295778
     http_req_receiving.............: avg=582.16µs min=52.85µs med=98.03µs max=237.99ms p(90)=1.1ms   p(95)=1.97ms  p(99.9)=27.07ms 
     http_req_sending...............: avg=46.73µs  min=4.8µs   med=10.44µs max=132.74ms p(90)=19.36µs p(95)=99.21µs p(99.9)=3.82ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=19.42ms  min=1.47ms  med=16.23ms max=300.44ms p(90)=32.17ms p(95)=39.47ms p(99.9)=136.75ms
     http_reqs......................: 295778  2460.630748/s
     iteration_duration.............: avg=20.28ms  min=2.44ms  med=16.98ms max=322.26ms p(90)=33.39ms p(95)=40.78ms p(99.9)=139.11ms
     iterations.....................: 295678  2459.79883/s
     success_rate...................: 100.00% ✓ 295678      ✗ 0     
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

     checks.........................: 100.00% ✓ 886047      ✗ 0     
     data_received..................: 26 GB   215 MB/s
     data_sent......................: 355 MB  3.0 MB/s
     http_req_blocked...............: avg=3.6µs    min=1.07µs  med=2.71µs  max=13.49ms  p(90)=4.41µs  p(95)=5.21µs  p(99.9)=39.54µs 
     http_req_connecting............: avg=301ns    min=0s      med=0s      max=3.37ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=20.07ms  min=1.64ms  med=17.1ms  max=288.55ms p(90)=32.69ms p(95)=39.75ms p(99.9)=130.07ms
       { expected_response:true }...: avg=20.07ms  min=1.64ms  med=17.1ms  max=288.55ms p(90)=32.69ms p(95)=39.75ms p(99.9)=130.07ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 295449
     http_req_receiving.............: avg=567.12µs min=51.35µs med=97.06µs max=147.05ms p(90)=1.1ms   p(95)=1.96ms  p(99.9)=26.36ms 
     http_req_sending...............: avg=46.92µs  min=4.72µs  med=10µs    max=78.91ms  p(90)=18.93µs p(95)=99.81µs p(99.9)=4.1ms   
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=19.46ms  min=1.52ms  med=16.57ms max=287.97ms p(90)=31.69ms p(95)=38.64ms p(99.9)=128.06ms
     http_reqs......................: 295449  2457.829288/s
     iteration_duration.............: avg=20.3ms   min=2.88ms  med=17.31ms max=298.22ms p(90)=32.91ms p(95)=40.01ms p(99.9)=130.96ms
     iterations.....................: 295349  2456.997392/s
     success_rate...................: 100.00% ✓ 295349      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (.net subgraphs) (16.7.0-p.10)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 800313      ✗ 0     
     data_received..................: 23 GB   195 MB/s
     data_sent......................: 321 MB  2.7 MB/s
     http_req_blocked...............: avg=2.92µs   min=891ns   med=2.22µs   max=13.47ms  p(90)=3.92µs  p(95)=4.61µs  p(99.9)=39.15µs 
     http_req_connecting............: avg=185ns    min=0s      med=0s       max=2.93ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=22.26ms  min=1.8ms   med=18.7ms   max=396.11ms p(90)=36.42ms p(95)=45.03ms p(99.9)=152.97ms
       { expected_response:true }...: avg=22.26ms  min=1.8ms   med=18.7ms   max=396.11ms p(90)=36.42ms p(95)=45.03ms p(99.9)=152.97ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 266871
     http_req_receiving.............: avg=616.83µs min=51.96µs med=101.46µs max=253.08ms p(90)=1.15ms  p(95)=1.98ms  p(99.9)=28.41ms 
     http_req_sending...............: avg=40.48µs  min=4.42µs  med=9.27µs   max=95.31ms  p(90)=18.31µs p(95)=72.01µs p(99.9)=2.86ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=21.6ms   min=1.72ms  med=18.13ms  max=395.11ms p(90)=35.36ms p(95)=43.75ms p(99.9)=151.83ms
     http_reqs......................: 266871  2219.480692/s
     iteration_duration.............: avg=22.48ms  min=2.95ms  med=18.91ms  max=396.28ms p(90)=36.63ms p(95)=45.27ms p(99.9)=154.54ms
     iterations.....................: 266771  2218.649024/s
     success_rate...................: 100.00% ✓ 266771      ✗ 0     
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

     checks.........................: 100.00% ✓ 587109      ✗ 0     
     data_received..................: 17 GB   143 MB/s
     data_sent......................: 235 MB  2.0 MB/s
     http_req_blocked...............: avg=3.48µs  min=872ns   med=2.37µs  max=12.3ms   p(90)=4.68µs   p(95)=5.78µs   p(99.9)=43.87µs
     http_req_connecting............: avg=457ns   min=0s      med=0s      max=3.27ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=30.4ms  min=2.28ms  med=29.81ms max=303.84ms p(90)=39.86ms  p(95)=43.28ms  p(99.9)=64.38ms
       { expected_response:true }...: avg=30.4ms  min=2.28ms  med=29.81ms max=303.84ms p(90)=39.86ms  p(95)=43.28ms  p(99.9)=64.38ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 195803
     http_req_receiving.............: avg=96.15µs min=27.04µs med=57.47µs max=152.42ms p(90)=127.23µs p(95)=197.6µs  p(99.9)=3.78ms 
     http_req_sending...............: avg=41.57µs min=4.95µs  med=10.05µs max=229.94ms p(90)=24.85µs  p(95)=103.74µs p(99.9)=2.97ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=30.26ms min=2.2ms   med=29.69ms max=303.2ms  p(90)=39.71ms  p(95)=43.1ms   p(99.9)=63.91ms
     http_reqs......................: 195803  1627.705322/s
     iteration_duration.............: avg=30.64ms min=5.86ms  med=30.04ms max=321.14ms p(90)=40.08ms  p(95)=43.5ms   p(99.9)=64.85ms
     iterations.....................: 195703  1626.874025/s
     success_rate...................: 100.00% ✓ 195703      ✗ 0     
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

     checks.........................: 100.00% ✓ 442431      ✗ 0     
     data_received..................: 13 GB   107 MB/s
     data_sent......................: 177 MB  1.5 MB/s
     http_req_blocked...............: avg=3.37µs  min=942ns  med=2.43µs  max=4.11ms   p(90)=4.11µs   p(95)=4.81µs   p(99.9)=33.48µs 
     http_req_connecting............: avg=610ns   min=0s     med=0s      max=4.06ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=40.43ms min=2.18ms med=40.01ms max=308.06ms p(90)=56.13ms  p(95)=60.95ms  p(99.9)=83.71ms 
       { expected_response:true }...: avg=40.43ms min=2.18ms med=40.01ms max=308.06ms p(90)=56.13ms  p(95)=60.95ms  p(99.9)=83.71ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 147577
     http_req_receiving.............: avg=77.58µs min=26.7µs med=65.55µs max=85.62ms  p(90)=104.69µs p(95)=120.42µs p(99.9)=794.91µs
     http_req_sending...............: avg=24.98µs min=4.99µs med=11.26µs max=115.15ms p(90)=18.42µs  p(95)=22.02µs  p(99.9)=856.3µs 
     http_req_tls_handshaking.......: avg=0s      min=0s     med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=40.33ms min=2.01ms med=39.92ms max=272.04ms p(90)=56.04ms  p(95)=60.84ms  p(99.9)=83.49ms 
     http_reqs......................: 147577  1226.890382/s
     iteration_duration.............: avg=40.67ms min=4.27ms med=40.22ms max=316.78ms p(90)=56.35ms  p(95)=61.17ms  p(99.9)=84.07ms 
     iterations.....................: 147477  1226.059026/s
     success_rate...................: 100.00% ✓ 147477      ✗ 0     
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

     checks.........................: 100.00% ✓ 203202     ✗ 0    
     data_received..................: 5.9 GB  49 MB/s
     data_sent......................: 82 MB   676 kB/s
     http_req_blocked...............: avg=4.82µs  min=1.19µs  med=3.21µs  max=4.13ms   p(90)=4.71µs   p(95)=5.37µs   p(99.9)=50.23µs 
     http_req_connecting............: avg=1.33µs  min=0s      med=0s      max=4.09ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=88.22ms min=4.05ms  med=86.21ms max=349.47ms p(90)=110.02ms p(95)=121.91ms p(99.9)=207.76ms
       { expected_response:true }...: avg=88.22ms min=4.05ms  med=86.21ms max=349.47ms p(90)=110.02ms p(95)=121.91ms p(99.9)=207.76ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 67834
     http_req_receiving.............: avg=84.77µs min=30.35µs med=75.82µs max=114.32ms p(90)=110.91µs p(95)=123.56µs p(99.9)=611.72µs
     http_req_sending...............: avg=23.75µs min=5.26µs  med=14.52µs max=80.37ms  p(90)=21.18µs  p(95)=23.32µs  p(99.9)=625.84µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=88.11ms min=3.89ms  med=86.11ms max=340.68ms p(90)=109.9ms  p(95)=121.79ms p(99.9)=207.54ms
     http_reqs......................: 67834   562.732949/s
     iteration_duration.............: avg=88.6ms  min=26.95ms med=86.46ms max=359.28ms p(90)=110.27ms p(95)=122.18ms p(99.9)=210.63ms
     iterations.....................: 67734   561.903376/s
     success_rate...................: 100.00% ✓ 67734      ✗ 0    
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

     checks.........................: 100.00% ✓ 148839     ✗ 0    
     data_received..................: 4.3 GB  36 MB/s
     data_sent......................: 60 MB   495 kB/s
     http_req_blocked...............: avg=9.65µs   min=1.34µs  med=3.55µs   max=9.65ms   p(90)=4.98µs   p(95)=5.56µs   p(99.9)=1.3ms   
     http_req_connecting............: avg=5.69µs   min=0s      med=0s       max=9.6ms    p(90)=0s       p(95)=0s       p(99.9)=1.04ms  
     http_req_duration..............: avg=120.45ms min=5.31ms  med=118.16ms max=328.6ms  p(90)=159.05ms p(95)=170.81ms p(99.9)=219.69ms
       { expected_response:true }...: avg=120.45ms min=5.31ms  med=118.16ms max=328.6ms  p(90)=159.05ms p(95)=170.81ms p(99.9)=219.69ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 49713
     http_req_receiving.............: avg=88.94µs  min=32.45µs med=81.79µs  max=110.06ms p(90)=112.92µs p(95)=125.09µs p(99.9)=573.95µs
     http_req_sending...............: avg=22.92µs  min=6.13µs  med=17.04µs  max=28.22ms  p(90)=22.19µs  p(95)=24.16µs  p(99.9)=631.74µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=120.34ms min=5.18ms  med=118.05ms max=315.42ms p(90)=158.94ms p(95)=170.7ms  p(99.9)=219.2ms 
     http_reqs......................: 49713   412.011333/s
     iteration_duration.............: avg=120.96ms min=28.47ms med=118.51ms max=339.44ms p(90)=159.36ms p(95)=171.13ms p(99.9)=222.34ms
     iterations.....................: 49613   411.182553/s
     success_rate...................: 100.00% ✓ 49613      ✗ 0    
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

     checks.........................: 100.00% ✓ 98007      ✗ 0    
     data_received..................: 2.9 GB  24 MB/s
     data_sent......................: 39 MB   325 kB/s
     http_req_blocked...............: avg=6.08µs   min=1.17µs  med=3.1µs    max=3.95ms   p(90)=4.44µs   p(95)=4.99µs   p(99.9)=1.29ms  
     http_req_connecting............: avg=2.75µs   min=0s      med=0s       max=3.91ms   p(90)=0s       p(95)=0s       p(99.9)=1.26ms  
     http_req_duration..............: avg=182.91ms min=7.71ms  med=183.19ms max=391.13ms p(90)=194.49ms p(95)=198.43ms p(99.9)=264.39ms
       { expected_response:true }...: avg=182.91ms min=7.71ms  med=183.19ms max=391.13ms p(90)=194.49ms p(95)=198.43ms p(99.9)=264.39ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32769
     http_req_receiving.............: avg=97.24µs  min=30.02µs med=87.76µs  max=190.65ms p(90)=118.3µs  p(95)=130.38µs p(99.9)=623.61µs
     http_req_sending...............: avg=24.02µs  min=5.57µs  med=17.72µs  max=41.19ms  p(90)=22.34µs  p(95)=24.22µs  p(99.9)=561.53µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=182.79ms min=7.6ms   med=183.08ms max=390.53ms p(90)=194.39ms p(95)=198.32ms p(99.9)=264.14ms
     http_reqs......................: 32769   270.872229/s
     iteration_duration.............: avg=183.77ms min=55.98ms med=183.52ms max=399.3ms  p(90)=194.78ms p(95)=198.73ms p(99.9)=267.81ms
     iterations.....................: 32669   270.045618/s
     success_rate...................: 100.00% ✓ 32669      ✗ 0    
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

     checks.........................: 100.00% ✓ 94173      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 38 MB   313 kB/s
     http_req_blocked...............: avg=6.2µs    min=1.12µs  med=3.11µs   max=3.57ms   p(90)=4.37µs   p(95)=4.89µs   p(99.9)=1.51ms  
     http_req_connecting............: avg=2.91µs   min=0s      med=0s       max=3.54ms   p(90)=0s       p(95)=0s       p(99.9)=1.48ms  
     http_req_duration..............: avg=190.39ms min=6.3ms   med=175.29ms max=679.79ms p(90)=216.97ms p(95)=269.21ms p(99.9)=561.53ms
       { expected_response:true }...: avg=190.39ms min=6.3ms   med=175.29ms max=679.79ms p(90)=216.97ms p(95)=269.21ms p(99.9)=561.53ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 31491
     http_req_receiving.............: avg=91.05µs  min=32.09µs med=88.18µs  max=9.07ms   p(90)=118.03µs p(95)=129.56µs p(99.9)=548.56µs
     http_req_sending...............: avg=35.62µs  min=5.47µs  med=16.73µs  max=135.82ms p(90)=20.88µs  p(95)=22.55µs  p(99.9)=602.41µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=190.26ms min=6.12ms  med=175.17ms max=679.37ms p(90)=216.88ms p(95)=269.11ms p(99.9)=561.45ms
     http_reqs......................: 31491   260.520396/s
     iteration_duration.............: avg=191.25ms min=35.26ms med=175.6ms  max=680.1ms  p(90)=217.35ms p(95)=270.58ms p(99.9)=562.01ms
     iterations.....................: 31391   259.693111/s
     success_rate...................: 100.00% ✓ 31391      ✗ 0    
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

     checks.........................: 100.00% ✓ 7557      ✗ 0   
     data_received..................: 251 MB  2.0 MB/s
     data_sent......................: 3.1 MB  25 kB/s
     http_req_blocked...............: avg=110.6µs  min=1.36µs   med=3.6µs   max=8.8ms  p(90)=5.26µs   p(95)=6.2µs    p(99.9)=8.04ms  
     http_req_connecting............: avg=104.71µs min=0s       med=0s      max=8.74ms p(90)=0s       p(95)=0s       p(99.9)=8ms     
     http_req_duration..............: avg=2.3s     min=26.17ms  med=2.36s   max=4.41s  p(90)=3.18s    p(95)=3.38s    p(99.9)=4.11s   
       { expected_response:true }...: avg=2.3s     min=26.17ms  med=2.36s   max=4.41s  p(90)=3.18s    p(95)=3.38s    p(99.9)=4.11s   
     http_req_failed................: 0.00%   ✓ 0         ✗ 2619
     http_req_receiving.............: avg=97.92µs  min=36.62µs  med=93.02µs max=2.26ms p(90)=133.49µs p(95)=146.97µs p(99.9)=664.74µs
     http_req_sending...............: avg=50.21µs  min=7.36µs   med=19.09µs max=3.85ms p(90)=24.63µs  p(95)=27.82µs  p(99.9)=3.03ms  
     http_req_tls_handshaking.......: avg=0s       min=0s       med=0s      max=0s     p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=2.3s     min=26.07ms  med=2.36s   max=4.41s  p(90)=3.18s    p(95)=3.38s    p(99.9)=4.11s   
     http_reqs......................: 2619    20.844792/s
     iteration_duration.............: avg=2.39s    min=438.34ms med=2.39s   max=4.41s  p(90)=3.19s    p(95)=3.4s     p(99.9)=4.11s   
     iterations.....................: 2519    20.048885/s
     success_rate...................: 100.00% ✓ 2519      ✗ 0   
     vus............................: 37      min=0       max=50
     vus_max........................: 50      min=50      max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

