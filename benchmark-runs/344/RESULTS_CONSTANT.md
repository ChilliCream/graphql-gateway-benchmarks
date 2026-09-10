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
| hive-router | v0.0.84 | 2,894 | 3,156 | 2,828 | 3.8% |  |
| fusion-nightly-net11 | 16.7.0-p.5 | 2,706 | 2,850 | 2,693 | 2.1% |  |
| fusion-nightly | 16.7.0-p.5 | 2,677 | 2,772 | 2,661 | 1.5% |  |
| fusion | 16.6.4 | 2,594 | 2,735 | 2,567 | 2.2% |  |
| fusion-nightly-fed | 16.7.0-p.5 | 2,439 | 2,503 | 2,426 | 1.2% |  |
| grafbase | 0.53.5 | 2,165 | 2,292 | 2,149 | 2.4% |  |
| cosmo | 0.334.0 | 1,318 | 1,367 | 1,304 | 1.6% |  |
| hive-gateway-router-runtime | 2.10.8 | 615 | 633 | 611 | 1.1% |  |
| apollo-router | v2.16.1 | 489 | 506 | 488 | 1.3% |  |
| apollo-gateway | 2.14.3 | 279 | 284 | 277 | 0.8% |  |
| hive-gateway | 2.10.8 | 273 | 282 | 273 | 1.3% |  |
| feddi | 5ff8b6165878 | 0 | 0 | 0 | 0.0% |  |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| fusion | 16.6.4 | 2,483 | 2,599 | 2,474 | 1.8% |  |
| hive-router | v0.0.84 | 2,433 | 2,708 | 2,386 | 4.3% |  |
| fusion-nightly-net11 | 16.7.0-p.5 | 2,427 | 2,547 | 2,420 | 1.9% |  |
| fusion-nightly | 16.7.0-p.5 | 2,398 | 2,523 | 2,393 | 1.9% |  |
| fusion-nightly-fed | 16.7.0-p.5 | 2,328 | 2,435 | 2,317 | 1.7% |  |
| grafbase | 0.53.5 | 1,620 | 1,676 | 1,616 | 1.2% |  |
| cosmo | 0.334.0 | 1,208 | 1,262 | 1,197 | 1.7% |  |
| hive-gateway-router-runtime | 2.10.8 | 574 | 592 | 568 | 1.5% |  |
| apollo-router | v2.16.1 | 447 | 464 | 446 | 1.3% |  |
| hive-gateway | 2.10.8 | 271 | 277 | 269 | 1.0% |  |
| apollo-gateway | 2.14.3 | 266 | 271 | 265 | 0.8% |  |
| feddi | 5ff8b6165878 | 20 | 21 | 19 | 3.5% |  |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.84)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 1043406     ✗ 0     
     data_received..................: 31 GB   254 MB/s
     data_sent......................: 418 MB  3.5 MB/s
     http_req_blocked...............: avg=2.45µs  min=872ns   med=1.84µs  max=17.19ms  p(90)=2.96µs  p(95)=3.5µs   p(99.9)=28.46µs
     http_req_connecting............: avg=245ns   min=0s      med=0s      max=3.76ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=17.04ms min=1.44ms  med=16.46ms max=278.14ms p(90)=24.85ms p(95)=27.78ms p(99.9)=45.91ms
       { expected_response:true }...: avg=17.04ms min=1.44ms  med=16.46ms max=278.14ms p(90)=24.85ms p(95)=27.78ms p(99.9)=45.91ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 347902
     http_req_receiving.............: avg=78.62µs min=24.15µs med=44.33µs max=127.22ms p(90)=76.79µs p(95)=113.8µs p(99.9)=6.28ms 
     http_req_sending...............: avg=39.6µs  min=4.32µs  med=8.04µs  max=77.86ms  p(90)=13.47µs p(95)=73.44µs p(99.9)=3.95ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=16.93ms min=1.39ms  med=16.36ms max=277.7ms  p(90)=24.72ms p(95)=27.57ms p(99.9)=44.83ms
     http_reqs......................: 347902  2894.680345/s
     iteration_duration.............: avg=17.24ms min=2.08ms  med=16.64ms max=288.04ms p(90)=25.05ms p(95)=27.99ms p(99.9)=46.94ms
     iterations.....................: 347802  2893.848306/s
     success_rate...................: 100.00% ✓ 347802      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (rust subgraphs) (16.7.0-p.5)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 975990      ✗ 0     
     data_received..................: 29 GB   237 MB/s
     data_sent......................: 391 MB  3.3 MB/s
     http_req_blocked...............: avg=3.06µs  min=881ns   med=2.32µs   max=18.04ms  p(90)=3.67µs  p(95)=4.32µs  p(99.9)=34.71µs
     http_req_connecting............: avg=267ns   min=0s      med=0s       max=3.46ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=18.22ms min=1.91ms  med=17.11ms  max=294.09ms p(90)=26.17ms p(95)=29.95ms p(99.9)=51.24ms
       { expected_response:true }...: avg=18.22ms min=1.91ms  med=17.11ms  max=294.09ms p(90)=26.17ms p(95)=29.95ms p(99.9)=51.24ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 325430
     http_req_receiving.............: avg=1.03ms  min=51.03µs med=122.34µs max=184.38ms p(90)=2.67ms  p(95)=3.7ms   p(99.9)=24.33ms
     http_req_sending...............: avg=48.5µs  min=4.63µs  med=8.81µs   max=156.34ms p(90)=16.92µs p(95)=95.71µs p(99.9)=5.75ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=17.13ms min=1.83ms  med=16.01ms  max=293.25ms p(90)=24.75ms p(95)=28.52ms p(99.9)=48.9ms 
     http_reqs......................: 325430  2706.344095/s
     iteration_duration.............: avg=18.43ms min=3.2ms   med=17.31ms  max=305.95ms p(90)=26.39ms p(95)=30.2ms  p(99.9)=51.66ms
     iterations.....................: 325330  2705.512474/s
     success_rate...................: 100.00% ✓ 325330      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (rust subgraphs) (16.7.0-p.5)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 965679      ✗ 0     
     data_received..................: 28 GB   235 MB/s
     data_sent......................: 387 MB  3.2 MB/s
     http_req_blocked...............: avg=2.73µs   min=822ns   med=2.11µs  max=12.58ms  p(90)=3.37µs  p(95)=3.94µs  p(99.9)=28.73µs 
     http_req_connecting............: avg=261ns    min=0s      med=0s      max=3.39ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=18.42ms  min=1.97ms  med=15.83ms max=285.29ms p(90)=29.9ms  p(95)=36.38ms p(99.9)=119.86ms
       { expected_response:true }...: avg=18.42ms  min=1.97ms  med=15.83ms max=285.29ms p(90)=29.9ms  p(95)=36.38ms p(99.9)=119.86ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 321993
     http_req_receiving.............: avg=534.03µs min=50.58µs med=88.61µs max=125.43ms p(90)=1.03ms  p(95)=1.86ms  p(99.9)=24.97ms 
     http_req_sending...............: avg=43.97µs  min=4.34µs  med=8.4µs   max=122.87ms p(90)=14.81µs p(95)=86.51µs p(99.9)=4.51ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=17.84ms  min=1.83ms  med=15.32ms max=284.79ms p(90)=29ms    p(95)=35.35ms p(99.9)=118.26ms
     http_reqs......................: 321993  2677.668914/s
     iteration_duration.............: avg=18.63ms  min=3.14ms  med=16.02ms max=303.64ms p(90)=30.11ms p(95)=36.61ms p(99.9)=121.05ms
     iterations.....................: 321893  2676.837322/s
     success_rate...................: 100.00% ✓ 321893      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (rust subgraphs) (16.6.4)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 935571      ✗ 0     
     data_received..................: 27 GB   227 MB/s
     data_sent......................: 375 MB  3.1 MB/s
     http_req_blocked...............: avg=3.1µs    min=1.01µs  med=2.37µs  max=11.59ms  p(90)=3.57µs  p(95)=4.12µs  p(99.9)=33.23µs 
     http_req_connecting............: avg=282ns    min=0s      med=0s      max=3.58ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=19.02ms  min=1.93ms  med=16.39ms max=310.6ms  p(90)=30.87ms p(95)=37.26ms p(99.9)=120.02ms
       { expected_response:true }...: avg=19.02ms  min=1.93ms  med=16.39ms max=310.6ms  p(90)=30.87ms p(95)=37.26ms p(99.9)=120.02ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 311957
     http_req_receiving.............: avg=582.97µs min=50.18µs med=92.15µs max=149.67ms p(90)=1.11ms  p(95)=2.02ms  p(99.9)=26.29ms 
     http_req_sending...............: avg=43.51µs  min=4.74µs  med=8.87µs  max=184.13ms p(90)=14.68µs p(95)=88.05µs p(99.9)=3.59ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=18.39ms  min=1.84ms  med=15.84ms max=310.52ms p(90)=29.88ms p(95)=36.12ms p(99.9)=118.58ms
     http_reqs......................: 311957  2594.109916/s
     iteration_duration.............: avg=19.23ms  min=2.75ms  med=16.58ms max=310.76ms p(90)=31.09ms p(95)=37.51ms p(99.9)=121.03ms
     iterations.....................: 311857  2593.278356/s
     success_rate...................: 100.00% ✓ 311857      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (rust subgraphs) (16.7.0-p.5)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 879486      ✗ 0     
     data_received..................: 26 GB   215 MB/s
     data_sent......................: 352 MB  2.9 MB/s
     http_req_blocked...............: avg=2.71µs  min=821ns   med=1.9µs   max=16.4ms   p(90)=3µs     p(95)=3.54µs  p(99.9)=25.85µs 
     http_req_connecting............: avg=327ns   min=0s      med=0s      max=3.84ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=20.25ms min=1.68ms  med=16.43ms max=303.03ms p(90)=34.58ms p(95)=43.86ms p(99.9)=159.37ms
       { expected_response:true }...: avg=20.25ms min=1.68ms  med=16.43ms max=303.03ms p(90)=34.58ms p(95)=43.86ms p(99.9)=159.37ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 293262
     http_req_receiving.............: avg=597.9µs min=49.99µs med=92.26µs max=230.87ms p(90)=1.07ms  p(95)=1.89ms  p(99.9)=29.78ms 
     http_req_sending...............: avg=38.14µs min=4.6µs   med=8.26µs  max=163.02ms p(90)=13.93µs p(95)=49.99µs p(99.9)=2.92ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=19.61ms min=1.6ms   med=15.92ms max=302.71ms p(90)=33.59ms p(95)=42.58ms p(99.9)=157.08ms
     http_reqs......................: 293262  2439.358561/s
     iteration_duration.............: avg=20.45ms min=2.69ms  med=16.62ms max=303.47ms p(90)=34.81ms p(95)=44.08ms p(99.9)=160.57ms
     iterations.....................: 293162  2438.526759/s
     success_rate...................: 100.00% ✓ 293162      ✗ 0     
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

     checks.........................: 100.00% ✓ 780885      ✗ 0     
     data_received..................: 23 GB   190 MB/s
     data_sent......................: 313 MB  2.6 MB/s
     http_req_blocked...............: avg=2.96µs  min=912ns  med=2.17µs  max=10.26ms  p(90)=3.53µs  p(95)=4.25µs   p(99.9)=37.69µs
     http_req_connecting............: avg=347ns   min=0s     med=0s      max=4.2ms    p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=22.83ms min=1.74ms med=22.6ms  max=299.35ms p(90)=27.04ms p(95)=28.81ms  p(99.9)=47.88ms
       { expected_response:true }...: avg=22.83ms min=1.74ms med=22.6ms  max=299.35ms p(90)=27.04ms p(95)=28.81ms  p(99.9)=47.88ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 260395
     http_req_receiving.............: avg=83.1µs  min=27.5µs med=53.67µs max=31.93ms  p(90)=91.51µs p(95)=116.04µs p(99.9)=4.92ms 
     http_req_sending...............: avg=34.23µs min=4.83µs med=9.41µs  max=96.52ms  p(90)=15.82µs p(95)=24.94µs  p(99.9)=1.69ms 
     http_req_tls_handshaking.......: avg=0s      min=0s     med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=22.71ms min=1.66ms med=22.5ms  max=298.96ms p(90)=26.92ms p(95)=28.64ms  p(99.9)=47.12ms
     http_reqs......................: 260395  2165.870075/s
     iteration_duration.............: avg=23.04ms min=4.35ms med=22.79ms max=309.61ms p(90)=27.24ms p(95)=29.01ms  p(99.9)=48.38ms
     iterations.....................: 260295  2165.038311/s
     success_rate...................: 100.00% ✓ 260295      ✗ 0     
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

     checks.........................: 100.00% ✓ 475404      ✗ 0     
     data_received..................: 14 GB   116 MB/s
     data_sent......................: 191 MB  1.6 MB/s
     http_req_blocked...............: avg=2.98µs  min=951ns   med=2.07µs  max=3.4ms    p(90)=3.52µs  p(95)=4.17µs   p(99.9)=35.11µs 
     http_req_connecting............: avg=571ns   min=0s      med=0s      max=3.36ms   p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=37.63ms min=2.04ms  med=37.28ms max=300.97ms p(90)=52.44ms p(95)=57.17ms  p(99.9)=79.43ms 
       { expected_response:true }...: avg=37.63ms min=2.04ms  med=37.28ms max=300.97ms p(90)=52.44ms p(95)=57.17ms  p(99.9)=79.43ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 158568
     http_req_receiving.............: avg=71µs    min=25.24µs med=56.73µs max=149.1ms  p(90)=92.6µs  p(95)=107.86µs p(99.9)=804.86µs
     http_req_sending...............: avg=22.4µs  min=4.68µs  med=9.55µs  max=138.73ms p(90)=16.19µs p(95)=20.05µs  p(99.9)=928.89µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=37.54ms min=1.93ms  med=37.2ms  max=270.29ms p(90)=52.35ms p(95)=57.08ms  p(99.9)=79.01ms 
     http_reqs......................: 158568  1318.42592/s
     iteration_duration.............: avg=37.85ms min=3.32ms  med=37.48ms max=315.68ms p(90)=52.64ms p(95)=57.37ms  p(99.9)=79.7ms  
     iterations.....................: 158468  1317.594462/s
     success_rate...................: 100.00% ✓ 158468      ✗ 0     
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

     checks.........................: 100.00% ✓ 222141     ✗ 0    
     data_received..................: 6.5 GB  54 MB/s
     data_sent......................: 89 MB   739 kB/s
     http_req_blocked...............: avg=3.1µs   min=952ns   med=2.26µs  max=2.06ms   p(90)=3.76µs   p(95)=4.37µs   p(99.9)=41.09µs 
     http_req_connecting............: avg=522ns   min=0s      med=0s      max=2.02ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=80.7ms  min=3.57ms  med=75.99ms max=289.25ms p(90)=113.33ms p(95)=125.17ms p(99.9)=208.84ms
       { expected_response:true }...: avg=80.7ms  min=3.57ms  med=75.99ms max=289.25ms p(90)=113.33ms p(95)=125.17ms p(99.9)=208.84ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 74147
     http_req_receiving.............: avg=74.92µs min=28.47µs med=65.56µs max=21.51ms  p(90)=102.76µs p(95)=115.79µs p(99.9)=608.49µs
     http_req_sending...............: avg=20.48µs min=4.9µs   med=11.85µs max=70.61ms  p(90)=19.21µs  p(95)=21.35µs  p(99.9)=576.15µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=80.6ms  min=3.49ms  med=75.9ms  max=288.74ms p(90)=113.23ms p(95)=125.08ms p(99.9)=208.57ms
     http_reqs......................: 74147   615.50101/s
     iteration_duration.............: avg=81.03ms min=25.5ms  med=76.25ms max=305.3ms  p(90)=113.57ms p(95)=125.46ms p(99.9)=209.56ms
     iterations.....................: 74047   614.670901/s
     success_rate...................: 100.00% ✓ 74047      ✗ 0    
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

     checks.........................: 100.00% ✓ 176754     ✗ 0    
     data_received..................: 5.2 GB  43 MB/s
     data_sent......................: 71 MB   588 kB/s
     http_req_blocked...............: avg=5.63µs   min=1.32µs  med=3.42µs   max=5.04ms   p(90)=4.83µs   p(95)=5.42µs   p(99.9)=59.72µs 
     http_req_connecting............: avg=1.9µs    min=0s      med=0s       max=5ms      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=101.41ms min=4.62ms  med=101.17ms max=294.25ms p(90)=122.37ms p(95)=128.62ms p(99.9)=156.89ms
       { expected_response:true }...: avg=101.41ms min=4.62ms  med=101.17ms max=294.25ms p(90)=122.37ms p(95)=128.62ms p(99.9)=156.89ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 59018
     http_req_receiving.............: avg=124.32µs min=31.48µs med=81.07µs  max=199.08ms p(90)=111.8µs  p(95)=124.17µs p(99.9)=738.35µs
     http_req_sending...............: avg=22.51µs  min=5.8µs   med=16.76µs  max=17.59ms  p(90)=22.28µs  p(95)=24.21µs  p(99.9)=701.8µs 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=101.26ms min=4.55ms  med=101.06ms max=293.73ms p(90)=122.23ms p(95)=128.46ms p(99.9)=155.26ms
     http_reqs......................: 59018   489.481204/s
     iteration_duration.............: avg=101.84ms min=26.49ms med=101.45ms max=318.81ms p(90)=122.63ms p(95)=128.89ms p(99.9)=158.58ms
     iterations.....................: 58918   488.651828/s
     success_rate...................: 100.00% ✓ 58918      ✗ 0    
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

     checks.........................: 100.00% ✓ 101061     ✗ 0    
     data_received..................: 3.0 GB  25 MB/s
     data_sent......................: 41 MB   336 kB/s
     http_req_blocked...............: avg=6.23µs   min=1.17µs  med=3.42µs   max=3.6ms    p(90)=4.71µs   p(95)=5.26µs   p(99.9)=1.2ms   
     http_req_connecting............: avg=2.46µs   min=0s      med=0s       max=3.56ms   p(90)=0s       p(95)=0s       p(99.9)=1.04ms  
     http_req_duration..............: avg=177.38ms min=7.35ms  med=182.46ms max=390.34ms p(90)=189.07ms p(95)=192.82ms p(99.9)=263.82ms
       { expected_response:true }...: avg=177.38ms min=7.35ms  med=182.46ms max=390.34ms p(90)=189.07ms p(95)=192.82ms p(99.9)=263.82ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 33787
     http_req_receiving.............: avg=92.13µs  min=30.85µs med=81.41µs  max=121.28ms p(90)=111.18µs p(95)=121.46µs p(99.9)=500.01µs
     http_req_sending...............: avg=25.3µs   min=5.29µs  med=16.24µs  max=49.75ms  p(90)=21.02µs  p(95)=22.87µs  p(99.9)=501µs   
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=177.26ms min=7.25ms  med=182.35ms max=388.49ms p(90)=188.97ms p(95)=192.71ms p(99.9)=263.62ms
     http_reqs......................: 33787   279.456308/s
     iteration_duration.............: avg=178.19ms min=33.51ms med=182.72ms max=401.85ms p(90)=189.35ms p(95)=193.12ms p(99.9)=265.89ms
     iterations.....................: 33687   278.629196/s
     success_rate...................: 100.00% ✓ 33687      ✗ 0    
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

     checks.........................: 100.00% ✓ 98958      ✗ 0    
     data_received..................: 2.9 GB  24 MB/s
     data_sent......................: 40 MB   329 kB/s
     http_req_blocked...............: avg=5.24µs   min=1.29µs  med=3.56µs   max=2.77ms   p(90)=4.93µs   p(95)=5.55µs   p(99.9)=519.22µs
     http_req_connecting............: avg=1.41µs   min=0s      med=0s       max=2.41ms   p(90)=0s       p(95)=0s       p(99.9)=500.06µs
     http_req_duration..............: avg=181.18ms min=5.76ms  med=165.49ms max=675.95ms p(90)=209.1ms  p(95)=245.54ms p(99.9)=600.78ms
       { expected_response:true }...: avg=181.18ms min=5.76ms  med=165.49ms max=675.95ms p(90)=209.1ms  p(95)=245.54ms p(99.9)=600.78ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 33086
     http_req_receiving.............: avg=92.28µs  min=35.4µs  med=86.16µs  max=21.75ms  p(90)=115.69µs p(95)=127.38µs p(99.9)=966.52µs
     http_req_sending...............: avg=23.12µs  min=6.39µs  med=17.48µs  max=42.04ms  p(90)=22.16µs  p(95)=23.99µs  p(99.9)=485.6µs 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=181.06ms min=5.64ms  med=165.37ms max=675.68ms p(90)=208.99ms p(95)=245.46ms p(99.9)=600.67ms
     http_reqs......................: 33086   273.889215/s
     iteration_duration.............: avg=181.97ms min=29.87ms med=165.81ms max=681.79ms p(90)=209.47ms p(95)=246.22ms p(99.9)=601.11ms
     iterations.....................: 32986   273.061405/s
     success_rate...................: 100.00% ✓ 32986      ✗ 0    
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
data_received..................: 2.8 MB 46 kB/s
     data_sent......................: 36 kB  599 B/s
     http_req_blocked...............: avg=10.05µs  min=2.77µs  med=3.33µs   max=168.86µs p(90)=6.82µs   p(95)=14.84µs  p(99.9)=164.63µs
     http_req_connecting............: avg=2.93µs   min=0s      med=0s       max=85.23µs  p(90)=0s       p(95)=0s       p(99.9)=82.85µs 
     http_req_duration..............: avg=1.07s    min=28.29ms med=38.27ms  max=30.02s   p(90)=45.74ms  p(95)=49.75ms  p(99.9)=29.18s  
       { expected_response:true }...: avg=1.07s    min=28.29ms med=38.27ms  max=30.02s   p(90)=45.74ms  p(95)=49.75ms  p(99.9)=29.18s  
     http_req_failed................: 0.00%  ✓ 0        ✗ 29  
     http_req_receiving.............: avg=152.22µs min=85.08µs med=130.95µs max=403.74µs p(90)=263.56µs p(95)=281.2µs  p(99.9)=400.51µs
     http_req_sending...............: avg=31.13µs  min=14.65µs med=18.7µs   max=230.68µs p(90)=32.81µs  p(95)=102.12µs p(99.9)=227.91µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=1.07s    min=28.13ms med=38.16ms  max=30.02s   p(90)=45.54ms  p(95)=49.32ms  p(99.9)=29.18s  
     http_reqs......................: 29     0.483328/s
     vus............................: 0      min=0      max=0 
     vus_max........................: 50     min=50     max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (.net subgraphs) (16.6.4)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 895350      ✗ 0     
     data_received..................: 26 GB   218 MB/s
     data_sent......................: 359 MB  3.0 MB/s
     http_req_blocked...............: avg=2.81µs   min=851ns   med=2.03µs  max=15.26ms  p(90)=3.65µs  p(95)=4.39µs  p(99.9)=32.5µs  
     http_req_connecting............: avg=205ns    min=0s      med=0s      max=3.19ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=19.88ms  min=1.65ms  med=16.67ms max=330.29ms p(90)=32.55ms p(95)=39.92ms p(99.9)=144.92ms
       { expected_response:true }...: avg=19.88ms  min=1.65ms  med=16.67ms max=330.29ms p(90)=32.55ms p(95)=39.92ms p(99.9)=144.92ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 298550
     http_req_receiving.............: avg=555.85µs min=49.37µs med=92.47µs max=239.39ms p(90)=1.06ms  p(95)=1.83ms  p(99.9)=26.15ms 
     http_req_sending...............: avg=41.72µs  min=4.21µs  med=8.58µs  max=139.8ms  p(90)=17.14µs p(95)=74.12µs p(99.9)=3.72ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=19.28ms  min=1.54ms  med=16.16ms max=330.01ms p(90)=31.62ms p(95)=38.85ms p(99.9)=142.85ms
     http_reqs......................: 298550  2483.652142/s
     iteration_duration.............: avg=20.09ms  min=2.58ms  med=16.87ms max=330.51ms p(90)=32.77ms p(95)=40.16ms p(99.9)=146.92ms
     iterations.....................: 298450  2482.820237/s
     success_rate...................: 100.00% ✓ 298450      ✗ 0     
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

     checks.........................: 100.00% ✓ 877401      ✗ 0     
     data_received..................: 26 GB   213 MB/s
     data_sent......................: 352 MB  2.9 MB/s
     http_req_blocked...............: avg=3.46µs  min=982ns   med=2.67µs  max=12.02ms  p(90)=4.26µs  p(95)=5µs      p(99.9)=39.83µs
     http_req_connecting............: avg=334ns   min=0s      med=0s      max=3.85ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=20.28ms min=1.6ms   med=19.95ms max=280.83ms p(90)=28.37ms p(95)=30.96ms  p(99.9)=49.86ms
       { expected_response:true }...: avg=20.28ms min=1.6ms   med=19.95ms max=280.83ms p(90)=28.37ms p(95)=30.96ms  p(99.9)=49.86ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 292567
     http_req_receiving.............: avg=90.03µs min=26.28µs med=52.6µs  max=117.79ms p(90)=94.18µs p(95)=135.42µs p(99.9)=6.2ms  
     http_req_sending...............: avg=45µs    min=4.7µs   med=10.53µs max=146.37ms p(90)=17.67µs p(95)=86.67µs  p(99.9)=3.17ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=20.15ms min=1.55ms  med=19.83ms max=280.04ms p(90)=28.23ms p(95)=30.77ms  p(99.9)=48.85ms
     http_reqs......................: 292567  2433.836054/s
     iteration_duration.............: avg=20.5ms  min=2.64ms  med=20.15ms max=305.7ms  p(90)=28.58ms p(95)=31.18ms  p(99.9)=50.49ms
     iterations.....................: 292467  2433.004164/s
     success_rate...................: 100.00% ✓ 292467      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (.net subgraphs) (16.7.0-p.5)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 875121      ✗ 0     
     data_received..................: 26 GB   213 MB/s
     data_sent......................: 351 MB  2.9 MB/s
     http_req_blocked...............: avg=3.48µs  min=1.07µs  med=2.61µs   max=13.59ms  p(90)=4.21µs  p(95)=4.98µs  p(99.9)=38.64µs
     http_req_connecting............: avg=342ns   min=0s      med=0s       max=3.67ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=20.33ms min=1.5ms   med=19.12ms  max=285.35ms p(90)=29.92ms p(95)=33.98ms p(99.9)=56.58ms
       { expected_response:true }...: avg=20.33ms min=1.5ms   med=19.12ms  max=285.35ms p(90)=29.92ms p(95)=33.98ms p(99.9)=56.58ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 291807
     http_req_receiving.............: avg=1.3ms   min=54.11µs med=242.96µs max=154.96ms p(90)=3.26ms  p(95)=4.5ms   p(99.9)=26.42ms
     http_req_sending...............: avg=48.37µs min=5.01µs  med=9.78µs   max=132.16ms p(90)=19.53µs p(95)=95.93µs p(99.9)=4.9ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=18.97ms min=1.42ms  med=17.72ms  max=285ms    p(90)=28.3ms  p(95)=32.27ms p(99.9)=54.37ms
     http_reqs......................: 291807  2427.586555/s
     iteration_duration.............: avg=20.56ms min=2.82ms  med=19.33ms  max=301.49ms p(90)=30.15ms p(95)=34.23ms p(99.9)=57.49ms
     iterations.....................: 291707  2426.75464/s
     success_rate...................: 100.00% ✓ 291707      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.7.0-p.5)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 864597      ✗ 0     
     data_received..................: 25 GB   210 MB/s
     data_sent......................: 346 MB  2.9 MB/s
     http_req_blocked...............: avg=3.31µs   min=1µs     med=2.56µs  max=14.34ms  p(90)=4.04µs  p(95)=4.71µs  p(99.9)=38.7µs  
     http_req_connecting............: avg=230ns    min=0s      med=0s      max=2.77ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=20.59ms  min=1.57ms  med=17.11ms max=402.15ms p(90)=33.96ms p(95)=41.71ms p(99.9)=151.71ms
       { expected_response:true }...: avg=20.59ms  min=1.57ms  med=17.11ms max=402.15ms p(90)=33.96ms p(95)=41.71ms p(99.9)=151.71ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 288299
     http_req_receiving.............: avg=609.72µs min=52.47µs med=99.84µs max=208.85ms p(90)=1.14ms  p(95)=1.98ms  p(99.9)=27.94ms 
     http_req_sending...............: avg=44.72µs  min=4.73µs  med=9.86µs  max=232.28ms p(90)=17.83µs p(95)=89.3µs  p(99.9)=3.42ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=19.93ms  min=1.49ms  med=16.55ms max=402.03ms p(90)=32.88ms p(95)=40.53ms p(99.9)=150.51ms
     http_reqs......................: 288299  2398.271394/s
     iteration_duration.............: avg=20.81ms  min=2.55ms  med=17.32ms max=402.35ms p(90)=34.18ms p(95)=41.95ms p(99.9)=152.92ms
     iterations.....................: 288199  2397.439525/s
     success_rate...................: 100.00% ✓ 288199      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (.net subgraphs) (16.7.0-p.5)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 839511      ✗ 0     
     data_received..................: 25 GB   204 MB/s
     data_sent......................: 336 MB  2.8 MB/s
     http_req_blocked...............: avg=3.52µs  min=971ns   med=2.73µs  max=6.41ms   p(90)=4.38µs  p(95)=5.15µs  p(99.9)=38.9µs  
     http_req_connecting............: avg=395ns   min=0s      med=0s      max=3.96ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=21.2ms  min=1.84ms  med=18.02ms max=319.42ms p(90)=34.41ms p(95)=42.31ms p(99.9)=145.91ms
       { expected_response:true }...: avg=21.2ms  min=1.84ms  med=18.02ms max=319.42ms p(90)=34.41ms p(95)=42.31ms p(99.9)=145.91ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 279937
     http_req_receiving.............: avg=588.1µs min=51.12µs med=102.6µs max=227.61ms p(90)=1.14ms  p(95)=1.97ms  p(99.9)=27.61ms 
     http_req_sending...............: avg=44.4µs  min=4.8µs   med=10.25µs max=123.48ms p(90)=19.34µs p(95)=92.18µs p(99.9)=3.32ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=20.57ms min=1.74ms  med=17.45ms max=318.4ms  p(90)=33.41ms p(95)=41.16ms p(99.9)=145.13ms
     http_reqs......................: 279937  2328.13807/s
     iteration_duration.............: avg=21.43ms min=2.88ms  med=18.23ms max=319.59ms p(90)=34.64ms p(95)=42.56ms p(99.9)=147.39ms
     iterations.....................: 279837  2327.306405/s
     success_rate...................: 100.00% ✓ 279837      ✗ 0     
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

     checks.........................: 100.00% ✓ 584370      ✗ 0     
     data_received..................: 17 GB   142 MB/s
     data_sent......................: 234 MB  1.9 MB/s
     http_req_blocked...............: avg=3.33µs  min=871ns   med=2.3µs   max=5.62ms   p(90)=4.45µs   p(95)=5.54µs   p(99.9)=41.37µs
     http_req_connecting............: avg=434ns   min=0s      med=0s      max=3.39ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=30.54ms min=2.27ms  med=30.04ms max=298.75ms p(90)=40.59ms  p(95)=44.06ms  p(99.9)=65.51ms
       { expected_response:true }...: avg=30.54ms min=2.27ms  med=30.04ms max=298.75ms p(90)=40.59ms  p(95)=44.06ms  p(99.9)=65.51ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 194890
     http_req_receiving.............: avg=95.64µs min=27.48µs med=54.86µs max=175.21ms p(90)=126.22µs p(95)=207.74µs p(99.9)=3.84ms 
     http_req_sending...............: avg=41.25µs min=4.94µs  med=9.62µs  max=30.95ms  p(90)=24.18µs  p(95)=110.43µs p(99.9)=3.41ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=30.4ms  min=2.15ms  med=29.91ms max=286.16ms p(90)=40.43ms  p(95)=43.89ms  p(99.9)=65.13ms
     http_reqs......................: 194890  1620.156171/s
     iteration_duration.............: avg=30.79ms min=5.94ms  med=30.26ms max=312.06ms p(90)=40.81ms  p(95)=44.28ms  p(99.9)=65.98ms
     iterations.....................: 194790  1619.324852/s
     success_rate...................: 100.00% ✓ 194790      ✗ 0     
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

     checks.........................: 100.00% ✓ 435705      ✗ 0     
     data_received..................: 13 GB   106 MB/s
     data_sent......................: 175 MB  1.5 MB/s
     http_req_blocked...............: avg=3.18µs  min=1.04µs  med=2.26µs  max=3.48ms   p(90)=3.81µs  p(95)=4.49µs   p(99.9)=37.2µs  
     http_req_connecting............: avg=587ns   min=0s      med=0s      max=3.44ms   p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=41.06ms min=2.13ms  med=40.67ms max=312.91ms p(90)=57.2ms  p(95)=62.25ms  p(99.9)=85.68ms 
       { expected_response:true }...: avg=41.06ms min=2.13ms  med=40.67ms max=312.91ms p(90)=57.2ms  p(95)=62.25ms  p(99.9)=85.68ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 145335
     http_req_receiving.............: avg=76.85µs min=26.44µs med=64.43µs max=70.49ms  p(90)=103.4µs p(95)=119.74µs p(99.9)=918.66µs
     http_req_sending...............: avg=25.56µs min=4.9µs   med=11.18µs max=159.67ms p(90)=18.09µs p(95)=21.74µs  p(99.9)=842.36µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=40.96ms min=2.06ms  med=40.57ms max=312.35ms p(90)=57.1ms  p(95)=62.13ms  p(99.9)=85.17ms 
     http_reqs......................: 145335  1208.296828/s
     iteration_duration.............: avg=41.3ms  min=4.12ms  med=40.89ms max=323.34ms p(90)=57.41ms p(95)=62.46ms  p(99.9)=86.07ms 
     iterations.....................: 145235  1207.46544/s
     success_rate...................: 100.00% ✓ 145235      ✗ 0     
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

     checks.........................: 100.00% ✓ 207249     ✗ 0    
     data_received..................: 6.1 GB  50 MB/s
     data_sent......................: 83 MB   690 kB/s
     http_req_blocked...............: avg=4.53µs  min=1.19µs  med=3.09µs  max=3.33ms   p(90)=4.56µs   p(95)=5.22µs   p(99.9)=44.86µs 
     http_req_connecting............: avg=1.2µs   min=0s      med=0s      max=3.29ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=86.48ms min=3.92ms  med=84.45ms max=329.52ms p(90)=105.75ms p(95)=115.97ms p(99.9)=203.73ms
       { expected_response:true }...: avg=86.48ms min=3.92ms  med=84.45ms max=329.52ms p(90)=105.75ms p(95)=115.97ms p(99.9)=203.73ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 69183
     http_req_receiving.............: avg=89.75µs min=31.62µs med=76.94µs max=140.34ms p(90)=112.3µs  p(95)=125.53µs p(99.9)=656.63µs
     http_req_sending...............: avg=24.28µs min=4.91µs  med=14.55µs max=67.47ms  p(90)=21.17µs  p(95)=23.33µs  p(99.9)=649.67µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=86.37ms min=3.8ms   med=84.35ms max=306.92ms p(90)=105.65ms p(95)=115.84ms p(99.9)=203.41ms
     http_reqs......................: 69183   574.087049/s
     iteration_duration.............: avg=86.85ms min=16.95ms med=84.7ms  max=343.98ms p(90)=106.01ms p(95)=116.27ms p(99.9)=205.02ms
     iterations.....................: 69083   573.25724/s
     success_rate...................: 100.00% ✓ 69083      ✗ 0    
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

     checks.........................: 100.00% ✓ 161595     ✗ 0    
     data_received..................: 4.7 GB  39 MB/s
     data_sent......................: 65 MB   537 kB/s
     http_req_blocked...............: avg=4.45µs   min=1.13µs  med=3.39µs   max=2.3ms    p(90)=4.89µs   p(95)=5.47µs   p(99.9)=88.92µs 
     http_req_connecting............: avg=835ns    min=0s      med=0s       max=2.26ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=110.94ms min=5.27ms  med=108.71ms max=291.48ms p(90)=146.56ms p(95)=157.87ms p(99.9)=202.88ms
       { expected_response:true }...: avg=110.94ms min=5.27ms  med=108.71ms max=291.48ms p(90)=146.56ms p(95)=157.87ms p(99.9)=202.88ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 53965
     http_req_receiving.............: avg=87.86µs  min=30.72µs med=84.55µs  max=78.35ms  p(90)=114.62µs p(95)=127.06µs p(99.9)=546.98µs
     http_req_sending...............: avg=24.24µs  min=5.44µs  med=17.48µs  max=93.88ms  p(90)=22.9µs   p(95)=24.77µs  p(99.9)=506.13µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=110.83ms min=5.17ms  med=108.61ms max=291.12ms p(90)=146.45ms p(95)=157.76ms p(99.9)=201.62ms
     http_reqs......................: 53965   447.271183/s
     iteration_duration.............: avg=111.41ms min=33.28ms med=109.02ms max=324.3ms  p(90)=146.86ms p(95)=158.16ms p(99.9)=204.37ms
     iterations.....................: 53865   446.442366/s
     success_rate...................: 100.00% ✓ 53865      ✗ 0    
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

     checks.........................: 100.00% ✓ 98049      ✗ 0    
     data_received..................: 2.9 GB  24 MB/s
     data_sent......................: 39 MB   325 kB/s
     http_req_blocked...............: avg=6.39µs   min=1.15µs  med=3.14µs   max=3.82ms   p(90)=4.54µs   p(95)=5.13µs   p(99.9)=1.67ms  
     http_req_connecting............: avg=3.02µs   min=0s      med=0s       max=3.78ms   p(90)=0s       p(95)=0s       p(99.9)=1.65ms  
     http_req_duration..............: avg=182.86ms min=6.19ms  med=168.44ms max=629.83ms p(90)=211.1ms  p(95)=256.31ms p(99.9)=539.01ms
       { expected_response:true }...: avg=182.86ms min=6.19ms  med=168.44ms max=629.83ms p(90)=211.1ms  p(95)=256.31ms p(99.9)=539.01ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32783
     http_req_receiving.............: avg=97.1µs   min=31.33µs med=89.7µs   max=69.9ms   p(90)=121.13µs p(95)=133.65µs p(99.9)=816.46µs
     http_req_sending...............: avg=36.77µs  min=5.51µs  med=17.87µs  max=122.02ms p(90)=22.43µs  p(95)=24.17µs  p(99.9)=417.23µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=182.73ms min=6.1ms   med=168.31ms max=629.7ms  p(90)=210.98ms p(95)=255.83ms p(99.9)=538.91ms
     http_reqs......................: 32783   271.01292/s
     iteration_duration.............: avg=183.68ms min=44.32ms med=168.78ms max=630.07ms p(90)=211.49ms p(95)=257.23ms p(99.9)=539.36ms
     iterations.....................: 32683   270.186233/s
     success_rate...................: 100.00% ✓ 32683      ✗ 0    
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

     checks.........................: 100.00% ✓ 96351      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 39 MB   320 kB/s
     http_req_blocked...............: avg=6.92µs   min=1.3µs   med=3.55µs   max=3.55ms   p(90)=4.97µs   p(95)=5.55µs   p(99.9)=1.53ms  
     http_req_connecting............: avg=3.12µs   min=0s      med=0s       max=3.5ms    p(90)=0s       p(95)=0s       p(99.9)=1.5ms   
     http_req_duration..............: avg=186.08ms min=7.72ms  med=186.19ms max=351.61ms p(90)=198.19ms p(95)=204.87ms p(99.9)=268.9ms 
       { expected_response:true }...: avg=186.08ms min=7.72ms  med=186.19ms max=351.61ms p(90)=198.19ms p(95)=204.87ms p(99.9)=268.9ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 32217
     http_req_receiving.............: avg=89.8µs   min=34.26µs med=84.76µs  max=33.13ms  p(90)=115.36µs p(95)=126.35µs p(99.9)=441.59µs
     http_req_sending...............: avg=27.63µs  min=5.99µs  med=17.61µs  max=47.96ms  p(90)=22.49µs  p(95)=24.41µs  p(99.9)=551.7µs 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=185.96ms min=7.6ms   med=186.08ms max=338.97ms p(90)=198.06ms p(95)=204.71ms p(99.9)=268.81ms
     http_reqs......................: 32217   266.294286/s
     iteration_duration.............: avg=186.93ms min=87.86ms med=186.56ms max=367.53ms p(90)=198.47ms p(95)=205.16ms p(99.9)=272.21ms
     iterations.....................: 32117   265.467722/s
     success_rate...................: 100.00% ✓ 32117      ✗ 0    
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

     checks.........................: 100.00% ✓ 7554      ✗ 0   
     data_received..................: 251 MB  2.0 MB/s
     data_sent......................: 3.1 MB  25 kB/s
     http_req_blocked...............: avg=40.48µs min=1.53µs   med=3.85µs  max=4.08ms   p(90)=5.54µs   p(95)=6.43µs   p(99.9)=3.76ms  
     http_req_connecting............: avg=35.88µs min=0s       med=0s      max=4.04ms   p(90)=0s       p(95)=0s       p(99.9)=3.72ms  
     http_req_duration..............: avg=2.31s   min=24.96ms  med=2.33s   max=4.61s    p(90)=3.18s    p(95)=3.43s    p(99.9)=4.44s   
       { expected_response:true }...: avg=2.31s   min=24.96ms  med=2.33s   max=4.61s    p(90)=3.18s    p(95)=3.43s    p(99.9)=4.44s   
     http_req_failed................: 0.00%   ✓ 0         ✗ 2618
     http_req_receiving.............: avg=99.41µs min=31.59µs  med=95.43µs max=532.28µs p(90)=135.41µs p(95)=152.34µs p(99.9)=365.63µs
     http_req_sending...............: avg=34.6µs  min=7.6µs    med=19.86µs max=9.48ms   p(90)=25.48µs  p(95)=28.99µs  p(99.9)=1.72ms  
     http_req_tls_handshaking.......: avg=0s      min=0s       med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=2.31s   min=24.86ms  med=2.33s   max=4.6s     p(90)=3.18s    p(95)=3.43s    p(99.9)=4.44s   
     http_reqs......................: 2618    20.911327/s
     iteration_duration.............: avg=2.4s    min=230.19ms med=2.35s   max=4.61s    p(90)=3.21s    p(95)=3.44s    p(99.9)=4.45s   
     iterations.....................: 2518    20.112575/s
     success_rate...................: 100.00% ✓ 2518      ✗ 0   
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

