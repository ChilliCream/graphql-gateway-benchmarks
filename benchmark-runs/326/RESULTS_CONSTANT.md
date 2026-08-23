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
| hive-router | v0.0.84 | 3,152 | 3,423 | 3,093 | 3.5% |  |
| fusion-nightly-net11 | 16.6.2-p.6 | 2,677 | 2,796 | 2,657 | 1.8% |  |
| fusion | 16.6.1 | 2,592 | 2,739 | 2,584 | 2.2% |  |
| fusion-nightly | 16.6.2-p.6 | 2,559 | 2,696 | 2,546 | 2.0% |  |
| fusion-nightly-fed | 16.6.2-p.6 | 2,389 | 2,482 | 2,374 | 1.5% |  |
| grafbase | 0.53.5 | 2,175 | 2,287 | 2,162 | 1.8% |  |
| cosmo | 0.334.0 | 1,272 | 1,328 | 1,269 | 1.9% |  |
| hive-gateway-router-runtime | 2.10.8 | 616 | 634 | 613 | 1.3% |  |
| apollo-router | v2.16.1 | 487 | 506 | 484 | 1.7% |  |
| apollo-gateway | 2.14.3 | 283 | 287 | 281 | 0.7% |  |
| hive-gateway | 2.10.8 | 283 | 292 | 283 | 1.1% |  |
| feddi | 5ff8b6165878 | — | — | — | — | non-compatible response (1320 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| fusion-nightly-net11 | 16.6.2-p.6 | 2,585 | 2,697 | 2,575 | 1.6% |  |
| fusion-nightly | 16.6.2-p.6 | 2,472 | 2,591 | 2,463 | 1.7% |  |
| fusion | 16.6.1 | 2,433 | 2,574 | 2,382 | 2.2% |  |
| hive-router | v0.0.84 | 2,405 | 2,596 | 2,385 | 3.0% |  |
| fusion-nightly-fed | 16.6.2-p.6 | 2,317 | 2,421 | 2,307 | 1.7% |  |
| grafbase | 0.53.5 | 1,655 | 1,707 | 1,648 | 1.3% |  |
| cosmo | 0.334.0 | 1,182 | 1,224 | 1,175 | 1.6% |  |
| hive-gateway-router-runtime | 2.10.8 | 586 | 605 | 584 | 1.3% |  |
| apollo-router | v2.16.1 | 414 | 430 | 404 | 1.8% |  |
| apollo-gateway | 2.14.3 | 272 | 274 | 271 | 0.4% |  |
| hive-gateway | 2.10.8 | 267 | 275 | 263 | 1.3% |  |
| feddi | 5ff8b6165878 | 23 | 24 | 22 | 2.6% |  |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.84)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 1136475     ✗ 0     
     data_received..................: 33 GB   277 MB/s
     data_sent......................: 455 MB  3.8 MB/s
     http_req_blocked...............: avg=2.82µs  min=901ns   med=2.04µs  max=16.53ms  p(90)=3.38µs  p(95)=4.01µs   p(99.9)=32.06µs
     http_req_connecting............: avg=254ns   min=0s      med=0s      max=4.14ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=15.63ms min=1.4ms   med=14.95ms max=280.16ms p(90)=22.75ms p(95)=25.8ms   p(99.9)=45.92ms
       { expected_response:true }...: avg=15.63ms min=1.4ms   med=14.95ms max=280.16ms p(90)=22.75ms p(95)=25.8ms   p(99.9)=45.92ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 378925
     http_req_receiving.............: avg=85.87µs min=24.89µs med=44.93µs max=260.18ms p(90)=81.86µs p(95)=157.43µs p(99.9)=6.62ms 
     http_req_sending...............: avg=48.95µs min=4.4µs   med=8.23µs  max=178.29ms p(90)=14.29µs p(95)=93.32µs  p(99.9)=7.71ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=15.49ms min=1.34ms  med=14.85ms max=271.32ms p(90)=22.58ms p(95)=25.55ms  p(99.9)=44.76ms
     http_reqs......................: 378925  3152.965979/s
     iteration_duration.............: avg=15.82ms min=1.81ms  med=15.14ms max=298.16ms p(90)=22.95ms p(95)=26.02ms  p(99.9)=46.49ms
     iterations.....................: 378825  3152.133898/s
     success_rate...................: 100.00% ✓ 378825      ✗ 0     
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

     checks.........................: 100.00% ✓ 965559      ✗ 0     
     data_received..................: 28 GB   235 MB/s
     data_sent......................: 387 MB  3.2 MB/s
     http_req_blocked...............: avg=2.69µs   min=872ns   med=1.86µs  max=18.44ms  p(90)=2.97µs  p(95)=3.53µs  p(99.9)=26.87µs
     http_req_connecting............: avg=302ns    min=0s      med=0s      max=3.71ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=18.43ms  min=1.91ms  med=17.58ms max=279.64ms p(90)=26.79ms p(95)=30.3ms  p(99.9)=50.1ms 
       { expected_response:true }...: avg=18.43ms  min=1.91ms  med=17.58ms max=279.64ms p(90)=26.79ms p(95)=30.3ms  p(99.9)=50.1ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 321953
     http_req_receiving.............: avg=485.61µs min=52.19µs med=92.72µs max=208.74ms p(90)=1.17ms  p(95)=1.79ms  p(99.9)=17.28ms
     http_req_sending...............: avg=40.85µs  min=4.6µs   med=7.98µs  max=142.77ms p(90)=14.06µs p(95)=78.25µs p(99.9)=3.41ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=17.9ms   min=1.79ms  med=17.06ms max=279.32ms p(90)=26.16ms p(95)=29.58ms p(99.9)=48.5ms 
     http_reqs......................: 321953  2677.642776/s
     iteration_duration.............: avg=18.63ms  min=2.9ms   med=17.77ms max=292.01ms p(90)=26.99ms p(95)=30.52ms p(99.9)=50.72ms
     iterations.....................: 321853  2676.811088/s
     success_rate...................: 100.00% ✓ 321853      ✗ 0     
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

     checks.........................: 100.00% ✓ 935169      ✗ 0     
     data_received..................: 27 GB   227 MB/s
     data_sent......................: 375 MB  3.1 MB/s
     http_req_blocked...............: avg=2.47µs   min=832ns   med=1.82µs  max=10.37ms  p(90)=2.98µs  p(95)=3.54µs  p(99.9)=26.11µs 
     http_req_connecting............: avg=278ns    min=0s      med=0s      max=3.97ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=19.03ms  min=2ms     med=16.33ms max=295.34ms p(90)=30.93ms p(95)=37.48ms p(99.9)=126.38ms
       { expected_response:true }...: avg=19.03ms  min=2ms     med=16.33ms max=295.34ms p(90)=30.93ms p(95)=37.48ms p(99.9)=126.38ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 311823
     http_req_receiving.............: avg=578.02µs min=51.82µs med=91.05µs max=279.76ms p(90)=1.08ms  p(95)=1.92ms  p(99.9)=25.82ms 
     http_req_sending...............: avg=41.9µs   min=4.33µs  med=7.8µs   max=174.83ms p(90)=13.35µs p(95)=78.46µs p(99.9)=4.34ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=18.41ms  min=1.92ms  med=15.8ms  max=293.34ms p(90)=29.93ms p(95)=36.35ms p(99.9)=125.19ms
     http_reqs......................: 311823  2592.895243/s
     iteration_duration.............: avg=19.23ms  min=3.15ms  med=16.52ms max=306.96ms p(90)=31.14ms p(95)=37.71ms p(99.9)=127.17ms
     iterations.....................: 311723  2592.063715/s
     success_rate...................: 100.00% ✓ 311723      ✗ 0     
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

     checks.........................: 100.00% ✓ 923052      ✗ 0     
     data_received..................: 27 GB   224 MB/s
     data_sent......................: 370 MB  3.1 MB/s
     http_req_blocked...............: avg=2.55µs   min=832ns   med=1.82µs  max=17.96ms  p(90)=2.94µs  p(95)=3.48µs  p(99.9)=27.84µs 
     http_req_connecting............: avg=266ns    min=0s      med=0s      max=3.27ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=19.29ms  min=2.05ms  med=16.56ms max=315ms    p(90)=31.39ms p(95)=38.01ms p(99.9)=120.54ms
       { expected_response:true }...: avg=19.29ms  min=2.05ms  med=16.56ms max=315ms    p(90)=31.39ms p(95)=38.01ms p(99.9)=120.54ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 307784
     http_req_receiving.............: avg=568.96µs min=49.79µs med=88.7µs  max=204.2ms  p(90)=1.08ms  p(95)=1.94ms  p(99.9)=25.46ms 
     http_req_sending...............: avg=38.81µs  min=4.51µs  med=7.83µs  max=114.59ms p(90)=13.4µs  p(95)=71.35µs p(99.9)=3.37ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=18.68ms  min=1.92ms  med=16.02ms max=295.28ms p(90)=30.46ms p(95)=36.94ms p(99.9)=119.34ms
     http_reqs......................: 307784  2559.442742/s
     iteration_duration.............: avg=19.49ms  min=3.04ms  med=16.74ms max=325.29ms p(90)=31.61ms p(95)=38.23ms p(99.9)=121.71ms
     iterations.....................: 307684  2558.611171/s
     success_rate...................: 100.00% ✓ 307684      ✗ 0     
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

     checks.........................: 100.00% ✓ 861297      ✗ 0     
     data_received..................: 25 GB   210 MB/s
     data_sent......................: 345 MB  2.9 MB/s
     http_req_blocked...............: avg=3.11µs   min=892ns   med=1.92µs  max=13.12ms  p(90)=3.15µs  p(95)=3.76µs  p(99.9)=28.18µs 
     http_req_connecting............: avg=783ns    min=0s      med=0s      max=9.6ms    p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=20.68ms  min=1.71ms  med=16.91ms max=344.54ms p(90)=35.3ms  p(95)=44.2ms  p(99.9)=155.15ms
       { expected_response:true }...: avg=20.68ms  min=1.71ms  med=16.91ms max=344.54ms p(90)=35.3ms  p(95)=44.2ms  p(99.9)=155.15ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 287199
     http_req_receiving.............: avg=609.71µs min=51.61µs med=92.77µs max=276.2ms  p(90)=1.09ms  p(95)=1.97ms  p(99.9)=30.02ms 
     http_req_sending...............: avg=41.14µs  min=4.75µs  med=8.37µs  max=181.96ms p(90)=14.68µs p(95)=49.82µs p(99.9)=3.3ms   
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=20.03ms  min=1.64ms  med=16.38ms max=344.12ms p(90)=34.23ms p(95)=43.02ms p(99.9)=153.68ms
     http_reqs......................: 287199  2389.034988/s
     iteration_duration.............: avg=20.88ms  min=2.76ms  med=17.11ms max=344.72ms p(90)=35.51ms p(95)=44.42ms p(99.9)=156.28ms
     iterations.....................: 287099  2388.203149/s
     success_rate...................: 100.00% ✓ 287099      ✗ 0     
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

     checks.........................: 100.00% ✓ 784320      ✗ 0     
     data_received..................: 23 GB   191 MB/s
     data_sent......................: 314 MB  2.6 MB/s
     http_req_blocked...............: avg=3.58µs  min=1.13µs  med=2.75µs  max=15.57ms  p(90)=4.27µs  p(95)=5µs      p(99.9)=40.83µs
     http_req_connecting............: avg=356ns   min=0s      med=0s      max=4.1ms    p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=22.72ms min=1.77ms  med=22.47ms max=276.55ms p(90)=27.04ms p(95)=28.94ms  p(99.9)=48.48ms
       { expected_response:true }...: avg=22.72ms min=1.77ms  med=22.47ms max=276.55ms p(90)=27.04ms p(95)=28.94ms  p(99.9)=48.48ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 261540
     http_req_receiving.............: avg=92.22µs min=27.27µs med=56.6µs  max=160.48ms p(90)=95.55µs p(95)=124.55µs p(99.9)=6.22ms 
     http_req_sending...............: avg=39.13µs min=4.72µs  med=10.64µs max=160.41ms p(90)=17.41µs p(95)=29.17µs  p(99.9)=2.08ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=22.59ms min=1.68ms  med=22.37ms max=276.15ms p(90)=26.9ms  p(95)=28.75ms  p(99.9)=47.74ms
     http_reqs......................: 261540  2175.436178/s
     iteration_duration.............: avg=22.93ms min=3.07ms  med=22.67ms max=310.22ms p(90)=27.25ms p(95)=29.16ms  p(99.9)=49.12ms
     iterations.....................: 261440  2174.604399/s
     success_rate...................: 100.00% ✓ 261440      ✗ 0     
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

     checks.........................: 100.00% ✓ 458715      ✗ 0     
     data_received..................: 13 GB   112 MB/s
     data_sent......................: 184 MB  1.5 MB/s
     http_req_blocked...............: avg=3.36µs  min=972ns  med=2.35µs  max=8.28ms   p(90)=3.75µs  p(95)=4.38µs   p(99.9)=31.72µs 
     http_req_connecting............: avg=644ns   min=0s     med=0s      max=4.55ms   p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=39ms    min=2.03ms med=38.61ms max=286.95ms p(90)=54.47ms p(95)=59.33ms  p(99.9)=82.41ms 
       { expected_response:true }...: avg=39ms    min=2.03ms med=38.61ms max=286.95ms p(90)=54.47ms p(95)=59.33ms  p(99.9)=82.41ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 153005
     http_req_receiving.............: avg=75.83µs min=28.1µs med=61.77µs max=162.9ms  p(90)=97.69µs p(95)=113.83µs p(99.9)=891.08µs
     http_req_sending...............: avg=23.69µs min=5.01µs med=10.48µs max=151.29ms p(90)=16.22µs p(95)=19.99µs  p(99.9)=966.97µs
     http_req_tls_handshaking.......: avg=0s      min=0s     med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=38.9ms  min=1.96ms med=38.51ms max=284.95ms p(90)=54.36ms p(95)=59.22ms  p(99.9)=82.17ms 
     http_reqs......................: 153005  1272.155829/s
     iteration_duration.............: avg=39.23ms min=3.69ms med=38.81ms max=302.32ms p(90)=54.67ms p(95)=59.53ms  p(99.9)=82.69ms 
     iterations.....................: 152905  1271.324382/s
     success_rate...................: 100.00% ✓ 152905      ✗ 0     
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

     checks.........................: 100.00% ✓ 222336     ✗ 0    
     data_received..................: 6.5 GB  54 MB/s
     data_sent......................: 89 MB   740 kB/s
     http_req_blocked...............: avg=6µs     min=1.22µs  med=2.99µs  max=9.09ms   p(90)=4.52µs   p(95)=5.2µs    p(99.9)=47.71µs 
     http_req_connecting............: avg=2.53µs  min=0s      med=0s      max=8.77ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=80.61ms min=3.67ms  med=78.47ms max=303.45ms p(90)=100.29ms p(95)=110.48ms p(99.9)=191.17ms
       { expected_response:true }...: avg=80.61ms min=3.67ms  med=78.47ms max=303.45ms p(90)=100.29ms p(95)=110.48ms p(99.9)=191.17ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 74212
     http_req_receiving.............: avg=83.99µs min=30.18µs med=70.39µs max=192.09ms p(90)=105.88µs p(95)=118.9µs  p(99.9)=661.39µs
     http_req_sending...............: avg=24.1µs  min=5.03µs  med=13.2µs  max=178.38ms p(90)=20µs     p(95)=22.34µs  p(99.9)=689.56µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=80.5ms  min=3.56ms  med=78.37ms max=294.81ms p(90)=100.19ms p(95)=110.36ms p(99.9)=190.27ms
     http_reqs......................: 74212   616.028551/s
     iteration_duration.............: avg=80.96ms min=13.83ms med=78.71ms max=323.38ms p(90)=100.55ms p(95)=110.77ms p(99.9)=192.19ms
     iterations.....................: 74112   615.198458/s
     success_rate...................: 100.00% ✓ 74112      ✗ 0    
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

     checks.........................: 100.00% ✓ 176136     ✗ 0    
     data_received..................: 5.2 GB  43 MB/s
     data_sent......................: 71 MB   586 kB/s
     http_req_blocked...............: avg=4.46µs   min=1.23µs  med=3.45µs   max=2.07ms   p(90)=4.87µs   p(95)=5.46µs   p(99.9)=65.83µs 
     http_req_connecting............: avg=767ns    min=0s      med=0s       max=2.05ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=101.77ms min=4.67ms  med=101.51ms max=302.23ms p(90)=122.94ms p(95)=129.07ms p(99.9)=159.8ms 
       { expected_response:true }...: avg=101.77ms min=4.67ms  med=101.51ms max=302.23ms p(90)=122.94ms p(95)=129.07ms p(99.9)=159.8ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 58812
     http_req_receiving.............: avg=87.67µs  min=31.07µs med=77.96µs  max=154.45ms p(90)=109.47µs p(95)=122.29µs p(99.9)=548.3µs 
     http_req_sending...............: avg=32.63µs  min=6.22µs  med=16.23µs  max=220.25ms p(90)=21.71µs  p(95)=23.68µs  p(99.9)=577.39µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=101.65ms min=4.54ms  med=101.4ms  max=301.36ms p(90)=122.82ms p(95)=128.95ms p(99.9)=158.87ms
     http_reqs......................: 58812   487.739215/s
     iteration_duration.............: avg=102.21ms min=32.91ms med=101.78ms max=333.19ms p(90)=123.19ms p(95)=129.33ms p(99.9)=160.91ms
     iterations.....................: 58712   486.909895/s
     success_rate...................: 100.00% ✓ 58712      ✗ 0    
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

     checks.........................: 100.00% ✓ 102678     ✗ 0    
     data_received..................: 3.0 GB  25 MB/s
     data_sent......................: 41 MB   341 kB/s
     http_req_blocked...............: avg=5.88µs   min=1.32µs  med=3.33µs   max=3.36ms   p(90)=4.61µs   p(95)=5.14µs   p(99.9)=993.95µs
     http_req_connecting............: avg=2.33µs   min=0s      med=0s       max=3.33ms   p(90)=0s       p(95)=0s       p(99.9)=972.77µs
     http_req_duration..............: avg=174.64ms min=7.19ms  med=153.58ms max=339.89ms p(90)=241.96ms p(95)=246.99ms p(99.9)=323.44ms
       { expected_response:true }...: avg=174.64ms min=7.19ms  med=153.58ms max=339.89ms p(90)=241.96ms p(95)=246.99ms p(99.9)=323.44ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 34326
     http_req_receiving.............: avg=87.23µs  min=33.8µs  med=83.06µs  max=4.71ms   p(90)=114.26µs p(95)=125.99µs p(99.9)=433.22µs
     http_req_sending...............: avg=23.07µs  min=6.14µs  med=16.42µs  max=27.34ms  p(90)=21.08µs  p(95)=22.86µs  p(99.9)=607.65µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=174.53ms min=7.13ms  med=153.47ms max=339.78ms p(90)=241.86ms p(95)=246.89ms p(99.9)=323.35ms
     http_reqs......................: 34326   283.856679/s
     iteration_duration.............: avg=175.4ms  min=51.68ms med=153.85ms max=340.15ms p(90)=242.26ms p(95)=247.26ms p(99.9)=324.23ms
     iterations.....................: 34226   283.029735/s
     success_rate...................: 100.00% ✓ 34226      ✗ 0    
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

     checks.........................: 100.00% ✓ 102528     ✗ 0    
     data_received..................: 3.0 GB  25 MB/s
     data_sent......................: 41 MB   340 kB/s
     http_req_blocked...............: avg=6.54µs   min=1.11µs  med=3.19µs   max=4.63ms   p(90)=4.58µs   p(95)=5.15µs   p(99.9)=1.45ms  
     http_req_connecting............: avg=3.12µs   min=0s      med=0s       max=4.6ms    p(90)=0s       p(95)=0s       p(99.9)=1.42ms  
     http_req_duration..............: avg=174.87ms min=5.79ms  med=159.78ms max=668.24ms p(90)=201.33ms p(95)=237.27ms p(99.9)=592.74ms
       { expected_response:true }...: avg=174.87ms min=5.79ms  med=159.78ms max=668.24ms p(90)=201.33ms p(95)=237.27ms p(99.9)=592.74ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 34276
     http_req_receiving.............: avg=96.9µs   min=31.03µs med=89.57µs  max=140.59ms p(90)=120.15µs p(95)=132.99µs p(99.9)=577.25µs
     http_req_sending...............: avg=31.52µs  min=5.27µs  med=17.66µs  max=93.19ms  p(90)=21.88µs  p(95)=23.54µs  p(99.9)=555.12µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=174.74ms min=5.62ms  med=159.66ms max=668.16ms p(90)=201.24ms p(95)=237.09ms p(99.9)=592.64ms
     http_reqs......................: 34276   283.500245/s
     iteration_duration.............: avg=175.65ms min=44.42ms med=160.11ms max=668.47ms p(90)=201.75ms p(95)=237.98ms p(99.9)=593.2ms 
     iterations.....................: 34176   282.673135/s
     success_rate...................: 100.00% ✓ 34176      ✗ 0    
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

     checks.........................: 100.00% ✓ 932022      ✗ 0     
     data_received..................: 27 GB   227 MB/s
     data_sent......................: 373 MB  3.1 MB/s
     http_req_blocked...............: avg=2.88µs   min=882ns   med=2µs     max=17.79ms  p(90)=3.65µs  p(95)=4.42µs  p(99.9)=30.32µs
     http_req_connecting............: avg=319ns    min=0s      med=0s      max=3.98ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=19.08ms  min=1.51ms  med=18.27ms max=300.72ms p(90)=27.52ms p(95)=31.1ms  p(99.9)=51.17ms
       { expected_response:true }...: avg=19.08ms  min=1.51ms  med=18.27ms max=300.72ms p(90)=27.52ms p(95)=31.1ms  p(99.9)=51.17ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 310774
     http_req_receiving.............: avg=533.25µs min=49.08µs med=94.57µs max=81.17ms  p(90)=1.36ms  p(95)=2.16ms  p(99.9)=19.47ms
     http_req_sending...............: avg=42.14µs  min=4.44µs  med=8.32µs  max=32.35ms  p(90)=17.67µs p(95)=84.59µs p(99.9)=4.04ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=18.51ms  min=1.4ms   med=17.7ms  max=285.65ms p(90)=26.82ms p(95)=30.36ms p(99.9)=49.73ms
     http_reqs......................: 310774  2585.545617/s
     iteration_duration.............: avg=19.3ms   min=2.52ms  med=18.47ms max=314.28ms p(90)=27.73ms p(95)=31.33ms p(99.9)=51.65ms
     iterations.....................: 310674  2584.713648/s
     success_rate...................: 100.00% ✓ 310674      ✗ 0     
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

     checks.........................: 100.00% ✓ 891183      ✗ 0     
     data_received..................: 26 GB   217 MB/s
     data_sent......................: 357 MB  3.0 MB/s
     http_req_blocked...............: avg=2.93µs   min=921ns   med=2.08µs  max=12.02ms  p(90)=3.64µs  p(95)=4.41µs  p(99.9)=35.77µs 
     http_req_connecting............: avg=332ns    min=0s      med=0s      max=3.58ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=19.97ms  min=1.56ms  med=16.86ms max=307.65ms p(90)=32.61ms p(95)=39.88ms p(99.9)=138.89ms
       { expected_response:true }...: avg=19.97ms  min=1.56ms  med=16.86ms max=307.65ms p(90)=32.61ms p(95)=39.88ms p(99.9)=138.89ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 297161
     http_req_receiving.............: avg=560.68µs min=52.35µs med=94.62µs max=161.68ms p(90)=1.07ms  p(95)=1.86ms  p(99.9)=26.56ms 
     http_req_sending...............: avg=41.82µs  min=4.67µs  med=8.83µs  max=86.77ms  p(90)=17.46µs p(95)=84.27µs p(99.9)=3.48ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=19.36ms  min=1.44ms  med=16.36ms max=307.25ms p(90)=31.64ms p(95)=38.74ms p(99.9)=137.77ms
     http_reqs......................: 297161  2472.184189/s
     iteration_duration.............: avg=20.18ms  min=2.45ms  med=17.06ms max=317.25ms p(90)=32.84ms p(95)=40.11ms p(99.9)=139.76ms
     iterations.....................: 297061  2471.352255/s
     success_rate...................: 100.00% ✓ 297061      ✗ 0     
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

     checks.........................: 100.00% ✓ 877095      ✗ 0     
     data_received..................: 26 GB   213 MB/s
     data_sent......................: 351 MB  2.9 MB/s
     http_req_blocked...............: avg=2.84µs   min=942ns   med=2.04µs  max=20.39ms  p(90)=3.38µs  p(95)=4.04µs  p(99.9)=31.61µs 
     http_req_connecting............: avg=221ns    min=0s      med=0s      max=3.45ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=20.3ms   min=1.61ms  med=17.02ms max=421.63ms p(90)=33.34ms p(95)=40.86ms p(99.9)=146.54ms
       { expected_response:true }...: avg=20.3ms   min=1.61ms  med=17.02ms max=421.63ms p(90)=33.34ms p(95)=40.86ms p(99.9)=146.54ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 292465
     http_req_receiving.............: avg=577.27µs min=50.24µs med=92.78µs max=147.84ms p(90)=1.1ms   p(95)=1.9ms   p(99.9)=28.68ms 
     http_req_sending...............: avg=42.83µs  min=4.75µs  med=8.69µs  max=146.66ms p(90)=16µs    p(95)=70.33µs p(99.9)=4.08ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=19.68ms  min=1.52ms  med=16.48ms max=421.48ms p(90)=32.35ms p(95)=39.73ms p(99.9)=144.85ms
     http_reqs......................: 292465  2433.032499/s
     iteration_duration.............: avg=20.51ms  min=2.56ms  med=17.22ms max=421.81ms p(90)=33.56ms p(95)=41.1ms  p(99.9)=146.98ms
     iterations.....................: 292365  2432.200594/s
     success_rate...................: 100.00% ✓ 292365      ✗ 0     
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

     checks.........................: 100.00% ✓ 867219      ✗ 0     
     data_received..................: 25 GB   210 MB/s
     data_sent......................: 348 MB  2.9 MB/s
     http_req_blocked...............: avg=3.23µs  min=972ns   med=2.54µs  max=4.25ms   p(90)=4.02µs  p(95)=4.71µs   p(99.9)=37.25µs
     http_req_connecting............: avg=316ns   min=0s      med=0s      max=4.15ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=20.53ms min=1.56ms  med=20.36ms max=279.24ms p(90)=28.47ms p(95)=30.91ms  p(99.9)=50.12ms
       { expected_response:true }...: avg=20.53ms min=1.56ms  med=20.36ms max=279.24ms p(90)=28.47ms p(95)=30.91ms  p(99.9)=50.12ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 289173
     http_req_receiving.............: avg=89.5µs  min=26.56µs med=52.74µs max=180.87ms p(90)=91.42µs p(95)=125.87µs p(99.9)=6.09ms 
     http_req_sending...............: avg=43.51µs min=4.91µs  med=10.24µs max=179.28ms p(90)=16.93µs p(95)=59.76µs  p(99.9)=3.28ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=20.39ms min=1.48ms  med=20.25ms max=279.03ms p(90)=28.32ms p(95)=30.73ms  p(99.9)=49.27ms
     http_reqs......................: 289173  2405.793222/s
     iteration_duration.............: avg=20.74ms min=2.76ms  med=20.56ms max=297.54ms p(90)=28.68ms p(95)=31.12ms  p(99.9)=50.84ms
     iterations.....................: 289073  2404.961266/s
     success_rate...................: 100.00% ✓ 289073      ✗ 0     
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

     checks.........................: 100.00% ✓ 835710      ✗ 0     
     data_received..................: 24 GB   203 MB/s
     data_sent......................: 335 MB  2.8 MB/s
     http_req_blocked...............: avg=3.68µs   min=1.07µs  med=2.73µs  max=19.63ms  p(90)=4.44µs  p(95)=5.23µs  p(99.9)=40.56µs 
     http_req_connecting............: avg=309ns    min=0s      med=0s      max=3.37ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=21.29ms  min=1.9ms   med=18.23ms max=298.21ms p(90)=34.55ms p(95)=42.17ms p(99.9)=129.88ms
       { expected_response:true }...: avg=21.29ms  min=1.9ms   med=18.23ms max=298.21ms p(90)=34.55ms p(95)=42.17ms p(99.9)=129.88ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 278670
     http_req_receiving.............: avg=569.51µs min=50.76µs med=98.92µs max=245.13ms p(90)=1.11ms  p(95)=1.96ms  p(99.9)=26.6ms  
     http_req_sending...............: avg=43.82µs  min=4.94µs  med=10.65µs max=205.45ms p(90)=20.33µs p(95)=93.25µs p(99.9)=3.29ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=20.68ms  min=1.78ms  med=17.7ms  max=298.03ms p(90)=33.6ms  p(95)=41.05ms p(99.9)=128.16ms
     http_reqs......................: 278670  2317.449962/s
     iteration_duration.............: avg=21.52ms  min=3.06ms  med=18.44ms max=310.17ms p(90)=34.79ms p(95)=42.41ms p(99.9)=130.72ms
     iterations.....................: 278570  2316.618351/s
     success_rate...................: 100.00% ✓ 278570      ✗ 0     
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

     checks.........................: 100.00% ✓ 597156      ✗ 0     
     data_received..................: 17 GB   145 MB/s
     data_sent......................: 239 MB  2.0 MB/s
     http_req_blocked...............: avg=3.32µs  min=931ns   med=2.26µs  max=5.3ms    p(90)=4.46µs   p(95)=5.58µs   p(99.9)=44.61µs
     http_req_connecting............: avg=452ns   min=0s      med=0s      max=3.66ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=29.89ms min=2.22ms  med=29.35ms max=324ms    p(90)=39.24ms  p(95)=42.49ms  p(99.9)=64.37ms
       { expected_response:true }...: avg=29.89ms min=2.22ms  med=29.35ms max=324ms    p(90)=39.24ms  p(95)=42.49ms  p(99.9)=64.37ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 199152
     http_req_receiving.............: avg=94.39µs min=27.27µs med=56.73µs max=116.41ms p(90)=126.15µs p(95)=197.54µs p(99.9)=3.65ms 
     http_req_sending...............: avg=40.87µs min=4.91µs  med=9.56µs  max=167.71ms p(90)=23.79µs  p(95)=101.34µs p(99.9)=2.57ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=29.75ms min=2.1ms   med=29.23ms max=321.03ms p(90)=39.09ms  p(95)=42.32ms  p(99.9)=63.65ms
     http_reqs......................: 199152  1655.750989/s
     iteration_duration.............: avg=30.13ms min=8.29ms  med=29.57ms max=333.35ms p(90)=39.46ms  p(95)=42.71ms  p(99.9)=64.71ms
     iterations.....................: 199052  1654.919588/s
     success_rate...................: 100.00% ✓ 199052      ✗ 0     
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

     checks.........................: 100.00% ✓ 426270      ✗ 0     
     data_received..................: 12 GB   103 MB/s
     data_sent......................: 171 MB  1.4 MB/s
     http_req_blocked...............: avg=3.31µs  min=932ns   med=2.39µs  max=3.93ms   p(90)=3.91µs   p(95)=4.55µs   p(99.9)=34.44µs 
     http_req_connecting............: avg=613ns   min=0s      med=0s      max=3.89ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=41.98ms min=2.11ms  med=41.62ms max=303.22ms p(90)=58.26ms  p(95)=63.37ms  p(99.9)=87.16ms 
       { expected_response:true }...: avg=41.98ms min=2.11ms  med=41.62ms max=303.22ms p(90)=58.26ms  p(95)=63.37ms  p(99.9)=87.16ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 142190
     http_req_receiving.............: avg=74.75µs min=26.73µs med=62.28µs max=48.42ms  p(90)=101.23µs p(95)=118.42µs p(99.9)=788.9µs 
     http_req_sending...............: avg=21.14µs min=4.77µs  med=10.84µs max=38.64ms  p(90)=17.65µs  p(95)=21.21µs  p(99.9)=911.09µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=41.88ms min=2.04ms  med=41.53ms max=301.53ms p(90)=58.16ms  p(95)=63.25ms  p(99.9)=87.03ms 
     http_reqs......................: 142190  1182.152947/s
     iteration_duration.............: avg=42.22ms min=3.86ms  med=41.83ms max=312.37ms p(90)=58.47ms  p(95)=63.57ms  p(99.9)=87.58ms 
     iterations.....................: 142090  1181.321558/s
     success_rate...................: 100.00% ✓ 142090      ✗ 0     
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

     checks.........................: 100.00% ✓ 211722     ✗ 0    
     data_received..................: 6.2 GB  51 MB/s
     data_sent......................: 85 MB   704 kB/s
     http_req_blocked...............: avg=4.84µs  min=1.03µs  med=2.68µs  max=7.85ms   p(90)=4.17µs   p(95)=4.77µs   p(99.9)=46.48µs 
     http_req_connecting............: avg=1.85µs  min=0s      med=0s      max=7.25ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=84.67ms min=4.01ms  med=82.45ms max=294.11ms p(90)=109.38ms p(95)=120.93ms p(99.9)=201.78ms
       { expected_response:true }...: avg=84.67ms min=4.01ms  med=82.45ms max=294.11ms p(90)=109.38ms p(95)=120.93ms p(99.9)=201.78ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 70674
     http_req_receiving.............: avg=80.4µs  min=28.09µs med=73.32µs max=12.06ms  p(90)=110.23µs p(95)=123.3µs  p(99.9)=606.93µs
     http_req_sending...............: avg=24.87µs min=4.59µs  med=13.32µs max=73.42ms  p(90)=20.07µs  p(95)=22.18µs  p(99.9)=658.03µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=84.57ms min=3.87ms  med=82.35ms max=292.74ms p(90)=109.26ms p(95)=120.79ms p(99.9)=201.61ms
     http_reqs......................: 70674   586.26991/s
     iteration_duration.............: avg=85.03ms min=19.67ms med=82.71ms max=300.61ms p(90)=109.64ms p(95)=121.19ms p(99.9)=202.65ms
     iterations.....................: 70574   585.440369/s
     success_rate...................: 100.00% ✓ 70574      ✗ 0    
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

     checks.........................: 100.00% ✓ 149865     ✗ 0    
     data_received..................: 4.4 GB  36 MB/s
     data_sent......................: 60 MB   498 kB/s
     http_req_blocked...............: avg=5.27µs   min=1.11µs  med=3.19µs   max=4.12ms   p(90)=4.68µs   p(95)=5.27µs   p(99.9)=193.84µs
     http_req_connecting............: avg=1.87µs   min=0s      med=0s       max=4.08ms   p(90)=0s       p(95)=0s       p(99.9)=165.04µs
     http_req_duration..............: avg=119.64ms min=5.14ms  med=117.19ms max=325.73ms p(90)=158.53ms p(95)=170.51ms p(99.9)=220.85ms
       { expected_response:true }...: avg=119.64ms min=5.14ms  med=117.19ms max=325.73ms p(90)=158.53ms p(95)=170.51ms p(99.9)=220.85ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 50055
     http_req_receiving.............: avg=86.64µs  min=29.33µs med=81.26µs  max=72.86ms  p(90)=112.02µs p(95)=124.35µs p(99.9)=583.84µs
     http_req_sending...............: avg=23.58µs  min=5.33µs  med=16.17µs  max=75.33ms  p(90)=21.3µs   p(95)=23.21µs  p(99.9)=504.75µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=119.52ms min=5.06ms  med=117.09ms max=325.33ms p(90)=158.43ms p(95)=170.42ms p(99.9)=220.74ms
     http_reqs......................: 50055   414.851956/s
     iteration_duration.............: avg=120.13ms min=28.11ms med=117.52ms max=335ms    p(90)=158.81ms p(95)=170.79ms p(99.9)=223.66ms
     iterations.....................: 49955   414.023164/s
     success_rate...................: 100.00% ✓ 49955      ✗ 0    
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

     checks.........................: 100.00% ✓ 98622      ✗ 0    
     data_received..................: 2.9 GB  24 MB/s
     data_sent......................: 40 MB   327 kB/s
     http_req_blocked...............: avg=6.4µs    min=1.1µs   med=3.26µs   max=3.69ms   p(90)=4.67µs   p(95)=5.25µs   p(99.9)=1.47ms  
     http_req_connecting............: avg=2.69µs   min=0s      med=0s       max=3.65ms   p(90)=0s       p(95)=0s       p(99.9)=1.29ms  
     http_req_duration..............: avg=181.77ms min=7.91ms  med=183.31ms max=387.42ms p(90)=193.36ms p(95)=197.74ms p(99.9)=273.09ms
       { expected_response:true }...: avg=181.77ms min=7.91ms  med=183.31ms max=387.42ms p(90)=193.36ms p(95)=197.74ms p(99.9)=273.09ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32974
     http_req_receiving.............: avg=94.52µs  min=28.65µs med=87.39µs  max=84.37ms  p(90)=117.52µs p(95)=128.63µs p(99.9)=537.6µs 
     http_req_sending...............: avg=27.82µs  min=5.33µs  med=17.17µs  max=124.36ms p(90)=21.65µs  p(95)=23.52µs  p(99.9)=549.08µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=181.65ms min=7.76ms  med=183.19ms max=380.74ms p(90)=193.26ms p(95)=197.63ms p(99.9)=272.98ms
     http_reqs......................: 32974   272.496314/s
     iteration_duration.............: avg=182.6ms  min=43.67ms med=183.78ms max=397.01ms p(90)=193.65ms p(95)=198.01ms p(99.9)=275.06ms
     iterations.....................: 32874   271.669916/s
     success_rate...................: 100.00% ✓ 32874      ✗ 0    
     vus............................: 12      min=12       max=50 
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

     checks.........................: 100.00% ✓ 96654      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 39 MB   321 kB/s
     http_req_blocked...............: avg=6.03µs   min=1.06µs  med=3.13µs   max=3.5ms    p(90)=4.47µs   p(95)=5.04µs   p(99.9)=1.27ms  
     http_req_connecting............: avg=2.72µs   min=0s      med=0s       max=3.46ms   p(90)=0s       p(95)=0s       p(99.9)=1.25ms  
     http_req_duration..............: avg=185.52ms min=6.06ms  med=170.55ms max=714.7ms  p(90)=217.83ms p(95)=254.93ms p(99.9)=579.89ms
       { expected_response:true }...: avg=185.52ms min=6.06ms  med=170.55ms max=714.7ms  p(90)=217.83ms p(95)=254.93ms p(99.9)=579.89ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32318
     http_req_receiving.............: avg=93.55µs  min=30.87µs med=89.33µs  max=50.96ms  p(90)=119.69µs p(95)=131.71µs p(99.9)=701.29µs
     http_req_sending...............: avg=24.72µs  min=5.44µs  med=17.55µs  max=50.82ms  p(90)=21.78µs  p(95)=23.49µs  p(99.9)=520.68µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=185.4ms  min=5.98ms  med=170.42ms max=714.6ms  p(90)=217.7ms  p(95)=254.83ms p(99.9)=579.74ms
     http_reqs......................: 32318   267.059015/s
     iteration_duration.............: avg=186.35ms min=37.55ms med=170.89ms max=714.96ms p(90)=218.23ms p(95)=256.68ms p(99.9)=580.43ms
     iterations.....................: 32218   266.232667/s
     success_rate...................: 100.00% ✓ 32218      ✗ 0    
     vus............................: 9       min=9        max=50 
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

     checks.........................: 100.00% ✓ 8364      ✗ 0   
     data_received..................: 276 MB  2.2 MB/s
     data_sent......................: 3.5 MB  28 kB/s
     http_req_blocked...............: avg=35.26µs min=1.17µs   med=3.26µs  max=4.06ms   p(90)=4.84µs   p(95)=5.51µs   p(99.9)=3.71ms  
     http_req_connecting............: avg=31.22µs min=0s       med=0s      max=4.02ms   p(90)=0s       p(95)=0s       p(99.9)=3.67ms  
     http_req_duration..............: avg=2.09s   min=25.72ms  med=2.14s   max=4.69s    p(90)=2.84s    p(95)=3.07s    p(99.9)=4.04s   
       { expected_response:true }...: avg=2.09s   min=25.72ms  med=2.14s   max=4.69s    p(90)=2.84s    p(95)=3.07s    p(99.9)=4.04s   
     http_req_failed................: 0.00%   ✓ 0         ✗ 2888
     http_req_receiving.............: avg=97.8µs  min=31.54µs  med=93.76µs max=600.68µs p(90)=135.09µs p(95)=151.45µs p(99.9)=367.43µs
     http_req_sending...............: avg=41.78µs min=5.61µs   med=18.7µs  max=32.98ms  p(90)=23.86µs  p(95)=26.78µs  p(99.9)=2.23ms  
     http_req_tls_handshaking.......: avg=0s      min=0s       med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=2.09s   min=25.57ms  med=2.14s   max=4.69s    p(90)=2.84s    p(95)=3.07s    p(99.9)=4.04s   
     http_reqs......................: 2888    23.046225/s
     iteration_duration.............: avg=2.17s   min=515.22ms med=2.16s   max=4.69s    p(90)=2.85s    p(95)=3.1s     p(99.9)=4.04s   
     iterations.....................: 2788    22.248225/s
     success_rate...................: 100.00% ✓ 2788      ✗ 0   
     vus............................: 30      min=0       max=50
     vus_max........................: 50      min=50      max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

