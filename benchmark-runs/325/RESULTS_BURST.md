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
| hive-router | v0.0.84 | 2,944 | 3,085 | 2,924 | 1.8% |  |
| fusion-nightly-net11 | 16.6.2-p.5 | 2,550 | 2,660 | 2,531 | 1.8% |  |
| fusion-nightly | 16.6.2-p.5 | 2,531 | 2,579 | 2,470 | 1.5% |  |
| fusion | 16.6.1 | 2,489 | 2,592 | 2,472 | 1.7% |  |
| fusion-nightly-fed | 16.6.2-p.5 | 2,343 | 2,436 | 2,301 | 1.9% |  |
| cosmo | 0.334.0 | 1,223 | 1,264 | 1,218 | 1.3% |  |
| hive-gateway-router-runtime | 2.10.8 | 562 | 575 | 558 | 1.0% |  |
| hive-gateway | 2.10.8 | 256 | 264 | 254 | 1.3% |  |
| apollo-gateway | 2.14.3 | 234 | 241 | 233 | 1.1% | 2 failed requests across 1/9 runs |
| apollo-router | v2.16.1 | — | — | — | — | non-compatible response (7726 across 9/9 runs) |
| feddi | — | — | — | — | — | not run |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (574479 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| fusion-nightly-net11 | 16.6.2-p.5 | 2,485 | 2,577 | 2,467 | 1.5% |  |
| fusion-nightly | 16.6.2-p.5 | 2,441 | 2,503 | 2,416 | 1.1% |  |
| fusion | 16.6.1 | 2,315 | 2,410 | 2,304 | 1.6% |  |
| fusion-nightly-fed | 16.6.2-p.5 | 2,265 | 2,341 | 2,247 | 1.4% |  |
| hive-router | v0.0.84 | 2,234 | 2,370 | 2,209 | 2.4% |  |
| cosmo | 0.334.0 | 1,146 | 1,187 | 1,128 | 1.5% |  |
| hive-gateway-router-runtime | 2.10.8 | 527 | 541 | 521 | 1.4% |  |
| hive-gateway | 2.10.8 | 240 | 247 | 235 | 1.4% |  |
| apollo-gateway | 2.14.3 | 228 | 235 | 228 | 1.0% |  |
| apollo-router | v2.16.1 | — | — | — | — | non-compatible response (44657 across 9/9 runs) |
| feddi | — | — | — | — | — | not run |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (298720 across 9/9 runs) |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.84)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 542355      ✗ 0     
     data_received..................: 16 GB   258 MB/s
     data_sent......................: 218 MB  3.5 MB/s
     http_req_blocked...............: avg=29.14µs min=962ns   med=2.74µs  max=72.39ms  p(90)=4.48µs   p(95)=5.7µs    p(99.9)=3.9ms   
     http_req_connecting............: avg=25.68µs min=0s      med=0s      max=72.34ms  p(90)=0s       p(95)=0s       p(99.9)=3.74ms  
     http_req_duration..............: avg=78.08ms min=1.4ms   med=72.15ms max=330.6ms  p(90)=151.6ms  p(95)=169.67ms p(99.9)=229.94ms
       { expected_response:true }...: avg=78.08ms min=1.4ms   med=72.15ms max=330.6ms  p(90)=151.6ms  p(95)=169.67ms p(99.9)=229.94ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 181785
     http_req_receiving.............: avg=196.2µs min=25.73µs med=51.87µs max=147.19ms p(90)=179µs    p(95)=371.19µs p(99.9)=28.3ms  
     http_req_sending...............: avg=86.29µs min=4.46µs  med=9.93µs  max=231.07ms p(90)=18.9µs   p(95)=128.39µs p(99.9)=13.03ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=77.79ms min=1.35ms  med=71.92ms max=312.07ms p(90)=151.23ms p(95)=168.98ms p(99.9)=228.47ms
     http_reqs......................: 181785  2944.612394/s
     iteration_duration.............: avg=78.85ms min=2.31ms  med=73.03ms max=340.94ms p(90)=152.15ms p(95)=170.31ms p(99.9)=233.32ms
     iterations.....................: 180785  2928.41407/s
     success_rate...................: 100.00% ✓ 180785      ✗ 0     
     vus............................: 90      min=0         max=498 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (rust subgraphs) (16.6.2-p.5)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 472419     ✗ 0     
     data_received..................: 14 GB   224 MB/s
     data_sent......................: 190 MB  3.1 MB/s
     http_req_blocked...............: avg=13.92µs  min=862ns   med=2.07µs   max=45.43ms  p(90)=3.37µs   p(95)=4.36µs   p(99.9)=926.2µs 
     http_req_connecting............: avg=11.17µs  min=0s      med=0s       max=45.28ms  p(90)=0s       p(95)=0s       p(99.9)=792.83µs
     http_req_duration..............: avg=89.73ms  min=1.86ms  med=85.56ms  max=327.8ms  p(90)=171.39ms p(95)=186.54ms p(99.9)=244.57ms
       { expected_response:true }...: avg=89.73ms  min=1.86ms  med=85.56ms  max=327.8ms  p(90)=171.39ms p(95)=186.54ms p(99.9)=244.57ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 158473
     http_req_receiving.............: avg=625.69µs min=52.75µs med=102.81µs max=175.81ms p(90)=1.17ms   p(95)=2.06ms   p(99.9)=25.94ms 
     http_req_sending...............: avg=59.16µs  min=4.34µs  med=8.61µs   max=179.91ms p(90)=15.75µs  p(95)=102.15µs p(99.9)=7.85ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=89.05ms  min=1.79ms  med=84.78ms  max=327.11ms p(90)=170.66ms p(95)=185.75ms p(99.9)=242.78ms
     http_reqs......................: 158473  2550.01281/s
     iteration_duration.............: avg=90.54ms  min=3.86ms  med=86.45ms  max=339.59ms p(90)=171.8ms  p(95)=186.94ms p(99.9)=245.66ms
     iterations.....................: 157473  2533.92166/s
     success_rate...................: 100.00% ✓ 157473     ✗ 0     
     vus............................: 63      min=0        max=496 
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (rust subgraphs) (16.6.2-p.5)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 471117      ✗ 0     
     data_received..................: 14 GB   222 MB/s
     data_sent......................: 190 MB  3.0 MB/s
     http_req_blocked...............: avg=16.44µs min=892ns   med=2.1µs   max=64.18ms  p(90)=3.54µs   p(95)=4.63µs   p(99.9)=964.6µs 
     http_req_connecting............: avg=13.36µs min=0s      med=0s      max=64.12ms  p(90)=0s       p(95)=0s       p(99.9)=883.28µs
     http_req_duration..............: avg=90.04ms min=1.99ms  med=77ms    max=1.43s    p(90)=169.55ms p(95)=196.32ms p(99.9)=830.98ms
       { expected_response:true }...: avg=90.04ms min=1.99ms  med=77ms    max=1.43s    p(90)=169.55ms p(95)=196.32ms p(99.9)=830.98ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 158039
     http_req_receiving.............: avg=1.67ms  min=51.58µs med=95.88µs max=578.93ms p(90)=1.55ms   p(95)=4.41ms   p(99.9)=254.39ms
     http_req_sending...............: avg=59.38µs min=4.68µs  med=9.03µs  max=199.66ms p(90)=17.03µs  p(95)=101.3µs  p(99.9)=7.93ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=88.3ms  min=1.88ms  med=75.95ms max=1.43s    p(90)=167.46ms p(95)=192.45ms p(99.9)=651.54ms
     http_reqs......................: 158039  2531.761499/s
     iteration_duration.............: avg=90.85ms min=3.56ms  med=77.83ms max=1.43s    p(90)=170.08ms p(95)=196.98ms p(99.9)=831.54ms
     iterations.....................: 157039  2515.741646/s
     success_rate...................: 100.00% ✓ 157039      ✗ 0     
     vus............................: 75      min=0         max=493 
     vus_max........................: 500     min=500       max=500
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

     checks.........................: 100.00% ✓ 462147      ✗ 0     
     data_received..................: 14 GB   218 MB/s
     data_sent......................: 186 MB  3.0 MB/s
     http_req_blocked...............: avg=17.22µs min=1.05µs  med=2.53µs   max=58.86ms  p(90)=4.01µs   p(95)=5.01µs   p(99.9)=1.36ms  
     http_req_connecting............: avg=14.02µs min=0s      med=0s       max=58.68ms  p(90)=0s       p(95)=0s       p(99.9)=1.3ms   
     http_req_duration..............: avg=91.75ms min=1.94ms  med=80.98ms  max=1.81s    p(90)=173.53ms p(95)=199.4ms  p(99.9)=597.84ms
       { expected_response:true }...: avg=91.75ms min=1.94ms  med=80.98ms  max=1.81s    p(90)=173.53ms p(95)=199.4ms  p(99.9)=597.84ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 155049
     http_req_receiving.............: avg=1.49ms  min=52.55µs med=101.48µs max=790.64ms p(90)=1.73ms   p(95)=4.68ms   p(99.9)=110.81ms
     http_req_sending...............: avg=68.19µs min=4.51µs  med=9.43µs   max=141.72ms p(90)=16.89µs  p(95)=111.44µs p(99.9)=9.24ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=90.18ms min=1.86ms  med=79.75ms  max=1.81s    p(90)=171.58ms p(95)=196.53ms p(99.9)=567.48ms
     http_reqs......................: 155049  2489.443422/s
     iteration_duration.............: avg=92.59ms min=3.48ms  med=81.89ms  max=1.81s    p(90)=174.07ms p(95)=200.06ms p(99.9)=603.04ms
     iterations.....................: 154049  2473.387572/s
     success_rate...................: 100.00% ✓ 154049      ✗ 0     
     vus............................: 72      min=0         max=495 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (rust subgraphs) (16.6.2-p.5)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 432951      ✗ 0     
     data_received..................: 13 GB   206 MB/s
     data_sent......................: 175 MB  2.8 MB/s
     http_req_blocked...............: avg=17.65µs min=862ns   med=2.57µs   max=59.62ms  p(90)=4.18µs   p(95)=5.28µs   p(99.9)=1.49ms  
     http_req_connecting............: avg=13.71µs min=0s      med=0s       max=59.52ms  p(90)=0s       p(95)=0s       p(99.9)=1.4ms   
     http_req_duration..............: avg=97.97ms min=1.61ms  med=85.66ms  max=1.38s    p(90)=186.45ms p(95)=215.88ms p(99.9)=759.45ms
       { expected_response:true }...: avg=97.97ms min=1.61ms  med=85.66ms  max=1.38s    p(90)=186.45ms p(95)=215.88ms p(99.9)=759.45ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 145317
     http_req_receiving.............: avg=1.41ms  min=53.46µs med=104.13µs max=808.51ms p(90)=1.66ms   p(95)=4.14ms   p(99.9)=85.12ms 
     http_req_sending...............: avg=67.25µs min=4.39µs  med=9.71µs   max=145.32ms p(90)=18.34µs  p(95)=112.34µs p(99.9)=9.14ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=96.49ms min=1.54ms  med=84.62ms  max=1.37s    p(90)=184.62ms p(95)=213.29ms p(99.9)=717.17ms
     http_reqs......................: 145317  2343.468193/s
     iteration_duration.............: avg=98.9ms  min=2.88ms  med=86.8ms   max=1.38s    p(90)=187.11ms p(95)=216.64ms p(99.9)=761.62ms
     iterations.....................: 144317  2327.3416/s
     success_rate...................: 100.00% ✓ 144317      ✗ 0     
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

     checks.........................: 100.00% ✓ 226443      ✗ 0    
     data_received..................: 6.7 GB  107 MB/s
     data_sent......................: 92 MB   1.5 MB/s
     http_req_blocked...............: avg=5.24µs   min=962ns   med=2.11µs   max=10.38ms  p(90)=3.69µs   p(95)=4.59µs   p(99.9)=457.79µs
     http_req_connecting............: avg=2.46µs   min=0s      med=0s       max=10.32ms  p(90)=0s       p(95)=0s       p(99.9)=401µs   
     http_req_duration..............: avg=186.55ms min=1.94ms  med=187.17ms max=523.56ms p(90)=347.95ms p(95)=372.89ms p(99.9)=455.16ms
       { expected_response:true }...: avg=186.55ms min=1.94ms  med=187.17ms max=523.56ms p(90)=347.95ms p(95)=372.89ms p(99.9)=455.16ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 76481
     http_req_receiving.............: avg=71.92µs  min=27.56µs med=57.06µs  max=119.61ms p(90)=92.77µs  p(95)=106.61µs p(99.9)=1.17ms  
     http_req_sending...............: avg=27.17µs  min=4.87µs  med=9.92µs   max=81.82ms  p(90)=16.5µs   p(95)=20.4µs   p(99.9)=3.24ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=186.45ms min=1.85ms  med=187.04ms max=523.49ms p(90)=347.86ms p(95)=372.79ms p(99.9)=455.07ms
     http_reqs......................: 76481   1223.269052/s
     iteration_duration.............: avg=189.24ms min=4.82ms  med=190.17ms max=523.72ms p(90)=348.93ms p(95)=373.56ms p(99.9)=455.65ms
     iterations.....................: 75481   1207.274634/s
     success_rate...................: 100.00% ✓ 75481       ✗ 0    
     vus............................: 81      min=0         max=492
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

     checks.........................: 100.00% ✓ 105285     ✗ 0    
     data_received..................: 3.2 GB  49 MB/s
     data_sent......................: 43 MB   675 kB/s
     http_req_blocked...............: avg=8.69µs   min=1.11µs  med=3.12µs   max=6.38ms   p(90)=4.81µs   p(95)=5.84µs   p(99.9)=1.58ms
     http_req_connecting............: avg=4.53µs   min=0s      med=0s       max=6.27ms   p(90)=0s       p(95)=0s       p(99.9)=1.48ms
     http_req_duration..............: avg=397.36ms min=3.51ms  med=370.63ms max=1.61s    p(90)=782.99ms p(95)=851.38ms p(99.9)=1.23s 
       { expected_response:true }...: avg=397.36ms min=3.51ms  med=370.63ms max=1.61s    p(90)=782.99ms p(95)=851.38ms p(99.9)=1.23s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 36095
     http_req_receiving.............: avg=84µs     min=30.22µs med=68.64µs  max=124.92ms p(90)=106.28µs p(95)=120.26µs p(99.9)=1ms   
     http_req_sending...............: avg=28.53µs  min=5.72µs  med=13.49µs  max=90.12ms  p(90)=20.54µs  p(95)=23.59µs  p(99.9)=2.48ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=397.25ms min=3.42ms  med=370.53ms max=1.61s    p(90)=782.87ms p(95)=851.26ms p(99.9)=1.23s 
     http_reqs......................: 36095   562.172485/s
     iteration_duration.............: avg=408.93ms min=17.69ms med=385.4ms  max=1.61s    p(90)=786.44ms p(95)=854.29ms p(99.9)=1.23s 
     iterations.....................: 35095   546.597683/s
     success_rate...................: 100.00% ✓ 35095      ✗ 0    
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

     checks.........................: 100.00% ✓ 48768      ✗ 0    
     data_received..................: 1.5 GB  23 MB/s
     data_sent......................: 21 MB   308 kB/s
     http_req_blocked...............: avg=13.05µs  min=1.13µs  med=3.29µs   max=3.29ms  p(90)=5.05µs   p(95)=6.54µs   p(99.9)=2.06ms
     http_req_connecting............: avg=8.18µs   min=0s      med=0s       max=3.25ms  p(90)=0s       p(95)=0s       p(99.9)=2.04ms
     http_req_duration..............: avg=837.41ms min=5.57ms  med=755.25ms max=14.34s  p(90)=1.5s     p(95)=1.73s    p(99.9)=12.71s
       { expected_response:true }...: avg=837.41ms min=5.57ms  med=755.25ms max=14.34s  p(90)=1.5s     p(95)=1.73s    p(99.9)=12.71s
     http_req_failed................: 0.00%   ✓ 0          ✗ 17256
     http_req_receiving.............: avg=99.06µs  min=31.32µs med=92.11µs  max=9.1ms   p(90)=128.36µs p(95)=143.87µs p(99.9)=1.36ms
     http_req_sending...............: avg=28.87µs  min=5.47µs  med=18.03µs  max=27.53ms p(90)=23.33µs  p(95)=28.03µs  p(99.9)=2.47ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=837.28ms min=5.48ms  med=755.14ms max=14.34s  p(90)=1.5s     p(95)=1.73s    p(99.9)=12.71s
     http_reqs......................: 17256   256.429682/s
     iteration_duration.............: avg=888.95ms min=23.16ms med=810.79ms max=14.34s  p(90)=1.54s    p(95)=1.75s    p(99.9)=12.71s
     iterations.....................: 16256   241.569362/s
     success_rate...................: 100.00% ✓ 16256      ✗ 0    
     vus............................: 69      min=0        max=497
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

     checks.........................: 100.00% ✓ 48438      ✗ 0    
     data_received..................: 1.5 GB  21 MB/s
     data_sent......................: 21 MB   287 kB/s
     http_req_blocked...............: avg=10.29µs  min=1.12µs  med=3.03µs   max=3.53ms  p(90)=4.68µs   p(95)=6.15µs   p(99.9)=1.15ms  
     http_req_connecting............: avg=5.71µs   min=0s      med=0s       max=3.46ms  p(90)=0s       p(95)=0s       p(99.9)=1.11ms  
     http_req_duration..............: avg=385.19ms min=7.5ms   med=443.88ms max=1.09s   p(90)=639.34ms p(95)=707.08ms p(99.9)=972.13ms
       { expected_response:true }...: avg=385.19ms min=7.5ms   med=443.88ms max=1.09s   p(90)=639.34ms p(95)=707.08ms p(99.9)=972.13ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 17146
     http_req_receiving.............: avg=94.7µs   min=33.3µs  med=86.25µs  max=46.13ms p(90)=123.34µs p(95)=137.85µs p(99.9)=881.47µs
     http_req_sending...............: avg=37.31µs  min=5.46µs  med=16.45µs  max=93.47ms p(90)=21.65µs  p(95)=26.31µs  p(99.9)=4.31ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=385.06ms min=7.38ms  med=443.8ms  max=1.09s   p(90)=639.21ms p(95)=706.98ms p(99.9)=972.01ms
     http_reqs......................: 17146   234.317747/s
     iteration_duration.............: avg=409.07ms min=13.12ms med=466.07ms max=1.11s   p(90)=644.91ms p(95)=712.81ms p(99.9)=979.92ms
     iterations.....................: 16146   220.651718/s
     success_rate...................: 100.00% ✓ 16146      ✗ 0    
     vus............................: 59      min=0        max=496
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (.net subgraphs) (16.6.2-p.5)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 457788      ✗ 0     
     data_received..................: 14 GB   218 MB/s
     data_sent......................: 185 MB  3.0 MB/s
     http_req_blocked...............: avg=22.1µs   min=942ns   med=2.75µs   max=61.1ms   p(90)=4.61µs   p(95)=5.78µs   p(99.9)=1.87ms  
     http_req_connecting............: avg=18.37µs  min=0s      med=0s       max=61.01ms  p(90)=0s       p(95)=0s       p(99.9)=1.8ms   
     http_req_duration..............: avg=92.57ms  min=1.37ms  med=87.65ms  max=354.77ms p(90)=177.94ms p(95)=196.28ms p(99.9)=260.4ms 
       { expected_response:true }...: avg=92.57ms  min=1.37ms  med=87.65ms  max=354.77ms p(90)=177.94ms p(95)=196.28ms p(99.9)=260.4ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 153596
     http_req_receiving.............: avg=649.41µs min=53.17µs med=106.95µs max=255.94ms p(90)=1.22ms   p(95)=2.23ms   p(99.9)=27.34ms 
     http_req_sending...............: avg=71.36µs  min=4.61µs  med=10.67µs  max=136.14ms p(90)=22.11µs  p(95)=126.61µs p(99.9)=9.91ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=91.85ms  min=1.3ms   med=86.89ms  max=354.11ms p(90)=177.15ms p(95)=195.4ms  p(99.9)=258.66ms
     http_reqs......................: 153596  2485.887598/s
     iteration_duration.............: avg=93.44ms  min=3ms     med=88.58ms  max=363.53ms p(90)=178.47ms p(95)=196.77ms p(99.9)=261.64ms
     iterations.....................: 152596  2469.703013/s
     success_rate...................: 100.00% ✓ 152596      ✗ 0     
     vus............................: 93      min=0         max=500 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.6.2-p.5)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 450336      ✗ 0     
     data_received..................: 13 GB   214 MB/s
     data_sent......................: 182 MB  2.9 MB/s
     http_req_blocked...............: avg=18.67µs min=851ns   med=2.22µs   max=73.06ms  p(90)=3.92µs   p(95)=5.06µs   p(99.9)=3.5ms   
     http_req_connecting............: avg=15.77µs min=0s      med=0s       max=72.92ms  p(90)=0s       p(95)=0s       p(99.9)=3.4ms   
     http_req_duration..............: avg=94.2ms  min=1.57ms  med=79.82ms  max=1.64s    p(90)=176.34ms p(95)=205.98ms p(99.9)=937.17ms
       { expected_response:true }...: avg=94.2ms  min=1.57ms  med=79.82ms  max=1.64s    p(90)=176.34ms p(95)=205.98ms p(99.9)=937.17ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 151112
     http_req_receiving.............: avg=2.14ms  min=51.66µs med=102.69µs max=888.62ms p(90)=1.75ms   p(95)=4.75ms   p(99.9)=310.17ms
     http_req_sending...............: avg=65.31µs min=4.64µs  med=9.24µs   max=142.51ms p(90)=18.86µs  p(95)=104.63µs p(99.9)=9.07ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=91.99ms min=1.46ms  med=78.69ms  max=1.64s    p(90)=174.38ms p(95)=202.2ms  p(99.9)=864.3ms 
     http_reqs......................: 151112  2441.410452/s
     iteration_duration.............: avg=95.09ms min=2.62ms  med=80.82ms  max=1.64s    p(90)=176.9ms  p(95)=206.77ms p(99.9)=937.48ms
     iterations.....................: 150112  2425.254155/s
     success_rate...................: 100.00% ✓ 150112      ✗ 0     
     vus............................: 53      min=0         max=499 
     vus_max........................: 500     min=500       max=500
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

     checks.........................: 100.00% ✓ 426936      ✗ 0     
     data_received..................: 13 GB   203 MB/s
     data_sent......................: 172 MB  2.8 MB/s
     http_req_blocked...............: avg=16.3µs   min=942ns   med=2.5µs   max=63.39ms  p(90)=4.18µs   p(95)=5.24µs   p(99.9)=1.32ms  
     http_req_connecting............: avg=12.94µs  min=0s      med=0s      max=63.19ms  p(90)=0s       p(95)=0s       p(99.9)=1.19ms  
     http_req_duration..............: avg=99.32ms  min=1.55ms  med=86.85ms max=1.52s    p(90)=188.51ms p(95)=221.72ms p(99.9)=738.38ms
       { expected_response:true }...: avg=99.32ms  min=1.55ms  med=86.85ms max=1.52s    p(90)=188.51ms p(95)=221.72ms p(99.9)=738.38ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 143312
     http_req_receiving.............: avg=1.75ms   min=54.33µs med=111.6µs max=846.06ms p(90)=1.92ms   p(95)=5.36ms   p(99.9)=126.22ms
     http_req_sending...............: avg=62.91µs  min=5.01µs  med=10.04µs max=147.99ms p(90)=19.21µs  p(95)=108.83µs p(99.9)=8.42ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=97.5ms   min=1.48ms  med=85.6ms  max=1.52s    p(90)=185.96ms p(95)=217.04ms p(99.9)=734.53ms
     http_reqs......................: 143312  2315.802866/s
     iteration_duration.............: avg=100.27ms min=3.17ms  med=87.88ms max=1.52s    p(90)=189.22ms p(95)=222.53ms p(99.9)=738.71ms
     iterations.....................: 142312  2299.643697/s
     success_rate...................: 100.00% ✓ 142312      ✗ 0     
     vus............................: 54      min=0         max=499 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (.net subgraphs) (16.6.2-p.5)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 419532      ✗ 0     
     data_received..................: 12 GB   199 MB/s
     data_sent......................: 169 MB  2.7 MB/s
     http_req_blocked...............: avg=22.07µs  min=1.03µs  med=2.97µs   max=95.81ms  p(90)=4.79µs   p(95)=6.03µs   p(99.9)=2.33ms  
     http_req_connecting............: avg=17.92µs  min=0s      med=0s       max=95.76ms  p(90)=0s       p(95)=0s       p(99.9)=2.23ms  
     http_req_duration..............: avg=101.04ms min=1.73ms  med=88.34ms  max=1.37s    p(90)=192.87ms p(95)=224.02ms p(99.9)=689.61ms
       { expected_response:true }...: avg=101.04ms min=1.73ms  med=88.34ms  max=1.37s    p(90)=192.87ms p(95)=224.02ms p(99.9)=689.61ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 140844
     http_req_receiving.............: avg=1.31ms   min=52.64µs med=108.89µs max=810.93ms p(90)=1.52ms   p(95)=3.91ms   p(99.9)=93.3ms  
     http_req_sending...............: avg=81.14µs  min=5.03µs  med=11.54µs  max=248.38ms p(90)=22.77µs  p(95)=127.41µs p(99.9)=10.95ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=99.64ms  min=1.65ms  med=87.25ms  max=1.37s    p(90)=190.98ms p(95)=221.13ms p(99.9)=685.11ms
     http_reqs......................: 140844  2265.811025/s
     iteration_duration.............: avg=102.04ms min=3.57ms  med=89.54ms  max=1.37s    p(90)=193.54ms p(95)=224.77ms p(99.9)=690.29ms
     iterations.....................: 139844  2249.723645/s
     success_rate...................: 100.00% ✓ 139844      ✗ 0     
     vus............................: 64      min=0         max=496 
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

     checks.........................: 100.00% ✓ 410931      ✗ 0     
     data_received..................: 12 GB   195 MB/s
     data_sent......................: 166 MB  2.7 MB/s
     http_req_blocked...............: avg=10.46µs  min=942ns   med=2.5µs   max=44.13ms  p(90)=4.33µs   p(95)=5.49µs   p(99.9)=515.17µs
     http_req_connecting............: avg=7.12µs   min=0s      med=0s      max=44.05ms  p(90)=0s       p(95)=0s       p(99.9)=433.18µs
     http_req_duration..............: avg=103.12ms min=1.45ms  med=97.36ms max=338.93ms p(90)=199.82ms p(95)=216.48ms p(99.9)=263.37ms
       { expected_response:true }...: avg=103.12ms min=1.45ms  med=97.36ms max=338.93ms p(90)=199.82ms p(95)=216.48ms p(99.9)=263.37ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 137977
     http_req_receiving.............: avg=104.52µs min=27.36µs med=56.52µs max=166.79ms p(90)=107.9µs  p(95)=289.16µs p(99.9)=5.87ms  
     http_req_sending...............: avg=54.86µs  min=4.74µs  med=10.4µs  max=230.17ms p(90)=19.07µs  p(95)=102.61µs p(99.9)=6.72ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=102.96ms min=1.4ms   med=97.19ms max=338.25ms p(90)=199.63ms p(95)=216.27ms p(99.9)=262.82ms
     http_reqs......................: 137977  2234.529286/s
     iteration_duration.............: avg=104.11ms min=4.27ms  med=98.51ms max=356.07ms p(90)=200.24ms p(95)=216.93ms p(99.9)=264.03ms
     iterations.....................: 136977  2218.334345/s
     success_rate...................: 100.00% ✓ 136977      ✗ 0     
     vus............................: 91      min=0         max=499 
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

     checks.........................: 100.00% ✓ 212274      ✗ 0    
     data_received..................: 6.3 GB  100 MB/s
     data_sent......................: 86 MB   1.4 MB/s
     http_req_blocked...............: avg=5.78µs   min=982ns   med=2.37µs   max=7.78ms   p(90)=4.21µs   p(95)=5.22µs   p(99.9)=677.19µs
     http_req_connecting............: avg=2.61µs   min=0s      med=0s       max=7.7ms    p(90)=0s       p(95)=0s       p(99.9)=532.31µs
     http_req_duration..............: avg=198.91ms min=1.93ms  med=200.17ms max=521.06ms p(90)=368.25ms p(95)=394.27ms p(99.9)=468.5ms 
       { expected_response:true }...: avg=198.91ms min=1.93ms  med=200.17ms max=521.06ms p(90)=368.25ms p(95)=394.27ms p(99.9)=468.5ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 71758
     http_req_receiving.............: avg=75.34µs  min=26.28µs med=61.31µs  max=109.69ms p(90)=101.9µs  p(95)=117.91µs p(99.9)=1.19ms  
     http_req_sending...............: avg=27.2µs   min=4.64µs  med=10.97µs  max=86.62ms  p(90)=18.54µs  p(95)=22.49µs  p(99.9)=3.1ms   
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=198.81ms min=1.87ms  med=200.05ms max=521.01ms p(90)=368.15ms p(95)=394.19ms p(99.9)=468.44ms
     http_reqs......................: 71758   1146.523815/s
     iteration_duration.............: avg=201.96ms min=4.68ms  med=203.56ms max=521.18ms p(90)=369.25ms p(95)=394.91ms p(99.9)=469.29ms
     iterations.....................: 70758   1130.546171/s
     success_rate...................: 100.00% ✓ 70758       ✗ 0    
     vus............................: 83      min=0         max=498
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

     checks.........................: 100.00% ✓ 99531      ✗ 0    
     data_received..................: 3.0 GB  46 MB/s
     data_sent......................: 41 MB   634 kB/s
     http_req_blocked...............: avg=8.79µs   min=1.18µs  med=3.46µs   max=13.82ms  p(90)=5.28µs   p(95)=6.44µs   p(99.9)=967.24µs
     http_req_connecting............: avg=4.12µs   min=0s      med=0s       max=13.75ms  p(90)=0s       p(95)=0s       p(99.9)=859.55µs
     http_req_duration..............: avg=419.97ms min=3.83ms  med=389.3ms  max=1.68s    p(90)=828.77ms p(95)=902.01ms p(99.9)=1.37s   
       { expected_response:true }...: avg=419.97ms min=3.83ms  med=389.3ms  max=1.68s    p(90)=828.77ms p(95)=902.01ms p(99.9)=1.37s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 34177
     http_req_receiving.............: avg=88.27µs  min=31.28µs med=76.68µs  max=17.63ms  p(90)=115.84µs p(95)=130.22µs p(99.9)=1.22ms  
     http_req_sending...............: avg=38.02µs  min=5.64µs  med=15.09µs  max=182.91ms p(90)=22.43µs  p(95)=25.71µs  p(99.9)=2.63ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=419.84ms min=3.77ms  med=389.2ms  max=1.68s    p(90)=828.63ms p(95)=901.92ms p(99.9)=1.37s   
     http_reqs......................: 34177   527.817275/s
     iteration_duration.............: avg=432.87ms min=18.28ms med=402.47ms max=1.68s    p(90)=832.31ms p(95)=905.13ms p(99.9)=1.38s   
     iterations.....................: 33177   512.373635/s
     success_rate...................: 100.00% ✓ 33177      ✗ 0    
     vus............................: 91      min=0        max=500
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

     checks.........................: 100.00% ✓ 45729      ✗ 0    
     data_received..................: 1.4 GB  21 MB/s
     data_sent......................: 20 MB   289 kB/s
     http_req_blocked...............: avg=13.63µs  min=1.04µs med=3.37µs   max=4.4ms   p(90)=5.21µs   p(95)=7.08µs   p(99.9)=2.13ms
     http_req_connecting............: avg=8.54µs   min=0s     med=0s       max=4.18ms  p(90)=0s       p(95)=0s       p(99.9)=2.08ms
     http_req_duration..............: avg=896.2ms  min=5.87ms med=820.63ms max=5.05s   p(90)=1.79s    p(95)=2.04s    p(99.9)=4.2s  
       { expected_response:true }...: avg=896.2ms  min=5.87ms med=820.63ms max=5.05s   p(90)=1.79s    p(95)=2.04s    p(99.9)=4.2s  
     http_req_failed................: 0.00%   ✓ 0          ✗ 16243
     http_req_receiving.............: avg=99.79µs  min=33.5µs med=94.28µs  max=3.19ms  p(90)=132.49µs p(95)=147.34µs p(99.9)=1.35ms
     http_req_sending...............: avg=32.03µs  min=5.59µs med=17.94µs  max=35.68ms p(90)=23.54µs  p(95)=28.51µs  p(99.9)=3.27ms
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=896.07ms min=5.78ms med=820.54ms max=5.05s   p(90)=1.79s    p(95)=2.04s    p(99.9)=4.2s  
     http_reqs......................: 16243   240.427181/s
     iteration_duration.............: avg=955.02ms min=6.98ms med=897.71ms max=5.06s   p(90)=1.81s    p(95)=2.04s    p(99.9)=4.2s  
     iterations.....................: 15243   225.625286/s
     success_rate...................: 100.00% ✓ 15243      ✗ 0    
     vus............................: 82      min=0        max=500
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

     checks.........................: 100.00% ✓ 44412      ✗ 0    
     data_received..................: 1.4 GB  20 MB/s
     data_sent......................: 19 MB   275 kB/s
     http_req_blocked...............: avg=13.92µs  min=1.13µs  med=3.15µs   max=6.5ms   p(90)=4.87µs   p(95)=6.44µs   p(99.9)=2.16ms
     http_req_connecting............: avg=9.07µs   min=0s      med=0s       max=6.45ms  p(90)=0s       p(95)=0s       p(99.9)=2.14ms
     http_req_duration..............: avg=919.61ms min=7.8ms   med=838ms    max=3.19s   p(90)=1.88s    p(95)=2s       p(99.9)=2.85s 
       { expected_response:true }...: avg=919.61ms min=7.8ms   med=838ms    max=3.19s   p(90)=1.88s    p(95)=2s       p(99.9)=2.85s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 15804
     http_req_receiving.............: avg=95.04µs  min=33.05µs med=87.87µs  max=9.64ms  p(90)=129.24µs p(95)=143.88µs p(99.9)=1.01ms
     http_req_sending...............: avg=31.82µs  min=5.48µs  med=16.98µs  max=49.03ms p(90)=22.46µs  p(95)=27.35µs  p(99.9)=2.91ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=919.49ms min=7.73ms  med=837.9ms  max=3.19s   p(90)=1.88s    p(95)=2s       p(99.9)=2.85s 
     http_reqs......................: 15804   228.939946/s
     iteration_duration.............: avg=981.67ms min=49.4ms  med=924.31ms max=3.2s    p(90)=1.89s    p(95)=2.01s    p(99.9)=2.86s 
     iterations.....................: 14804   214.453743/s
     success_rate...................: 100.00% ✓ 14804      ✗ 0    
     vus............................: 56      min=0        max=499
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

