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
| hive-router | v0.0.83 | 2,931 | 3,076 | 2,900 | 2.2% |  |
| fusion-nightly-net11 | 16.5.1-p.1 | 2,471 | 2,574 | 2,456 | 1.7% |  |
| fusion | 16.5.0 | 2,407 | 2,453 | 2,338 | 2.0% |  |
| fusion-nightly | 16.5.1-p.1 | 2,386 | 2,476 | 2,351 | 1.8% |  |
| cosmo | 0.331.1 | 1,224 | 1,267 | 1,219 | 1.5% |  |
| hive-gateway-router-runtime | 2.10.4 | 554 | 570 | 553 | 1.1% |  |
| hive-gateway | 2.10.4 | 252 | 255 | 247 | 1.0% |  |
| apollo-gateway | 2.14.2 | 235 | 241 | 232 | 1.0% |  |
| apollo-router | v2.16.0 | — | — | — | — | non-compatible response (11322 across 9/9 runs) |
| feddi | — | — | — | — | — | not run |
| fusion-nightly-fed | — | — | — | — | — | not run |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (526565 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| fusion-nightly-net11 | 16.5.1-p.1 | 2,387 | 2,480 | 2,352 | 1.7% |  |
| hive-router | v0.0.83 | 2,382 | 2,520 | 2,354 | 2.4% |  |
| fusion-nightly | 16.5.1-p.1 | 2,357 | 2,441 | 2,343 | 1.5% |  |
| fusion | 16.5.0 | 2,338 | 2,430 | 2,334 | 1.4% |  |
| fusion-nightly-fed | 16.5.1-p.1 | 2,172 | 2,266 | 2,166 | 1.6% |  |
| cosmo | 0.331.1 | 1,119 | 1,163 | 1,113 | 1.6% |  |
| hive-gateway-router-runtime | 2.10.4 | 524 | 540 | 523 | 1.1% |  |
| hive-gateway | 2.10.4 | 239 | 242 | 235 | 0.9% |  |
| apollo-gateway | 2.14.2 | 236 | 240 | 235 | 0.7% |  |
| apollo-router | v2.16.0 | — | — | — | — | non-compatible response (54988 across 9/9 runs) |
| feddi | — | — | — | — | — | not run |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (315541 across 9/9 runs) |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.83)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 538656      ✗ 0     
     data_received..................: 16 GB   257 MB/s
     data_sent......................: 217 MB  3.5 MB/s
     http_req_blocked...............: avg=29.5µs   min=992ns   med=2.74µs  max=72.68ms  p(90)=4.53µs   p(95)=5.82µs   p(99.9)=3.99ms  
     http_req_connecting............: avg=26.03µs  min=0s      med=0s      max=72.61ms  p(90)=0s       p(95)=0s       p(99.9)=3.92ms  
     http_req_duration..............: avg=78.63ms  min=1.28ms  med=72.39ms max=334.01ms p(90)=152.8ms  p(95)=171.92ms p(99.9)=229.4ms 
       { expected_response:true }...: avg=78.63ms  min=1.28ms  med=72.39ms max=334.01ms p(90)=152.8ms  p(95)=171.92ms p(99.9)=229.4ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 180552
     http_req_receiving.............: avg=189.99µs min=26.09µs med=52.31µs max=63.58ms  p(90)=171.03µs p(95)=373.43µs p(99.9)=24.89ms 
     http_req_sending...............: avg=84.1µs   min=4.47µs  med=10.19µs max=67.07ms  p(90)=20.5µs   p(95)=130.56µs p(99.9)=12.82ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=78.36ms  min=1.23ms  med=72.1ms  max=333.39ms p(90)=152.42ms p(95)=171.39ms p(99.9)=227.52ms
     http_reqs......................: 180552  2931.56396/s
     iteration_duration.............: avg=79.38ms  min=2.08ms  med=73.15ms max=344.77ms p(90)=153.39ms p(95)=172.75ms p(99.9)=230.94ms
     iterations.....................: 179552  2915.327286/s
     success_rate...................: 100.00% ✓ 179552      ✗ 0     
     vus............................: 84      min=0         max=493 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (rust subgraphs) (16.5.1-p.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 459240      ✗ 0     
     data_received..................: 14 GB   217 MB/s
     data_sent......................: 185 MB  3.0 MB/s
     http_req_blocked...............: avg=15.96µs  min=992ns   med=2.61µs   max=43.76ms  p(90)=4.12µs   p(95)=5.17µs   p(99.9)=1.5ms   
     http_req_connecting............: avg=12.58µs  min=0s      med=0s       max=43.64ms  p(90)=0s       p(95)=0s       p(99.9)=1.37ms  
     http_req_duration..............: avg=92.31ms  min=1.92ms  med=87.8ms   max=347.45ms p(90)=176.45ms p(95)=192.1ms  p(99.9)=255.29ms
       { expected_response:true }...: avg=92.31ms  min=1.92ms  med=87.8ms   max=347.45ms p(90)=176.45ms p(95)=192.1ms  p(99.9)=255.29ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 154080
     http_req_receiving.............: avg=765.92µs min=53.65µs med=121.82µs max=67.37ms  p(90)=1.55ms   p(95)=2.55ms   p(99.9)=27.62ms 
     http_req_sending...............: avg=60.34µs  min=4.52µs  med=9.76µs   max=203.34ms p(90)=17.95µs  p(95)=114.7µs  p(99.9)=8.05ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=91.48ms  min=1.85ms  med=87.01ms  max=347.35ms p(90)=175.6ms  p(95)=191.22ms p(99.9)=253.75ms
     http_reqs......................: 154080  2471.435732/s
     iteration_duration.............: avg=93.15ms  min=3.69ms  med=88.78ms  max=355.52ms p(90)=176.89ms p(95)=192.57ms p(99.9)=255.83ms
     iterations.....................: 153080  2455.39578/s
     success_rate...................: 100.00% ✓ 153080      ✗ 0     
     vus............................: 74      min=0         max=494 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (rust subgraphs) (16.5.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 447162      ✗ 0     
     data_received..................: 13 GB   211 MB/s
     data_sent......................: 180 MB  2.9 MB/s
     http_req_blocked...............: avg=13.33µs min=862ns   med=2.07µs  max=37.95ms  p(90)=3.51µs   p(95)=4.6µs    p(99.9)=1.31ms  
     http_req_connecting............: avg=10.56µs min=0s      med=0s      max=37.87ms  p(90)=0s       p(95)=0s       p(99.9)=1.16ms  
     http_req_duration..............: avg=94.83ms min=1.98ms  med=81.04ms max=1.69s    p(90)=180.89ms p(95)=207.11ms p(99.9)=788.02ms
       { expected_response:true }...: avg=94.83ms min=1.98ms  med=81.04ms max=1.69s    p(90)=180.89ms p(95)=207.11ms p(99.9)=788.02ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 150054
     http_req_receiving.............: avg=1.34ms  min=50.07µs med=98.33µs max=852.47ms p(90)=1.69ms   p(95)=4.55ms   p(99.9)=64.23ms 
     http_req_sending...............: avg=57.03µs min=4.49µs  med=8.74µs  max=203.76ms p(90)=16.93µs  p(95)=97.14µs  p(99.9)=7.37ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=93.43ms min=1.89ms  med=79.93ms max=1.69s    p(90)=179.11ms p(95)=204.15ms p(99.9)=761.26ms
     http_reqs......................: 150054  2407.10761/s
     iteration_duration.............: avg=95.7ms  min=3.19ms  med=81.93ms max=1.69s    p(90)=181.5ms  p(95)=207.79ms p(99.9)=789.29ms
     iterations.....................: 149054  2391.066001/s
     success_rate...................: 100.00% ✓ 149054      ✗ 0     
     vus............................: 75      min=0         max=494 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (rust subgraphs) (16.5.1-p.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 443265      ✗ 0     
     data_received..................: 13 GB   209 MB/s
     data_sent......................: 179 MB  2.9 MB/s
     http_req_blocked...............: avg=18.55µs min=992ns   med=2.56µs  max=51.05ms  p(90)=4.09µs   p(95)=5.18µs   p(99.9)=1.95ms  
     http_req_connecting............: avg=15.31µs min=0s      med=0s      max=50.9ms   p(90)=0s       p(95)=0s       p(99.9)=1.89ms  
     http_req_duration..............: avg=95.65ms min=1.99ms  med=82.57ms max=1.4s     p(90)=183.12ms p(95)=210.33ms p(99.9)=692.78ms
       { expected_response:true }...: avg=95.65ms min=1.99ms  med=82.57ms max=1.4s     p(90)=183.12ms p(95)=210.33ms p(99.9)=692.78ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 148755
     http_req_receiving.............: avg=1.45ms  min=52.64µs med=103.1µs max=566.77ms p(90)=1.67ms   p(95)=4.65ms   p(99.9)=88.09ms 
     http_req_sending...............: avg=69.12µs min=4.68µs  med=9.54µs  max=276.37ms p(90)=17.37µs  p(95)=110.69µs p(99.9)=9.21ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=94.12ms min=1.88ms  med=81.45ms max=1.4s     p(90)=180.75ms p(95)=206.34ms p(99.9)=676.81ms
     http_reqs......................: 148755  2386.741683/s
     iteration_duration.............: avg=96.55ms min=3.35ms  med=83.59ms max=1.4s     p(90)=183.7ms  p(95)=211ms    p(99.9)=693.47ms
     iterations.....................: 147755  2370.6969/s
     success_rate...................: 100.00% ✓ 147755      ✗ 0     
     vus............................: 71      min=0         max=494 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (rust subgraphs) (0.331.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 226707      ✗ 0    
     data_received..................: 6.7 GB  108 MB/s
     data_sent......................: 92 MB   1.5 MB/s
     http_req_blocked...............: avg=4.78µs   min=912ns   med=2.19µs   max=18.11ms  p(90)=3.87µs   p(95)=4.77µs   p(99.9)=317.16µs
     http_req_connecting............: avg=1.88µs   min=0s      med=0s       max=18.02ms  p(90)=0s       p(95)=0s       p(99.9)=240.95µs
     http_req_duration..............: avg=186.35ms min=1.98ms  med=188.06ms max=487.45ms p(90)=347.01ms p(95)=372.11ms p(99.9)=440.16ms
       { expected_response:true }...: avg=186.35ms min=1.98ms  med=188.06ms max=487.45ms p(90)=347.01ms p(95)=372.11ms p(99.9)=440.16ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 76569
     http_req_receiving.............: avg=69.49µs  min=27.61µs med=58.93µs  max=15.12ms  p(90)=95.29µs  p(95)=108.97µs p(99.9)=823.31µs
     http_req_sending...............: avg=27.18µs  min=5.08µs  med=9.95µs   max=123.51ms p(90)=16.59µs  p(95)=20.41µs  p(99.9)=2.9ms   
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=186.25ms min=1.87ms  med=187.96ms max=487.4ms  p(90)=346.92ms p(95)=372.01ms p(99.9)=440.05ms
     http_reqs......................: 76569   1224.817672/s
     iteration_duration.............: avg=189.03ms min=3.73ms  med=191.05ms max=487.67ms p(90)=347.97ms p(95)=372.71ms p(99.9)=440.5ms 
     iterations.....................: 75569   1208.821411/s
     success_rate...................: 100.00% ✓ 75569       ✗ 0    
     vus............................: 81      min=0         max=492
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (rust subgraphs) (2.10.4)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 104022     ✗ 0    
     data_received..................: 3.1 GB  49 MB/s
     data_sent......................: 43 MB   666 kB/s
     http_req_blocked...............: avg=6.42µs   min=1.01µs  med=2.41µs   max=3.15ms   p(90)=4.1µs    p(95)=5.03µs   p(99.9)=886.35µs
     http_req_connecting............: avg=3.04µs   min=0s      med=0s       max=3.11ms   p(90)=0s       p(95)=0s       p(99.9)=822.92µs
     http_req_duration..............: avg=402.19ms min=3.59ms  med=375.7ms  max=1.63s    p(90)=788.83ms p(95)=856.12ms p(99.9)=1.22s   
       { expected_response:true }...: avg=402.19ms min=3.59ms  med=375.7ms  max=1.63s    p(90)=788.83ms p(95)=856.12ms p(99.9)=1.22s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 35674
     http_req_receiving.............: avg=79.97µs  min=30.11µs med=63.1µs   max=147.9ms  p(90)=101.36µs p(95)=115.03µs p(99.9)=804.89µs
     http_req_sending...............: avg=26.63µs  min=5.05µs  med=12.02µs  max=130.33ms p(90)=19.67µs  p(95)=22.53µs  p(99.9)=1.63ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=402.08ms min=3.51ms  med=375.62ms max=1.63s    p(90)=788.77ms p(95)=856.03ms p(99.9)=1.22s   
     http_reqs......................: 35674   554.748601/s
     iteration_duration.............: avg=414ms    min=23.1ms  med=390.88ms max=1.64s    p(90)=791.92ms p(95)=859.43ms p(99.9)=1.23s   
     iterations.....................: 34674   539.198099/s
     success_rate...................: 100.00% ✓ 34674      ✗ 0    
     vus............................: 71      min=0        max=496
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (rust subgraphs) (2.10.4)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 48135      ✗ 0    
     data_received..................: 1.5 GB  22 MB/s
     data_sent......................: 21 MB   303 kB/s
     http_req_blocked...............: avg=14.31µs  min=1.52µs  med=3.64µs   max=12.26ms p(90)=5.42µs   p(95)=6.99µs  p(99.9)=2.05ms
     http_req_connecting............: avg=9.05µs   min=0s      med=0s       max=12.2ms  p(90)=0s       p(95)=0s      p(99.9)=2.03ms
     http_req_duration..............: avg=847.06ms min=5.78ms  med=741.79ms max=18.64s  p(90)=1.44s    p(95)=1.61s   p(99.9)=17.53s
       { expected_response:true }...: avg=847.06ms min=5.78ms  med=741.79ms max=18.64s  p(90)=1.44s    p(95)=1.61s   p(99.9)=17.53s
     http_req_failed................: 0.00%   ✓ 0          ✗ 17045
     http_req_receiving.............: avg=94.13µs  min=36.32µs med=87.07µs  max=6.08ms  p(90)=123.63µs p(95)=139.2µs p(99.9)=1.38ms
     http_req_sending...............: avg=28.68µs  min=6.04µs  med=17.29µs  max=10.96ms p(90)=23.16µs  p(95)=27.6µs  p(99.9)=2.74ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s      p(99.9)=0s    
     http_req_waiting...............: avg=846.94ms min=5.7ms   med=741.67ms max=18.64s  p(90)=1.44s    p(95)=1.61s   p(99.9)=17.53s
     http_reqs......................: 17045   252.128854/s
     iteration_duration.............: avg=899.86ms min=32.38ms med=795.77ms max=18.64s  p(90)=1.47s    p(95)=1.61s   p(99.9)=17.54s
     iterations.....................: 16045   237.3369/s
     success_rate...................: 100.00% ✓ 16045      ✗ 0    
     vus............................: 83      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-gateway (rust subgraphs) (2.14.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 48624      ✗ 0    
     data_received..................: 1.5 GB  21 MB/s
     data_sent......................: 21 MB   288 kB/s
     http_req_blocked...............: avg=13.45µs  min=1.12µs  med=3.11µs   max=3.61ms  p(90)=4.65µs   p(95)=5.99µs   p(99.9)=2.03ms  
     http_req_connecting............: avg=8.82µs   min=0s      med=0s       max=3.41ms  p(90)=0s       p(95)=0s       p(99.9)=2.01ms  
     http_req_duration..............: avg=380.6ms  min=7.44ms  med=410.49ms max=1.14s   p(90)=669.5ms  p(95)=721.94ms p(99.9)=995.29ms
       { expected_response:true }...: avg=380.6ms  min=7.44ms  med=410.49ms max=1.14s   p(90)=669.5ms  p(95)=721.94ms p(99.9)=995.29ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 17208
     http_req_receiving.............: avg=99.17µs  min=33.34µs med=85.76µs  max=91.58ms p(90)=122.7µs  p(95)=137.27µs p(99.9)=1.04ms  
     http_req_sending...............: avg=36.44µs  min=5.62µs  med=17.15µs  max=85.05ms p(90)=22.32µs  p(95)=26.77µs  p(99.9)=2.87ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=380.46ms min=7.36ms  med=410.39ms max=1.14s   p(90)=669.35ms p(95)=721.84ms p(99.9)=995.1ms 
     http_reqs......................: 17208   235.202741/s
     iteration_duration.............: avg=404.05ms min=8.04ms  med=431.07ms max=1.15s   p(90)=675.02ms p(95)=724.89ms p(99.9)=1s      
     iterations.....................: 16208   221.53452/s
     success_rate...................: 100.00% ✓ 16208      ✗ 0    
     vus............................: 56      min=0        max=496
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (.net subgraphs) (16.5.1-p.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 439995      ✗ 0     
     data_received..................: 13 GB   209 MB/s
     data_sent......................: 177 MB  2.9 MB/s
     http_req_blocked...............: avg=14.71µs  min=862ns   med=2.32µs   max=43.63ms  p(90)=4.24µs   p(95)=5.44µs   p(99.9)=1.13ms  
     http_req_connecting............: avg=11.68µs  min=0s      med=0s       max=43.58ms  p(90)=0s       p(95)=0s       p(99.9)=1.09ms  
     http_req_duration..............: avg=96.31ms  min=1.49ms  med=91.52ms  max=395.32ms p(90)=183.01ms p(95)=198.94ms p(99.9)=252.92ms
       { expected_response:true }...: avg=96.31ms  min=1.49ms  med=91.52ms  max=395.32ms p(90)=183.01ms p(95)=198.94ms p(99.9)=252.92ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 147665
     http_req_receiving.............: avg=778.65µs min=51.63µs med=118.05µs max=181.84ms p(90)=1.61ms   p(95)=2.6ms    p(99.9)=26.45ms 
     http_req_sending...............: avg=61.41µs  min=4.68µs  med=9.79µs   max=78.55ms  p(90)=22.28µs  p(95)=113.81µs p(99.9)=8.06ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=95.47ms  min=1.41ms  med=90.67ms  max=394.83ms p(90)=182.07ms p(95)=197.96ms p(99.9)=250.18ms
     http_reqs......................: 147665  2387.879801/s
     iteration_duration.............: avg=97.22ms  min=3.16ms  med=92.53ms  max=395.57ms p(90)=183.46ms p(95)=199.44ms p(99.9)=254.36ms
     iterations.....................: 146665  2371.708875/s
     success_rate...................: 100.00% ✓ 146665      ✗ 0     
     vus............................: 95      min=0         max=500 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.83)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 440307      ✗ 0     
     data_received..................: 13 GB   208 MB/s
     data_sent......................: 178 MB  2.9 MB/s
     http_req_blocked...............: avg=15.27µs  min=942ns  med=2.42µs  max=62.01ms  p(90)=4.19µs   p(95)=5.4µs    p(99.9)=737.11µs
     http_req_connecting............: avg=12.03µs  min=0s     med=0s      max=61.83ms  p(90)=0s       p(95)=0s       p(99.9)=674.67µs
     http_req_duration..............: avg=96.25ms  min=1.54ms med=91.4ms  max=301.95ms p(90)=185.85ms p(95)=202.65ms p(99.9)=258.16ms
       { expected_response:true }...: avg=96.25ms  min=1.54ms med=91.4ms  max=301.95ms p(90)=185.85ms p(95)=202.65ms p(99.9)=258.16ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 147769
     http_req_receiving.............: avg=119.73µs min=25.8µs med=53.73µs max=44.84ms  p(90)=125.22µs p(95)=334.97µs p(99.9)=10.1ms  
     http_req_sending...............: avg=66.77µs  min=4.75µs med=10.3µs  max=254.88ms p(90)=20.76µs  p(95)=117.3µs  p(99.9)=8.1ms   
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=96.06ms  min=1.44ms med=91.2ms  max=301.6ms  p(90)=185.58ms p(95)=202.37ms p(99.9)=257.33ms
     http_reqs......................: 147769  2382.059574/s
     iteration_duration.............: avg=97.15ms  min=3.65ms med=92.52ms max=319.7ms  p(90)=186.35ms p(95)=203.08ms p(99.9)=259.16ms
     iterations.....................: 146769  2365.939417/s
     success_rate...................: 100.00% ✓ 146769      ✗ 0     
     vus............................: 59      min=0         max=498 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.5.1-p.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 434907      ✗ 0     
     data_received..................: 13 GB   207 MB/s
     data_sent......................: 175 MB  2.8 MB/s
     http_req_blocked...............: avg=19.07µs min=911ns   med=2.29µs   max=78.42ms  p(90)=3.98µs   p(95)=5.17µs   p(99.9)=1.99ms  
     http_req_connecting............: avg=15.96µs min=0s      med=0s       max=78.34ms  p(90)=0s       p(95)=0s       p(99.9)=1.95ms  
     http_req_duration..............: avg=97.45ms min=1.55ms  med=85.16ms  max=1.37s    p(90)=185.16ms p(95)=213.93ms p(99.9)=637.05ms
       { expected_response:true }...: avg=97.45ms min=1.55ms  med=85.16ms  max=1.37s    p(90)=185.16ms p(95)=213.93ms p(99.9)=637.05ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 145969
     http_req_receiving.............: avg=1.51ms  min=53.07µs med=103.35µs max=671.31ms p(90)=1.63ms   p(95)=4.12ms   p(99.9)=123.7ms 
     http_req_sending...............: avg=67.13µs min=4.77µs  med=9.55µs   max=143.26ms p(90)=19.83µs  p(95)=109.06µs p(99.9)=8.76ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=95.87ms min=1.47ms  med=83.94ms  max=1.34s    p(90)=183.45ms p(95)=210.87ms p(99.9)=629.79ms
     http_reqs......................: 145969  2357.034365/s
     iteration_duration.............: avg=98.4ms  min=3.02ms  med=86.12ms  max=1.37s    p(90)=185.76ms p(95)=214.73ms p(99.9)=638.54ms
     iterations.....................: 144969  2340.886866/s
     success_rate...................: 100.00% ✓ 144969      ✗ 0     
     vus............................: 55      min=0         max=499 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (.net subgraphs) (16.5.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 431076      ✗ 0     
     data_received..................: 13 GB   205 MB/s
     data_sent......................: 174 MB  2.8 MB/s
     http_req_blocked...............: avg=15.18µs min=871ns   med=2.33µs  max=64.74ms  p(90)=4.06µs   p(95)=5.25µs   p(99.9)=1.24ms  
     http_req_connecting............: avg=11.97µs min=0s      med=0s      max=64.54ms  p(90)=0s       p(95)=0s       p(99.9)=1.16ms  
     http_req_duration..............: avg=98.4ms  min=1.54ms  med=86.02ms max=1.86s    p(90)=188.66ms p(95)=216.07ms p(99.9)=674.85ms
       { expected_response:true }...: avg=98.4ms  min=1.54ms  med=86.02ms max=1.86s    p(90)=188.66ms p(95)=216.07ms p(99.9)=674.85ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 144692
     http_req_receiving.............: avg=1.28ms  min=51.65µs med=102.8µs max=813.91ms p(90)=1.54ms   p(95)=3.84ms   p(99.9)=78.62ms 
     http_req_sending...............: avg=64.44µs min=4.75µs  med=9.52µs  max=130.89ms p(90)=19.9µs   p(95)=107.68µs p(99.9)=8.25ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=97.05ms min=1.46ms  med=84.94ms max=1.86s    p(90)=186.85ms p(95)=212.6ms  p(99.9)=672.1ms 
     http_reqs......................: 144692  2338.679713/s
     iteration_duration.............: avg=99.35ms min=2.88ms  med=87.08ms max=1.86s    p(90)=189.25ms p(95)=216.74ms p(99.9)=676.54ms
     iterations.....................: 143692  2322.516555/s
     success_rate...................: 100.00% ✓ 143692      ✗ 0     
     vus............................: 31      min=0         max=500 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (.net subgraphs) (16.5.1-p.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 403422      ✗ 0     
     data_received..................: 12 GB   190 MB/s
     data_sent......................: 163 MB  2.6 MB/s
     http_req_blocked...............: avg=18.38µs  min=902ns   med=2.68µs   max=69.34ms p(90)=4.65µs   p(95)=5.8µs    p(99.9)=1.06ms  
     http_req_connecting............: avg=14.75µs  min=0s      med=0s       max=69.15ms p(90)=0s       p(95)=0s       p(99.9)=1.03ms  
     http_req_duration..............: avg=105.04ms min=1.97ms  med=90.62ms  max=1.75s   p(90)=198.91ms p(95)=232.27ms p(99.9)=703.54ms
       { expected_response:true }...: avg=105.04ms min=1.97ms  med=90.62ms  max=1.75s   p(90)=198.91ms p(95)=232.27ms p(99.9)=703.54ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 135474
     http_req_receiving.............: avg=1.59ms   min=52.96µs med=109.65µs max=1.44s   p(90)=1.54ms   p(95)=4.04ms   p(99.9)=133.5ms 
     http_req_sending...............: avg=69.64µs  min=4.63µs  med=10.88µs  max=77.15ms p(90)=22.42µs  p(95)=119.62µs p(99.9)=9.69ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=103.38ms min=1.87ms  med=89.63ms  max=1.75s   p(90)=197.15ms p(95)=228.55ms p(99.9)=693.15ms
     http_reqs......................: 135474  2172.502389/s
     iteration_duration.............: avg=106.14ms min=3.91ms  med=91.67ms  max=1.76s   p(90)=199.7ms  p(95)=233.38ms p(99.9)=704.21ms
     iterations.....................: 134474  2156.466084/s
     success_rate...................: 100.00% ✓ 134474      ✗ 0     
     vus............................: 74      min=0         max=494 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (.net subgraphs) (0.331.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 207504      ✗ 0    
     data_received..................: 6.1 GB  98 MB/s
     data_sent......................: 84 MB   1.3 MB/s
     http_req_blocked...............: avg=6.81µs   min=1.07µs  med=3.06µs   max=11.81ms  p(90)=4.89µs   p(95)=5.9µs    p(99.9)=671.53µs
     http_req_connecting............: avg=3µs      min=0s      med=0s       max=11.74ms  p(90)=0s       p(95)=0s       p(99.9)=639.73µs
     http_req_duration..............: avg=203.42ms min=2.05ms  med=204.24ms max=557.76ms p(90)=376.75ms p(95)=404.44ms p(99.9)=485.77ms
       { expected_response:true }...: avg=203.42ms min=2.05ms  med=204.24ms max=557.76ms p(90)=376.75ms p(95)=404.44ms p(99.9)=485.77ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 70168
     http_req_receiving.............: avg=86.51µs  min=28.48µs med=70.18µs  max=76.29ms  p(90)=113.62µs p(95)=130.28µs p(99.9)=1.56ms  
     http_req_sending...............: avg=32.3µs   min=5.54µs  med=12.94µs  max=115.92ms p(90)=20.41µs  p(95)=24.37µs  p(99.9)=3.6ms   
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=203.3ms  min=1.94ms  med=204.12ms max=557.67ms p(90)=376.61ms p(95)=404.31ms p(99.9)=485.69ms
     http_reqs......................: 70168   1119.121209/s
     iteration_duration.............: avg=206.62ms min=5.11ms  med=207.85ms max=557.99ms p(90)=377.58ms p(95)=405.12ms p(99.9)=486.03ms
     iterations.....................: 69168   1103.172041/s
     success_rate...................: 100.00% ✓ 69168       ✗ 0    
     vus............................: 88      min=0         max=499
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (.net subgraphs) (2.10.4)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 98946      ✗ 0    
     data_received..................: 3.0 GB  46 MB/s
     data_sent......................: 41 MB   630 kB/s
     http_req_blocked...............: avg=8.99µs   min=1.15µs  med=3.24µs   max=3.85ms   p(90)=4.96µs   p(95)=6.02µs   p(99.9)=1.38ms
     http_req_connecting............: avg=4.61µs   min=0s      med=0s       max=3.81ms   p(90)=0s       p(95)=0s       p(99.9)=1.32ms
     http_req_duration..............: avg=422.26ms min=3.82ms  med=393.13ms max=1.82s    p(90)=832.69ms p(95)=904.32ms p(99.9)=1.34s 
       { expected_response:true }...: avg=422.26ms min=3.82ms  med=393.13ms max=1.82s    p(90)=832.69ms p(95)=904.32ms p(99.9)=1.34s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 33982
     http_req_receiving.............: avg=99.2µs   min=31.61µs med=75.07µs  max=171.12ms p(90)=114.22µs p(95)=129.37µs p(99.9)=1.05ms
     http_req_sending...............: avg=42.36µs  min=5.3µs   med=14.92µs  max=163.17ms p(90)=22.05µs  p(95)=25.16µs  p(99.9)=2.86ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=422.12ms min=3.75ms  med=393.01ms max=1.82s    p(90)=832.5ms  p(95)=904.22ms p(99.9)=1.34s 
     http_reqs......................: 33982   524.634244/s
     iteration_duration.............: avg=435.29ms min=17.33ms med=408.11ms max=1.83s    p(90)=836.96ms p(95)=907.24ms p(99.9)=1.35s 
     iterations.....................: 32982   509.195652/s
     success_rate...................: 100.00% ✓ 32982      ✗ 0    
     vus............................: 90      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (.net subgraphs) (2.10.4)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 45645      ✗ 0    
     data_received..................: 1.4 GB  21 MB/s
     data_sent......................: 20 MB   288 kB/s
     http_req_blocked...............: avg=16.12µs  min=1.42µs  med=3.74µs   max=16.18ms  p(90)=5.56µs   p(95)=7.35µs   p(99.9)=2.44ms
     http_req_connecting............: avg=10.53µs  min=0s      med=0s       max=16.13ms  p(90)=0s       p(95)=0s       p(99.9)=2.38ms
     http_req_duration..............: avg=897.36ms min=5.64ms  med=804.21ms max=5.23s    p(90)=1.79s    p(95)=2.01s    p(99.9)=4.15s 
       { expected_response:true }...: avg=897.36ms min=5.64ms  med=804.21ms max=5.23s    p(90)=1.79s    p(95)=2.01s    p(99.9)=4.15s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 16215
     http_req_receiving.............: avg=105.16µs min=36.37µs med=90.66µs  max=121.05ms p(90)=128.64µs p(95)=144.23µs p(99.9)=1ms   
     http_req_sending...............: avg=44.06µs  min=6.14µs  med=17.54µs  max=85.83ms  p(90)=23.43µs  p(95)=28.58µs  p(99.9)=4.73ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=897.22ms min=5.53ms  med=804.12ms max=5.23s    p(90)=1.79s    p(95)=2.01s    p(99.9)=4.15s 
     http_reqs......................: 16215   239.856815/s
     iteration_duration.............: avg=956.41ms min=25.31ms med=877.51ms max=5.24s    p(90)=1.83s    p(95)=2.03s    p(99.9)=4.33s 
     iterations.....................: 15215   225.064536/s
     success_rate...................: 100.00% ✓ 15215      ✗ 0    
     vus............................: 83      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-gateway (.net subgraphs) (2.14.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 45747      ✗ 0    
     data_received..................: 1.4 GB  21 MB/s
     data_sent......................: 20 MB   284 kB/s
     http_req_blocked...............: avg=14.49µs  min=1.13µs  med=3.31µs   max=8.67ms  p(90)=5.12µs   p(95)=6.65µs   p(99.9)=2.13ms
     http_req_connecting............: avg=9.36µs   min=0s      med=0s       max=8.61ms  p(90)=0s       p(95)=0s       p(99.9)=2.08ms
     http_req_duration..............: avg=893.67ms min=7.7ms   med=820.25ms max=3.08s   p(90)=1.82s    p(95)=1.94s    p(99.9)=2.66s 
       { expected_response:true }...: avg=893.67ms min=7.7ms   med=820.25ms max=3.08s   p(90)=1.82s    p(95)=1.94s    p(99.9)=2.66s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 16249
     http_req_receiving.............: avg=98.64µs  min=28.07µs med=90.42µs  max=18.45ms p(90)=131.33µs p(95)=147.03µs p(99.9)=1ms   
     http_req_sending...............: avg=34.76µs  min=5.22µs  med=17.46µs  max=42.27ms p(90)=23.1µs   p(95)=27.45µs  p(99.9)=2.95ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=893.54ms min=7.61ms  med=820.13ms max=3.08s   p(90)=1.82s    p(95)=1.94s    p(99.9)=2.65s 
     http_reqs......................: 16249   236.189382/s
     iteration_duration.............: avg=952.22ms min=33.61ms med=904.07ms max=3.09s   p(90)=1.84s    p(95)=1.95s    p(99.9)=2.67s 
     iterations.....................: 15249   221.653757/s
     success_rate...................: 100.00% ✓ 15249      ✗ 0    
     vus............................: 95      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

