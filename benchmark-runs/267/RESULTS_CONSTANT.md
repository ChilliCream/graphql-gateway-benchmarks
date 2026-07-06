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
| hive-router | v0.0.74 | 2,941 | 3,130 | 2,886 | 2.7% |  |
| fusion-nightly-net11 | 16.4.0-p.14 | 2,431 | 2,500 | 2,425 | 1.1% |  |
| fusion-nightly | 16.4.0-p.14 | 2,381 | 2,453 | 2,365 | 1.3% |  |
| fusion | 16.3.0 | 2,339 | 2,423 | 2,325 | 1.4% |  |
| grafbase | 0.53.5 | 2,248 | 2,358 | 2,242 | 1.7% |  |
| cosmo | 0.326.1 | 1,331 | 1,371 | 1,326 | 1.2% |  |
| hive-gateway-router-runtime | 2.10.0 | 618 | 636 | 613 | 1.1% |  |
| apollo-router | v2.15.1 | 445 | 467 | 441 | 2.2% |  |
| apollo-gateway | 2.14.2 | 283 | 287 | 282 | 0.5% |  |
| hive-gateway | 2.10.0 | 273 | 281 | 273 | 1.1% |  |
| feddi | 77271dc84a06 | 0 | 0 | 0 | 0.0% | non-compatible response (419 across 3/4 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.74 | 2,382 | 2,592 | 2,362 | 3.3% |  |
| fusion-nightly | 16.4.0-p.14 | 2,282 | 2,333 | 2,276 | 0.9% |  |
| fusion-nightly-net11 | 16.4.0-p.14 | 2,224 | 2,304 | 2,210 | 1.5% |  |
| fusion | 16.3.0 | 2,167 | 2,261 | 2,161 | 1.6% |  |
| grafbase | 0.53.5 | 1,657 | 1,715 | 1,652 | 1.3% |  |
| cosmo | 0.326.1 | 1,249 | 1,292 | 1,244 | 1.3% |  |
| hive-gateway-router-runtime | 2.10.0 | 579 | 599 | 577 | 1.2% |  |
| apollo-router | v2.15.1 | 409 | 431 | 407 | 2.0% |  |
| apollo-gateway | 2.14.2 | 263 | 267 | 262 | 0.6% |  |
| hive-gateway | 2.10.0 | 261 | 269 | 259 | 1.2% |  |
| feddi | 77271dc84a06 | 23 | 24 | 23 | 1.4% |  |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.74)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 1060050     ✗ 0     
     data_received..................: 31 GB   258 MB/s
     data_sent......................: 425 MB  3.5 MB/s
     http_req_blocked...............: avg=2.78µs  min=911ns   med=2.07µs  max=21.8ms   p(90)=3.34µs  p(95)=3.95µs   p(99.9)=31.83µs
     http_req_connecting............: avg=283ns   min=0s      med=0s      max=3.56ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=16.77ms min=1.39ms  med=16.13ms max=274.38ms p(90)=24.56ms p(95)=27.64ms  p(99.9)=46.92ms
       { expected_response:true }...: avg=16.77ms min=1.39ms  med=16.13ms max=274.38ms p(90)=24.56ms p(95)=27.64ms  p(99.9)=46.92ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 353450
     http_req_receiving.............: avg=85.36µs min=25.59µs med=47.79µs max=80.48ms  p(90)=83.74µs p(95)=132.41µs p(99.9)=6.82ms 
     http_req_sending...............: avg=43.61µs min=4.39µs  med=8.44µs  max=131.82ms p(90)=14.84µs p(95)=86µs     p(99.9)=4.43ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=16.64ms min=1.33ms  med=16.02ms max=274.06ms p(90)=24.4ms  p(95)=27.41ms  p(99.9)=46.01ms
     http_reqs......................: 353450  2941.068398/s
     iteration_duration.............: avg=16.97ms min=2ms     med=16.31ms max=302.72ms p(90)=24.76ms p(95)=27.85ms  p(99.9)=47.61ms
     iterations.....................: 353350  2940.236295/s
     success_rate...................: 100.00% ✓ 353350      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (rust subgraphs) (16.4.0-p.14)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 876780      ✗ 0     
     data_received..................: 26 GB   213 MB/s
     data_sent......................: 351 MB  2.9 MB/s
     http_req_blocked...............: avg=2.76µs   min=881ns   med=1.93µs   max=15.4ms   p(90)=3.29µs  p(95)=3.92µs  p(99.9)=26.56µs
     http_req_connecting............: avg=284ns    min=0s      med=0s       max=3.35ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=20.3ms   min=1.97ms  med=19.45ms  max=280.44ms p(90)=29.25ms p(95)=32.84ms p(99.9)=53.78ms
       { expected_response:true }...: avg=20.3ms   min=1.97ms  med=19.45ms  max=280.44ms p(90)=29.25ms p(95)=32.84ms p(99.9)=53.78ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 292360
     http_req_receiving.............: avg=721.09µs min=50.62µs med=133.25µs max=204.18ms p(90)=1.77ms  p(95)=2.56ms  p(99.9)=17.99ms
     http_req_sending...............: avg=38.28µs  min=4.65µs  med=8.35µs   max=117.71ms p(90)=16.38µs p(95)=70.47µs p(99.9)=2.81ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=19.55ms  min=1.89ms  med=18.69ms  max=279.95ms p(90)=28.38ms p(95)=31.91ms p(99.9)=52.38ms
     http_reqs......................: 292360  2431.439002/s
     iteration_duration.............: avg=20.52ms  min=3.32ms  med=19.65ms  max=292.52ms p(90)=29.46ms p(95)=33.06ms p(99.9)=54.28ms
     iterations.....................: 292260  2430.607343/s
     success_rate...................: 100.00% ✓ 292260      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (rust subgraphs) (16.4.0-p.14)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 858921      ✗ 0     
     data_received..................: 25 GB   209 MB/s
     data_sent......................: 344 MB  2.9 MB/s
     http_req_blocked...............: avg=2.69µs   min=852ns   med=1.94µs  max=14.66ms  p(90)=3.23µs  p(95)=3.84µs  p(99.9)=28.76µs 
     http_req_connecting............: avg=330ns    min=0s      med=0s      max=6.05ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=20.74ms  min=2.07ms  med=17.73ms max=280.53ms p(90)=33.51ms p(95)=40.9ms  p(99.9)=141.64ms
       { expected_response:true }...: avg=20.74ms  min=2.07ms  med=17.73ms max=280.53ms p(90)=33.51ms p(95)=40.9ms  p(99.9)=141.64ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 286407
     http_req_receiving.............: avg=590.85µs min=49.75µs med=91.4µs  max=185.39ms p(90)=1.09ms  p(95)=1.9ms   p(99.9)=26.73ms 
     http_req_sending...............: avg=39.73µs  min=4.58µs  med=8.25µs  max=250.53ms p(90)=14.87µs p(95)=58.48µs p(99.9)=3.03ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=20.11ms  min=1.95ms  med=17.19ms max=280.33ms p(90)=32.5ms  p(95)=39.73ms p(99.9)=139.3ms 
     http_reqs......................: 286407  2381.540516/s
     iteration_duration.............: avg=20.94ms  min=3.24ms  med=17.92ms max=311.32ms p(90)=33.72ms p(95)=41.12ms p(99.9)=142.19ms
     iterations.....................: 286307  2380.708993/s
     success_rate...................: 100.00% ✓ 286307      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (rust subgraphs) (16.3.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 843627      ✗ 0     
     data_received..................: 25 GB   205 MB/s
     data_sent......................: 338 MB  2.8 MB/s
     http_req_blocked...............: avg=3µs     min=881ns   med=2.14µs  max=19.02ms  p(90)=3.6µs   p(95)=4.23µs  p(99.9)=32.29µs 
     http_req_connecting............: avg=355ns   min=0s      med=0s      max=3.55ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=21.12ms min=2.12ms  med=17.98ms max=361.05ms p(90)=34.27ms p(95)=41.67ms p(99.9)=148.54ms
       { expected_response:true }...: avg=21.12ms min=2.12ms  med=17.98ms max=361.05ms p(90)=34.27ms p(95)=41.67ms p(99.9)=148.54ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 281309
     http_req_receiving.............: avg=602.3µs min=50.29µs med=94.87µs max=166.16ms p(90)=1.11ms  p(95)=1.94ms  p(99.9)=26.56ms 
     http_req_sending...............: avg=39.38µs min=4.41µs  med=8.52µs  max=126.47ms p(90)=15.18µs p(95)=67.47µs p(99.9)=3.06ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=20.47ms min=1.96ms  med=17.42ms max=360.95ms p(90)=33.23ms p(95)=40.51ms p(99.9)=147.55ms
     http_reqs......................: 281309  2339.0201/s
     iteration_duration.............: avg=21.32ms min=3.27ms  med=18.17ms max=361.27ms p(90)=34.49ms p(95)=41.9ms  p(99.9)=149.61ms
     iterations.....................: 281209  2338.188622/s
     success_rate...................: 100.00% ✓ 281209      ✗ 0     
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

     checks.........................: 100.00% ✓ 810558      ✗ 0     
     data_received..................: 24 GB   198 MB/s
     data_sent......................: 325 MB  2.7 MB/s
     http_req_blocked...............: avg=3.64µs  min=1.06µs  med=2.74µs  max=14.44ms  p(90)=4.38µs  p(95)=5.19µs   p(99.9)=41.84µs
     http_req_connecting............: avg=347ns   min=0s      med=0s      max=3.98ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=21.97ms min=1.66ms  med=21.71ms max=292.55ms p(90)=26.27ms p(95)=28.39ms  p(99.9)=49.04ms
       { expected_response:true }...: avg=21.97ms min=1.66ms  med=21.71ms max=292.55ms p(90)=26.27ms p(95)=28.39ms  p(99.9)=49.04ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 270286
     http_req_receiving.............: avg=101.9µs min=26.87µs med=55.46µs max=180.3ms  p(90)=96.62µs p(95)=135.83µs p(99.9)=7.87ms 
     http_req_sending...............: avg=42.42µs min=4.75µs  med=10.5µs  max=151.08ms p(90)=17.73µs p(95)=85.21µs  p(99.9)=2.5ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=21.83ms min=1.58ms  med=21.61ms max=244.47ms p(90)=26.13ms p(95)=28.18ms  p(99.9)=48.03ms
     http_reqs......................: 270286  2248.253601/s
     iteration_duration.............: avg=22.19ms min=3.81ms  med=21.92ms max=303.7ms  p(90)=26.48ms p(95)=28.63ms  p(99.9)=49.69ms
     iterations.....................: 270186  2247.421795/s
     success_rate...................: 100.00% ✓ 270186      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (rust subgraphs) (0.326.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 479925      ✗ 0     
     data_received..................: 14 GB   117 MB/s
     data_sent......................: 192 MB  1.6 MB/s
     http_req_blocked...............: avg=2.85µs  min=892ns  med=1.99µs  max=3.48ms   p(90)=3.41µs  p(95)=4.06µs  p(99.9)=31.04µs 
     http_req_connecting............: avg=524ns   min=0s     med=0s      max=3.44ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=37.28ms min=1.92ms med=36.81ms max=281.62ms p(90)=52.37ms p(95)=57.1ms  p(99.9)=80.56ms 
       { expected_response:true }...: avg=37.28ms min=1.92ms med=36.81ms max=281.62ms p(90)=52.37ms p(95)=57.1ms  p(99.9)=80.56ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 160075
     http_req_receiving.............: avg=70.47µs min=26.1µs med=57.03µs max=149.46ms p(90)=91.82µs p(95)=106.9µs p(99.9)=843.28µs
     http_req_sending...............: avg=23.84µs min=4.4µs  med=9.45µs  max=188.77ms p(90)=15.99µs p(95)=19.93µs p(99.9)=915.32µs
     http_req_tls_handshaking.......: avg=0s      min=0s     med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=37.18ms min=1.85ms med=36.72ms max=269.33ms p(90)=52.27ms p(95)=57ms    p(99.9)=80.36ms 
     http_reqs......................: 160075  1331.099344/s
     iteration_duration.............: avg=37.5ms  min=3.65ms med=37.01ms max=306.97ms p(90)=52.57ms p(95)=57.3ms  p(99.9)=80.93ms 
     iterations.....................: 159975  1330.267797/s
     success_rate...................: 100.00% ✓ 159975      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (rust subgraphs) (2.10.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 223173     ✗ 0    
     data_received..................: 6.5 GB  54 MB/s
     data_sent......................: 90 MB   743 kB/s
     http_req_blocked...............: avg=3.79µs  min=992ns   med=2.25µs  max=3.14ms   p(90)=3.82µs   p(95)=4.44µs   p(99.9)=42.89µs 
     http_req_connecting............: avg=1.17µs  min=0s      med=0s      max=3.1ms    p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=80.33ms min=3.67ms  med=81.22ms max=316.68ms p(90)=104.09ms p(95)=114.36ms p(99.9)=193.48ms
       { expected_response:true }...: avg=80.33ms min=3.67ms  med=81.22ms max=316.68ms p(90)=104.09ms p(95)=114.36ms p(99.9)=193.48ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 74491
     http_req_receiving.............: avg=76.28µs min=29.96µs med=64.61µs max=66.62ms  p(90)=101.61µs p(95)=114.75µs p(99.9)=660.11µs
     http_req_sending...............: avg=18.29µs min=4.84µs  med=11.38µs max=103.6ms  p(90)=18.6µs   p(95)=20.76µs  p(99.9)=554.1µs 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=80.24ms min=3.61ms  med=81.13ms max=315.91ms p(90)=103.99ms p(95)=114.26ms p(99.9)=193.38ms
     http_reqs......................: 74491   618.269287/s
     iteration_duration.............: avg=80.66ms min=13.39ms med=81.47ms max=325.16ms p(90)=104.33ms p(95)=114.62ms p(99.9)=194.35ms
     iterations.....................: 74391   617.439295/s
     success_rate...................: 100.00% ✓ 74391      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-router (rust subgraphs) (v2.15.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 160839     ✗ 0    
     data_received..................: 4.7 GB  39 MB/s
     data_sent......................: 65 MB   535 kB/s
     http_req_blocked...............: avg=5.01µs   min=1.25µs  med=3.25µs   max=3.43ms   p(90)=4.61µs   p(95)=5.15µs   p(99.9)=55.64µs 
     http_req_connecting............: avg=1.56µs   min=0s      med=0s       max=3.39ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=111.48ms min=4.64ms  med=111.29ms max=327.74ms p(90)=134.48ms p(95)=141.49ms p(99.9)=175.1ms 
       { expected_response:true }...: avg=111.48ms min=4.64ms  med=111.29ms max=327.74ms p(90)=134.48ms p(95)=141.49ms p(99.9)=175.1ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 53713
     http_req_receiving.............: avg=80.43µs  min=31µs    med=73.68µs  max=84.26ms  p(90)=105.83µs p(95)=117.94µs p(99.9)=494.63µs
     http_req_sending...............: avg=23.9µs   min=5.52µs  med=14.49µs  max=145.19ms p(90)=20.15µs  p(95)=22.11µs  p(99.9)=561.11µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=111.38ms min=4.54ms  med=111.19ms max=327.1ms  p(90)=134.39ms p(95)=141.39ms p(99.9)=174.71ms
     http_reqs......................: 53713   445.35173/s
     iteration_duration.............: avg=111.94ms min=38.41ms med=111.56ms max=344.4ms  p(90)=134.73ms p(95)=141.75ms p(99.9)=177.53ms
     iterations.....................: 53613   444.522598/s
     success_rate...................: 100.00% ✓ 53613      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
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

     checks.........................: 100.00% ✓ 102678     ✗ 0    
     data_received..................: 3.0 GB  25 MB/s
     data_sent......................: 41 MB   341 kB/s
     http_req_blocked...............: avg=6.26µs   min=1.34µs  med=3.44µs   max=3.56ms   p(90)=4.74µs   p(95)=5.3µs    p(99.9)=1.25ms  
     http_req_connecting............: avg=2.6µs    min=0s      med=0s       max=3.51ms   p(90)=0s       p(95)=0s       p(99.9)=1.22ms  
     http_req_duration..............: avg=174.61ms min=7.34ms  med=180.4ms  max=399.37ms p(90)=198.55ms p(95)=203.56ms p(99.9)=280.72ms
       { expected_response:true }...: avg=174.61ms min=7.34ms  med=180.4ms  max=399.37ms p(90)=198.55ms p(95)=203.56ms p(99.9)=280.72ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 34326
     http_req_receiving.............: avg=88.35µs  min=34.15µs med=82.46µs  max=65.74ms  p(90)=113.35µs p(95)=124.3µs  p(99.9)=456.02µs
     http_req_sending...............: avg=35.32µs  min=6.02µs  med=17.17µs  max=128.81ms p(90)=21.88µs  p(95)=23.72µs  p(99.9)=588.97µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=174.48ms min=7.27ms  med=180.29ms max=398.69ms p(90)=198.45ms p(95)=203.45ms p(99.9)=280.42ms
     http_reqs......................: 34326   283.888577/s
     iteration_duration.............: avg=175.39ms min=44.55ms med=180.8ms  max=408.75ms p(90)=198.82ms p(95)=203.84ms p(99.9)=282.83ms
     iterations.....................: 34226   283.06154/s
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
  <summary>Summary for: hive-gateway (rust subgraphs) (2.10.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 98799      ✗ 0    
     data_received..................: 2.9 GB  24 MB/s
     data_sent......................: 40 MB   328 kB/s
     http_req_blocked...............: avg=6.63µs   min=1.61µs  med=3.55µs   max=3.61ms   p(90)=4.93µs   p(95)=5.55µs   p(99.9)=1.36ms  
     http_req_connecting............: avg=2.78µs   min=0s      med=0s       max=3.57ms   p(90)=0s       p(95)=0s       p(99.9)=1.34ms  
     http_req_duration..............: avg=181.46ms min=5.88ms  med=169.51ms max=678.18ms p(90)=214.29ms p(95)=259.28ms p(99.9)=599.68ms
       { expected_response:true }...: avg=181.46ms min=5.88ms  med=169.51ms max=678.18ms p(90)=214.29ms p(95)=259.28ms p(99.9)=599.68ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 33033
     http_req_receiving.............: avg=91.59µs  min=35.57µs med=86.34µs  max=31.64ms  p(90)=115.35µs p(95)=126.42µs p(99.9)=573.93µs
     http_req_sending...............: avg=23.26µs  min=6.83µs  med=17.9µs   max=50.06ms  p(90)=22.65µs  p(95)=24.46µs  p(99.9)=596.53µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=181.34ms min=5.78ms  med=169.39ms max=678.08ms p(90)=214.18ms p(95)=259.1ms  p(99.9)=599.54ms
     http_reqs......................: 33033   273.422896/s
     iteration_duration.............: avg=182.27ms min=64.03ms med=169.89ms max=678.4ms  p(90)=214.69ms p(95)=260.56ms p(99.9)=600ms   
     iterations.....................: 32933   272.595169/s
     success_rate...................: 100.00% ✓ 32933      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: feddi (rust subgraphs) (77271dc84a06)</summary>

  **K6 Output**


```
data_received..................: 4.8 MB 80 kB/s
     data_sent......................: 61 kB  1.0 kB/s
     http_req_blocked...............: avg=6.72µs   min=2.62µs  med=3.37µs   max=158.45µs p(90)=4.16µs   p(95)=5.18µs   p(99.9)=151.12µs
     http_req_connecting............: avg=1.67µs   min=0s      med=0s       max=83.98µs  p(90)=0s       p(95)=0s       p(99.9)=79.86µs 
     http_req_duration..............: avg=629.91ms min=21.98ms med=28.16ms  max=30.02s   p(90)=38.81ms  p(95)=40.34ms  p(99.9)=28.55s  
       { expected_response:true }...: avg=629.91ms min=21.98ms med=28.16ms  max=30.02s   p(90)=38.81ms  p(95)=40.34ms  p(99.9)=28.55s  
     http_req_failed................: 0.00%  ✓ 0        ✗ 50  
     http_req_receiving.............: avg=139.63µs min=73.6µs  med=137.52µs max=320.27µs p(90)=173.89µs p(95)=194.65µs p(99.9)=320.09µs
     http_req_sending...............: avg=20.2µs   min=13.52µs med=18.8µs   max=59.35µs  p(90)=22.29µs  p(95)=23.28µs  p(99.9)=58.76µs 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=629.75ms min=21.88ms med=28.01ms  max=30.02s   p(90)=38.66ms  p(95)=40.16ms  p(99.9)=28.55s  
     http_reqs......................: 50     0.833327/s
     vus............................: 0      min=0      max=0 
     vus_max........................: 50     min=50     max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.74)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 859203      ✗ 0     
     data_received..................: 25 GB   208 MB/s
     data_sent......................: 344 MB  2.9 MB/s
     http_req_blocked...............: avg=3.51µs  min=1.09µs  med=2.81µs  max=5.15ms   p(90)=4.36µs  p(95)=5.09µs   p(99.9)=39.57µs
     http_req_connecting............: avg=321ns   min=0s      med=0s      max=4.15ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=20.72ms min=1.84ms  med=20.5ms  max=291.25ms p(90)=28.86ms p(95)=31.32ms  p(99.9)=50.39ms
       { expected_response:true }...: avg=20.72ms min=1.84ms  med=20.5ms  max=291.25ms p(90)=28.86ms p(95)=31.32ms  p(99.9)=50.39ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 286501
     http_req_receiving.............: avg=95.6µs  min=27.81µs med=53.74µs max=252.44ms p(90)=93.22µs p(95)=128.48µs p(99.9)=6.65ms 
     http_req_sending...............: avg=42.41µs min=4.91µs  med=10.44µs max=175.25ms p(90)=17.17µs p(95)=66.63µs  p(99.9)=2.47ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=20.58ms min=1.7ms   med=20.38ms max=291.06ms p(90)=28.71ms p(95)=31.13ms  p(99.9)=49.11ms
     http_reqs......................: 286501  2382.957801/s
     iteration_duration.............: avg=20.94ms min=3.45ms  med=20.7ms  max=317.05ms p(90)=29.07ms p(95)=31.54ms  p(99.9)=51.05ms
     iterations.....................: 286401  2382.126056/s
     success_rate...................: 100.00% ✓ 286401      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.4.0-p.14)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 822654      ✗ 0     
     data_received..................: 24 GB   200 MB/s
     data_sent......................: 330 MB  2.7 MB/s
     http_req_blocked...............: avg=3.42µs   min=911ns   med=2.54µs   max=14.95ms  p(90)=4.14µs  p(95)=4.86µs  p(99.9)=37.85µs 
     http_req_connecting............: avg=326ns    min=0s      med=0s       max=3.56ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=21.64ms  min=1.63ms  med=18.06ms  max=339.33ms p(90)=35.6ms  p(95)=43.84ms p(99.9)=158.57ms
       { expected_response:true }...: avg=21.64ms  min=1.63ms  med=18.06ms  max=339.33ms p(90)=35.6ms  p(95)=43.84ms p(99.9)=158.57ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 274318
     http_req_receiving.............: avg=632.29µs min=52.66µs med=100.52µs max=178.26ms p(90)=1.15ms  p(95)=2.02ms  p(99.9)=29.68ms 
     http_req_sending...............: avg=43.69µs  min=4.77µs  med=9.81µs   max=168.26ms p(90)=18.27µs p(95)=89.2µs  p(99.9)=3.17ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=20.96ms  min=1.55ms  med=17.49ms  max=339.19ms p(90)=34.51ms p(95)=42.56ms p(99.9)=156.6ms 
     http_reqs......................: 274318  2282.008777/s
     iteration_duration.............: avg=21.87ms  min=2.11ms  med=18.27ms  max=339.54ms p(90)=35.83ms p(95)=44.08ms p(99.9)=159.63ms
     iterations.....................: 274218  2281.176892/s
     success_rate...................: 100.00% ✓ 274218      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (.net subgraphs) (16.4.0-p.14)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 801750      ✗ 0     
     data_received..................: 23 GB   195 MB/s
     data_sent......................: 321 MB  2.7 MB/s
     http_req_blocked...............: avg=3µs      min=881ns   med=2.28µs   max=6.33ms   p(90)=3.8µs   p(95)=4.45µs  p(99.9)=30.02µs
     http_req_connecting............: avg=342ns    min=0s      med=0s       max=4.04ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=22.22ms  min=1.55ms  med=21.33ms  max=231.64ms p(90)=32.23ms p(95)=36.1ms  p(99.9)=57.48ms
       { expected_response:true }...: avg=22.22ms  min=1.55ms  med=21.33ms  max=231.64ms p(90)=32.23ms p(95)=36.1ms  p(99.9)=57.48ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 267350
     http_req_receiving.............: avg=846.78µs min=49.62µs med=207.85µs max=52.46ms  p(90)=2.04ms  p(95)=2.97ms  p(99.9)=20.04ms
     http_req_sending...............: avg=38.63µs  min=4.51µs  med=8.92µs   max=115.07ms p(90)=16.85µs p(95)=77.71µs p(99.9)=2.63ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=21.33ms  min=1.42ms  med=20.44ms  max=231.07ms p(90)=31.19ms p(95)=34.99ms p(99.9)=55.28ms
     http_reqs......................: 267350  2224.17596/s
     iteration_duration.............: avg=22.44ms  min=3.18ms  med=21.54ms  max=346.68ms p(90)=32.44ms p(95)=36.32ms p(99.9)=58.1ms 
     iterations.....................: 267250  2223.344026/s
     success_rate...................: 100.00% ✓ 267250      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (.net subgraphs) (16.3.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 781554      ✗ 0     
     data_received..................: 23 GB   190 MB/s
     data_sent......................: 313 MB  2.6 MB/s
     http_req_blocked...............: avg=3.02µs   min=912ns  med=2.33µs   max=5.15ms   p(90)=3.82µs  p(95)=4.47µs  p(99.9)=34.19µs 
     http_req_connecting............: avg=332ns    min=0s     med=0s       max=3.39ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=22.79ms  min=1.69ms med=18.63ms  max=389.93ms p(90)=37.63ms p(95)=46.75ms p(99.9)=177.83ms
       { expected_response:true }...: avg=22.79ms  min=1.69ms med=18.63ms  max=389.93ms p(90)=37.63ms p(95)=46.75ms p(99.9)=177.83ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 260618
     http_req_receiving.............: avg=677.67µs min=50.7µs med=103.51µs max=154.89ms p(90)=1.19ms  p(95)=2.04ms  p(99.9)=33.21ms 
     http_req_sending...............: avg=39.99µs  min=4.71µs med=9.6µs    max=235.11ms p(90)=17.4µs  p(95)=60.04µs p(99.9)=2.39ms  
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=22.08ms  min=1.6ms  med=18.02ms  max=389.86ms p(90)=36.46ms p(95)=45.3ms  p(99.9)=176.56ms
     http_reqs......................: 260618  2167.859785/s
     iteration_duration.............: avg=23.02ms  min=2.68ms med=18.83ms  max=390.1ms  p(90)=37.85ms p(95)=46.98ms p(99.9)=180.13ms
     iterations.....................: 260518  2167.02797/s
     success_rate...................: 100.00% ✓ 260518      ✗ 0     
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

     checks.........................: 100.00% ✓ 597825      ✗ 0     
     data_received..................: 18 GB   145 MB/s
     data_sent......................: 240 MB  2.0 MB/s
     http_req_blocked...............: avg=4.16µs   min=972ns   med=3.1µs   max=5.83ms   p(90)=5.47µs   p(95)=6.58µs   p(99.9)=51.88µs
     http_req_connecting............: avg=345ns    min=0s      med=0s      max=2.87ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=29.84ms  min=2.27ms  med=29.31ms max=300.5ms  p(90)=39.84ms  p(95)=43.36ms  p(99.9)=68.12ms
       { expected_response:true }...: avg=29.84ms  min=2.27ms  med=29.31ms max=300.5ms  p(90)=39.84ms  p(95)=43.36ms  p(99.9)=68.12ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 199375
     http_req_receiving.............: avg=107.58µs min=29.46µs med=59.65µs max=130.7ms  p(90)=132.67µs p(95)=225.91µs p(99.9)=5.47ms 
     http_req_sending...............: avg=48.21µs  min=4.98µs  med=11.5µs  max=141.9ms  p(90)=25.88µs  p(95)=121.07µs p(99.9)=4.15ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=29.68ms  min=2.11ms  med=29.17ms max=300.26ms p(90)=39.66ms  p(95)=43.15ms  p(99.9)=66.93ms
     http_reqs......................: 199375  1657.492745/s
     iteration_duration.............: avg=30.09ms  min=4.79ms  med=29.54ms max=316.9ms  p(90)=40.08ms  p(95)=43.59ms  p(99.9)=68.82ms
     iterations.....................: 199275  1656.6614/s
     success_rate...................: 100.00% ✓ 199275      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (.net subgraphs) (0.326.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 450663      ✗ 0     
     data_received..................: 13 GB   109 MB/s
     data_sent......................: 181 MB  1.5 MB/s
     http_req_blocked...............: avg=3.41µs  min=942ns   med=2.53µs  max=3.33ms   p(90)=4.18µs   p(95)=4.86µs   p(99.9)=39.51µs 
     http_req_connecting............: avg=553ns   min=0s      med=0s      max=3.29ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=39.69ms min=2.15ms  med=39.25ms max=306.42ms p(90)=55.15ms  p(95)=59.98ms  p(99.9)=84.03ms 
       { expected_response:true }...: avg=39.69ms min=2.15ms  med=39.25ms max=306.42ms p(90)=55.15ms  p(95)=59.98ms  p(99.9)=84.03ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 150321
     http_req_receiving.............: avg=79.7µs  min=24.76µs med=65.18µs max=156.21ms p(90)=105.26µs p(95)=121.93µs p(99.9)=835.16µs
     http_req_sending...............: avg=25.14µs min=4.63µs  med=11.89µs max=108.83ms p(90)=19.76µs  p(95)=23.35µs  p(99.9)=973.03µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=39.58ms min=2.03ms  med=39.15ms max=305.82ms p(90)=55.04ms  p(95)=59.87ms  p(99.9)=83.51ms 
     http_reqs......................: 150321  1249.675641/s
     iteration_duration.............: avg=39.93ms min=4.58ms  med=39.47ms max=315.46ms p(90)=55.37ms  p(95)=60.19ms  p(99.9)=84.47ms 
     iterations.....................: 150221  1248.844303/s
     success_rate...................: 100.00% ✓ 150221      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (.net subgraphs) (2.10.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 209046     ✗ 0    
     data_received..................: 6.1 GB  51 MB/s
     data_sent......................: 84 MB   695 kB/s
     http_req_blocked...............: avg=4.27µs  min=1.03µs  med=2.77µs  max=3.57ms   p(90)=4.32µs   p(95)=4.95µs   p(99.9)=45.16µs 
     http_req_connecting............: avg=1.27µs  min=0s      med=0s      max=3.54ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=85.74ms min=3.86ms  med=83.89ms max=333.9ms  p(90)=106.08ms p(95)=116.76ms p(99.9)=209.6ms 
       { expected_response:true }...: avg=85.74ms min=3.86ms  med=83.89ms max=333.9ms  p(90)=106.08ms p(95)=116.76ms p(99.9)=209.6ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 69782
     http_req_receiving.............: avg=87.13µs min=29.93µs med=74.33µs max=194.83ms p(90)=110.01µs p(95)=122.86µs p(99.9)=604.28µs
     http_req_sending...............: avg=21.45µs min=5.21µs  med=13.89µs max=86.89ms  p(90)=20.57µs  p(95)=22.72µs  p(99.9)=576.2µs 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=85.63ms min=3.77ms  med=83.79ms max=327.88ms p(90)=105.97ms p(95)=116.65ms p(99.9)=208.13ms
     http_reqs......................: 69782   579.01066/s
     iteration_duration.............: avg=86.11ms min=33.55ms med=84.14ms max=343.25ms p(90)=106.36ms p(95)=117.1ms  p(99.9)=211.16ms
     iterations.....................: 69682   578.180918/s
     success_rate...................: 100.00% ✓ 69682      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-router (.net subgraphs) (v2.15.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 148026     ✗ 0    
     data_received..................: 4.3 GB  36 MB/s
     data_sent......................: 59 MB   492 kB/s
     http_req_blocked...............: avg=5µs      min=1.08µs  med=2.99µs   max=3.31ms   p(90)=4.4µs    p(95)=4.95µs   p(99.9)=169.93µs
     http_req_connecting............: avg=1.81µs   min=0s      med=0s       max=3.27ms   p(90)=0s       p(95)=0s       p(99.9)=64.95µs 
     http_req_duration..............: avg=121.14ms min=5.22ms  med=118.77ms max=331.34ms p(90)=160.62ms p(95)=172.3ms  p(99.9)=221.93ms
       { expected_response:true }...: avg=121.14ms min=5.22ms  med=118.77ms max=331.34ms p(90)=160.62ms p(95)=172.3ms  p(99.9)=221.93ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 49442
     http_req_receiving.............: avg=82.28µs  min=30.26µs med=78.43µs  max=45.05ms  p(90)=109.65µs p(95)=122.28µs p(99.9)=544.48µs
     http_req_sending...............: avg=22.55µs  min=5.27µs  med=15.4µs   max=72.33ms  p(90)=20.92µs  p(95)=22.74µs  p(99.9)=536.05µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=121.04ms min=5.08ms  med=118.67ms max=330.74ms p(90)=160.5ms  p(95)=172.2ms  p(99.9)=221.71ms
     http_reqs......................: 49442   409.724812/s
     iteration_duration.............: avg=121.64ms min=17.17ms med=119.08ms max=347.76ms p(90)=160.95ms p(95)=172.6ms  p(99.9)=225.29ms
     iterations.....................: 49342   408.896114/s
     success_rate...................: 100.00% ✓ 49342      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
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

     checks.........................: 100.00% ✓ 95322      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 38 MB   316 kB/s
     http_req_blocked...............: avg=7.82µs   min=1.13µs  med=2.97µs   max=7.44ms   p(90)=4.25µs   p(95)=4.79µs   p(99.9)=1.89ms  
     http_req_connecting............: avg=4.55µs   min=0s      med=0s       max=7.42ms   p(90)=0s       p(95)=0s       p(99.9)=1.85ms  
     http_req_duration..............: avg=188.08ms min=7.89ms  med=189.07ms max=363.36ms p(90)=197.96ms p(95)=202.34ms p(99.9)=269.79ms
       { expected_response:true }...: avg=188.08ms min=7.89ms  med=189.07ms max=363.36ms p(90)=197.96ms p(95)=202.34ms p(99.9)=269.79ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 31874
     http_req_receiving.............: avg=88.33µs  min=30.52µs med=83.67µs  max=57.63ms  p(90)=114.21µs p(95)=125.38µs p(99.9)=487.25µs
     http_req_sending...............: avg=28.28µs  min=5.18µs  med=16.51µs  max=59.44ms  p(90)=21.15µs  p(95)=23.07µs  p(99.9)=3.27ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=187.96ms min=7.8ms   med=188.97ms max=360.81ms p(90)=197.85ms p(95)=202.22ms p(99.9)=269.69ms
     http_reqs......................: 31874   263.433803/s
     iteration_duration.............: avg=188.94ms min=48.61ms med=189.43ms max=374.9ms  p(90)=198.24ms p(95)=202.61ms p(99.9)=271.04ms
     iterations.....................: 31774   262.607318/s
     success_rate...................: 100.00% ✓ 31774      ✗ 0    
     vus............................: 11      min=11       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (.net subgraphs) (2.10.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 94569      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 38 MB   314 kB/s
     http_req_blocked...............: avg=6.87µs   min=1.36µs  med=3.57µs   max=3.47ms   p(90)=4.94µs   p(95)=5.55µs   p(99.9)=1.6ms   
     http_req_connecting............: avg=3.01µs   min=0s      med=0s       max=3.43ms   p(90)=0s       p(95)=0s       p(99.9)=1.58ms  
     http_req_duration..............: avg=189.57ms min=6.56ms  med=174.8ms  max=615.26ms p(90)=223.27ms p(95)=271.92ms p(99.9)=547.96ms
       { expected_response:true }...: avg=189.57ms min=6.56ms  med=174.8ms  max=615.26ms p(90)=223.27ms p(95)=271.92ms p(99.9)=547.96ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 31623
     http_req_receiving.............: avg=97.76µs  min=37µs    med=89.02µs  max=103.35ms p(90)=119.54µs p(95)=131.44µs p(99.9)=587.63µs
     http_req_sending...............: avg=29.62µs  min=5.95µs  med=18.18µs  max=82.49ms  p(90)=22.98µs  p(95)=24.8µs   p(99.9)=559.65µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=189.45ms min=6.43ms  med=174.66ms max=615.16ms p(90)=223.14ms p(95)=271.74ms p(99.9)=547.85ms
     http_reqs......................: 31623   261.300509/s
     iteration_duration.............: avg=190.46ms min=16.11ms med=175.16ms max=615.51ms p(90)=223.73ms p(95)=274.28ms p(99.9)=548.45ms
     iterations.....................: 31523   260.47421/s
     success_rate...................: 100.00% ✓ 31523      ✗ 0    
     vus............................: 15      min=15       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: feddi (.net subgraphs) (77271dc84a06)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 8670      ✗ 0   
     data_received..................: 286 MB  2.3 MB/s
     data_sent......................: 3.6 MB  29 kB/s
     http_req_blocked...............: avg=38.22µs  min=1.62µs   med=3.9µs    max=6.22ms   p(90)=5.59µs   p(95)=6.41µs   p(99.9)=5.38ms  
     http_req_connecting............: avg=32.9µs   min=0s       med=0s       max=6.19ms   p(90)=0s       p(95)=0s       p(99.9)=5.32ms  
     http_req_duration..............: avg=2.02s    min=27.1ms   med=2.05s    max=11.29s   p(90)=2.75s    p(95)=2.94s    p(99.9)=8.88s   
       { expected_response:true }...: avg=2.02s    min=27.1ms   med=2.05s    max=11.29s   p(90)=2.75s    p(95)=2.94s    p(99.9)=8.88s   
     http_req_failed................: 0.00%   ✓ 0         ✗ 2990
     http_req_receiving.............: avg=103.74µs min=33.02µs  med=100.66µs max=413.05µs p(90)=139.77µs p(95)=154.55µs p(99.9)=376.33µs
     http_req_sending...............: avg=53.63µs  min=6.22µs   med=19.82µs  max=22.31ms  p(90)=25.12µs  p(95)=28.59µs  p(99.9)=3.88ms  
     http_req_tls_handshaking.......: avg=0s       min=0s       med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=2.02s    min=26.94ms  med=2.05s    max=11.29s   p(90)=2.75s    p(95)=2.94s    p(99.9)=8.88s   
     http_reqs......................: 2990    23.806754/s
     iteration_duration.............: avg=2.09s    min=194.87ms med=2.07s    max=11.3s    p(90)=2.76s    p(95)=2.95s    p(99.9)=8.9s    
     iterations.....................: 2890    23.010541/s
     success_rate...................: 100.00% ✓ 2890      ✗ 0   
     vus............................: 31      min=0       max=50
     vus_max........................: 50      min=50      max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

