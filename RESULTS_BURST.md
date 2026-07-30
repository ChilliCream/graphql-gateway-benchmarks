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
| hive-router | v0.0.84 | 2,874 | 3,056 | 2,857 | 2.4% |  |
| fusion-nightly-net11 | 16.6.0-p.7 | 2,611 | 2,706 | 2,598 | 1.4% |  |
| fusion-nightly | 16.6.0-p.7 | 2,546 | 2,644 | 2,533 | 1.4% |  |
| fusion | 16.5.1 | 2,408 | 2,480 | 2,395 | 1.2% |  |
| cosmo | 0.334.0 | 1,201 | 1,244 | 1,190 | 1.6% |  |
| hive-gateway-router-runtime | 2.10.8 | 560 | 575 | 559 | 1.0% |  |
| hive-gateway | 2.10.8 | 261 | 266 | 259 | 0.9% |  |
| apollo-gateway | 2.14.3 | 231 | 237 | 229 | 1.1% |  |
| apollo-router | v2.16.1 | — | — | — | — | non-compatible response (11281 across 9/9 runs) |
| feddi | — | — | — | — | — | not run |
| fusion-nightly-fed | — | — | — | — | — | not run |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (577115 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| fusion-nightly-net11 | 16.6.0-p.7 | 2,462 | 2,563 | 2,455 | 1.5% |  |
| fusion | 16.5.1 | 2,356 | 2,449 | 2,345 | 1.5% |  |
| fusion-nightly | 16.6.0-p.7 | 2,353 | 2,424 | 2,313 | 1.4% |  |
| fusion-nightly-fed | 16.6.0-p.7 | 2,194 | 2,302 | 2,190 | 1.7% |  |
| hive-router | v0.0.84 | 2,191 | 2,345 | 2,184 | 2.5% |  |
| cosmo | 0.334.0 | 1,173 | 1,218 | 1,168 | 1.5% |  |
| hive-gateway-router-runtime | 2.10.8 | 516 | 532 | 512 | 1.5% |  |
| hive-gateway | 2.10.8 | 248 | 254 | 246 | 1.0% |  |
| apollo-gateway | 2.14.3 | 228 | 234 | 226 | 1.1% |  |
| apollo-router | v2.16.1 | — | — | — | — | non-compatible response (17024 across 9/9 runs) |
| feddi | — | — | — | — | — | not run |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (413047 across 9/9 runs) |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.84)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 528810      ✗ 0     
     data_received..................: 16 GB   252 MB/s
     data_sent......................: 213 MB  3.5 MB/s
     http_req_blocked...............: avg=18.58µs  min=821ns   med=2.17µs  max=59.59ms  p(90)=3.77µs   p(95)=5µs      p(99.9)=1.71ms  
     http_req_connecting............: avg=15.57µs  min=0s      med=0s      max=59.44ms  p(90)=0s       p(95)=0s       p(99.9)=1.45ms  
     http_req_duration..............: avg=80.15ms  min=1.4ms   med=75.35ms max=320.89ms p(90)=154.47ms p(95)=169.58ms p(99.9)=217.86ms
       { expected_response:true }...: avg=80.15ms  min=1.4ms   med=75.35ms max=320.89ms p(90)=154.47ms p(95)=169.58ms p(99.9)=217.86ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 177270
     http_req_receiving.............: avg=145.04µs min=25.68µs med=50.39µs max=57.07ms  p(90)=138.46µs p(95)=324.25µs p(99.9)=16.7ms  
     http_req_sending...............: avg=73.29µs  min=4.71µs  med=9.12µs  max=114.61ms p(90)=17.89µs  p(95)=112.4µs  p(99.9)=10.43ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=79.93ms  min=1.35ms  med=75.13ms max=320.33ms p(90)=154.17ms p(95)=169.16ms p(99.9)=215.57ms
     http_reqs......................: 177270  2874.205074/s
     iteration_duration.............: avg=80.86ms  min=2.13ms  med=76.1ms  max=329.75ms p(90)=154.92ms p(95)=170.1ms  p(99.9)=222.4ms 
     iterations.....................: 176270  2857.99136/s
     success_rate...................: 100.00% ✓ 176270      ✗ 0     
     vus............................: 87      min=0         max=495 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (rust subgraphs) (16.6.0-p.7)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 484467      ✗ 0     
     data_received..................: 14 GB   229 MB/s
     data_sent......................: 195 MB  3.1 MB/s
     http_req_blocked...............: avg=19.08µs  min=852ns   med=2.4µs   max=76.6ms   p(90)=4.08µs   p(95)=5.18µs   p(99.9)=1.98ms  
     http_req_connecting............: avg=16.02µs  min=0s      med=0s      max=76.51ms  p(90)=0s       p(95)=0s       p(99.9)=1.93ms  
     http_req_duration..............: avg=87.49ms  min=1.87ms  med=82.43ms max=329.98ms p(90)=167.09ms p(95)=184.66ms p(99.9)=241.11ms
       { expected_response:true }...: avg=87.49ms  min=1.87ms  med=82.43ms max=329.98ms p(90)=167.09ms p(95)=184.66ms p(99.9)=241.11ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 162489
     http_req_receiving.............: avg=725.15µs min=51.45µs med=111.2µs max=194.62ms p(90)=1.48ms   p(95)=2.4ms    p(99.9)=27.13ms 
     http_req_sending...............: avg=68.38µs  min=4.49µs  med=9.25µs  max=155.17ms p(90)=19.79µs  p(95)=118.73µs p(99.9)=9.4ms   
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=86.7ms   min=1.8ms   med=81.6ms  max=323.06ms p(90)=166.24ms p(95)=183.82ms p(99.9)=239.76ms
     http_reqs......................: 162489  2611.70552/s
     iteration_duration.............: avg=88.28ms  min=3.64ms  med=83.28ms max=339.37ms p(90)=167.62ms p(95)=185.2ms  p(99.9)=242.04ms
     iterations.....................: 161489  2595.632398/s
     success_rate...................: 100.00% ✓ 161489      ✗ 0     
     vus............................: 67      min=0         max=496 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (rust subgraphs) (16.6.0-p.7)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 472593      ✗ 0     
     data_received..................: 14 GB   223 MB/s
     data_sent......................: 190 MB  3.1 MB/s
     http_req_blocked...............: avg=15.41µs min=791ns   med=2.04µs  max=91.29ms  p(90)=3.43µs   p(95)=4.46µs   p(99.9)=1.08ms  
     http_req_connecting............: avg=12.76µs min=0s      med=0s      max=91.05ms  p(90)=0s       p(95)=0s       p(99.9)=1.02ms  
     http_req_duration..............: avg=89.71ms min=1.92ms  med=79.26ms max=1.59s    p(90)=171.31ms p(95)=194.4ms  p(99.9)=793.09ms
       { expected_response:true }...: avg=89.71ms min=1.92ms  med=79.26ms max=1.59s    p(90)=171.31ms p(95)=194.4ms  p(99.9)=793.09ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 158531
     http_req_receiving.............: avg=1.28ms  min=50.68µs med=93.6µs  max=772.9ms  p(90)=1.33ms   p(95)=3.55ms   p(99.9)=110.59ms
     http_req_sending...............: avg=60.97µs min=4.55µs  med=8.56µs  max=129.78ms p(90)=16.17µs  p(95)=101.34µs p(99.9)=8.33ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=88.36ms min=1.85ms  med=78.21ms max=1.59s    p(90)=169.83ms p(95)=192.55ms p(99.9)=735.31ms
     http_reqs......................: 158531  2546.444112/s
     iteration_duration.............: avg=90.54ms min=3.26ms  med=80.34ms max=1.59s    p(90)=171.83ms p(95)=195.05ms p(99.9)=797.81ms
     iterations.....................: 157531  2530.38136/s
     success_rate...................: 100.00% ✓ 157531      ✗ 0     
     vus............................: 73      min=0         max=495 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (rust subgraphs) (16.5.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 447132      ✗ 0     
     data_received..................: 13 GB   211 MB/s
     data_sent......................: 180 MB  2.9 MB/s
     http_req_blocked...............: avg=15.14µs min=882ns   med=2.22µs  max=62.69ms  p(90)=3.74µs   p(95)=4.76µs   p(99.9)=1.74ms  
     http_req_connecting............: avg=12.17µs min=0s      med=0s      max=62.64ms  p(90)=0s       p(95)=0s       p(99.9)=1.7ms   
     http_req_duration..............: avg=94.84ms min=1.96ms  med=82.43ms max=1.48s    p(90)=178.3ms  p(95)=207.08ms p(99.9)=657.44ms
       { expected_response:true }...: avg=94.84ms min=1.96ms  med=82.43ms max=1.48s    p(90)=178.3ms  p(95)=207.08ms p(99.9)=657.44ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 150044
     http_req_receiving.............: avg=1.75ms  min=53.16µs med=101.4µs max=1.08s    p(90)=1.84ms   p(95)=5.17ms   p(99.9)=135.22ms
     http_req_sending...............: avg=60.96µs min=4.76µs  med=9.02µs  max=154.26ms p(90)=16.45µs  p(95)=105.18µs p(99.9)=7.77ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=93.03ms min=1.88ms  med=81.04ms max=1.47s    p(90)=176.4ms  p(95)=203.44ms p(99.9)=613.09ms
     http_reqs......................: 150044  2408.032238/s
     iteration_duration.............: avg=95.72ms min=3.37ms  med=83.47ms max=1.48s    p(90)=178.81ms p(95)=207.83ms p(99.9)=659.23ms
     iterations.....................: 149044  2391.983398/s
     success_rate...................: 100.00% ✓ 149044      ✗ 0     
     vus............................: 72      min=0         max=494 
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

     checks.........................: 100.00% ✓ 222171      ✗ 0    
     data_received..................: 6.6 GB  105 MB/s
     data_sent......................: 90 MB   1.4 MB/s
     http_req_blocked...............: avg=4.86µs   min=952ns   med=2.14µs   max=8.65ms   p(90)=3.62µs   p(95)=4.48µs   p(99.9)=397.91µs
     http_req_connecting............: avg=2.08µs   min=0s      med=0s       max=8.59ms   p(90)=0s       p(95)=0s       p(99.9)=348µs   
     http_req_duration..............: avg=190.13ms min=1.92ms  med=189.85ms max=591.7ms  p(90)=351.42ms p(95)=377.55ms p(99.9)=495.77ms
       { expected_response:true }...: avg=190.13ms min=1.92ms  med=189.85ms max=591.7ms  p(90)=351.42ms p(95)=377.55ms p(99.9)=495.77ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 75057
     http_req_receiving.............: avg=71.13µs  min=28.11µs med=57.24µs  max=68.59ms  p(90)=93.94µs  p(95)=108.99µs p(99.9)=1.12ms  
     http_req_sending...............: avg=27.63µs  min=4.34µs  med=9.81µs   max=126.09ms p(90)=16µs     p(95)=19.78µs  p(99.9)=2.64ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=190.03ms min=1.83ms  med=189.74ms max=591.66ms p(90)=351.35ms p(95)=377.47ms p(99.9)=495.7ms 
     http_reqs......................: 75057   1201.736673/s
     iteration_duration.............: avg=192.92ms min=4.68ms  med=192.78ms max=591.88ms p(90)=352.3ms  p(95)=378.14ms p(99.9)=497.87ms
     iterations.....................: 74057   1185.725686/s
     success_rate...................: 100.00% ✓ 74057       ✗ 0    
     vus............................: 78      min=0         max=493
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

     checks.........................: 100.00% ✓ 104976     ✗ 0    
     data_received..................: 3.2 GB  49 MB/s
     data_sent......................: 43 MB   673 kB/s
     http_req_blocked...............: avg=7.75µs   min=962ns   med=2.4µs    max=13.79ms p(90)=4.12µs   p(95)=5.09µs   p(99.9)=1.04ms  
     http_req_connecting............: avg=4.35µs   min=0s      med=0s       max=13.72ms p(90)=0s       p(95)=0s       p(99.9)=1.01ms  
     http_req_duration..............: avg=398.51ms min=3.54ms  med=370.39ms max=1.76s   p(90)=786.66ms p(95)=857.72ms p(99.9)=1.27s   
       { expected_response:true }...: avg=398.51ms min=3.54ms  med=370.39ms max=1.76s   p(90)=786.66ms p(95)=857.72ms p(99.9)=1.27s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 35992
     http_req_receiving.............: avg=83.19µs  min=30.63µs med=65.74µs  max=199ms   p(90)=103.65µs p(95)=117.5µs  p(99.9)=936.28µs
     http_req_sending...............: avg=30.32µs  min=5.15µs  med=11.64µs  max=77.38ms p(90)=19.11µs  p(95)=21.91µs  p(99.9)=2.67ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=398.4ms  min=3.49ms  med=370.29ms max=1.76s   p(90)=786.59ms p(95)=857.64ms p(99.9)=1.27s   
     http_reqs......................: 35992   560.253526/s
     iteration_duration.............: avg=410.14ms min=16.32ms med=383.61ms max=1.76s   p(90)=790.09ms p(95)=860.3ms  p(99.9)=1.28s   
     iterations.....................: 34992   544.687469/s
     success_rate...................: 100.00% ✓ 34992      ✗ 0    
     vus............................: 69      min=0        max=496
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

     checks.........................: 100.00% ✓ 49788      ✗ 0    
     data_received..................: 1.5 GB  23 MB/s
     data_sent......................: 21 MB   315 kB/s
     http_req_blocked...............: avg=13.59µs  min=1.11µs  med=3.24µs   max=9.66ms   p(90)=4.97µs   p(95)=6.38µs   p(99.9)=2.04ms  
     http_req_connecting............: avg=8.74µs   min=0s      med=0s       max=9.6ms    p(90)=0s       p(95)=0s       p(99.9)=2.02ms  
     http_req_duration..............: avg=820.98ms min=5.37ms  med=712.01ms max=19.12s   p(90)=1.38s    p(95)=1.57s    p(99.9)=16.51s  
       { expected_response:true }...: avg=820.98ms min=5.37ms  med=712.01ms max=19.12s   p(90)=1.38s    p(95)=1.57s    p(99.9)=16.51s  
     http_req_failed................: 0.00%   ✓ 0          ✗ 17596
     http_req_receiving.............: avg=107.21µs min=31.79µs med=91.41µs  max=127.09ms p(90)=127.36µs p(95)=142.28µs p(99.9)=828.38µs
     http_req_sending...............: avg=36.48µs  min=5.99µs  med=18.43µs  max=68.01ms  p(90)=23.75µs  p(95)=28.17µs  p(99.9)=2.77ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=820.84ms min=5.29ms  med=711.85ms max=19.12s   p(90)=1.38s    p(95)=1.57s    p(99.9)=16.51s  
     http_reqs......................: 17596   261.975392/s
     iteration_duration.............: avg=870.52ms min=23.75ms med=765.63ms max=19.12s   p(90)=1.4s     p(95)=1.58s    p(99.9)=16.68s  
     iterations.....................: 16596   247.087043/s
     success_rate...................: 100.00% ✓ 16596      ✗ 0    
     vus............................: 57      min=0        max=499
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

     checks.........................: 100.00% ✓ 47871      ✗ 0    
     data_received..................: 1.5 GB  20 MB/s
     data_sent......................: 21 MB   283 kB/s
     http_req_blocked...............: avg=14.1µs   min=1.13µs  med=3µs      max=10.6ms  p(90)=4.6µs    p(95)=5.83µs   p(99.9)=2.1ms 
     http_req_connecting............: avg=9.56µs   min=0s      med=0s       max=10.55ms p(90)=0s       p(95)=0s       p(99.9)=2.08ms
     http_req_duration..............: avg=434.78ms min=7.64ms  med=500.86ms max=1.22s   p(90)=743.32ms p(95)=796.79ms p(99.9)=1.1s  
       { expected_response:true }...: avg=434.78ms min=7.64ms  med=500.86ms max=1.22s   p(90)=743.32ms p(95)=796.79ms p(99.9)=1.1s  
     http_req_failed................: 0.00%   ✓ 0          ✗ 16957
     http_req_receiving.............: avg=90.13µs  min=29.08µs med=81.94µs  max=19.33ms p(90)=122.09µs p(95)=138.56µs p(99.9)=1.11ms
     http_req_sending...............: avg=39.09µs  min=5.67µs  med=16.17µs  max=95.15ms p(90)=21.6µs   p(95)=25.66µs  p(99.9)=3.03ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=434.65ms min=7.53ms  med=500.77ms max=1.22s   p(90)=743.19ms p(95)=796.66ms p(99.9)=1.1s  
     http_reqs......................: 16957   231.405867/s
     iteration_duration.............: avg=462.01ms min=12.95ms med=529.89ms max=1.23s   p(90)=747.69ms p(95)=801.8ms  p(99.9)=1.12s 
     iterations.....................: 15957   217.759239/s
     success_rate...................: 100.00% ✓ 15957      ✗ 0    
     vus............................: 58      min=0        max=495
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (.net subgraphs) (16.6.0-p.7)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 453555      ✗ 0     
     data_received..................: 13 GB   216 MB/s
     data_sent......................: 183 MB  3.0 MB/s
     http_req_blocked...............: avg=17.41µs  min=911ns   med=2.25µs   max=54.46ms  p(90)=3.99µs   p(95)=5.15µs   p(99.9)=1.21ms  
     http_req_connecting............: avg=14.47µs  min=0s      med=0s       max=54.36ms  p(90)=0s       p(95)=0s       p(99.9)=1.17ms  
     http_req_duration..............: avg=93.43ms  min=1.38ms  med=88.66ms  max=380.52ms p(90)=178.07ms p(95)=194.94ms p(99.9)=254.71ms
       { expected_response:true }...: avg=93.43ms  min=1.38ms  med=88.66ms  max=380.52ms p(90)=178.07ms p(95)=194.94ms p(99.9)=254.71ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 152185
     http_req_receiving.............: avg=757.79µs min=52.57µs med=116.87µs max=81.86ms  p(90)=1.62ms   p(95)=2.57ms   p(99.9)=27ms    
     http_req_sending...............: avg=64.71µs  min=4.73µs  med=9.57µs   max=132.54ms p(90)=21.3µs   p(95)=112.83µs p(99.9)=8.8ms   
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=92.61ms  min=1.3ms   med=87.84ms  max=372.81ms p(90)=177.19ms p(95)=194.18ms p(99.9)=253.41ms
     http_reqs......................: 152185  2462.892555/s
     iteration_duration.............: avg=94.31ms  min=3.45ms  med=89.65ms  max=380.74ms p(90)=178.57ms p(95)=195.39ms p(99.9)=255.93ms
     iterations.....................: 151185  2446.709012/s
     success_rate...................: 100.00% ✓ 151185      ✗ 0     
     vus............................: 91      min=0         max=500 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (.net subgraphs) (16.5.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 434619      ✗ 0     
     data_received..................: 13 GB   207 MB/s
     data_sent......................: 175 MB  2.8 MB/s
     http_req_blocked...............: avg=16.08µs min=821ns   med=2.26µs   max=63.75ms  p(90)=3.99µs   p(95)=5.13µs   p(99.9)=1.02ms  
     http_req_connecting............: avg=13.1µs  min=0s      med=0s       max=63.69ms  p(90)=0s       p(95)=0s       p(99.9)=986.07µs
     http_req_duration..............: avg=97.55ms min=1.49ms  med=85.11ms  max=1.27s    p(90)=182.34ms p(95)=210.6ms  p(99.9)=731.41ms
       { expected_response:true }...: avg=97.55ms min=1.49ms  med=85.11ms  max=1.27s    p(90)=182.34ms p(95)=210.6ms  p(99.9)=731.41ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 145873
     http_req_receiving.............: avg=1.45ms  min=51.44µs med=102.58µs max=779.08ms p(90)=1.53ms   p(95)=3.7ms    p(99.9)=111.3ms 
     http_req_sending...............: avg=62.69µs min=4.71µs  med=9.48µs   max=238.79ms p(90)=19.99µs  p(95)=103.3µs  p(99.9)=8.61ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=96.03ms min=1.41ms  med=83.95ms  max=1.27s    p(90)=180.8ms  p(95)=207.1ms  p(99.9)=619.71ms
     http_reqs......................: 145873  2356.636109/s
     iteration_duration.............: avg=98.49ms min=3.19ms  med=86.22ms  max=1.27s    p(90)=182.88ms p(95)=211.52ms p(99.9)=731.71ms
     iterations.....................: 144873  2340.480713/s
     success_rate...................: 100.00% ✓ 144873      ✗ 0     
     vus............................: 52      min=0         max=499 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.6.0-p.7)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 434385      ✗ 0     
     data_received..................: 13 GB   206 MB/s
     data_sent......................: 175 MB  2.8 MB/s
     http_req_blocked...............: avg=16.26µs min=861ns  med=2.23µs   max=50.62ms  p(90)=3.86µs   p(95)=5.01µs   p(99.9)=1.46ms  
     http_req_connecting............: avg=12.85µs min=0s     med=0s       max=50.57ms  p(90)=0s       p(95)=0s       p(99.9)=1.36ms  
     http_req_duration..............: avg=97.61ms min=1.53ms med=83.81ms  max=1.12s    p(90)=184.54ms p(95)=213.42ms p(99.9)=746.43ms
       { expected_response:true }...: avg=97.61ms min=1.53ms med=83.81ms  max=1.12s    p(90)=184.54ms p(95)=213.42ms p(99.9)=746.43ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 145795
     http_req_receiving.............: avg=1.74ms  min=52.4µs med=107.47µs max=708.28ms p(90)=1.79ms   p(95)=4.91ms   p(99.9)=113.82ms
     http_req_sending...............: avg=63.85µs min=4.6µs  med=9.41µs   max=129.78ms p(90)=19.74µs  p(95)=103.61µs p(99.9)=8.54ms  
     http_req_tls_handshaking.......: avg=0s      min=0s     med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=95.8ms  min=1.44ms med=82.62ms  max=1.12s    p(90)=182.27ms p(95)=208.12ms p(99.9)=696.48ms
     http_reqs......................: 145795  2353.991841/s
     iteration_duration.............: avg=98.53ms min=2.83ms med=84.78ms  max=1.12s    p(90)=185.12ms p(95)=214.26ms p(99.9)=747.54ms
     iterations.....................: 144795  2337.845938/s
     success_rate...................: 100.00% ✓ 144795      ✗ 0     
     vus............................: 53      min=0         max=499 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (.net subgraphs) (16.6.0-p.7)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 407571      ✗ 0     
     data_received..................: 12 GB   192 MB/s
     data_sent......................: 164 MB  2.6 MB/s
     http_req_blocked...............: avg=18.25µs  min=962ns   med=2.89µs   max=73.47ms  p(90)=4.87µs   p(95)=6.07µs   p(99.9)=2.19ms  
     http_req_connecting............: avg=14.62µs  min=0s      med=0s       max=73.38ms  p(90)=0s       p(95)=0s       p(99.9)=2.14ms  
     http_req_duration..............: avg=104.01ms min=1.77ms  med=91.8ms   max=1.49s    p(90)=198.73ms p(95)=227.8ms  p(99.9)=660.85ms
       { expected_response:true }...: avg=104.01ms min=1.77ms  med=91.8ms   max=1.49s    p(90)=198.73ms p(95)=227.8ms  p(99.9)=660.85ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 136857
     http_req_receiving.............: avg=1.41ms   min=52.89µs med=111.33µs max=550.84ms p(90)=1.54ms   p(95)=4.04ms   p(99.9)=83.82ms 
     http_req_sending...............: avg=70.26µs  min=5.17µs  med=11.56µs  max=84.59ms  p(90)=22.92µs  p(95)=120.18µs p(99.9)=9.5ms   
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=102.52ms min=1.69ms  med=90.74ms  max=1.49s    p(90)=196.87ms p(95)=224.61ms p(99.9)=655.46ms
     http_reqs......................: 136857  2194.58527/s
     iteration_duration.............: avg=105.04ms min=3.66ms  med=92.89ms  max=1.49s    p(90)=199.29ms p(95)=228.5ms  p(99.9)=661.55ms
     iterations.....................: 135857  2178.549662/s
     success_rate...................: 100.00% ✓ 135857      ✗ 0     
     vus............................: 73      min=0         max=494 
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

     checks.........................: 100.00% ✓ 404982      ✗ 0     
     data_received..................: 12 GB   192 MB/s
     data_sent......................: 163 MB  2.6 MB/s
     http_req_blocked...............: avg=8.59µs   min=881ns   med=2.25µs   max=30.42ms  p(90)=3.8µs    p(95)=4.91µs   p(99.9)=434.14µs
     http_req_connecting............: avg=5.7µs    min=0s      med=0s       max=30.28ms  p(90)=0s       p(95)=0s       p(99.9)=367.98µs
     http_req_duration..............: avg=104.64ms min=1.6ms   med=99.97ms  max=338.18ms p(90)=201.81ms p(95)=216.54ms p(99.9)=257.93ms
       { expected_response:true }...: avg=104.64ms min=1.6ms   med=99.97ms  max=338.18ms p(90)=201.81ms p(95)=216.54ms p(99.9)=257.93ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 135994
     http_req_receiving.............: avg=95.37µs  min=27.32µs med=53.35µs  max=245.92ms p(90)=100.97µs p(95)=263.43µs p(99.9)=5.08ms  
     http_req_sending...............: avg=55.05µs  min=4.82µs  med=10.25µs  max=297.02ms p(90)=17.88µs  p(95)=97.36µs  p(99.9)=6.78ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=104.49ms min=1.53ms  med=99.8ms   max=338.03ms p(90)=201.63ms p(95)=216.36ms p(99.9)=256.99ms
     http_reqs......................: 135994  2191.736166/s
     iteration_duration.............: avg=105.64ms min=4.3ms   med=101.18ms max=349.03ms p(90)=202.22ms p(95)=216.91ms p(99.9)=258.47ms
     iterations.....................: 134994  2175.619748/s
     success_rate...................: 100.00% ✓ 134994      ✗ 0     
     vus............................: 59      min=0         max=498 
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

     checks.........................: 100.00% ✓ 217371      ✗ 0    
     data_received..................: 6.4 GB  103 MB/s
     data_sent......................: 88 MB   1.4 MB/s
     http_req_blocked...............: avg=6.21µs   min=1.18µs  med=3.16µs   max=5.1ms    p(90)=5.06µs   p(95)=6.07µs   p(99.9)=497.35µs
     http_req_connecting............: avg=2.33µs   min=0s      med=0s       max=5.04ms   p(90)=0s       p(95)=0s       p(99.9)=431.38µs
     http_req_duration..............: avg=194.25ms min=1.93ms  med=194.38ms max=516.06ms p(90)=359.39ms p(95)=385.05ms p(99.9)=464.5ms 
       { expected_response:true }...: avg=194.25ms min=1.93ms  med=194.38ms max=516.06ms p(90)=359.39ms p(95)=385.05ms p(99.9)=464.5ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 73457
     http_req_receiving.............: avg=81.77µs  min=27.67µs med=65.75µs  max=116.69ms p(90)=107.28µs p(95)=123.4µs  p(99.9)=1.42ms  
     http_req_sending...............: avg=29.68µs  min=5.14µs  med=12.8µs   max=31.75ms  p(90)=20.47µs  p(95)=24.25µs  p(99.9)=3.32ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=194.14ms min=1.84ms  med=194.25ms max=516ms    p(90)=359.27ms p(95)=384.93ms p(99.9)=464.42ms
     http_reqs......................: 73457   1173.278888/s
     iteration_duration.............: avg=197.19ms min=4.75ms  med=197.85ms max=516.26ms p(90)=360.22ms p(95)=385.69ms p(99.9)=464.83ms
     iterations.....................: 72457   1157.306566/s
     success_rate...................: 100.00% ✓ 72457       ✗ 0    
     vus............................: 86      min=0         max=497
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

     checks.........................: 100.00% ✓ 97302      ✗ 0    
     data_received..................: 2.9 GB  45 MB/s
     data_sent......................: 40 MB   620 kB/s
     http_req_blocked...............: avg=8.07µs   min=1.11µs  med=2.75µs   max=3.71ms   p(90)=4.48µs   p(95)=5.44µs   p(99.9)=1.36ms
     http_req_connecting............: avg=4.37µs   min=0s      med=0s       max=3.67ms   p(90)=0s       p(95)=0s       p(99.9)=1.33ms
     http_req_duration..............: avg=429.29ms min=3.89ms  med=398.65ms max=2.19s    p(90)=844.1ms  p(95)=920.5ms  p(99.9)=1.39s 
       { expected_response:true }...: avg=429.29ms min=3.89ms  med=398.65ms max=2.19s    p(90)=844.1ms  p(95)=920.5ms  p(99.9)=1.39s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 33434
     http_req_receiving.............: avg=95.02µs  min=30.59µs med=73.15µs  max=201.65ms p(90)=111.59µs p(95)=126.14µs p(99.9)=1.3ms 
     http_req_sending...............: avg=32.96µs  min=4.76µs  med=13.34µs  max=183.61ms p(90)=20.54µs  p(95)=23.44µs  p(99.9)=2.7ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=429.16ms min=3.81ms  med=398.46ms max=2.19s    p(90)=843.9ms  p(95)=920.38ms p(99.9)=1.39s 
     http_reqs......................: 33434   516.278193/s
     iteration_duration.............: avg=442.77ms min=14.83ms med=412.63ms max=2.2s     p(90)=847.98ms p(95)=923.4ms  p(99.9)=1.39s 
     iterations.....................: 32434   500.836481/s
     success_rate...................: 100.00% ✓ 32434      ✗ 0    
     vus............................: 90      min=0        max=500
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

     checks.........................: 100.00% ✓ 47232      ✗ 0    
     data_received..................: 1.5 GB  22 MB/s
     data_sent......................: 20 MB   298 kB/s
     http_req_blocked...............: avg=13.93µs  min=1.24µs  med=3.91µs   max=9.21ms   p(90)=6µs     p(95)=7.86µs   p(99.9)=1.85ms
     http_req_connecting............: avg=7.98µs   min=0s      med=0s       max=9.13ms   p(90)=0s      p(95)=0s       p(99.9)=1.72ms
     http_req_duration..............: avg=869.11ms min=5.76ms  med=783.6ms  max=4.51s    p(90)=1.72s   p(95)=1.95s    p(99.9)=3.87s 
       { expected_response:true }...: avg=869.11ms min=5.76ms  med=783.6ms  max=4.51s    p(90)=1.72s   p(95)=1.95s    p(99.9)=3.87s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 16744
     http_req_receiving.............: avg=105.83µs min=34.96µs med=96.19µs  max=25.54ms  p(90)=136.2µs p(95)=152.76µs p(99.9)=1.3ms 
     http_req_sending...............: avg=47.11µs  min=5.84µs  med=19.44µs  max=160.05ms p(90)=25.69µs p(95)=31.11µs  p(99.9)=3.38ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=868.96ms min=5.62ms  med=783.49ms max=4.51s    p(90)=1.72s   p(95)=1.95s    p(99.9)=3.87s 
     http_reqs......................: 16744   248.265812/s
     iteration_duration.............: avg=924.46ms min=26.74ms med=848.86ms max=4.52s    p(90)=1.73s   p(95)=1.99s    p(99.9)=3.9s  
     iterations.....................: 15744   233.438662/s
     success_rate...................: 100.00% ✓ 15744      ✗ 0    
     vus............................: 72      min=0        max=500
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

     checks.........................: 100.00% ✓ 44274      ✗ 0    
     data_received..................: 1.4 GB  20 MB/s
     data_sent......................: 19 MB   275 kB/s
     http_req_blocked...............: avg=14.49µs  min=1.45µs  med=3.79µs   max=3.22ms  p(90)=5.58µs   p(95)=7.48µs   p(99.9)=2.42ms
     http_req_connecting............: avg=8.84µs   min=0s      med=0s       max=3.19ms  p(90)=0s       p(95)=0s       p(99.9)=2.4ms 
     http_req_duration..............: avg=921.52ms min=7.78ms  med=834.88ms max=3.72s   p(90)=1.86s    p(95)=1.99s    p(99.9)=2.79s 
       { expected_response:true }...: avg=921.52ms min=7.78ms  med=834.88ms max=3.72s   p(90)=1.86s    p(95)=1.99s    p(99.9)=2.79s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 15758
     http_req_receiving.............: avg=99.07µs  min=37.06µs med=90.95µs  max=9.13ms  p(90)=130.98µs p(95)=146.37µs p(99.9)=1.07ms
     http_req_sending...............: avg=30.39µs  min=6.32µs  med=17.66µs  max=22.09ms p(90)=23.52µs  p(95)=29.34µs  p(99.9)=2.89ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=921.39ms min=7.66ms  med=834.75ms max=3.72s   p(90)=1.86s    p(95)=1.99s    p(99.9)=2.79s 
     http_reqs......................: 15758   228.971765/s
     iteration_duration.............: avg=983.88ms min=34.64ms med=923.58ms max=3.73s   p(90)=1.88s    p(95)=2s       p(99.9)=2.81s 
     iterations.....................: 14758   214.441256/s
     success_rate...................: 100.00% ✓ 14758      ✗ 0    
     vus............................: 98      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

