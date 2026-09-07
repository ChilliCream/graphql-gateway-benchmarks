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
| hive-router | v0.0.84 | 2,747 | 2,871 | 2,714 | 2.1% |  |
| fusion-nightly-net11 | 16.7.0-p.3 | 2,644 | 2,755 | 2,607 | 1.9% |  |
| fusion | 16.6.4 | 2,526 | 2,628 | 2,510 | 1.5% |  |
| fusion-nightly | 16.7.0-p.3 | 2,467 | 2,558 | 2,421 | 2.2% |  |
| fusion-nightly-fed | 16.7.0-p.3 | 2,289 | 2,386 | 2,283 | 1.6% |  |
| cosmo | 0.334.0 | 1,236 | 1,272 | 1,230 | 1.2% |  |
| hive-gateway-router-runtime | 2.10.8 | 580 | 590 | 576 | 0.9% |  |
| hive-gateway | 2.10.8 | 256 | 261 | 254 | 0.9% |  |
| apollo-gateway | 2.14.3 | 231 | 239 | 231 | 1.1% |  |
| apollo-router | v2.16.1 | — | — | — | — | non-compatible response (8771 across 9/9 runs) |
| feddi | — | — | — | — | — | not run |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (561161 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| fusion-nightly-net11 | 16.7.0-p.3 | 2,473 | 2,575 | 2,460 | 1.6% |  |
| fusion-nightly | 16.7.0-p.3 | 2,419 | 2,518 | 2,402 | 1.7% |  |
| fusion | 16.6.4 | 2,400 | 2,493 | 2,393 | 1.4% |  |
| hive-router | v0.0.84 | 2,365 | 2,525 | 2,358 | 2.5% |  |
| fusion-nightly-fed | 16.7.0-p.3 | 2,137 | 2,236 | 2,118 | 1.8% |  |
| cosmo | 0.334.0 | 1,169 | 1,208 | 1,162 | 1.3% |  |
| hive-gateway-router-runtime | 2.10.8 | 531 | 547 | 527 | 1.5% |  |
| hive-gateway | 2.10.8 | 246 | 251 | 244 | 1.0% |  |
| apollo-gateway | 2.14.3 | 233 | 236 | 232 | 0.6% |  |
| apollo-router | v2.16.1 | — | — | — | — | non-compatible response (25461 across 9/9 runs) |
| feddi | — | — | — | — | — | not run |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (461457 across 9/9 runs) |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.84)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 505437      ✗ 0     
     data_received..................: 15 GB   241 MB/s
     data_sent......................: 204 MB  3.3 MB/s
     http_req_blocked...............: avg=15.14µs  min=892ns   med=2.07µs  max=44.03ms  p(90)=3.49µs   p(95)=4.58µs   p(99.9)=1.38ms  
     http_req_connecting............: avg=12.35µs  min=0s      med=0s      max=43.88ms  p(90)=0s       p(95)=0s       p(99.9)=1.26ms  
     http_req_duration..............: avg=83.9ms   min=1.38ms  med=78.3ms  max=324.35ms p(90)=162.59ms p(95)=175.47ms p(99.9)=220.87ms
       { expected_response:true }...: avg=83.9ms   min=1.38ms  med=78.3ms  max=324.35ms p(90)=162.59ms p(95)=175.47ms p(99.9)=220.87ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 169479
     http_req_receiving.............: avg=127.02µs min=27.03µs med=50.44µs max=127.01ms p(90)=111.08µs p(95)=302.69µs p(99.9)=14.57ms 
     http_req_sending...............: avg=61.06µs  min=4.21µs  med=8.99µs  max=200.22ms p(90)=16.4µs   p(95)=104.56µs p(99.9)=8.18ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=83.71ms  min=1.34ms  med=78.14ms max=310.53ms p(90)=162.33ms p(95)=175.25ms p(99.9)=220.01ms
     http_reqs......................: 169479  2747.305379/s
     iteration_duration.............: avg=84.62ms  min=2.03ms  med=79.11ms max=346.44ms p(90)=162.97ms p(95)=175.86ms p(99.9)=221.62ms
     iterations.....................: 168479  2731.095079/s
     success_rate...................: 100.00% ✓ 168479      ✗ 0     
     vus............................: 87      min=0         max=495 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (rust subgraphs) (16.7.0-p.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 491151      ✗ 0     
     data_received..................: 14 GB   232 MB/s
     data_sent......................: 198 MB  3.2 MB/s
     http_req_blocked...............: avg=18.3µs   min=852ns   med=2.06µs  max=63.94ms  p(90)=3.45µs   p(95)=4.48µs   p(99.9)=1.56ms  
     http_req_connecting............: avg=15.42µs  min=0s      med=0s      max=63.89ms  p(90)=0s       p(95)=0s       p(99.9)=1.44ms  
     http_req_duration..............: avg=86.31ms  min=1.88ms  med=81.37ms max=308.47ms p(90)=166.05ms p(95)=181.6ms  p(99.9)=239.36ms
       { expected_response:true }...: avg=86.31ms  min=1.88ms  med=81.37ms max=308.47ms p(90)=166.05ms p(95)=181.6ms  p(99.9)=239.36ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 164717
     http_req_receiving.............: avg=591.25µs min=51.59µs med=99.89µs max=90.6ms   p(90)=1.11ms   p(95)=1.97ms   p(99.9)=26.11ms 
     http_req_sending...............: avg=64.92µs  min=4.62µs  med=8.89µs  max=162.51ms p(90)=17.42µs  p(95)=106.76µs p(99.9)=9.04ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=85.65ms  min=1.78ms  med=80.67ms max=308.37ms p(90)=165.28ms p(95)=180.82ms p(99.9)=238.93ms
     http_reqs......................: 164717  2644.831555/s
     iteration_duration.............: avg=87.08ms  min=3.31ms  med=82.17ms max=308.63ms p(90)=166.48ms p(95)=182.09ms p(99.9)=240.06ms
     iterations.....................: 163717  2628.774733/s
     success_rate...................: 100.00% ✓ 163717      ✗ 0     
     vus............................: 69      min=0         max=495 
     vus_max........................: 500     min=500       max=500
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

     checks.........................: 100.00% ✓ 470349      ✗ 0     
     data_received..................: 14 GB   222 MB/s
     data_sent......................: 190 MB  3.0 MB/s
     http_req_blocked...............: avg=17.06µs min=852ns   med=2.05µs  max=72.53ms  p(90)=3.46µs   p(95)=4.5µs    p(99.9)=1.56ms  
     http_req_connecting............: avg=14.15µs min=0s      med=0s      max=72.44ms  p(90)=0s       p(95)=0s       p(99.9)=1.51ms  
     http_req_duration..............: avg=90.17ms min=1.94ms  med=80.49ms max=1.68s    p(90)=166.92ms p(95)=193.08ms p(99.9)=703.7ms 
       { expected_response:true }...: avg=90.17ms min=1.94ms  med=80.49ms max=1.68s    p(90)=166.92ms p(95)=193.08ms p(99.9)=703.7ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 157783
     http_req_receiving.............: avg=1.34ms  min=50.38µs med=94.23µs max=549.15ms p(90)=1.52ms   p(95)=4.14ms   p(99.9)=86.31ms 
     http_req_sending...............: avg=64.21µs min=4.59µs  med=8.61µs  max=239.6ms  p(90)=16.08µs  p(95)=99.18µs  p(99.9)=8.72ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=88.76ms min=1.87ms  med=79.39ms max=1.68s    p(90)=165.39ms p(95)=190.89ms p(99.9)=671.07ms
     http_reqs......................: 157783  2526.935919/s
     iteration_duration.............: avg=91ms    min=3.18ms  med=81.28ms max=1.68s    p(90)=167.45ms p(95)=193.72ms p(99.9)=711.67ms
     iterations.....................: 156783  2510.920658/s
     success_rate...................: 100.00% ✓ 156783      ✗ 0     
     vus............................: 76      min=0         max=493 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (rust subgraphs) (16.7.0-p.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 458259      ✗ 0     
     data_received..................: 14 GB   216 MB/s
     data_sent......................: 185 MB  3.0 MB/s
     http_req_blocked...............: avg=22.07µs min=981ns   med=2.54µs   max=66.17ms  p(90)=4.06µs   p(95)=5.14µs   p(99.9)=2.27ms  
     http_req_connecting............: avg=18.5µs  min=0s      med=0s       max=66.09ms  p(90)=0s       p(95)=0s       p(99.9)=2.14ms  
     http_req_duration..............: avg=92.51ms min=1.97ms  med=79.83ms  max=1.51s    p(90)=177.13ms p(95)=202.18ms p(99.9)=632.5ms 
       { expected_response:true }...: avg=92.51ms min=1.97ms  med=79.83ms  max=1.51s    p(90)=177.13ms p(95)=202.18ms p(99.9)=632.5ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 153753
     http_req_receiving.............: avg=1.3ms   min=52.86µs med=101.47µs max=847.87ms p(90)=1.6ms    p(95)=4.34ms   p(99.9)=77.92ms 
     http_req_sending...............: avg=74.64µs min=4.55µs  med=9.33µs   max=226.48ms p(90)=17.51µs  p(95)=115.89µs p(99.9)=10.27ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=91.12ms min=1.87ms  med=78.6ms   max=1.51s    p(90)=175.39ms p(95)=199.56ms p(99.9)=625.09ms
     http_reqs......................: 153753  2467.041325/s
     iteration_duration.............: avg=93.38ms min=3.38ms  med=80.77ms  max=1.51s    p(90)=177.69ms p(95)=202.87ms p(99.9)=633.18ms
     iterations.....................: 152753  2450.995841/s
     success_rate...................: 100.00% ✓ 152753      ✗ 0     
     vus............................: 72      min=0         max=494 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (rust subgraphs) (16.7.0-p.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 423264      ✗ 0     
     data_received..................: 13 GB   201 MB/s
     data_sent......................: 171 MB  2.7 MB/s
     http_req_blocked...............: avg=14.67µs  min=892ns   med=2.36µs   max=46.85ms p(90)=3.86µs   p(95)=4.85µs   p(99.9)=1.68ms  
     http_req_connecting............: avg=11.32µs  min=0s      med=0s       max=42.79ms p(90)=0s       p(95)=0s       p(99.9)=1.52ms  
     http_req_duration..............: avg=100.26ms min=1.66ms  med=87.41ms  max=2.03s   p(90)=190.98ms p(95)=221.98ms p(99.9)=770.67ms
       { expected_response:true }...: avg=100.26ms min=1.66ms  med=87.41ms  max=2.03s   p(90)=190.98ms p(95)=221.98ms p(99.9)=770.67ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 142088
     http_req_receiving.............: avg=1.72ms   min=53.52µs med=106.23µs max=1.05s   p(90)=1.98ms   p(95)=5.16ms   p(99.9)=108.95ms
     http_req_sending...............: avg=62.53µs  min=4.3µs   med=9.28µs   max=167.6ms p(90)=16.29µs  p(95)=98.76µs  p(99.9)=8.04ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=98.47ms  min=1.6ms   med=86.1ms   max=2.03s   p(90)=188.74ms p(95)=217.88ms p(99.9)=761.25ms
     http_reqs......................: 142088  2289.363144/s
     iteration_duration.............: avg=101.21ms min=2.79ms  med=88.49ms  max=2.03s   p(90)=191.6ms  p(95)=222.74ms p(99.9)=770.91ms
     iterations.....................: 141088  2273.250853/s
     success_rate...................: 100.00% ✓ 141088      ✗ 0     
     vus............................: 62      min=0         max=497 
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

     checks.........................: 100.00% ✓ 228804      ✗ 0    
     data_received..................: 6.8 GB  109 MB/s
     data_sent......................: 93 MB   1.5 MB/s
     http_req_blocked...............: avg=5.67µs   min=1.04µs  med=2.59µs   max=17.25ms  p(90)=4.26µs   p(95)=5.18µs   p(99.9)=454.17µs
     http_req_connecting............: avg=2.36µs   min=0s      med=0s       max=17.1ms   p(90)=0s       p(95)=0s       p(99.9)=352.54µs
     http_req_duration..............: avg=184.64ms min=1.91ms  med=186.74ms max=535.09ms p(90)=343.06ms p(95)=366.84ms p(99.9)=460.91ms
       { expected_response:true }...: avg=184.64ms min=1.91ms  med=186.74ms max=535.09ms p(90)=343.06ms p(95)=366.84ms p(99.9)=460.91ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 77268
     http_req_receiving.............: avg=78.85µs  min=28.05µs med=62.75µs  max=126.87ms p(90)=100.85µs p(95)=116.8µs  p(99.9)=1.21ms  
     http_req_sending...............: avg=31.12µs  min=4.85µs  med=11.02µs  max=126.77ms p(90)=17.95µs  p(95)=22.05µs  p(99.9)=3.09ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=184.53ms min=1.85ms  med=186.65ms max=534.97ms p(90)=342.94ms p(95)=366.74ms p(99.9)=460.83ms
     http_reqs......................: 77268   1236.465478/s
     iteration_duration.............: avg=187.29ms min=4.93ms  med=189.67ms max=535.37ms p(90)=343.87ms p(95)=367.46ms p(99.9)=461.55ms
     iterations.....................: 76268   1220.463181/s
     success_rate...................: 100.00% ✓ 76268       ✗ 0    
     vus............................: 79      min=0         max=493
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

     checks.........................: 100.00% ✓ 108804     ✗ 0    
     data_received..................: 3.3 GB  51 MB/s
     data_sent......................: 45 MB   697 kB/s
     http_req_blocked...............: avg=9.02µs   min=1.11µs  med=3.19µs   max=13.72ms  p(90)=4.93µs   p(95)=5.96µs   p(99.9)=1.14ms  
     http_req_connecting............: avg=4.85µs   min=0s      med=0s       max=13.65ms  p(90)=0s       p(95)=0s       p(99.9)=1.11ms  
     http_req_duration..............: avg=384.88ms min=3.54ms  med=360.43ms max=1.52s    p(90)=757.14ms p(95)=822.5ms  p(99.9)=1.21s   
       { expected_response:true }...: avg=384.88ms min=3.54ms  med=360.43ms max=1.52s    p(90)=757.14ms p(95)=822.5ms  p(99.9)=1.21s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 37268
     http_req_receiving.............: avg=84.01µs  min=32.12µs med=72.82µs  max=34.04ms  p(90)=111.91µs p(95)=127.41µs p(99.9)=949.05µs
     http_req_sending...............: avg=30.85µs  min=5.26µs  med=14.22µs  max=131.67ms p(90)=22.03µs  p(95)=25.13µs  p(99.9)=2.73ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=384.76ms min=3.47ms  med=360.31ms max=1.52s    p(90)=757.04ms p(95)=822.42ms p(99.9)=1.21s   
     http_reqs......................: 37268   580.431865/s
     iteration_duration.............: avg=395.74ms min=27.35ms med=372.39ms max=1.53s    p(90)=759.78ms p(95)=825.39ms p(99.9)=1.21s   
     iterations.....................: 36268   564.857327/s
     success_rate...................: 100.00% ✓ 36268      ✗ 0    
     vus............................: 66      min=0        max=496
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

     checks.........................: 100.00% ✓ 48897      ✗ 0    
     data_received..................: 1.5 GB  23 MB/s
     data_sent......................: 21 MB   309 kB/s
     http_req_blocked...............: avg=12.37µs  min=1.59µs  med=3.85µs   max=7.25ms  p(90)=5.69µs   p(95)=7.07µs   p(99.9)=1.49ms  
     http_req_connecting............: avg=6.71µs   min=0s      med=0s       max=7.19ms  p(90)=0s       p(95)=0s       p(99.9)=1.4ms   
     http_req_duration..............: avg=829.16ms min=5.45ms  med=731.4ms  max=17.03s  p(90)=1.45s    p(95)=1.65s    p(99.9)=14.85s  
       { expected_response:true }...: avg=829.16ms min=5.45ms  med=731.4ms  max=17.03s  p(90)=1.45s    p(95)=1.65s    p(99.9)=14.85s  
     http_req_failed................: 0.00%   ✓ 0          ✗ 17299
     http_req_receiving.............: avg=109.23µs min=40.58µs med=95.41µs  max=111ms   p(90)=133.82µs p(95)=150.35µs p(99.9)=875.93µs
     http_req_sending...............: avg=29.75µs  min=5.74µs  med=18.61µs  max=58.48ms p(90)=24.45µs  p(95)=28.78µs  p(99.9)=1.74ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=829.02ms min=5.32ms  med=731.31ms max=17.03s  p(90)=1.45s    p(95)=1.65s    p(99.9)=14.85s  
     http_reqs......................: 17299   256.370421/s
     iteration_duration.............: avg=880.08ms min=49.6ms  med=779.03ms max=17.03s  p(90)=1.46s    p(95)=1.67s    p(99.9)=14.86s  
     iterations.....................: 16299   241.550465/s
     success_rate...................: 100.00% ✓ 16299      ✗ 0    
     vus............................: 76      min=0        max=498
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

     checks.........................: 100.00% ✓ 47910      ✗ 0    
     data_received..................: 1.5 GB  20 MB/s
     data_sent......................: 21 MB   284 kB/s
     http_req_blocked...............: avg=12.2µs   min=1.35µs  med=3.44µs   max=5.94ms  p(90)=5.13µs   p(95)=6.59µs   p(99.9)=1.62ms  
     http_req_connecting............: avg=7.11µs   min=0s      med=0s       max=5.73ms  p(90)=0s       p(95)=0s       p(99.9)=1.6ms   
     http_req_duration..............: avg=375.1ms  min=7.66ms  med=392.57ms max=1.09s   p(90)=646.19ms p(95)=687.08ms p(99.9)=959.13ms
       { expected_response:true }...: avg=375.1ms  min=7.66ms  med=392.57ms max=1.09s   p(90)=646.19ms p(95)=687.08ms p(99.9)=959.13ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 16970
     http_req_receiving.............: avg=90.67µs  min=36.88µs med=83.11µs  max=3.4ms   p(90)=122.43µs p(95)=137.38µs p(99.9)=844.82µs
     http_req_sending...............: avg=28.36µs  min=5.77µs  med=16.11µs  max=24.02ms p(90)=21.81µs  p(95)=26.36µs  p(99.9)=3.08ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=374.98ms min=7.53ms  med=392.45ms max=1.09s   p(90)=646.09ms p(95)=686.99ms p(99.9)=958.96ms
     http_reqs......................: 16970   231.693972/s
     iteration_duration.............: avg=398.55ms min=8.37ms  med=410.22ms max=1.09s   p(90)=651.67ms p(95)=690.61ms p(99.9)=968.09ms
     iterations.....................: 15970   218.040821/s
     success_rate...................: 100.00% ✓ 15970      ✗ 0    
     vus............................: 63      min=0        max=495
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (.net subgraphs) (16.7.0-p.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 455928      ✗ 0     
     data_received..................: 13 GB   217 MB/s
     data_sent......................: 184 MB  3.0 MB/s
     http_req_blocked...............: avg=26.49µs  min=1.1µs   med=3µs      max=79.14ms  p(90)=4.87µs   p(95)=6.14µs   p(99.9)=2.94ms  
     http_req_connecting............: avg=22.23µs  min=0s      med=0s       max=79.03ms  p(90)=0s       p(95)=0s       p(99.9)=2.89ms  
     http_req_duration..............: avg=92.93ms  min=1.48ms  med=87.79ms  max=347.97ms p(90)=178.39ms p(95)=197.77ms p(99.9)=269.02ms
       { expected_response:true }...: avg=92.93ms  min=1.48ms  med=87.79ms  max=347.97ms p(90)=178.39ms p(95)=197.77ms p(99.9)=269.02ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 152976
     http_req_receiving.............: avg=656.67µs min=54.97µs med=109.56µs max=121.78ms p(90)=1.24ms   p(95)=2.26ms   p(99.9)=29.68ms 
     http_req_sending...............: avg=77.55µs  min=4.92µs  med=10.87µs  max=144.99ms p(90)=22.48µs  p(95)=130.67µs p(99.9)=10.2ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=92.19ms  min=1.39ms  med=86.98ms  max=347.48ms p(90)=177.54ms p(95)=196.85ms p(99.9)=267.82ms
     http_reqs......................: 152976  2473.638326/s
     iteration_duration.............: avg=93.82ms  min=3.18ms  med=88.78ms  max=348.19ms p(90)=178.94ms p(95)=198.32ms p(99.9)=269.65ms
     iterations.....................: 151976  2457.468219/s
     success_rate...................: 100.00% ✓ 151976      ✗ 0     
     vus............................: 95      min=0         max=500 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.7.0-p.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 446361      ✗ 0     
     data_received..................: 13 GB   212 MB/s
     data_sent......................: 180 MB  2.9 MB/s
     http_req_blocked...............: avg=20.76µs min=872ns   med=2.74µs   max=113.32ms p(90)=4.57µs   p(95)=5.73µs   p(99.9)=1.34ms  
     http_req_connecting............: avg=17.31µs min=0s      med=0s       max=113.06ms p(90)=0s       p(95)=0s       p(99.9)=1.3ms   
     http_req_duration..............: avg=94.97ms min=1.53ms  med=82.62ms  max=1.28s    p(90)=183.35ms p(95)=214.84ms p(99.9)=645.73ms
       { expected_response:true }...: avg=94.97ms min=1.53ms  med=82.62ms  max=1.28s    p(90)=183.35ms p(95)=214.84ms p(99.9)=645.73ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 149787
     http_req_receiving.............: avg=1.36ms  min=52.52µs med=105.37µs max=543.99ms p(90)=1.51ms   p(95)=3.86ms   p(99.9)=94.51ms 
     http_req_sending...............: avg=73.46µs min=4.83µs  med=10.46µs  max=128.56ms p(90)=20.77µs  p(95)=119.16µs p(99.9)=10.04ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=93.54ms min=1.45ms  med=81.7ms   max=1.28s    p(90)=181.2ms  p(95)=211.49ms p(99.9)=632.8ms 
     http_reqs......................: 149787  2419.188495/s
     iteration_duration.............: avg=95.88ms min=2.5ms   med=83.57ms  max=1.28s    p(90)=183.97ms p(95)=215.53ms p(99.9)=648.51ms
     iterations.....................: 148787  2403.037638/s
     success_rate...................: 100.00% ✓ 148787      ✗ 0     
     vus............................: 53      min=0         max=499 
     vus_max........................: 500     min=500       max=500
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

     checks.........................: 100.00% ✓ 442836      ✗ 0     
     data_received..................: 13 GB   210 MB/s
     data_sent......................: 179 MB  2.9 MB/s
     http_req_blocked...............: avg=15.33µs min=852ns   med=2.33µs   max=55.64ms  p(90)=4.25µs   p(95)=5.43µs   p(99.9)=1.77ms  
     http_req_connecting............: avg=12.22µs min=0s      med=0s       max=55.57ms  p(90)=0s       p(95)=0s       p(99.9)=1.71ms  
     http_req_duration..............: avg=95.77ms min=1.57ms  med=83.42ms  max=1.24s    p(90)=180.17ms p(95)=211.62ms p(99.9)=713.64ms
       { expected_response:true }...: avg=95.77ms min=1.57ms  med=83.42ms  max=1.24s    p(90)=180.17ms p(95)=211.62ms p(99.9)=713.64ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 148612
     http_req_receiving.............: avg=1.47ms  min=53.03µs med=104.12µs max=796.43ms p(90)=1.66ms   p(95)=4.56ms   p(99.9)=92.39ms 
     http_req_sending...............: avg=62.97µs min=4.95µs  med=9.65µs   max=81.15ms  p(90)=20.11µs  p(95)=104.56µs p(99.9)=8.8ms   
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=94.23ms min=1.46ms  med=82.2ms   max=1.24s    p(90)=178.4ms  p(95)=208.43ms p(99.9)=695.23ms
     http_reqs......................: 148612  2400.758139/s
     iteration_duration.............: avg=96.67ms min=2.48ms  med=84.36ms  max=1.24s    p(90)=180.8ms  p(95)=212.45ms p(99.9)=714.15ms
     iterations.....................: 147612  2384.603601/s
     success_rate...................: 100.00% ✓ 147612      ✗ 0     
     vus............................: 53      min=0         max=499 
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

     checks.........................: 100.00% ✓ 437388      ✗ 0     
     data_received..................: 13 GB   207 MB/s
     data_sent......................: 176 MB  2.8 MB/s
     http_req_blocked...............: avg=16.32µs  min=912ns   med=2.46µs  max=62.2ms   p(90)=4.33µs   p(95)=5.55µs   p(99.9)=1.52ms  
     http_req_connecting............: avg=12.89µs  min=0s      med=0s      max=62.13ms  p(90)=0s       p(95)=0s       p(99.9)=1.45ms  
     http_req_duration..............: avg=96.89ms  min=1.6ms   med=92.02ms max=338.69ms p(90)=186.69ms p(95)=202.26ms p(99.9)=253.49ms
       { expected_response:true }...: avg=96.89ms  min=1.6ms   med=92.02ms max=338.69ms p(90)=186.69ms p(95)=202.26ms p(99.9)=253.49ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 146796
     http_req_receiving.............: avg=124.84µs min=25.66µs med=55.1µs  max=102.7ms  p(90)=131.52µs p(95)=345.58µs p(99.9)=10.32ms 
     http_req_sending...............: avg=66.87µs  min=4.67µs  med=10.63µs max=130.64ms p(90)=22.05µs  p(95)=122.77µs p(99.9)=8.36ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=96.7ms   min=1.56ms  med=91.84ms max=299.73ms p(90)=186.45ms p(95)=202.04ms p(99.9)=252.59ms
     http_reqs......................: 146796  2365.873527/s
     iteration_duration.............: avg=97.8ms   min=4.19ms  med=93.05ms max=349ms    p(90)=187.18ms p(95)=202.68ms p(99.9)=254.75ms
     iterations.....................: 145796  2349.756783/s
     success_rate...................: 100.00% ✓ 145796      ✗ 0     
     vus............................: 59      min=0         max=498 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (.net subgraphs) (16.7.0-p.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 395640      ✗ 0     
     data_received..................: 12 GB   187 MB/s
     data_sent......................: 160 MB  2.6 MB/s
     http_req_blocked...............: avg=12.96µs  min=912ns   med=2.39µs   max=81.24ms  p(90)=4.12µs   p(95)=5.21µs   p(99.9)=1.38ms  
     http_req_connecting............: avg=9.92µs   min=0s      med=0s       max=81.04ms  p(90)=0s       p(95)=0s       p(99.9)=1.31ms  
     http_req_duration..............: avg=107.13ms min=1.73ms  med=91.58ms  max=1.9s     p(90)=206.32ms p(95)=239.02ms p(99.9)=656.35ms
       { expected_response:true }...: avg=107.13ms min=1.73ms  med=91.58ms  max=1.9s     p(90)=206.32ms p(95)=239.02ms p(99.9)=656.35ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 132880
     http_req_receiving.............: avg=1.55ms   min=52.47µs med=112.85µs max=532.17ms p(90)=1.87ms   p(95)=4.76ms   p(99.9)=101.1ms 
     http_req_sending...............: avg=57.2µs   min=4.66µs  med=9.77µs   max=88.62ms  p(90)=19.45µs  p(95)=98.92µs  p(99.9)=7.61ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=105.51ms min=1.65ms  med=90.45ms  max=1.9s     p(90)=204.15ms p(95)=235.09ms p(99.9)=640.01ms
     http_reqs......................: 132880  2137.108173/s
     iteration_duration.............: avg=108.19ms min=3.08ms  med=92.77ms  max=1.9s     p(90)=206.99ms p(95)=239.91ms p(99.9)=656.83ms
     iterations.....................: 131880  2121.02518/s
     success_rate...................: 100.00% ✓ 131880      ✗ 0     
     vus............................: 65      min=0         max=496 
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

     checks.........................: 100.00% ✓ 216657      ✗ 0    
     data_received..................: 6.4 GB  102 MB/s
     data_sent......................: 88 MB   1.4 MB/s
     http_req_blocked...............: avg=5.28µs   min=962ns   med=2.48µs   max=13.23ms  p(90)=4.38µs   p(95)=5.38µs   p(99.9)=407.04µs
     http_req_connecting............: avg=2.05µs   min=0s      med=0s       max=13.07ms  p(90)=0s       p(95)=0s       p(99.9)=308.53µs
     http_req_duration..............: avg=194.88ms min=2.02ms  med=195.79ms max=559.91ms p(90)=361.05ms p(95)=387.75ms p(99.9)=473.13ms
       { expected_response:true }...: avg=194.88ms min=2.02ms  med=195.79ms max=559.91ms p(90)=361.05ms p(95)=387.75ms p(99.9)=473.13ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 73219
     http_req_receiving.............: avg=78.55µs  min=26.01µs med=64.89µs  max=53.51ms  p(90)=106.38µs p(95)=121.3µs  p(99.9)=1.26ms  
     http_req_sending...............: avg=29.48µs  min=4.95µs  med=11.47µs  max=132.11ms p(90)=19.56µs  p(95)=23.35µs  p(99.9)=3.41ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=194.77ms min=1.96ms  med=195.7ms  max=559.87ms p(90)=360.97ms p(95)=387.65ms p(99.9)=473.02ms
     http_reqs......................: 73219   1169.638454/s
     iteration_duration.............: avg=197.82ms min=4.39ms  med=199.19ms max=560.04ms p(90)=361.94ms p(95)=388.6ms  p(99.9)=473.48ms
     iterations.....................: 72219   1153.663933/s
     success_rate...................: 100.00% ✓ 72219       ✗ 0    
     vus............................: 85      min=0         max=497
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

     checks.........................: 100.00% ✓ 100035     ✗ 0    
     data_received..................: 3.0 GB  47 MB/s
     data_sent......................: 41 MB   638 kB/s
     http_req_blocked...............: avg=9.2µs    min=1.11µs med=3.39µs   max=9.52ms   p(90)=5.21µs   p(95)=6.34µs   p(99.9)=1.44ms
     http_req_connecting............: avg=4.73µs   min=0s     med=0s       max=9.45ms   p(90)=0s       p(95)=0s       p(99.9)=1.42ms
     http_req_duration..............: avg=417.68ms min=3.85ms med=395.09ms max=1.76s    p(90)=826.99ms p(95)=896.04ms p(99.9)=1.26s 
       { expected_response:true }...: avg=417.68ms min=3.85ms med=395.09ms max=1.76s    p(90)=826.99ms p(95)=896.04ms p(99.9)=1.26s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 34345
     http_req_receiving.............: avg=96.34µs  min=32.3µs med=77.63µs  max=144.27ms p(90)=117.17µs p(95)=132.77µs p(99.9)=1.11ms
     http_req_sending...............: avg=34.57µs  min=5.64µs med=14.92µs  max=132.34ms p(90)=22.14µs  p(95)=25.62µs  p(99.9)=3.01ms
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=417.55ms min=3.75ms med=394.88ms max=1.76s    p(90)=826.83ms p(95)=895.94ms p(99.9)=1.26s 
     http_reqs......................: 34345   531.090006/s
     iteration_duration.............: avg=430.46ms min=8.77ms med=409.69ms max=1.76s    p(90)=831.18ms p(95)=899.13ms p(99.9)=1.27s 
     iterations.....................: 33345   515.62662/s
     success_rate...................: 100.00% ✓ 33345      ✗ 0    
     vus............................: 86      min=0        max=500
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

     checks.........................: 100.00% ✓ 47097      ✗ 0    
     data_received..................: 1.5 GB  22 MB/s
     data_sent......................: 20 MB   296 kB/s
     http_req_blocked...............: avg=12.53µs  min=1.29µs  med=3.87µs   max=3.05ms  p(90)=5.8µs    p(95)=7.47µs   p(99.9)=1.39ms
     http_req_connecting............: avg=6.87µs   min=0s      med=0s       max=3ms     p(90)=0s       p(95)=0s       p(99.9)=1.37ms
     http_req_duration..............: avg=870.94ms min=5.76ms  med=793.21ms max=4.56s   p(90)=1.72s    p(95)=1.94s    p(99.9)=3.77s 
       { expected_response:true }...: avg=870.94ms min=5.76ms  med=793.21ms max=4.56s   p(90)=1.72s    p(95)=1.94s    p(99.9)=3.77s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 16699
     http_req_receiving.............: avg=104.03µs min=35.56µs med=94.46µs  max=12.07ms p(90)=135.03µs p(95)=152.22µs p(99.9)=1.36ms
     http_req_sending...............: avg=35.7µs   min=5.86µs  med=18.65µs  max=26.25ms p(90)=24.69µs  p(95)=30.04µs  p(99.9)=5.28ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=870.8ms  min=5.66ms  med=793.08ms max=4.56s   p(90)=1.72s    p(95)=1.94s    p(99.9)=3.77s 
     http_reqs......................: 16699   246.885378/s
     iteration_duration.............: avg=926.43ms min=57.82ms med=843.16ms max=4.57s   p(90)=1.75s    p(95)=1.96s    p(99.9)=3.82s 
     iterations.....................: 15699   232.100937/s
     success_rate...................: 100.00% ✓ 15699      ✗ 0    
     vus............................: 89      min=0        max=500
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

     checks.........................: 100.00% ✓ 45249      ✗ 0    
     data_received..................: 1.4 GB  20 MB/s
     data_sent......................: 19 MB   280 kB/s
     http_req_blocked...............: avg=13.36µs  min=1.19µs  med=3.14µs   max=3.27ms   p(90)=5.02µs   p(95)=6.87µs   p(99.9)=2.08ms
     http_req_connecting............: avg=8.44µs   min=0s      med=0s       max=3.23ms   p(90)=0s       p(95)=0s       p(99.9)=2.06ms
     http_req_duration..............: avg=903.66ms min=7.93ms  med=823.55ms max=3.24s    p(90)=1.86s    p(95)=1.96s    p(99.9)=2.82s 
       { expected_response:true }...: avg=903.66ms min=7.93ms  med=823.55ms max=3.24s    p(90)=1.86s    p(95)=1.96s    p(99.9)=2.82s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 16083
     http_req_receiving.............: avg=100.43µs min=32.14µs med=93.21µs  max=19.23ms  p(90)=133.46µs p(95)=148.23µs p(99.9)=1.09ms
     http_req_sending...............: avg=48.84µs  min=5.64µs  med=17.42µs  max=135.34ms p(90)=23.47µs  p(95)=28.69µs  p(99.9)=2.24ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=903.51ms min=7.81ms  med=823.42ms max=3.24s    p(90)=1.86s    p(95)=1.96s    p(99.9)=2.82s 
     http_reqs......................: 16083   233.343358/s
     iteration_duration.............: avg=963.55ms min=34.7ms  med=910.72ms max=3.24s    p(90)=1.87s    p(95)=1.97s    p(99.9)=2.83s 
     iterations.....................: 15083   218.834662/s
     success_rate...................: 100.00% ✓ 15083      ✗ 0    
     vus............................: 36      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

