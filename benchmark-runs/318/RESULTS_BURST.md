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
| hive-router | v0.0.84 | 2,666 | 2,795 | 2,650 | 2.1% |  |
| fusion-nightly | 16.6.1-p.3 | 2,549 | 2,647 | 2,529 | 1.6% |  |
| fusion-nightly-net11 | 16.6.1-p.3 | 2,541 | 2,642 | 2,521 | 1.7% |  |
| fusion | 16.6.0 | 2,460 | 2,560 | 2,441 | 1.6% |  |
| fusion-nightly-fed | 16.6.1-p.3 | 2,353 | 2,442 | 2,337 | 1.6% |  |
| cosmo | 0.334.0 | 1,227 | 1,267 | 1,223 | 1.4% |  |
| hive-gateway-router-runtime | 2.10.8 | 571 | 583 | 567 | 1.0% |  |
| hive-gateway | 2.10.8 | 256 | 259 | 254 | 0.7% |  |
| apollo-gateway | 2.14.3 | 232 | 238 | 231 | 0.9% |  |
| apollo-router | v2.16.1 | — | — | — | — | non-compatible response (5706 across 9/9 runs) |
| feddi | — | — | — | — | — | not run |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (495923 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| fusion-nightly-net11 | 16.6.1-p.3 | 2,480 | 2,570 | 2,465 | 1.4% |  |
| fusion-nightly | 16.6.1-p.3 | 2,329 | 2,421 | 2,302 | 1.7% |  |
| fusion | 16.6.0 | 2,300 | 2,388 | 2,285 | 1.5% |  |
| hive-router | v0.0.84 | 2,149 | 2,332 | 2,129 | 3.1% |  |
| fusion-nightly-fed | 16.6.1-p.3 | 2,143 | 2,238 | 2,128 | 1.7% |  |
| cosmo | 0.334.0 | 1,122 | 1,165 | 1,112 | 1.6% |  |
| hive-gateway-router-runtime | 2.10.8 | 534 | 550 | 531 | 1.1% |  |
| hive-gateway | 2.10.8 | 242 | 247 | 239 | 1.1% |  |
| apollo-gateway | 2.14.3 | 235 | 240 | 233 | 0.9% |  |
| apollo-router | v2.16.1 | — | — | — | — | non-compatible response (44227 across 9/9 runs) |
| feddi | — | — | — | — | — | not run |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (245187 across 9/9 runs) |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.84)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 490956      ✗ 0     
     data_received..................: 14 GB   234 MB/s
     data_sent......................: 198 MB  3.2 MB/s
     http_req_blocked...............: avg=13.79µs  min=902ns   med=2.12µs  max=45.76ms  p(90)=3.59µs   p(95)=4.74µs   p(99.9)=1.52ms  
     http_req_connecting............: avg=10.9µs   min=0s      med=0s      max=45.59ms  p(90)=0s       p(95)=0s       p(99.9)=1.43ms  
     http_req_duration..............: avg=86.36ms  min=1.45ms  med=81.25ms max=329.44ms p(90)=166.65ms p(95)=179.07ms p(99.9)=222.42ms
       { expected_response:true }...: avg=86.36ms  min=1.45ms  med=81.25ms max=329.44ms p(90)=166.65ms p(95)=179.07ms p(99.9)=222.42ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 164652
     http_req_receiving.............: avg=112.37µs min=27.56µs med=52.15µs max=67.15ms  p(90)=119.25µs p(95)=309.96µs p(99.9)=9.12ms  
     http_req_sending...............: avg=61.26µs  min=4.48µs  med=9.1µs   max=160.3ms  p(90)=17.15µs  p(95)=110.14µs p(99.9)=7.71ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=86.18ms  min=1.41ms  med=81.09ms max=329.23ms p(90)=166.45ms p(95)=178.85ms p(99.9)=221.81ms
     http_reqs......................: 164652  2666.599636/s
     iteration_duration.............: avg=87.11ms  min=2.03ms  med=82.16ms max=340.72ms p(90)=167.04ms p(95)=179.46ms p(99.9)=223.12ms
     iterations.....................: 163652  2650.404268/s
     success_rate...................: 100.00% ✓ 163652      ✗ 0     
     vus............................: 90      min=0         max=499 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (rust subgraphs) (16.6.1-p.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 473199      ✗ 0     
     data_received..................: 14 GB   223 MB/s
     data_sent......................: 191 MB  3.1 MB/s
     http_req_blocked...............: avg=27.5µs  min=882ns  med=2.58µs  max=107.26ms p(90)=4.2µs    p(95)=5.31µs   p(99.9)=4.45ms  
     http_req_connecting............: avg=24.09µs min=0s     med=0s      max=107.23ms p(90)=0s       p(95)=0s       p(99.9)=4.4ms   
     http_req_duration..............: avg=89.54ms min=1.9ms  med=78.96ms max=1.06s    p(90)=170.06ms p(95)=197.73ms p(99.9)=578.82ms
       { expected_response:true }...: avg=89.54ms min=1.9ms  med=78.96ms max=1.06s    p(90)=170.06ms p(95)=197.73ms p(99.9)=578.82ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 158733
     http_req_receiving.............: avg=1.55ms  min=52µs   med=97.69µs max=891.4ms  p(90)=1.49ms   p(95)=4.25ms   p(99.9)=106.86ms
     http_req_sending...............: avg=78.2µs  min=4.48µs med=9.59µs  max=111.69ms p(90)=18.2µs   p(95)=115.1µs  p(99.9)=10.83ms 
     http_req_tls_handshaking.......: avg=0s      min=0s     med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=87.91ms min=1.83ms med=77.79ms max=1.06s    p(90)=168.48ms p(95)=195.13ms p(99.9)=533.1ms 
     http_reqs......................: 158733  2549.014411/s
     iteration_duration.............: avg=90.4ms  min=3.37ms med=79.77ms max=1.06s    p(90)=170.61ms p(95)=198.58ms p(99.9)=593.36ms
     iterations.....................: 157733  2532.955908/s
     success_rate...................: 100.00% ✓ 157733      ✗ 0     
     vus............................: 69      min=0         max=495 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (rust subgraphs) (16.6.1-p.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 471537      ✗ 0     
     data_received..................: 14 GB   223 MB/s
     data_sent......................: 190 MB  3.1 MB/s
     http_req_blocked...............: avg=13.33µs  min=881ns   med=2µs     max=56.37ms  p(90)=3.29µs   p(95)=4.21µs   p(99.9)=1.46ms  
     http_req_connecting............: avg=10.77µs  min=0s      med=0s      max=56.31ms  p(90)=0s       p(95)=0s       p(99.9)=1.41ms  
     http_req_duration..............: avg=89.92ms  min=1.88ms  med=85.03ms max=321.01ms p(90)=172.04ms p(95)=188.09ms p(99.9)=242.86ms
       { expected_response:true }...: avg=89.92ms  min=1.88ms  med=85.03ms max=321.01ms p(90)=172.04ms p(95)=188.09ms p(99.9)=242.86ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 158179
     http_req_receiving.............: avg=623.79µs min=50.48µs med=102.3µs max=102.56ms p(90)=1.19ms   p(95)=2.09ms   p(99.9)=25.59ms 
     http_req_sending...............: avg=59.62µs  min=4.28µs  med=8.41µs  max=193.7ms  p(90)=15.53µs  p(95)=103.29µs p(99.9)=7.54ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=89.23ms  min=1.81ms  med=84.3ms  max=316.58ms p(90)=171.18ms p(95)=187.21ms p(99.9)=242.23ms
     http_reqs......................: 158179  2541.900235/s
     iteration_duration.............: avg=90.72ms  min=3.78ms  med=85.89ms max=329.55ms p(90)=172.47ms p(95)=188.46ms p(99.9)=243.75ms
     iterations.....................: 157179  2525.830465/s
     success_rate...................: 100.00% ✓ 157179      ✗ 0     
     vus............................: 67      min=0         max=496 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (rust subgraphs) (16.6.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 457248      ✗ 0     
     data_received..................: 13 GB   216 MB/s
     data_sent......................: 184 MB  3.0 MB/s
     http_req_blocked...............: avg=15.49µs min=911ns   med=2.07µs  max=54.39ms  p(90)=3.35µs   p(95)=4.31µs   p(99.9)=1.62ms  
     http_req_connecting............: avg=12.37µs min=0s      med=0s      max=54.34ms  p(90)=0s       p(95)=0s       p(99.9)=1.57ms  
     http_req_duration..............: avg=92.73ms min=1.97ms  med=82.21ms max=1.23s    p(90)=173.65ms p(95)=202.11ms p(99.9)=679.06ms
       { expected_response:true }...: avg=92.73ms min=1.97ms  med=82.21ms max=1.23s    p(90)=173.65ms p(95)=202.11ms p(99.9)=679.06ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 153416
     http_req_receiving.............: avg=1.35ms  min=51.45µs med=97.97µs max=608.15ms p(90)=1.69ms   p(95)=4.48ms   p(99.9)=80.93ms 
     http_req_sending...............: avg=61.7µs  min=4.67µs  med=8.67µs  max=162.26ms p(90)=15.52µs  p(95)=100.15µs p(99.9)=8.58ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=91.31ms min=1.88ms  med=80.91ms max=1.23s    p(90)=171.94ms p(95)=199.53ms p(99.9)=672.27ms
     http_reqs......................: 153416  2460.333861/s
     iteration_duration.............: avg=93.59ms min=3.11ms  med=83.26ms max=1.23s    p(90)=174.2ms  p(95)=202.9ms  p(99.9)=679.53ms
     iterations.....................: 152416  2444.296852/s
     success_rate...................: 100.00% ✓ 152416      ✗ 0     
     vus............................: 72      min=0         max=494 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (rust subgraphs) (16.6.1-p.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 435036     ✗ 0     
     data_received..................: 13 GB   207 MB/s
     data_sent......................: 175 MB  2.8 MB/s
     http_req_blocked...............: avg=18.17µs min=982ns   med=2.71µs   max=60.9ms   p(90)=4.36µs   p(95)=5.5µs    p(99.9)=1.63ms  
     http_req_connecting............: avg=14.49µs min=0s      med=0s       max=60.72ms  p(90)=0s       p(95)=0s       p(99.9)=1.56ms  
     http_req_duration..............: avg=97.44ms min=1.64ms  med=79.56ms  max=2.27s    p(90)=185.92ms p(95)=219.83ms p(99.9)=778.12ms
       { expected_response:true }...: avg=97.44ms min=1.64ms  med=79.56ms  max=2.27s    p(90)=185.92ms p(95)=219.83ms p(99.9)=778.12ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 146012
     http_req_receiving.............: avg=1.55ms  min=52.34µs med=102.61µs max=512.71ms p(90)=1.58ms   p(95)=4.48ms   p(99.9)=144.15ms
     http_req_sending...............: avg=67.49µs min=4.43µs  med=10.12µs  max=49.92ms  p(90)=18.83µs  p(95)=115.17µs p(99.9)=9.37ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=95.82ms min=1.57ms  med=78.51ms  max=2.23s    p(90)=184.06ms p(95)=215.88ms p(99.9)=767ms   
     http_reqs......................: 146012  2353.21262/s
     iteration_duration.............: avg=98.38ms min=2.64ms  med=80.66ms  max=2.27s    p(90)=186.57ms p(95)=220.68ms p(99.9)=779.07ms
     iterations.....................: 145012  2337.09605/s
     success_rate...................: 100.00% ✓ 145012     ✗ 0     
     vus............................: 60      min=0        max=498 
     vus_max........................: 500     min=500      max=500
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

     checks.........................: 100.00% ✓ 227232      ✗ 0    
     data_received..................: 6.7 GB  108 MB/s
     data_sent......................: 92 MB   1.5 MB/s
     http_req_blocked...............: avg=5.08µs   min=892ns   med=2.16µs   max=12.15ms  p(90)=3.73µs   p(95)=4.69µs   p(99.9)=231.61µs
     http_req_connecting............: avg=2.27µs   min=0s      med=0s       max=12.08ms  p(90)=0s       p(95)=0s       p(99.9)=173.55µs
     http_req_duration..............: avg=185.92ms min=1.96ms  med=187.13ms max=491.84ms p(90)=345.57ms p(95)=370.42ms p(99.9)=451.1ms 
       { expected_response:true }...: avg=185.92ms min=1.96ms  med=187.13ms max=491.84ms p(90)=345.57ms p(95)=370.42ms p(99.9)=451.1ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 76744
     http_req_receiving.............: avg=72.21µs  min=28.88µs med=60.27µs  max=31.19ms  p(90)=97.78µs  p(95)=112.4µs  p(99.9)=1ms     
     http_req_sending...............: avg=25.06µs  min=4.81µs  med=10.07µs  max=86.94ms  p(90)=17.55µs  p(95)=21.26µs  p(99.9)=2.91ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=185.82ms min=1.86ms  med=187.03ms max=491.77ms p(90)=345.47ms p(95)=370.36ms p(99.9)=451.03ms
     http_reqs......................: 76744   1227.198241/s
     iteration_duration.............: avg=188.61ms min=4.94ms  med=190.16ms max=491.97ms p(90)=346.36ms p(95)=371.06ms p(99.9)=451.45ms
     iterations.....................: 75744   1211.207438/s
     success_rate...................: 100.00% ✓ 75744       ✗ 0    
     vus............................: 81      min=0         max=493
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

     checks.........................: 100.00% ✓ 107079     ✗ 0    
     data_received..................: 3.2 GB  50 MB/s
     data_sent......................: 44 MB   686 kB/s
     http_req_blocked...............: avg=8.1µs    min=1.12µs  med=2.9µs    max=4.78ms  p(90)=4.63µs   p(95)=5.69µs   p(99.9)=1.24ms
     http_req_connecting............: avg=4.17µs   min=0s      med=0s       max=4.34ms  p(90)=0s       p(95)=0s       p(99.9)=1.22ms
     http_req_duration..............: avg=390.77ms min=3.5ms   med=363.99ms max=1.66s   p(90)=762.61ms p(95)=838ms    p(99.9)=1.25s 
       { expected_response:true }...: avg=390.77ms min=3.5ms   med=363.99ms max=1.66s   p(90)=762.61ms p(95)=838ms    p(99.9)=1.25s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 36693
     http_req_receiving.............: avg=85.49µs  min=29.62µs med=69.5µs   max=82.47ms p(90)=108.76µs p(95)=123.96µs p(99.9)=1.47ms
     http_req_sending...............: avg=24.29µs  min=5.81µs  med=13.66µs  max=23.41ms p(90)=21.1µs   p(95)=24.22µs  p(99.9)=2.14ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=390.66ms min=3.44ms  med=363.92ms max=1.66s   p(90)=762.52ms p(95)=837.91ms p(99.9)=1.25s 
     http_reqs......................: 36693   571.695479/s
     iteration_duration.............: avg=401.95ms min=13.28ms med=379ms    max=1.66s   p(90)=766.22ms p(95)=841.06ms p(99.9)=1.25s 
     iterations.....................: 35693   556.114973/s
     success_rate...................: 100.00% ✓ 35693      ✗ 0    
     vus............................: 64      min=0        max=497
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

     checks.........................: 100.00% ✓ 48993      ✗ 0    
     data_received..................: 1.5 GB  23 MB/s
     data_sent......................: 21 MB   309 kB/s
     http_req_blocked...............: avg=13.36µs  min=1.17µs  med=3.37µs   max=3.59ms  p(90)=5.15µs   p(95)=6.57µs   p(99.9)=2.4ms 
     http_req_connecting............: avg=8.3µs    min=0s      med=0s       max=3.54ms  p(90)=0s       p(95)=0s       p(99.9)=2.27ms
     http_req_duration..............: avg=823.29ms min=5.67ms  med=726.34ms max=19.21s  p(90)=1.42s    p(95)=1.59s    p(99.9)=18.27s
       { expected_response:true }...: avg=823.29ms min=5.67ms  med=726.34ms max=19.21s  p(90)=1.42s    p(95)=1.59s    p(99.9)=18.27s
     http_req_failed................: 0.00%   ✓ 0          ✗ 17331
     http_req_receiving.............: avg=101.23µs min=33.11µs med=91.25µs  max=27.5ms  p(90)=129.76µs p(95)=146.89µs p(99.9)=1.43ms
     http_req_sending...............: avg=43.62µs  min=5.82µs  med=18.06µs  max=122.2ms p(90)=23.57µs  p(95)=27.78µs  p(99.9)=2.54ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=823.15ms min=5.51ms  med=726.22ms max=19.21s  p(90)=1.42s    p(95)=1.59s    p(99.9)=18.27s
     http_reqs......................: 17331   256.993187/s
     iteration_duration.............: avg=873.75ms min=34.98ms med=790.4ms  max=19.21s  p(90)=1.44s    p(95)=1.6s     p(99.9)=18.29s
     iterations.....................: 16331   242.164661/s
     success_rate...................: 100.00% ✓ 16331      ✗ 0    
     vus............................: 78      min=0        max=500
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

     checks.........................: 100.00% ✓ 47904      ✗ 0    
     data_received..................: 1.5 GB  21 MB/s
     data_sent......................: 21 MB   285 kB/s
     http_req_blocked...............: avg=13.94µs  min=1.46µs  med=3.56µs   max=3.94ms   p(90)=5.26µs   p(95)=6.65µs   p(99.9)=2.06ms
     http_req_connecting............: avg=8.61µs   min=0s      med=0s       max=3.9ms    p(90)=0s       p(95)=0s       p(99.9)=2.04ms
     http_req_duration..............: avg=416.12ms min=7.31ms  med=479.89ms max=1.19s    p(90)=689.31ms p(95)=741.22ms p(99.9)=1.04s 
       { expected_response:true }...: avg=416.12ms min=7.31ms  med=479.89ms max=1.19s    p(90)=689.31ms p(95)=741.22ms p(99.9)=1.04s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 16968
     http_req_receiving.............: avg=105.76µs min=35.26µs med=85.83µs  max=151.16ms p(90)=124.55µs p(95)=139.85µs p(99.9)=1.03ms
     http_req_sending...............: avg=37.5µs   min=6.04µs  med=17.89µs  max=94.31ms  p(90)=23.27µs  p(95)=27.51µs  p(99.9)=2.69ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=415.98ms min=7.18ms  med=479.76ms max=1.19s    p(90)=689.13ms p(95)=741.02ms p(99.9)=1.04s 
     http_reqs......................: 16968   232.818959/s
     iteration_duration.............: avg=442.23ms min=11.29ms med=505.64ms max=1.19s    p(90)=695.79ms p(95)=746.94ms p(99.9)=1.05s 
     iterations.....................: 15968   219.097898/s
     success_rate...................: 100.00% ✓ 15968      ✗ 0    
     vus............................: 45      min=0        max=499
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (.net subgraphs) (16.6.1-p.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 456561      ✗ 0     
     data_received..................: 13 GB   218 MB/s
     data_sent......................: 184 MB  3.0 MB/s
     http_req_blocked...............: avg=16.61µs  min=812ns   med=2.27µs   max=50.07ms  p(90)=4.07µs   p(95)=5.21µs   p(99.9)=2.81ms  
     http_req_connecting............: avg=13.4µs   min=0s      med=0s       max=49.88ms  p(90)=0s       p(95)=0s       p(99.9)=2.45ms  
     http_req_duration..............: avg=92.82ms  min=1.44ms  med=88.29ms  max=336.27ms p(90)=175.85ms p(95)=193.03ms p(99.9)=256.63ms
       { expected_response:true }...: avg=92.82ms  min=1.44ms  med=88.29ms  max=336.27ms p(90)=175.85ms p(95)=193.03ms p(99.9)=256.63ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 153187
     http_req_receiving.............: avg=630.94µs min=52.16µs med=104.57µs max=180.67ms p(90)=1.21ms   p(95)=2.15ms   p(99.9)=26.86ms 
     http_req_sending...............: avg=61.97µs  min=4.69µs  med=9.37µs   max=73.84ms  p(90)=20.37µs  p(95)=112.24µs p(99.9)=8.81ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=92.13ms  min=1.35ms  med=87.58ms  max=336.18ms p(90)=175.14ms p(95)=192.15ms p(99.9)=255.39ms
     http_reqs......................: 153187  2480.901682/s
     iteration_duration.............: avg=93.68ms  min=3ms     med=89.31ms  max=336.46ms p(90)=176.32ms p(95)=193.52ms p(99.9)=257.43ms
     iterations.....................: 152187  2464.706433/s
     success_rate...................: 100.00% ✓ 152187      ✗ 0     
     vus............................: 92      min=0         max=498 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.6.1-p.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 429453      ✗ 0     
     data_received..................: 13 GB   204 MB/s
     data_sent......................: 173 MB  2.8 MB/s
     http_req_blocked...............: avg=15.03µs min=851ns   med=2.21µs  max=79.4ms   p(90)=3.95µs   p(95)=5.07µs   p(99.9)=944.54µs
     http_req_connecting............: avg=12.09µs min=0s      med=0s      max=79.33ms  p(90)=0s       p(95)=0s       p(99.9)=905.9µs 
     http_req_duration..............: avg=98.75ms min=1.5ms   med=84.97ms max=1.68s    p(90)=183.08ms p(95)=210.54ms p(99.9)=815.46ms
       { expected_response:true }...: avg=98.75ms min=1.5ms   med=84.97ms max=1.68s    p(90)=183.08ms p(95)=210.54ms p(99.9)=815.46ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 144151
     http_req_receiving.............: avg=1.71ms  min=52.53µs med=109.2µs max=880.16ms p(90)=1.87ms   p(95)=5.19ms   p(99.9)=94.86ms 
     http_req_sending...............: avg=59.41µs min=4.76µs  med=9.22µs  max=238.84ms p(90)=18.87µs  p(95)=102.8µs  p(99.9)=7.4ms   
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=96.97ms min=1.43ms  med=83.51ms max=1.68s    p(90)=181.37ms p(95)=207.43ms p(99.9)=698.18ms
     http_reqs......................: 144151  2329.571908/s
     iteration_duration.............: avg=99.69ms min=2.93ms  med=86.12ms max=1.68s    p(90)=183.65ms p(95)=211.25ms p(99.9)=821.39ms
     iterations.....................: 143151  2313.411272/s
     success_rate...................: 100.00% ✓ 143151      ✗ 0     
     vus............................: 53      min=0         max=499 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (.net subgraphs) (16.6.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 424395      ✗ 0     
     data_received..................: 13 GB   202 MB/s
     data_sent......................: 171 MB  2.8 MB/s
     http_req_blocked...............: avg=19.03µs  min=901ns   med=2.69µs   max=66.7ms   p(90)=4.43µs   p(95)=5.55µs   p(99.9)=1.98ms  
     http_req_connecting............: avg=15.48µs  min=0s      med=0s       max=66.46ms  p(90)=0s       p(95)=0s       p(99.9)=1.85ms  
     http_req_duration..............: avg=99.87ms  min=1.56ms  med=87.12ms  max=1.42s    p(90)=193.11ms p(95)=221.65ms p(99.9)=676.86ms
       { expected_response:true }...: avg=99.87ms  min=1.56ms  med=87.12ms  max=1.42s    p(90)=193.11ms p(95)=221.65ms p(99.9)=676.86ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 142465
     http_req_receiving.............: avg=1.53ms   min=53.48µs med=110.33µs max=987.57ms p(90)=1.88ms   p(95)=4.54ms   p(99.9)=101.51ms
     http_req_sending...............: avg=67.04µs  min=4.91µs  med=10.14µs  max=211.59ms p(90)=19.26µs  p(95)=114.81µs p(99.9)=8.59ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=98.27ms  min=1.48ms  med=85.71ms  max=1.42s    p(90)=190.78ms p(95)=218.11ms p(99.9)=662.41ms
     http_reqs......................: 142465  2300.376458/s
     iteration_duration.............: avg=100.86ms min=3.04ms  med=88.25ms  max=1.42s    p(90)=193.78ms p(95)=222.45ms p(99.9)=679.28ms
     iterations.....................: 141465  2284.2295/s
     success_rate...................: 100.00% ✓ 141465      ✗ 0     
     vus............................: 54      min=0         max=499 
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

     checks.........................: 100.00% ✓ 397137      ✗ 0     
     data_received..................: 12 GB   188 MB/s
     data_sent......................: 160 MB  2.6 MB/s
     http_req_blocked...............: avg=8.95µs   min=972ns   med=2.38µs   max=45.81ms  p(90)=4.12µs   p(95)=5.32µs   p(99.9)=456.99µs
     http_req_connecting............: avg=5.84µs   min=0s      med=0s       max=45.63ms  p(90)=0s       p(95)=0s       p(99.9)=383.21µs
     http_req_duration..............: avg=106.69ms min=1.64ms  med=102.13ms max=289.18ms p(90)=205.33ms p(95)=223.6ms  p(99.9)=263.95ms
       { expected_response:true }...: avg=106.69ms min=1.64ms  med=102.13ms max=289.18ms p(90)=205.33ms p(95)=223.6ms  p(99.9)=263.95ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 133379
     http_req_receiving.............: avg=95.65µs  min=27.57µs med=55.09µs  max=97.36ms  p(90)=103.36µs p(95)=260.8µs  p(99.9)=5.04ms  
     http_req_sending...............: avg=52.4µs   min=5.06µs  med=10.68µs  max=200.71ms p(90)=18.85µs  p(95)=98.46µs  p(99.9)=6.21ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=106.55ms min=1.6ms   med=101.98ms max=289.1ms  p(90)=205.16ms p(95)=223.43ms p(99.9)=263.55ms
     http_reqs......................: 133379  2149.272008/s
     iteration_duration.............: avg=107.74ms min=3.46ms  med=103.4ms  max=312.05ms p(90)=205.92ms p(95)=224.09ms p(99.9)=264.79ms
     iterations.....................: 132379  2133.157987/s
     success_rate...................: 100.00% ✓ 132379      ✗ 0     
     vus............................: 58      min=0         max=497 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (.net subgraphs) (16.6.1-p.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 396882      ✗ 0     
     data_received..................: 12 GB   188 MB/s
     data_sent......................: 160 MB  2.6 MB/s
     http_req_blocked...............: avg=23.3µs   min=1.05µs  med=2.99µs   max=78.63ms  p(90)=4.78µs   p(95)=5.99µs   p(99.9)=3.58ms  
     http_req_connecting............: avg=19.45µs  min=0s      med=0s       max=78.51ms  p(90)=0s       p(95)=0s       p(99.9)=3.4ms   
     http_req_duration..............: avg=106.78ms min=1.79ms  med=91.07ms  max=2.1s     p(90)=202.01ms p(95)=238.47ms p(99.9)=926.62ms
       { expected_response:true }...: avg=106.78ms min=1.79ms  med=91.07ms  max=2.1s     p(90)=202.01ms p(95)=238.47ms p(99.9)=926.62ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 133294
     http_req_receiving.............: avg=1.78ms   min=53.95µs med=116.36µs max=823.97ms p(90)=1.94ms   p(95)=5.2ms    p(99.9)=103.86ms
     http_req_sending...............: avg=74.44µs  min=5.32µs  med=11.26µs  max=123.09ms p(90)=20.8µs   p(95)=120.61µs p(99.9)=10.24ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=104.92ms min=1.67ms  med=89.67ms  max=2.1s     p(90)=199.63ms p(95)=234.51ms p(99.9)=888.55ms
     http_reqs......................: 133294  2143.920004/s
     iteration_duration.............: avg=107.88ms min=2.98ms  med=92.42ms  max=2.11s    p(90)=202.84ms p(95)=239.38ms p(99.9)=930.23ms
     iterations.....................: 132294  2127.835859/s
     success_rate...................: 100.00% ✓ 132294      ✗ 0     
     vus............................: 64      min=0         max=496 
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

     checks.........................: 100.00% ✓ 207687      ✗ 0    
     data_received..................: 6.1 GB  98 MB/s
     data_sent......................: 84 MB   1.3 MB/s
     http_req_blocked...............: avg=9.44µs   min=1.12µs  med=2.89µs   max=220.27ms p(90)=4.61µs   p(95)=5.56µs   p(99.9)=541.27µs
     http_req_connecting............: avg=2.68µs   min=0s      med=0s       max=21.23ms  p(90)=0s       p(95)=0s       p(99.9)=469.09µs
     http_req_duration..............: avg=203.23ms min=1.94ms  med=204.52ms max=578.79ms p(90)=377.78ms p(95)=406.16ms p(99.9)=509.76ms
       { expected_response:true }...: avg=203.23ms min=1.94ms  med=204.52ms max=578.79ms p(90)=377.78ms p(95)=406.16ms p(99.9)=509.76ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 70229
     http_req_receiving.............: avg=81.98µs  min=28.16µs med=65.67µs  max=201.73ms p(90)=106.13µs p(95)=122.65µs p(99.9)=1.05ms  
     http_req_sending...............: avg=31.86µs  min=5.28µs  med=12.21µs  max=181.44ms p(90)=18.99µs  p(95)=22.88µs  p(99.9)=3.31ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=203.11ms min=1.84ms  med=204.41ms max=578.72ms p(90)=377.68ms p(95)=406.02ms p(99.9)=509.63ms
     http_reqs......................: 70229   1122.723915/s
     iteration_duration.............: avg=206.41ms min=5.39ms  med=207.93ms max=578.95ms p(90)=378.72ms p(95)=407.02ms p(99.9)=510.2ms 
     iterations.....................: 69229   1106.737301/s
     success_rate...................: 100.00% ✓ 69229       ✗ 0    
     vus............................: 85      min=0         max=494
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

     checks.........................: 100.00% ✓ 100809     ✗ 0    
     data_received..................: 3.0 GB  47 MB/s
     data_sent......................: 42 MB   642 kB/s
     http_req_blocked...............: avg=8.73µs   min=1.06µs  med=2.76µs   max=9.61ms   p(90)=4.5µs    p(95)=5.51µs   p(99.9)=1.22ms  
     http_req_connecting............: avg=4.98µs   min=0s      med=0s       max=9.48ms   p(90)=0s       p(95)=0s       p(99.9)=1.2ms   
     http_req_duration..............: avg=414.6ms  min=3.62ms  med=385.71ms max=1.78s    p(90)=809.29ms p(95)=890.28ms p(99.9)=1.31s   
       { expected_response:true }...: avg=414.6ms  min=3.62ms  med=385.71ms max=1.78s    p(90)=809.29ms p(95)=890.28ms p(99.9)=1.31s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 34603
     http_req_receiving.............: avg=83.2µs   min=28.83µs med=72.48µs  max=28.97ms  p(90)=112.75µs p(95)=127µs    p(99.9)=881.52µs
     http_req_sending...............: avg=30.34µs  min=4.97µs  med=14.04µs  max=153.33ms p(90)=21.58µs  p(95)=24.53µs  p(99.9)=2.34ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=414.48ms min=3.55ms  med=385.63ms max=1.78s    p(90)=809.15ms p(95)=890.2ms  p(99.9)=1.31s   
     http_reqs......................: 34603   534.784953/s
     iteration_duration.............: avg=427.19ms min=15.3ms  med=401.8ms  max=1.78s    p(90)=812.71ms p(95)=893.37ms p(99.9)=1.31s   
     iterations.....................: 33603   519.330081/s
     success_rate...................: 100.00% ✓ 33603      ✗ 0    
     vus............................: 93      min=0        max=500
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

     checks.........................: 100.00% ✓ 46131      ✗ 0    
     data_received..................: 1.4 GB  21 MB/s
     data_sent......................: 20 MB   291 kB/s
     http_req_blocked...............: avg=41.28µs  min=1.25µs  med=3.78µs   max=20.12ms p(90)=5.76µs   p(95)=7.52µs   p(99.9)=14.9ms 
     http_req_connecting............: avg=35.21µs  min=0s      med=0s       max=20.07ms p(90)=0s       p(95)=0s       p(99.9)=14.85ms
     http_req_duration..............: avg=889.14ms min=5.81ms  med=804.11ms max=5.24s   p(90)=1.77s    p(95)=2s       p(99.9)=4.04s  
       { expected_response:true }...: avg=889.14ms min=5.81ms  med=804.11ms max=5.24s   p(90)=1.77s    p(95)=2s       p(99.9)=4.04s  
     http_req_failed................: 0.00%   ✓ 0          ✗ 16377
     http_req_receiving.............: avg=103.02µs min=38.59µs med=96.06µs  max=6.69ms  p(90)=134.72µs p(95)=149.74µs p(99.9)=1.39ms 
     http_req_sending...............: avg=35.55µs  min=6.08µs  med=18.85µs  max=33.62ms p(90)=24.92µs  p(95)=29.89µs  p(99.9)=3.69ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=889ms    min=5.7ms   med=803.98ms max=5.24s   p(90)=1.77s    p(95)=2s       p(99.9)=4.04s  
     http_reqs......................: 16377   242.518799/s
     iteration_duration.............: avg=947.05ms min=42.57ms med=873.31ms max=5.24s   p(90)=1.78s    p(95)=2.02s    p(99.9)=4.07s  
     iterations.....................: 15377   227.710299/s
     success_rate...................: 100.00% ✓ 15377      ✗ 0    
     vus............................: 81      min=0        max=500
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

     checks.........................: 100.00% ✓ 45531      ✗ 0    
     data_received..................: 1.4 GB  21 MB/s
     data_sent......................: 19 MB   282 kB/s
     http_req_blocked...............: avg=16.13µs  min=1.49µs  med=3.87µs   max=5.21ms   p(90)=5.82µs   p(95)=7.8µs   p(99.9)=2.43ms
     http_req_connecting............: avg=10.13µs  min=0s      med=0s       max=4.93ms   p(90)=0s       p(95)=0s      p(99.9)=2.29ms
     http_req_duration..............: avg=897.4ms  min=7.91ms  med=824.81ms max=3.07s    p(90)=1.82s    p(95)=1.96s   p(99.9)=2.74s 
       { expected_response:true }...: avg=897.4ms  min=7.91ms  med=824.81ms max=3.07s    p(90)=1.82s    p(95)=1.96s   p(99.9)=2.74s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 16177
     http_req_receiving.............: avg=101.99µs min=34.86µs med=93.77µs  max=11.39ms  p(90)=135.82µs p(95)=153.2µs p(99.9)=1.01ms
     http_req_sending...............: avg=38.13µs  min=6.27µs  med=19.15µs  max=131.08ms p(90)=25.14µs  p(95)=30.21µs p(99.9)=2.43ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s    
     http_req_waiting...............: avg=897.26ms min=7.8ms   med=824.68ms max=3.07s    p(90)=1.82s    p(95)=1.96s   p(99.9)=2.74s 
     http_reqs......................: 16177   235.032579/s
     iteration_duration.............: avg=956.53ms min=38.52ms med=889.48ms max=3.07s    p(90)=1.84s    p(95)=1.97s   p(99.9)=2.78s 
     iterations.....................: 15177   220.503768/s
     success_rate...................: 100.00% ✓ 15177      ✗ 0    
     vus............................: 101     min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

