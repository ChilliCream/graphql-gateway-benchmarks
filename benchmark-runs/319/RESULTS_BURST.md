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
| hive-router | v0.0.84 | 2,698 | 2,853 | 2,641 | 2.4% |  |
| fusion | 16.6.0 | 2,538 | 2,652 | 2,527 | 1.7% |  |
| fusion-nightly-net11 | 16.6.1-p.3 | 2,515 | 2,627 | 2,492 | 1.9% |  |
| fusion-nightly | 16.6.1-p.3 | 2,505 | 2,615 | 2,495 | 1.7% |  |
| fusion-nightly-fed | 16.6.1-p.3 | 2,395 | 2,472 | 2,385 | 1.2% |  |
| cosmo | 0.334.0 | 1,219 | 1,262 | 1,212 | 1.4% |  |
| hive-gateway-router-runtime | 2.10.8 | 556 | 571 | 554 | 1.2% |  |
| hive-gateway | 2.10.8 | 251 | 254 | 248 | 0.8% |  |
| apollo-gateway | 2.14.3 | 229 | 237 | 228 | 1.2% |  |
| apollo-router | v2.16.1 | — | — | — | — | non-compatible response (14488 across 9/9 runs) |
| feddi | — | — | — | — | — | not run |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (523315 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| fusion | 16.6.0 | 2,382 | 2,476 | 2,368 | 1.5% |  |
| fusion-nightly-net11 | 16.6.1-p.3 | 2,377 | 2,504 | 2,363 | 2.0% |  |
| fusion-nightly | 16.6.1-p.3 | 2,323 | 2,415 | 2,310 | 1.7% |  |
| hive-router | v0.0.84 | 2,290 | 2,483 | 2,234 | 3.6% |  |
| fusion-nightly-fed | 16.6.1-p.3 | 2,232 | 2,314 | 2,225 | 1.4% |  |
| cosmo | 0.334.0 | 1,162 | 1,201 | 1,153 | 1.5% |  |
| hive-gateway-router-runtime | 2.10.8 | 528 | 538 | 526 | 0.9% |  |
| hive-gateway | 2.10.8 | 241 | 245 | 236 | 1.3% |  |
| apollo-gateway | 2.14.3 | 232 | 236 | 229 | 1.0% |  |
| apollo-router | v2.16.1 | — | — | — | — | non-compatible response (25003 across 9/9 runs) |
| feddi | — | — | — | — | — | not run |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (345090 across 9/9 runs) |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.84)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 496059      ✗ 0     
     data_received..................: 15 GB   237 MB/s
     data_sent......................: 200 MB  3.2 MB/s
     http_req_blocked...............: avg=17.8µs  min=1.04µs  med=2.65µs  max=55.8ms   p(90)=4.28µs   p(95)=5.42µs   p(99.9)=1.68ms  
     http_req_connecting............: avg=14.39µs min=0s      med=0s      max=55.65ms  p(90)=0s       p(95)=0s       p(99.9)=1.64ms  
     http_req_duration..............: avg=85.46ms min=1.4ms   med=79.8ms  max=294.74ms p(90)=164.76ms p(95)=178.45ms p(99.9)=234.3ms 
       { expected_response:true }...: avg=85.46ms min=1.4ms   med=79.8ms  max=294.74ms p(90)=164.76ms p(95)=178.45ms p(99.9)=234.3ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 166353
     http_req_receiving.............: avg=138.5µs min=25.29µs med=52.79µs max=236.24ms p(90)=135.32µs p(95)=343.85µs p(99.9)=14.18ms 
     http_req_sending...............: avg=67.82µs min=4.66µs  med=9.97µs  max=178.07ms p(90)=18.59µs  p(95)=121.83µs p(99.9)=8.68ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=85.25ms min=1.34ms  med=79.59ms max=274.43ms p(90)=164.52ms p(95)=178.12ms p(99.9)=233.23ms
     http_reqs......................: 166353  2698.622287/s
     iteration_duration.............: avg=86.22ms min=2.19ms  med=80.61ms max=332.27ms p(90)=165.16ms p(95)=178.87ms p(99.9)=235.52ms
     iterations.....................: 165353  2682.400023/s
     success_rate...................: 100.00% ✓ 165353      ✗ 0     
     vus............................: 86      min=0         max=496 
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

     checks.........................: 100.00% ✓ 472428      ✗ 0     
     data_received..................: 14 GB   223 MB/s
     data_sent......................: 190 MB  3.0 MB/s
     http_req_blocked...............: avg=21.34µs min=831ns   med=2.14µs  max=116.94ms p(90)=3.56µs   p(95)=4.65µs   p(99.9)=2.05ms  
     http_req_connecting............: avg=18.57µs min=0s      med=0s      max=116.89ms p(90)=0s       p(95)=0s       p(99.9)=2.02ms  
     http_req_duration..............: avg=89.73ms min=1.98ms  med=77.38ms max=1.14s    p(90)=172.33ms p(95)=200.46ms p(99.9)=723.85ms
       { expected_response:true }...: avg=89.73ms min=1.98ms  med=77.38ms max=1.14s    p(90)=172.33ms p(95)=200.46ms p(99.9)=723.85ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 158476
     http_req_receiving.............: avg=1.41ms  min=50.17µs med=94µs    max=675.53ms p(90)=1.49ms   p(95)=4.25ms   p(99.9)=104.48ms
     http_req_sending...............: avg=69.61µs min=4.61µs  med=8.78µs  max=256.06ms p(90)=16.22µs  p(95)=102.87µs p(99.9)=9.03ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=88.25ms min=1.89ms  med=76.29ms max=1.14s    p(90)=170.14ms p(95)=196.68ms p(99.9)=688.36ms
     http_reqs......................: 158476  2538.276201/s
     iteration_duration.............: avg=90.58ms min=3.26ms  med=78.24ms max=1.15s    p(90)=172.98ms p(95)=201.31ms p(99.9)=743.53ms
     iterations.....................: 157476  2522.259415/s
     success_rate...................: 100.00% ✓ 157476      ✗ 0     
     vus............................: 80      min=0         max=493 
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

     checks.........................: 100.00% ✓ 466707      ✗ 0     
     data_received..................: 14 GB   221 MB/s
     data_sent......................: 188 MB  3.0 MB/s
     http_req_blocked...............: avg=15.82µs min=902ns   med=2.3µs    max=63.34ms  p(90)=3.78µs   p(95)=4.78µs   p(99.9)=1.64ms  
     http_req_connecting............: avg=12.72µs min=0s      med=0s       max=50.89ms  p(90)=0s       p(95)=0s       p(99.9)=1.58ms  
     http_req_duration..............: avg=90.83ms min=1.89ms  med=86.22ms  max=354.15ms p(90)=174.81ms p(95)=190.5ms  p(99.9)=245.86ms
       { expected_response:true }...: avg=90.83ms min=1.89ms  med=86.22ms  max=354.15ms p(90)=174.81ms p(95)=190.5ms  p(99.9)=245.86ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 156569
     http_req_receiving.............: avg=652.1µs min=52.31µs med=105.62µs max=65.16ms  p(90)=1.19ms   p(95)=2.16ms   p(99.9)=28.35ms 
     http_req_sending...............: avg=63.55µs min=4.63µs  med=9.17µs   max=175.71ms p(90)=17.35µs  p(95)=110.67µs p(99.9)=8.48ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=90.11ms min=1.81ms  med=85.42ms  max=353.6ms  p(90)=174.04ms p(95)=189.69ms p(99.9)=243.95ms
     http_reqs......................: 156569  2515.291337/s
     iteration_duration.............: avg=91.66ms min=3.83ms  med=87.11ms  max=364.15ms p(90)=175.28ms p(95)=190.95ms p(99.9)=246.87ms
     iterations.....................: 155569  2499.226271/s
     success_rate...................: 100.00% ✓ 155569      ✗ 0     
     vus............................: 67      min=0         max=495 
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

     checks.........................: 100.00% ✓ 465063      ✗ 0     
     data_received..................: 14 GB   220 MB/s
     data_sent......................: 187 MB  3.0 MB/s
     http_req_blocked...............: avg=17.85µs min=852ns   med=2.17µs  max=57.17ms  p(90)=3.76µs   p(95)=4.91µs   p(99.9)=1.64ms  
     http_req_connecting............: avg=14.98µs min=0s      med=0s      max=57.02ms  p(90)=0s       p(95)=0s       p(99.9)=1.55ms  
     http_req_duration..............: avg=91.16ms min=1.95ms  med=77.27ms max=2.25s    p(90)=172.84ms p(95)=196.3ms  p(99.9)=822.58ms
       { expected_response:true }...: avg=91.16ms min=1.95ms  med=77.27ms max=2.25s    p(90)=172.84ms p(95)=196.3ms  p(99.9)=822.58ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 156021
     http_req_receiving.............: avg=1.35ms  min=52.96µs med=97.26µs max=1.76s    p(90)=1.55ms   p(95)=4.04ms   p(99.9)=79.06ms 
     http_req_sending...............: avg=65.27µs min=4.49µs  med=8.94µs  max=133.76ms p(90)=17.71µs  p(95)=105.53µs p(99.9)=9.08ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=89.74ms min=1.87ms  med=76.07ms max=2.25s    p(90)=170.9ms  p(95)=193.56ms p(99.9)=774.25ms
     http_reqs......................: 156021  2505.728491/s
     iteration_duration.............: avg=92ms    min=3.09ms  med=78.22ms max=2.25s    p(90)=173.34ms p(95)=196.9ms  p(99.9)=832.11ms
     iterations.....................: 155021  2489.668291/s
     success_rate...................: 100.00% ✓ 155021      ✗ 0     
     vus............................: 68      min=0         max=495 
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

     checks.........................: 100.00% ✓ 442590      ✗ 0     
     data_received..................: 13 GB   211 MB/s
     data_sent......................: 178 MB  2.9 MB/s
     http_req_blocked...............: avg=15.37µs min=872ns   med=2.17µs  max=60.7ms   p(90)=3.66µs   p(95)=4.75µs   p(99.9)=997.01µs
     http_req_connecting............: avg=12.42µs min=0s      med=0s      max=60.66ms  p(90)=0s       p(95)=0s       p(99.9)=864.16µs
     http_req_duration..............: avg=95.78ms min=1.64ms  med=82.03ms max=1.34s    p(90)=181.48ms p(95)=215.43ms p(99.9)=616.26ms
       { expected_response:true }...: avg=95.78ms min=1.64ms  med=82.03ms max=1.34s    p(90)=181.48ms p(95)=215.43ms p(99.9)=616.26ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 148530
     http_req_receiving.............: avg=1.18ms  min=51.64µs med=97.93µs max=546.48ms p(90)=1.52ms   p(95)=3.81ms   p(99.9)=88.24ms 
     http_req_sending...............: avg=60.78µs min=4.54µs  med=9.08µs  max=112.28ms p(90)=17.5µs   p(95)=101.83µs p(99.9)=8.19ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=94.54ms min=1.57ms  med=80.86ms max=1.34s    p(90)=179.61ms p(95)=212.2ms  p(99.9)=604.1ms 
     http_reqs......................: 148530  2395.768802/s
     iteration_duration.............: avg=96.68ms min=2.6ms   med=83.18ms max=1.34s    p(90)=182.03ms p(95)=216.22ms p(99.9)=618.61ms
     iterations.....................: 147530  2379.638937/s
     success_rate...................: 100.00% ✓ 147530      ✗ 0     
     vus............................: 56      min=0         max=498 
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

     checks.........................: 100.00% ✓ 225642      ✗ 0    
     data_received..................: 6.7 GB  107 MB/s
     data_sent......................: 92 MB   1.5 MB/s
     http_req_blocked...............: avg=5.69µs   min=952ns   med=2.53µs   max=11.32ms  p(90)=4.29µs   p(95)=5.24µs   p(99.9)=543.66µs
     http_req_connecting............: avg=2.51µs   min=0s      med=0s       max=11.23ms  p(90)=0s       p(95)=0s       p(99.9)=489.52µs
     http_req_duration..............: avg=187.22ms min=1.96ms  med=188.43ms max=499.26ms p(90)=347.41ms p(95)=371.02ms p(99.9)=449.54ms
       { expected_response:true }...: avg=187.22ms min=1.96ms  med=188.43ms max=499.26ms p(90)=347.41ms p(95)=371.02ms p(99.9)=449.54ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 76214
     http_req_receiving.............: avg=75.12µs  min=28.49µs med=61.29µs  max=45.22ms  p(90)=99.27µs  p(95)=114.66µs p(99.9)=1.17ms  
     http_req_sending...............: avg=30.05µs  min=4.94µs  med=10.75µs  max=83.79ms  p(90)=18.02µs  p(95)=22.16µs  p(99.9)=3.29ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=187.11ms min=1.86ms  med=188.31ms max=499.19ms p(90)=347.32ms p(95)=370.93ms p(99.9)=449.45ms
     http_reqs......................: 76214   1219.34768/s
     iteration_duration.............: avg=189.94ms min=3.9ms   med=191.32ms max=499.42ms p(90)=348.16ms p(95)=371.62ms p(99.9)=449.77ms
     iterations.....................: 75214   1203.348681/s
     success_rate...................: 100.00% ✓ 75214       ✗ 0    
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

     checks.........................: 100.00% ✓ 104238     ✗ 0    
     data_received..................: 3.1 GB  49 MB/s
     data_sent......................: 43 MB   668 kB/s
     http_req_blocked...............: avg=6.78µs   min=1.04µs  med=2.56µs   max=13.12ms  p(90)=4.3µs    p(95)=5.3µs    p(99.9)=619.6µs 
     http_req_connecting............: avg=3.26µs   min=0s      med=0s       max=13ms     p(90)=0s       p(95)=0s       p(99.9)=558.08µs
     http_req_duration..............: avg=401.16ms min=3.55ms  med=374.42ms max=1.77s    p(90)=793.75ms p(95)=855.5ms  p(99.9)=1.26s   
       { expected_response:true }...: avg=401.16ms min=3.55ms  med=374.42ms max=1.77s    p(90)=793.75ms p(95)=855.5ms  p(99.9)=1.26s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 35746
     http_req_receiving.............: avg=80.65µs  min=29.45µs med=65.71µs  max=128.73ms p(90)=104.3µs  p(95)=118.62µs p(99.9)=999.45µs
     http_req_sending...............: avg=23.67µs  min=5.03µs  med=12.09µs  max=84.74ms  p(90)=19.73µs  p(95)=22.67µs  p(99.9)=2.44ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=401.05ms min=3.49ms  med=374.35ms max=1.77s    p(90)=793.66ms p(95)=855.42ms p(99.9)=1.26s   
     http_reqs......................: 35746   556.175022/s
     iteration_duration.............: avg=412.93ms min=26.89ms med=388.69ms max=1.79s    p(90)=797ms    p(95)=857.79ms p(99.9)=1.26s   
     iterations.....................: 34746   540.615937/s
     success_rate...................: 100.00% ✓ 34746      ✗ 0    
     vus............................: 68      min=0        max=496
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

     checks.........................: 100.00% ✓ 47745      ✗ 0    
     data_received..................: 1.5 GB  22 MB/s
     data_sent......................: 20 MB   303 kB/s
     http_req_blocked...............: avg=13.57µs  min=1.12µs  med=3.05µs   max=18.84ms  p(90)=4.7µs    p(95)=6.05µs   p(99.9)=1.98ms  
     http_req_connecting............: avg=9.03µs   min=0s      med=0s       max=18.79ms  p(90)=0s       p(95)=0s       p(99.9)=1.96ms  
     http_req_duration..............: avg=842.06ms min=5.47ms  med=728.3ms  max=18.76s   p(90)=1.41s    p(95)=1.6s     p(99.9)=17.62s  
       { expected_response:true }...: avg=842.06ms min=5.47ms  med=728.3ms  max=18.76s   p(90)=1.41s    p(95)=1.6s     p(99.9)=17.62s  
     http_req_failed................: 0.00%   ✓ 0          ✗ 16915
     http_req_receiving.............: avg=106µs    min=34.43µs med=86.48µs  max=111.22ms p(90)=123.75µs p(95)=138.63µs p(99.9)=976.81µs
     http_req_sending...............: avg=35.28µs  min=5.25µs  med=15.85µs  max=79.07ms  p(90)=21.27µs  p(95)=25.3µs   p(99.9)=2.02ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=841.92ms min=5.39ms  med=728.24ms max=18.76s   p(90)=1.41s    p(95)=1.6s     p(99.9)=17.62s  
     http_reqs......................: 16915   251.891083/s
     iteration_duration.............: avg=895.02ms min=39.6ms  med=777.08ms max=18.76s   p(90)=1.43s    p(95)=1.62s    p(99.9)=17.62s  
     iterations.....................: 15915   236.999502/s
     success_rate...................: 100.00% ✓ 15915      ✗ 0    
     vus............................: 60      min=0        max=499
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

     checks.........................: 100.00% ✓ 47208      ✗ 0    
     data_received..................: 1.5 GB  20 MB/s
     data_sent......................: 21 MB   281 kB/s
     http_req_blocked...............: avg=13µs     min=1.14µs med=2.99µs   max=4.77ms   p(90)=4.53µs   p(95)=5.91µs   p(99.9)=1.96ms  
     http_req_connecting............: avg=8.52µs   min=0s     med=0s       max=4.71ms   p(90)=0s       p(95)=0s       p(99.9)=1.94ms  
     http_req_duration..............: avg=393.97ms min=7.39ms med=453.12ms max=1.22s    p(90)=680.52ms p(95)=742.98ms p(99.9)=1.02s   
       { expected_response:true }...: avg=393.97ms min=7.39ms med=453.12ms max=1.22s    p(90)=680.52ms p(95)=742.98ms p(99.9)=1.02s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 16736
     http_req_receiving.............: avg=88.42µs  min=33.7µs med=80.96µs  max=30.57ms  p(90)=119.96µs p(95)=134.73µs p(99.9)=670.24µs
     http_req_sending...............: avg=45.41µs  min=5.6µs  med=16.11µs  max=139.31ms p(90)=20.98µs  p(95)=25.22µs  p(99.9)=5.07ms  
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=393.83ms min=7.3ms  med=452.91ms max=1.22s    p(90)=680.39ms p(95)=742.9ms  p(99.9)=1.02s   
     http_reqs......................: 16736   229.158177/s
     iteration_duration.............: avg=418.98ms min=8.09ms med=479.91ms max=1.23s    p(90)=685ms    p(95)=748.31ms p(99.9)=1.03s   
     iterations.....................: 15736   215.465647/s
     success_rate...................: 100.00% ✓ 15736      ✗ 0    
     vus............................: 55      min=0        max=498
     vus_max........................: 500     min=500      max=500
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

     checks.........................: 100.00% ✓ 439842      ✗ 0     
     data_received..................: 13 GB   209 MB/s
     data_sent......................: 177 MB  2.9 MB/s
     http_req_blocked...............: avg=18.51µs min=891ns   med=2.45µs   max=69.99ms p(90)=4.42µs   p(95)=5.55µs   p(99.9)=2.25ms  
     http_req_connecting............: avg=15.16µs min=0s      med=0s       max=69.85ms p(90)=0s       p(95)=0s       p(99.9)=2.17ms  
     http_req_duration..............: avg=96.37ms min=1.46ms  med=81.79ms  max=1.56s   p(90)=182.76ms p(95)=210.57ms p(99.9)=906.05ms
       { expected_response:true }...: avg=96.37ms min=1.46ms  med=81.79ms  max=1.56s   p(90)=182.76ms p(95)=210.57ms p(99.9)=906.05ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 147614
     http_req_receiving.............: avg=1.49ms  min=52.62µs med=104.55µs max=1.08s   p(90)=1.64ms   p(95)=4.26ms   p(99.9)=103.58ms
     http_req_sending...............: avg=69.35µs min=4.63µs  med=9.87µs   max=165.4ms p(90)=21.34µs  p(95)=110.01µs p(99.9)=9.29ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=94.81ms min=1.4ms   med=80.67ms  max=1.56s   p(90)=180.52ms p(95)=207.26ms p(99.9)=879.86ms
     http_reqs......................: 147614  2382.931386/s
     iteration_duration.............: avg=97.34ms min=2.86ms  med=82.75ms  max=1.56s   p(90)=183.38ms p(95)=211.4ms  p(99.9)=907.59ms
     iterations.....................: 146614  2366.788395/s
     success_rate...................: 100.00% ✓ 146614      ✗ 0     
     vus............................: 55      min=0         max=499 
     vus_max........................: 500     min=500       max=500
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

     checks.........................: 100.00% ✓ 437913      ✗ 0     
     data_received..................: 13 GB   208 MB/s
     data_sent......................: 177 MB  2.9 MB/s
     http_req_blocked...............: avg=21.3µs   min=1.05µs  med=2.88µs  max=60.23ms  p(90)=4.61µs   p(95)=5.8µs    p(99.9)=2.65ms  
     http_req_connecting............: avg=17.62µs  min=0s      med=0s      max=60.17ms  p(90)=0s       p(95)=0s       p(99.9)=2.53ms  
     http_req_duration..............: avg=96.76ms  min=1.46ms  med=91.3ms  max=396.94ms p(90)=185.5ms  p(95)=203.06ms p(99.9)=270.73ms
       { expected_response:true }...: avg=96.76ms  min=1.46ms  med=91.3ms  max=396.94ms p(90)=185.5ms  p(95)=203.06ms p(99.9)=270.73ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 146971
     http_req_receiving.............: avg=681.42µs min=52.85µs med=111.9µs max=159.73ms p(90)=1.24ms   p(95)=2.24ms   p(99.9)=30.26ms 
     http_req_sending...............: avg=68.56µs  min=4.82µs  med=10.57µs max=55.75ms  p(90)=20.76µs  p(95)=125.16µs p(99.9)=9.17ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=96.01ms  min=1.39ms  med=90.59ms max=394.94ms p(90)=184.64ms p(95)=202.2ms  p(99.9)=268.9ms 
     http_reqs......................: 146971  2377.169206/s
     iteration_duration.............: avg=97.69ms  min=3.45ms  med=92.38ms max=397.14ms p(90)=186.05ms p(95)=203.58ms p(99.9)=272.98ms
     iterations.....................: 145971  2360.994797/s
     success_rate...................: 100.00% ✓ 145971      ✗ 0     
     vus............................: 95      min=0         max=500 
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

     checks.........................: 100.00% ✓ 428607      ✗ 0     
     data_received..................: 13 GB   204 MB/s
     data_sent......................: 173 MB  2.8 MB/s
     http_req_blocked...............: avg=12.24µs min=842ns   med=2.14µs   max=47.08ms  p(90)=3.66µs   p(95)=4.81µs   p(99.9)=728.16µs
     http_req_connecting............: avg=9.45µs  min=0s      med=0s       max=46.94ms  p(90)=0s       p(95)=0s       p(99.9)=650.25µs
     http_req_duration..............: avg=98.91ms min=1.53ms  med=86.15ms  max=1.94s    p(90)=186.12ms p(95)=213.14ms p(99.9)=967.09ms
       { expected_response:true }...: avg=98.91ms min=1.53ms  med=86.15ms  max=1.94s    p(90)=186.12ms p(95)=213.14ms p(99.9)=967.09ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 143869
     http_req_receiving.............: avg=1.74ms  min=51.62µs med=107.71µs max=960.8ms  p(90)=1.83ms   p(95)=4.5ms    p(99.9)=189.66ms
     http_req_sending...............: avg=55.66µs min=4.55µs  med=9.26µs   max=149.83ms p(90)=18.03µs  p(95)=94.72µs  p(99.9)=7.64ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=97.11ms min=1.47ms  med=84.99ms  max=1.94s    p(90)=184.1ms  p(95)=209.45ms p(99.9)=859.54ms
     http_reqs......................: 143869  2323.652626/s
     iteration_duration.............: avg=99.85ms min=2.7ms   med=87.18ms  max=1.94s    p(90)=186.71ms p(95)=213.82ms p(99.9)=968.38ms
     iterations.....................: 142869  2307.501456/s
     success_rate...................: 100.00% ✓ 142869      ✗ 0     
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

     checks.........................: 100.00% ✓ 422427      ✗ 0     
     data_received..................: 12 GB   200 MB/s
     data_sent......................: 170 MB  2.8 MB/s
     http_req_blocked...............: avg=19.59µs  min=951ns   med=2.49µs  max=63.44ms  p(90)=4.38µs   p(95)=5.65µs   p(99.9)=2ms     
     http_req_connecting............: avg=16.21µs  min=0s      med=0s      max=63.34ms  p(90)=0s       p(95)=0s       p(99.9)=1.89ms  
     http_req_duration..............: avg=100.31ms min=1.55ms  med=97.79ms max=291.26ms p(90)=189.6ms  p(95)=205.4ms  p(99.9)=255.75ms
       { expected_response:true }...: avg=100.31ms min=1.55ms  med=97.79ms max=291.26ms p(90)=189.6ms  p(95)=205.4ms  p(99.9)=255.75ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 141809
     http_req_receiving.............: avg=131.54µs min=27.87µs med=57.65µs max=136.24ms p(90)=128.85µs p(95)=342.19µs p(99.9)=10.44ms 
     http_req_sending...............: avg=62.17µs  min=4.91µs  med=10.78µs max=174.89ms p(90)=21.76µs  p(95)=119.96µs p(99.9)=7.88ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=100.11ms min=1.49ms  med=97.62ms max=284.05ms p(90)=189.34ms p(95)=205.08ms p(99.9)=254.97ms
     http_reqs......................: 141809  2290.104698/s
     iteration_duration.............: avg=101.26ms min=3.61ms  med=98.82ms max=344.98ms p(90)=190.11ms p(95)=205.81ms p(99.9)=256.23ms
     iterations.....................: 140809  2273.955479/s
     success_rate...................: 100.00% ✓ 140809      ✗ 0     
     vus............................: 52      min=0         max=499 
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

     checks.........................: 100.00% ✓ 413877      ✗ 0     
     data_received..................: 12 GB   196 MB/s
     data_sent......................: 167 MB  2.7 MB/s
     http_req_blocked...............: avg=18.52µs  min=892ns  med=2.76µs   max=59.2ms   p(90)=4.79µs   p(95)=5.93µs   p(99.9)=2.26ms  
     http_req_connecting............: avg=14.88µs  min=0s     med=0s       max=59.13ms  p(90)=0s       p(95)=0s       p(99.9)=2.22ms  
     http_req_duration..............: avg=102.43ms min=1.84ms med=90.36ms  max=1.31s    p(90)=196.32ms p(95)=222.56ms p(99.9)=629.26ms
       { expected_response:true }...: avg=102.43ms min=1.84ms med=90.36ms  max=1.31s    p(90)=196.32ms p(95)=222.56ms p(99.9)=629.26ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 138959
     http_req_receiving.............: avg=1.35ms   min=51.7µs med=109.64µs max=586.31ms p(90)=1.69ms   p(95)=4.34ms   p(99.9)=84.25ms 
     http_req_sending...............: avg=69.77µs  min=4.71µs med=10.66µs  max=178ms    p(90)=21.41µs  p(95)=116.17µs p(99.9)=9.47ms  
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=101ms    min=1.75ms med=89.24ms  max=1.31s    p(90)=194.31ms p(95)=219.79ms p(99.9)=617.65ms
     http_reqs......................: 138959  2232.222645/s
     iteration_duration.............: avg=103.44ms min=3.19ms med=91.48ms  max=1.31s    p(90)=196.92ms p(95)=223.4ms  p(99.9)=630.63ms
     iterations.....................: 137959  2216.158751/s
     success_rate...................: 100.00% ✓ 137959      ✗ 0     
     vus............................: 68      min=0         max=495 
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

     checks.........................: 100.00% ✓ 215265      ✗ 0    
     data_received..................: 6.4 GB  102 MB/s
     data_sent......................: 87 MB   1.4 MB/s
     http_req_blocked...............: avg=6.05µs   min=1.05µs  med=3.03µs   max=4.45ms   p(90)=4.97µs   p(95)=5.95µs   p(99.9)=533.61µs
     http_req_connecting............: avg=2.36µs   min=0s      med=0s       max=4.4ms    p(90)=0s       p(95)=0s       p(99.9)=495.63µs
     http_req_duration..............: avg=196.13ms min=1.98ms  med=195.19ms max=516.12ms p(90)=361.94ms p(95)=386.65ms p(99.9)=461.77ms
       { expected_response:true }...: avg=196.13ms min=1.98ms  med=195.19ms max=516.12ms p(90)=361.94ms p(95)=386.65ms p(99.9)=461.77ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 72755
     http_req_receiving.............: avg=77.28µs  min=27.45µs med=64.65µs  max=20.61ms  p(90)=105.41µs p(95)=120.51µs p(99.9)=1.17ms  
     http_req_sending...............: avg=33.6µs   min=5.11µs  med=12.49µs  max=140.2ms  p(90)=20.27µs  p(95)=24.02µs  p(99.9)=3.35ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=196.02ms min=1.93ms  med=195.05ms max=516.06ms p(90)=361.86ms p(95)=386.56ms p(99.9)=461.68ms
     http_reqs......................: 72755   1162.320931/s
     iteration_duration.............: avg=199.12ms min=5.32ms  med=198.58ms max=516.26ms p(90)=362.82ms p(95)=387.29ms p(99.9)=462.45ms
     iterations.....................: 71755   1146.345109/s
     success_rate...................: 100.00% ✓ 71755       ✗ 0    
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

     checks.........................: 100.00% ✓ 99477      ✗ 0    
     data_received..................: 3.0 GB  46 MB/s
     data_sent......................: 41 MB   634 kB/s
     http_req_blocked...............: avg=7.79µs   min=1.14µs  med=3.28µs   max=2.64ms   p(90)=5.07µs   p(95)=6.11µs   p(99.9)=818.26µs
     http_req_connecting............: avg=3.49µs   min=0s      med=0s       max=2.61ms   p(90)=0s       p(95)=0s       p(99.9)=788.53µs
     http_req_duration..............: avg=420.08ms min=3.86ms  med=390.79ms max=1.82s    p(90)=827.65ms p(95)=899.72ms p(99.9)=1.34s   
       { expected_response:true }...: avg=420.08ms min=3.86ms  med=390.79ms max=1.82s    p(90)=827.65ms p(95)=899.72ms p(99.9)=1.34s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 34159
     http_req_receiving.............: avg=92.59µs  min=30.45µs med=74.42µs  max=179.22ms p(90)=112.68µs p(95)=127.56µs p(99.9)=1.27ms  
     http_req_sending...............: avg=32.41µs  min=5.58µs  med=14.34µs  max=167.25ms p(90)=21.81µs  p(95)=25.35µs  p(99.9)=2.15ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=419.96ms min=3.78ms  med=390.6ms  max=1.82s    p(90)=827.58ms p(95)=899.6ms  p(99.9)=1.34s   
     http_reqs......................: 34159   528.133753/s
     iteration_duration.............: avg=432.97ms min=28.49ms med=407.04ms max=1.82s    p(90)=830.31ms p(95)=903.2ms  p(99.9)=1.34s   
     iterations.....................: 33159   512.67271/s
     success_rate...................: 100.00% ✓ 33159      ✗ 0    
     vus............................: 87      min=0        max=500
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

     checks.........................: 100.00% ✓ 46149      ✗ 0    
     data_received..................: 1.4 GB  21 MB/s
     data_sent......................: 20 MB   290 kB/s
     http_req_blocked...............: avg=14.57µs  min=1.13µs  med=3.24µs   max=20.67ms p(90)=4.95µs   p(95)=6.57µs   p(99.9)=2.28ms
     http_req_connecting............: avg=9.5µs    min=0s      med=0s       max=20.43ms p(90)=0s       p(95)=0s       p(99.9)=2.2ms 
     http_req_duration..............: avg=888.26ms min=5.91ms  med=813.73ms max=4.74s   p(90)=1.75s    p(95)=1.97s    p(99.9)=3.89s 
       { expected_response:true }...: avg=888.26ms min=5.91ms  med=813.73ms max=4.74s   p(90)=1.75s    p(95)=1.97s    p(99.9)=3.89s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 16383
     http_req_receiving.............: avg=100.45µs min=33.42µs med=90.9µs   max=33.45ms p(90)=127.68µs p(95)=142.55µs p(99.9)=1.37ms
     http_req_sending...............: avg=27.44µs  min=5.3µs   med=17.42µs  max=8.24ms  p(90)=22.9µs   p(95)=28.04µs  p(99.9)=2.7ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=888.13ms min=5.82ms  med=813.63ms max=4.73s   p(90)=1.75s    p(95)=1.97s    p(99.9)=3.89s 
     http_reqs......................: 16383   241.962721/s
     iteration_duration.............: avg=946.01ms min=52.45ms med=879.22ms max=4.75s   p(90)=1.77s    p(95)=1.98s    p(99.9)=3.92s 
     iterations.....................: 15383   227.193587/s
     success_rate...................: 100.00% ✓ 15383      ✗ 0    
     vus............................: 92      min=0        max=500
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

     checks.........................: 100.00% ✓ 45102      ✗ 0    
     data_received..................: 1.4 GB  20 MB/s
     data_sent......................: 19 MB   279 kB/s
     http_req_blocked...............: avg=12.95µs  min=1.32µs  med=3.62µs   max=3.06ms  p(90)=5.49µs   p(95)=7.11µs   p(99.9)=1.82ms  
     http_req_connecting............: avg=7.5µs    min=0s      med=0s       max=3.03ms  p(90)=0s       p(95)=0s       p(99.9)=1.79ms  
     http_req_duration..............: avg=906.25ms min=7.79ms  med=820.22ms max=3.29s   p(90)=1.87s    p(95)=2s       p(99.9)=2.92s   
       { expected_response:true }...: avg=906.25ms min=7.79ms  med=820.22ms max=3.29s   p(90)=1.87s    p(95)=2s       p(99.9)=2.92s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 16034
     http_req_receiving.............: avg=100.19µs min=35.91µs med=91.83µs  max=20.11ms p(90)=133.14µs p(95)=150.05µs p(99.9)=852.49µs
     http_req_sending...............: avg=28.19µs  min=6µs     med=17.9µs   max=8.79ms  p(90)=23.82µs  p(95)=28.7µs   p(99.9)=2.58ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=906.12ms min=7.71ms  med=820.07ms max=3.29s   p(90)=1.87s    p(95)=2s       p(99.9)=2.92s   
     http_reqs......................: 16034   232.775322/s
     iteration_duration.............: avg=966.45ms min=40.83ms med=914.72ms max=3.3s    p(90)=1.89s    p(95)=2.01s    p(99.9)=2.94s   
     iterations.....................: 15034   218.257715/s
     success_rate...................: 100.00% ✓ 15034      ✗ 0    
     vus............................: 14      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

