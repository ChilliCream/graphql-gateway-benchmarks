## Overview for: `burst-vus`

Each benchmark runs a GraphQL gateway with 4 subgraphs and executes a heavy nested query that exercises federation/composition capabilities.

Results are split by subgraph technology:
- **Rust Subgraphs** = [async-graphql](https://github.com/async-graphql/async-graphql) + axum
- **.NET Subgraphs** = [HotChocolate](https://github.com/ChilliCream/graphql-platform)

**Methodology:** Each gateway executes 10 runs of 120s each. The first run is a full-duration warmup (discarded). The remaining 9 runs are measured. Results are ranked by **median RPS** across the 9 measured runs, with best/worst/CV% reported for transparency.

This scenario is a burst stress test with peaks up to **500 VUs** over **120s**.


### Rust Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.84 | 2,921 | 3,071 | 2,890 | 2.1% |  |
| fusion-nightly-net11 | 16.7.0-p.2 | 2,658 | 2,767 | 2,637 | 1.7% |  |
| fusion | 16.6.3 | 2,487 | 2,558 | 2,467 | 1.2% |  |
| fusion-nightly | 16.7.0-p.2 | 2,465 | 2,592 | 2,455 | 2.0% |  |
| fusion-nightly-fed | 16.7.0-p.2 | 2,305 | 2,375 | 2,295 | 1.3% |  |
| cosmo | 0.334.0 | 1,208 | 1,245 | 1,189 | 1.4% |  |
| hive-gateway-router-runtime | 2.10.8 | 570 | 586 | 566 | 1.3% |  |
| hive-gateway | 2.10.8 | 257 | 263 | 253 | 1.1% |  |
| apollo-gateway | 2.14.3 | 237 | 243 | 233 | 1.2% |  |
| apollo-router | v2.16.1 | — | — | — | — | non-compatible response (5633 across 9/9 runs) |
| feddi | — | — | — | — | — | not run |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (534367 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| fusion-nightly-net11 | 16.7.0-p.2 | 2,501 | 2,591 | 2,493 | 1.4% |  |
| fusion | 16.6.3 | 2,420 | 2,529 | 2,411 | 1.6% |  |
| fusion-nightly | 16.7.0-p.2 | 2,383 | 2,474 | 2,345 | 1.8% |  |
| hive-router | v0.0.84 | 2,370 | 2,516 | 2,355 | 2.3% |  |
| fusion-nightly-fed | 16.7.0-p.2 | 2,124 | 2,219 | 2,108 | 1.7% |  |
| cosmo | 0.334.0 | 1,167 | 1,204 | 1,156 | 1.4% |  |
| hive-gateway-router-runtime | 2.10.8 | 544 | 556 | 539 | 1.1% |  |
| hive-gateway | 2.10.8 | 239 | 244 | 238 | 0.8% |  |
| apollo-gateway | 2.14.3 | 234 | 239 | 233 | 0.8% |  |
| apollo-router | v2.16.1 | — | — | — | — | non-compatible response (22392 across 9/9 runs) |
| feddi | — | — | — | — | — | not run |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (366958 across 9/9 runs) |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.84)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 537516      ✗ 0     
     data_received..................: 16 GB   256 MB/s
     data_sent......................: 216 MB  3.5 MB/s
     http_req_blocked...............: avg=18.76µs  min=892ns   med=2.12µs  max=50.97ms  p(90)=3.61µs   p(95)=4.81µs   p(99.9)=1.75ms  
     http_req_connecting............: avg=15.84µs  min=0s      med=0s      max=50.91ms  p(90)=0s       p(95)=0s       p(99.9)=1.66ms  
     http_req_duration..............: avg=78.86ms  min=1.39ms  med=74.26ms max=332.86ms p(90)=151.99ms p(95)=165.27ms p(99.9)=210.32ms
       { expected_response:true }...: avg=78.86ms  min=1.39ms  med=74.26ms max=332.86ms p(90)=151.99ms p(95)=165.27ms p(99.9)=210.32ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 180172
     http_req_receiving.............: avg=134.57µs min=24.73µs med=48.63µs max=130.36ms p(90)=137.14µs p(95)=321.79µs p(99.9)=16.02ms 
     http_req_sending...............: avg=69.14µs  min=4.3µs   med=9µs     max=172.72ms p(90)=17.49µs  p(95)=112.43µs p(99.9)=9.44ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=78.65ms  min=1.34ms  med=74.03ms max=292.33ms p(90)=151.75ms p(95)=164.98ms p(99.9)=208.95ms
     http_reqs......................: 180172  2921.438167/s
     iteration_duration.............: avg=79.55ms  min=1.91ms  med=75.01ms max=347.08ms p(90)=152.42ms p(95)=165.68ms p(99.9)=211.38ms
     iterations.....................: 179172  2905.223449/s
     success_rate...................: 100.00% ✓ 179172      ✗ 0     
     vus............................: 88      min=0         max=494 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (rust subgraphs) (16.7.0-p.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 493413      ✗ 0     
     data_received..................: 15 GB   233 MB/s
     data_sent......................: 199 MB  3.2 MB/s
     http_req_blocked...............: avg=20.4µs   min=832ns   med=2.49µs   max=54.73ms  p(90)=4.05µs   p(95)=5.13µs   p(99.9)=1.72ms  
     http_req_connecting............: avg=17.11µs  min=0s      med=0s       max=54.48ms  p(90)=0s       p(95)=0s       p(99.9)=1.64ms  
     http_req_duration..............: avg=85.9ms   min=1.87ms  med=81.66ms  max=311.76ms p(90)=164.11ms p(95)=182.35ms p(99.9)=242.72ms
       { expected_response:true }...: avg=85.9ms   min=1.87ms  med=81.66ms  max=311.76ms p(90)=164.11ms p(95)=182.35ms p(99.9)=242.72ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 165471
     http_req_receiving.............: avg=570.16µs min=51.68µs med=100.74µs max=118.02ms p(90)=1.07ms   p(95)=1.89ms   p(99.9)=25.06ms 
     http_req_sending...............: avg=68.61µs  min=4.43µs  med=9.48µs   max=214.05ms p(90)=18.74µs  p(95)=120.02µs p(99.9)=9.04ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=85.26ms  min=1.79ms  med=80.97ms  max=305.1ms  p(90)=163.33ms p(95)=181.59ms p(99.9)=241.48ms
     http_reqs......................: 165471  2658.065961/s
     iteration_duration.............: avg=86.67ms  min=3.48ms  med=82.6ms   max=340.67ms p(90)=164.57ms p(95)=182.83ms p(99.9)=243.71ms
     iterations.....................: 164471  2642.002324/s
     success_rate...................: 100.00% ✓ 164471      ✗ 0     
     vus............................: 69      min=0         max=495 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (rust subgraphs) (16.6.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 462840      ✗ 0     
     data_received..................: 14 GB   218 MB/s
     data_sent......................: 187 MB  3.0 MB/s
     http_req_blocked...............: avg=16.17µs min=862ns   med=2.11µs  max=85.87ms  p(90)=3.52µs   p(95)=4.55µs   p(99.9)=1.78ms  
     http_req_connecting............: avg=13.15µs min=0s      med=0s      max=85.69ms  p(90)=0s       p(95)=0s       p(99.9)=1.67ms  
     http_req_duration..............: avg=91.59ms min=1.97ms  med=79.93ms max=1.16s    p(90)=173.43ms p(95)=199.64ms p(99.9)=601.5ms 
       { expected_response:true }...: avg=91.59ms min=1.97ms  med=79.93ms max=1.16s    p(90)=173.43ms p(95)=199.64ms p(99.9)=601.5ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 155280
     http_req_receiving.............: avg=1.55ms  min=52.26µs med=98.23µs max=686ms    p(90)=1.92ms   p(95)=5.01ms   p(99.9)=93.65ms 
     http_req_sending...............: avg=60.51µs min=4.65µs  med=8.88µs  max=276.21ms p(90)=15.98µs  p(95)=95.16µs  p(99.9)=7.61ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=89.97ms min=1.88ms  med=78.77ms max=1.1s     p(90)=171.31ms p(95)=195.45ms p(99.9)=587.99ms
     http_reqs......................: 155280  2487.904918/s
     iteration_duration.............: avg=92.43ms min=3.16ms  med=80.99ms max=1.16s    p(90)=173.97ms p(95)=200.3ms  p(99.9)=602.14ms
     iterations.....................: 154280  2471.882861/s
     success_rate...................: 100.00% ✓ 154280      ✗ 0     
     vus............................: 76      min=0         max=494 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (rust subgraphs) (16.7.0-p.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 459126      ✗ 0     
     data_received..................: 14 GB   216 MB/s
     data_sent......................: 185 MB  3.0 MB/s
     http_req_blocked...............: avg=14.27µs min=782ns   med=2.07µs  max=53.71ms  p(90)=3.39µs   p(95)=4.44µs   p(99.9)=1.24ms  
     http_req_connecting............: avg=11.3µs  min=0s      med=0s      max=48.96ms  p(90)=0s       p(95)=0s       p(99.9)=1.19ms  
     http_req_duration..............: avg=92.36ms min=1.99ms  med=81.37ms max=1.07s    p(90)=176.89ms p(95)=203.92ms p(99.9)=597.73ms
       { expected_response:true }...: avg=92.36ms min=1.99ms  med=81.37ms max=1.07s    p(90)=176.89ms p(95)=203.92ms p(99.9)=597.73ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 154042
     http_req_receiving.............: avg=1.4ms   min=51.59µs med=98.78µs max=579.63ms p(90)=1.83ms   p(95)=5.02ms   p(99.9)=85.24ms 
     http_req_sending...............: avg=59.04µs min=4.71µs  med=8.9µs   max=122.29ms p(90)=16.25µs  p(95)=98.67µs  p(99.9)=8.3ms   
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=90.9ms  min=1.91ms  med=79.91ms max=1.07s    p(90)=174.72ms p(95)=200.92ms p(99.9)=589.45ms
     http_reqs......................: 154042  2465.911292/s
     iteration_duration.............: avg=93.2ms  min=3.29ms  med=82.31ms max=1.07s    p(90)=177.5ms  p(95)=204.52ms p(99.9)=598.45ms
     iterations.....................: 153042  2449.903247/s
     success_rate...................: 100.00% ✓ 153042      ✗ 0     
     vus............................: 77      min=0         max=492 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (rust subgraphs) (16.7.0-p.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 425895      ✗ 0     
     data_received..................: 13 GB   203 MB/s
     data_sent......................: 172 MB  2.8 MB/s
     http_req_blocked...............: avg=16.05µs  min=922ns   med=2.46µs   max=63.43ms  p(90)=3.89µs   p(95)=4.84µs   p(99.9)=998.63µs
     http_req_connecting............: avg=12.84µs  min=0s      med=0s       max=63.22ms  p(90)=0s       p(95)=0s       p(99.9)=929.17µs
     http_req_duration..............: avg=99.58ms  min=1.65ms  med=82.7ms   max=1.43s    p(90)=187.85ms p(95)=219.95ms p(99.9)=990.46ms
       { expected_response:true }...: avg=99.58ms  min=1.65ms  med=82.7ms   max=1.43s    p(90)=187.85ms p(95)=219.95ms p(99.9)=990.46ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 142965
     http_req_receiving.............: avg=1.56ms   min=52.02µs med=103.49µs max=1s       p(90)=1.75ms   p(95)=4.58ms   p(99.9)=96.88ms 
     http_req_sending...............: avg=61.01µs  min=4.48µs  med=9.31µs   max=105.46ms p(90)=16.3µs   p(95)=106.59µs p(99.9)=8.62ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=97.96ms  min=1.57ms  med=81.53ms  max=1.43s    p(90)=185.99ms p(95)=216.28ms p(99.9)=942.16ms
     http_reqs......................: 142965  2305.172707/s
     iteration_duration.............: avg=100.53ms min=2.86ms  med=83.76ms  max=1.43s    p(90)=188.46ms p(95)=220.92ms p(99.9)=991.56ms
     iterations.....................: 141965  2289.048672/s
     success_rate...................: 100.00% ✓ 141965      ✗ 0     
     vus............................: 58      min=0         max=498 
     vus_max........................: 500     min=500       max=500
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

     checks.........................: 100.00% ✓ 223512      ✗ 0    
     data_received..................: 6.6 GB  106 MB/s
     data_sent......................: 91 MB   1.5 MB/s
     http_req_blocked...............: avg=4.84µs   min=992ns   med=2.03µs   max=17.19ms  p(90)=3.53µs   p(95)=4.41µs   p(99.9)=392.84µs
     http_req_connecting............: avg=2.12µs   min=0s      med=0s       max=17.07ms  p(90)=0s       p(95)=0s       p(99.9)=356.86µs
     http_req_duration..............: avg=188.98ms min=1.88ms  med=189.79ms max=503.61ms p(90)=350.83ms p(95)=375.83ms p(99.9)=454.92ms
       { expected_response:true }...: avg=188.98ms min=1.88ms  med=189.79ms max=503.61ms p(90)=350.83ms p(95)=375.83ms p(99.9)=454.92ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 75504
     http_req_receiving.............: avg=70.35µs  min=26.55µs med=56.23µs  max=123.43ms p(90)=91.78µs  p(95)=107.37µs p(99.9)=1.13ms  
     http_req_sending...............: avg=25.89µs  min=4.68µs  med=9.48µs   max=178.33ms p(90)=15.26µs  p(95)=19.26µs  p(99.9)=2.73ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=188.89ms min=1.83ms  med=189.68ms max=503.55ms p(90)=350.75ms p(95)=375.74ms p(99.9)=454.69ms
     http_reqs......................: 75504   1208.725035/s
     iteration_duration.............: avg=191.73ms min=3.97ms  med=192.67ms max=503.78ms p(90)=351.74ms p(95)=376.51ms p(99.9)=455.32ms
     iterations.....................: 74504   1192.71628/s
     success_rate...................: 100.00% ✓ 74504       ✗ 0    
     vus............................: 77      min=0         max=493
     vus_max........................: 500     min=500       max=500
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

     checks.........................: 100.00% ✓ 106890     ✗ 0    
     data_received..................: 3.2 GB  50 MB/s
     data_sent......................: 44 MB   684 kB/s
     http_req_blocked...............: avg=12.54µs  min=1.04µs  med=2.55µs   max=159.99ms p(90)=4.4µs    p(95)=5.41µs   p(99.9)=1.38ms  
     http_req_connecting............: avg=4.62µs   min=0s      med=0s       max=14.97ms  p(90)=0s       p(95)=0s       p(99.9)=1.33ms  
     http_req_duration..............: avg=391.61ms min=3.43ms  med=363.93ms max=1.7s     p(90)=774.57ms p(95)=838.89ms p(99.9)=1.22s   
       { expected_response:true }...: avg=391.61ms min=3.43ms  med=363.93ms max=1.7s     p(90)=774.57ms p(95)=838.89ms p(99.9)=1.22s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 36630
     http_req_receiving.............: avg=82.84µs  min=29.74µs med=67.9µs   max=170.26ms p(90)=107.36µs p(95)=120.71µs p(99.9)=964.79µs
     http_req_sending...............: avg=33µs     min=4.85µs  med=11.93µs  max=141.77ms p(90)=19.95µs  p(95)=23µs     p(99.9)=2.33ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=391.5ms  min=3.33ms  med=363.83ms max=1.7s     p(90)=774.44ms p(95)=838.78ms p(99.9)=1.22s   
     http_reqs......................: 36630   570.067876/s
     iteration_duration.............: avg=402.84ms min=16.49ms med=378.7ms  max=1.71s    p(90)=777.53ms p(95)=841.74ms p(99.9)=1.23s   
     iterations.....................: 35630   554.505007/s
     success_rate...................: 100.00% ✓ 35630      ✗ 0    
     vus............................: 67      min=0        max=496
     vus_max........................: 500     min=500      max=500
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

     checks.........................: 100.00% ✓ 49026      ✗ 0    
     data_received..................: 1.5 GB  23 MB/s
     data_sent......................: 21 MB   309 kB/s
     http_req_blocked...............: avg=11.99µs  min=1.11µs  med=3.62µs   max=18.46ms p(90)=5.56µs   p(95)=7.12µs   p(99.9)=1.29ms  
     http_req_connecting............: avg=6.53µs   min=0s      med=0s       max=18.4ms  p(90)=0s       p(95)=0s       p(99.9)=1.22ms  
     http_req_duration..............: avg=835.45ms min=5.49ms  med=739.81ms max=10.94s  p(90)=1.63s    p(95)=1.84s    p(99.9)=9.84s   
       { expected_response:true }...: avg=835.45ms min=5.49ms  med=739.81ms max=10.94s  p(90)=1.63s    p(95)=1.84s    p(99.9)=9.84s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 17342
     http_req_receiving.............: avg=98.14µs  min=35.1µs  med=92.48µs  max=6.36ms  p(90)=130.29µs p(95)=147.18µs p(99.9)=990.52µs
     http_req_sending...............: avg=25.05µs  min=5.67µs  med=18.53µs  max=16.07ms p(90)=24.47µs  p(95)=28.84µs  p(99.9)=1.3ms   
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=835.33ms min=5.4ms   med=739.69ms max=10.94s  p(90)=1.63s    p(95)=1.84s    p(99.9)=9.84s   
     http_reqs......................: 17342   257.401172/s
     iteration_duration.............: avg=886.59ms min=44.51ms med=816.73ms max=10.94s  p(90)=1.67s    p(95)=1.86s    p(99.9)=10.02s  
     iterations.....................: 16342   242.558525/s
     success_rate...................: 100.00% ✓ 16342      ✗ 0    
     vus............................: 74      min=0        max=499
     vus_max........................: 500     min=500      max=500
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

     checks.........................: 100.00% ✓ 48993      ✗ 0    
     data_received..................: 1.5 GB  21 MB/s
     data_sent......................: 21 MB   291 kB/s
     http_req_blocked...............: avg=12.82µs  min=1.11µs  med=3.06µs   max=4.74ms   p(90)=4.72µs   p(95)=5.96µs   p(99.9)=2.07ms
     http_req_connecting............: avg=8.21µs   min=0s      med=0s       max=4.64ms   p(90)=0s       p(95)=0s       p(99.9)=2.05ms
     http_req_duration..............: avg=404.35ms min=7.4ms   med=453.08ms max=1.2s     p(90)=696.67ms p(95)=744.4ms  p(99.9)=1.02s 
       { expected_response:true }...: avg=404.35ms min=7.4ms   med=453.08ms max=1.2s     p(90)=696.67ms p(95)=744.4ms  p(99.9)=1.02s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 17331
     http_req_receiving.............: avg=91.58µs  min=32.19µs med=84.5µs   max=8.74ms   p(90)=123.08µs p(95)=137.78µs p(99.9)=1.01ms
     http_req_sending...............: avg=43.25µs  min=5.69µs  med=16.24µs  max=130.52ms p(90)=21.91µs  p(95)=26µs     p(99.9)=2.21ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=404.22ms min=7.28ms  med=452.94ms max=1.2s     p(90)=696.59ms p(95)=744.29ms p(99.9)=1.02s 
     http_reqs......................: 17331   237.410929/s
     iteration_duration.............: avg=429.13ms min=11.84ms med=475.95ms max=1.21s    p(90)=704.06ms p(95)=746.92ms p(99.9)=1.03s 
     iterations.....................: 16331   223.7123/s
     success_rate...................: 100.00% ✓ 16331      ✗ 0    
     vus............................: 48      min=0        max=498
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (.net subgraphs) (16.7.0-p.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 460611      ✗ 0     
     data_received..................: 14 GB   219 MB/s
     data_sent......................: 186 MB  3.0 MB/s
     http_req_blocked...............: avg=15.54µs  min=881ns   med=2.22µs   max=58.37ms  p(90)=3.94µs   p(95)=5.05µs   p(99.9)=1.8ms   
     http_req_connecting............: avg=12.51µs  min=0s      med=0s       max=58.28ms  p(90)=0s       p(95)=0s       p(99.9)=1.75ms  
     http_req_duration..............: avg=92ms     min=1.44ms  med=87.37ms  max=350.81ms p(90)=175.8ms  p(95)=191.92ms p(99.9)=249.26ms
       { expected_response:true }...: avg=92ms     min=1.44ms  med=87.37ms  max=350.81ms p(90)=175.8ms  p(95)=191.92ms p(99.9)=249.26ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 154537
     http_req_receiving.............: avg=619.12µs min=50.18µs med=104.55µs max=183.13ms p(90)=1.23ms   p(95)=2.11ms   p(99.9)=25.13ms 
     http_req_sending...............: avg=62.99µs  min=4.59µs  med=9.4µs    max=196.19ms p(90)=20.47µs  p(95)=109.32µs p(99.9)=8.36ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=91.32ms  min=1.37ms  med=86.63ms  max=333.33ms p(90)=175.01ms p(95)=191.18ms p(99.9)=247.71ms
     http_reqs......................: 154537  2501.863789/s
     iteration_duration.............: avg=92.86ms  min=3.52ms  med=88.3ms   max=360.18ms p(90)=176.27ms p(95)=192.4ms  p(99.9)=250.17ms
     iterations.....................: 153537  2485.674373/s
     success_rate...................: 100.00% ✓ 153537      ✗ 0     
     vus............................: 91      min=0         max=499 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (.net subgraphs) (16.6.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 446865      ✗ 0     
     data_received..................: 13 GB   212 MB/s
     data_sent......................: 180 MB  2.9 MB/s
     http_req_blocked...............: avg=17.16µs min=831ns   med=2.22µs   max=69.9ms   p(90)=3.88µs   p(95)=5.06µs   p(99.9)=1.28ms  
     http_req_connecting............: avg=14.3µs  min=0s      med=0s       max=69.73ms  p(90)=0s       p(95)=0s       p(99.9)=1.26ms  
     http_req_duration..............: avg=94.89ms min=1.57ms  med=82.91ms  max=1.84s    p(90)=179.33ms p(95)=207.79ms p(99.9)=698.66ms
       { expected_response:true }...: avg=94.89ms min=1.57ms  med=82.91ms  max=1.84s    p(90)=179.33ms p(95)=207.79ms p(99.9)=698.66ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 149955
     http_req_receiving.............: avg=1.38ms  min=52.25µs med=101.52µs max=594.27ms p(90)=1.61ms   p(95)=4.15ms   p(99.9)=105.1ms 
     http_req_sending...............: avg=67.46µs min=4.83µs  med=9.6µs    max=175.51ms p(90)=19.87µs  p(95)=105.03µs p(99.9)=8.76ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=93.43ms min=1.48ms  med=81.75ms  max=1.8s     p(90)=177.57ms p(95)=204.69ms p(99.9)=695.08ms
     http_reqs......................: 149955  2420.767798/s
     iteration_duration.............: avg=95.77ms min=2.43ms  med=83.91ms  max=1.84s    p(90)=179.95ms p(95)=208.45ms p(99.9)=698.94ms
     iterations.....................: 148955  2404.624503/s
     success_rate...................: 100.00% ✓ 148955      ✗ 0     
     vus............................: 53      min=0         max=499 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.7.0-p.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 439650      ✗ 0     
     data_received..................: 13 GB   209 MB/s
     data_sent......................: 177 MB  2.9 MB/s
     http_req_blocked...............: avg=16.77µs min=882ns  med=2.25µs   max=122.62ms p(90)=3.95µs   p(95)=5.17µs   p(99.9)=1.87ms  
     http_req_connecting............: avg=13.77µs min=0s     med=0s       max=122.53ms p(90)=0s       p(95)=0s       p(99.9)=1.72ms  
     http_req_duration..............: avg=96.46ms min=1.48ms med=81.55ms  max=1.43s    p(90)=182.95ms p(95)=211.91ms p(99.9)=781.14ms
       { expected_response:true }...: avg=96.46ms min=1.48ms med=81.55ms  max=1.43s    p(90)=182.95ms p(95)=211.91ms p(99.9)=781.14ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 147550
     http_req_receiving.............: avg=1.48ms  min=53.6µs med=103.93µs max=1.2s     p(90)=1.72ms   p(95)=4.63ms   p(99.9)=118.97ms
     http_req_sending...............: avg=65.62µs min=4.65µs med=9.54µs   max=200.52ms p(90)=20.34µs  p(95)=109.06µs p(99.9)=8.79ms  
     http_req_tls_handshaking.......: avg=0s      min=0s     med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=94.91ms min=1.41ms med=80.52ms  max=1.43s    p(90)=181.18ms p(95)=208.71ms p(99.9)=765.2ms 
     http_reqs......................: 147550  2383.211346/s
     iteration_duration.............: avg=97.37ms min=2.78ms med=82.55ms  max=1.43s    p(90)=183.42ms p(95)=212.85ms p(99.9)=782.48ms
     iterations.....................: 146550  2367.059456/s
     success_rate...................: 100.00% ✓ 146550      ✗ 0     
     vus............................: 51      min=0         max=499 
     vus_max........................: 500     min=500       max=500
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

     checks.........................: 100.00% ✓ 437973      ✗ 0     
     data_received..................: 13 GB   207 MB/s
     data_sent......................: 177 MB  2.8 MB/s
     http_req_blocked...............: avg=14.91µs  min=942ns   med=2.45µs  max=55.02ms  p(90)=4.39µs   p(95)=5.63µs   p(99.9)=1.12ms  
     http_req_connecting............: avg=11.69µs  min=0s      med=0s      max=54.86ms  p(90)=0s       p(95)=0s       p(99.9)=1.06ms  
     http_req_duration..............: avg=96.76ms  min=1.54ms  med=92.16ms max=279ms    p(90)=186.33ms p(95)=201.45ms p(99.9)=254.49ms
       { expected_response:true }...: avg=96.76ms  min=1.54ms  med=92.16ms max=279ms    p(90)=186.33ms p(95)=201.45ms p(99.9)=254.49ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 146991
     http_req_receiving.............: avg=122.05µs min=26.92µs med=56.48µs max=76.11ms  p(90)=133.8µs  p(95)=340.74µs p(99.9)=9.73ms  
     http_req_sending...............: avg=66.34µs  min=4.77µs  med=10.57µs max=97.27ms  p(90)=21.94µs  p(95)=121.03µs p(99.9)=8.68ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=96.57ms  min=1.49ms  med=91.96ms max=278.74ms p(90)=186.09ms p(95)=201.17ms p(99.9)=253.63ms
     http_reqs......................: 146991  2370.633085/s
     iteration_duration.............: avg=97.67ms  min=4.08ms  med=93.22ms max=305.49ms p(90)=186.78ms p(95)=201.86ms p(99.9)=255.21ms
     iterations.....................: 145991  2354.505342/s
     success_rate...................: 100.00% ✓ 145991      ✗ 0     
     vus............................: 56      min=0         max=498 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (.net subgraphs) (16.7.0-p.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 394083      ✗ 0     
     data_received..................: 12 GB   186 MB/s
     data_sent......................: 159 MB  2.6 MB/s
     http_req_blocked...............: avg=18.09µs  min=1.01µs  med=3.11µs  max=109.6ms  p(90)=5.02µs   p(95)=6.22µs   p(99.9)=2.34ms  
     http_req_connecting............: avg=13.99µs  min=0s      med=0s      max=109.53ms p(90)=0s       p(95)=0s       p(99.9)=2.29ms  
     http_req_duration..............: avg=107.51ms min=1.74ms  med=96.47ms max=1.2s     p(90)=203.28ms p(95)=234.89ms p(99.9)=676.57ms
       { expected_response:true }...: avg=107.51ms min=1.74ms  med=96.47ms max=1.2s     p(90)=203.28ms p(95)=234.89ms p(99.9)=676.57ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 132361
     http_req_receiving.............: avg=1.38ms   min=53.96µs med=117.8µs max=682.36ms p(90)=1.84ms   p(95)=4.37ms   p(99.9)=83.09ms 
     http_req_sending...............: avg=67.78µs  min=4.88µs  med=11.74µs max=150.45ms p(90)=22.68µs  p(95)=120.95µs p(99.9)=8.83ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=106.06ms min=1.66ms  med=95.26ms max=1.2s     p(90)=200.91ms p(95)=232.13ms p(99.9)=666.7ms 
     http_reqs......................: 132361  2124.903763/s
     iteration_duration.............: avg=108.6ms  min=3.57ms  med=97.72ms max=1.2s     p(90)=204ms    p(95)=235.59ms p(99.9)=678.88ms
     iterations.....................: 131361  2108.849912/s
     success_rate...................: 100.00% ✓ 131361      ✗ 0     
     vus............................: 71      min=0         max=495 
     vus_max........................: 500     min=500       max=500
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

     checks.........................: 100.00% ✓ 216207      ✗ 0    
     data_received..................: 6.4 GB  102 MB/s
     data_sent......................: 88 MB   1.4 MB/s
     http_req_blocked...............: avg=6.28µs   min=1.1µs  med=2.94µs   max=11.49ms  p(90)=4.81µs   p(95)=5.89µs   p(99.9)=477.91µs
     http_req_connecting............: avg=2.57µs   min=0s     med=0s       max=11.43ms  p(90)=0s       p(95)=0s       p(99.9)=414.57µs
     http_req_duration..............: avg=195.31ms min=1.87ms med=197.33ms max=515.51ms p(90)=360.43ms p(95)=387.69ms p(99.9)=469.43ms
       { expected_response:true }...: avg=195.31ms min=1.87ms med=197.33ms max=515.51ms p(90)=360.43ms p(95)=387.69ms p(99.9)=469.43ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 73069
     http_req_receiving.............: avg=78.4µs   min=26.6µs med=65.41µs  max=15.49ms  p(90)=106.66µs p(95)=122.05µs p(99.9)=1.23ms  
     http_req_sending...............: avg=34.07µs  min=5.15µs med=12.72µs  max=114.4ms  p(90)=20.24µs  p(95)=24.07µs  p(99.9)=3.57ms  
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=195.2ms  min=1.81ms med=197.21ms max=515.44ms p(90)=360.34ms p(95)=387.58ms p(99.9)=469.36ms
     http_reqs......................: 73069   1167.000132/s
     iteration_duration.............: avg=198.27ms min=3.65ms med=200.27ms max=515.82ms p(90)=361.32ms p(95)=388.42ms p(99.9)=470ms   
     iterations.....................: 72069   1151.028925/s
     success_rate...................: 100.00% ✓ 72069       ✗ 0    
     vus............................: 84      min=0         max=496
     vus_max........................: 500     min=500       max=500
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

     checks.........................: 100.00% ✓ 102459     ✗ 0    
     data_received..................: 3.1 GB  48 MB/s
     data_sent......................: 42 MB   653 kB/s
     http_req_blocked...............: avg=7.89µs   min=1.01µs  med=2.96µs   max=3.2ms    p(90)=4.82µs   p(95)=6µs      p(99.9)=1.17ms
     http_req_connecting............: avg=3.95µs   min=0s      med=0s       max=3.15ms   p(90)=0s       p(95)=0s       p(99.9)=1.11ms
     http_req_duration..............: avg=408.27ms min=3.77ms  med=380.65ms max=1.71s    p(90)=809.17ms p(95)=883.45ms p(99.9)=1.29s 
       { expected_response:true }...: avg=408.27ms min=3.77ms  med=380.65ms max=1.71s    p(90)=809.17ms p(95)=883.45ms p(99.9)=1.29s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 35153
     http_req_receiving.............: avg=84.34µs  min=28.2µs  med=73.65µs  max=34.86ms  p(90)=113.6µs  p(95)=128.26µs p(99.9)=1ms   
     http_req_sending...............: avg=34.6µs   min=5.18µs  med=14.47µs  max=133.07ms p(90)=22.04µs  p(95)=25.43µs  p(99.9)=2.93ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=408.15ms min=3.65ms  med=380.56ms max=1.71s    p(90)=809.08ms p(95)=883.35ms p(99.9)=1.29s 
     http_reqs......................: 35153   544.002789/s
     iteration_duration.............: avg=420.45ms min=19.34ms med=396.5ms  max=1.74s    p(90)=812.81ms p(95)=886.03ms p(99.9)=1.3s  
     iterations.....................: 34153   528.527501/s
     success_rate...................: 100.00% ✓ 34153      ✗ 0    
     vus............................: 83      min=0        max=500
     vus_max........................: 500     min=500      max=500
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

     checks.........................: 100.00% ✓ 45861      ✗ 0    
     data_received..................: 1.4 GB  21 MB/s
     data_sent......................: 20 MB   288 kB/s
     http_req_blocked...............: avg=15.39µs  min=1.28µs  med=3.82µs   max=9.59ms  p(90)=5.7µs   p(95)=7.59µs  p(99.9)=2.41ms
     http_req_connecting............: avg=9.75µs   min=0s      med=0s       max=9.51ms  p(90)=0s      p(95)=0s      p(99.9)=2.38ms
     http_req_duration..............: avg=892.58ms min=6.09ms  med=799.21ms max=4.71s   p(90)=1.8s    p(95)=2.03s   p(99.9)=4.16s 
       { expected_response:true }...: avg=892.58ms min=6.09ms  med=799.21ms max=4.71s   p(90)=1.8s    p(95)=2.03s   p(99.9)=4.16s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 16287
     http_req_receiving.............: avg=105.7µs  min=38.68µs med=92.16µs  max=25.45ms p(90)=129.6µs p(95)=146.8µs p(99.9)=1.88ms
     http_req_sending...............: avg=33.26µs  min=5.57µs  med=18.21µs  max=31.04ms p(90)=23.99µs p(95)=29.33µs p(99.9)=2.43ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s      p(95)=0s      p(99.9)=0s    
     http_req_waiting...............: avg=892.44ms min=6ms     med=799.09ms max=4.71s   p(90)=1.79s   p(95)=2.03s   p(99.9)=4.16s 
     http_reqs......................: 16287   239.728284/s
     iteration_duration.............: avg=950.98ms min=56.28ms med=880.09ms max=4.72s   p(90)=1.83s   p(95)=2.04s   p(99.9)=4.18s 
     iterations.....................: 15287   225.009288/s
     success_rate...................: 100.00% ✓ 15287      ✗ 0    
     vus............................: 35      min=0        max=500
     vus_max........................: 500     min=500      max=500
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

     checks.........................: 100.00% ✓ 45198      ✗ 0    
     data_received..................: 1.4 GB  21 MB/s
     data_sent......................: 19 MB   281 kB/s
     http_req_blocked...............: avg=11.2µs   min=1.13µs  med=3.09µs   max=6.04ms  p(90)=4.85µs   p(95)=6.61µs  p(99.9)=1.19ms  
     http_req_connecting............: avg=6.39µs   min=0s      med=0s       max=5.95ms  p(90)=0s       p(95)=0s      p(99.9)=1.15ms  
     http_req_duration..............: avg=904.3ms  min=7.62ms  med=829.66ms max=3.08s   p(90)=1.84s    p(95)=1.93s   p(99.9)=2.78s   
       { expected_response:true }...: avg=904.3ms  min=7.62ms  med=829.66ms max=3.08s   p(90)=1.84s    p(95)=1.93s   p(99.9)=2.78s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 16066
     http_req_receiving.............: avg=99.55µs  min=33.16µs med=88.89µs  max=77.12ms p(90)=129.14µs p(95)=144.7µs p(99.9)=915.52µs
     http_req_sending...............: avg=39.01µs  min=5.73µs  med=17.81µs  max=55.86ms p(90)=23.5µs   p(95)=29.02µs p(99.9)=3.11ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=904.16ms min=7.48ms  med=829.55ms max=3.08s   p(90)=1.84s    p(95)=1.93s   p(99.9)=2.77s   
     http_reqs......................: 16066   234.031233/s
     iteration_duration.............: avg=964.29ms min=56.04ms med=899.46ms max=3.09s   p(90)=1.86s    p(95)=1.94s   p(99.9)=2.79s   
     iterations.....................: 15066   219.464369/s
     success_rate...................: 100.00% ✓ 15066      ✗ 0    
     vus............................: 90      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

