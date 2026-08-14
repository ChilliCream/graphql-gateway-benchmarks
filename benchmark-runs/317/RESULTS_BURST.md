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
| hive-router | v0.0.84 | 2,895 | 3,038 | 2,848 | 2.1% |  |
| fusion-nightly-net11 | 16.6.1-p.2 | 2,545 | 2,657 | 2,535 | 1.7% |  |
| fusion | 16.6.0 | 2,538 | 2,643 | 2,528 | 1.5% |  |
| fusion-nightly | 16.6.1-p.2 | 2,431 | 2,541 | 2,399 | 2.1% |  |
| fusion-nightly-fed | 16.6.1-p.2 | 2,363 | 2,445 | 2,354 | 1.4% |  |
| cosmo | 0.334.0 | 1,195 | 1,234 | 1,185 | 1.5% |  |
| hive-gateway-router-runtime | 2.10.8 | 559 | 568 | 558 | 0.7% |  |
| hive-gateway | 2.10.8 | 248 | 255 | 246 | 1.1% |  |
| apollo-gateway | 2.14.3 | 234 | 241 | 232 | 1.2% |  |
| apollo-router | v2.16.1 | — | — | — | — | non-compatible response (5361 across 9/9 runs) |
| feddi | — | — | — | — | — | not run |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (489357 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| fusion-nightly-net11 | 16.6.1-p.2 | 2,481 | 2,570 | 2,472 | 1.4% |  |
| hive-router | v0.0.84 | 2,333 | 2,409 | 2,288 | 1.8% |  |
| fusion-nightly | 16.6.1-p.2 | 2,319 | 2,405 | 2,312 | 1.4% |  |
| fusion | 16.6.0 | 2,306 | 2,409 | 2,292 | 1.7% |  |
| fusion-nightly-fed | 16.6.1-p.2 | 2,129 | 2,227 | 2,118 | 1.8% |  |
| cosmo | 0.334.0 | 1,157 | 1,195 | 1,151 | 1.3% |  |
| hive-gateway-router-runtime | 2.10.8 | 516 | 532 | 513 | 1.2% |  |
| hive-gateway | 2.10.8 | 236 | 243 | 234 | 1.2% |  |
| apollo-gateway | 2.14.3 | 232 | 237 | 230 | 0.9% |  |
| apollo-router | v2.16.1 | — | — | — | — | non-compatible response (33123 across 9/9 runs) |
| feddi | — | — | — | — | — | not run |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (276435 across 9/9 runs) |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.84)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 532530      ✗ 0     
     data_received..................: 16 GB   254 MB/s
     data_sent......................: 214 MB  3.5 MB/s
     http_req_blocked...............: avg=20.08µs min=892ns   med=2.13µs  max=59.22ms  p(90)=3.72µs   p(95)=4.92µs   p(99.9)=1.84ms  
     http_req_connecting............: avg=17.03µs min=0s      med=0s      max=57.8ms   p(90)=0s       p(95)=0s       p(99.9)=1.82ms  
     http_req_duration..............: avg=79.61ms min=1.34ms  med=75.89ms max=329.18ms p(90)=152.5ms  p(95)=165.8ms  p(99.9)=217.09ms
       { expected_response:true }...: avg=79.61ms min=1.34ms  med=75.89ms max=329.18ms p(90)=152.5ms  p(95)=165.8ms  p(99.9)=217.09ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 178510
     http_req_receiving.............: avg=144.5µs min=24.27µs med=49.37µs max=92.32ms  p(90)=129.56µs p(95)=324.67µs p(99.9)=18.38ms 
     http_req_sending...............: avg=72.58µs min=4.31µs  med=9.01µs  max=265.31ms p(90)=17.77µs  p(95)=112.43µs p(99.9)=10.33ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=79.39ms min=1.3ms   med=75.69ms max=328.91ms p(90)=152.25ms p(95)=165.43ms p(99.9)=215.37ms
     http_reqs......................: 178510  2895.860381/s
     iteration_duration.............: avg=80.3ms  min=2.24ms  med=76.59ms max=338.94ms p(90)=152.88ms p(95)=166.25ms p(99.9)=217.8ms 
     iterations.....................: 177510  2879.637982/s
     success_rate...................: 100.00% ✓ 177510      ✗ 0     
     vus............................: 86      min=0         max=494 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (rust subgraphs) (16.6.1-p.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 471759      ✗ 0     
     data_received..................: 14 GB   223 MB/s
     data_sent......................: 190 MB  3.1 MB/s
     http_req_blocked...............: avg=18.86µs  min=1.01µs  med=2.52µs  max=67.1ms   p(90)=4.02µs   p(95)=5.06µs   p(99.9)=1.82ms  
     http_req_connecting............: avg=15.26µs  min=0s      med=0s      max=67.04ms  p(90)=0s       p(95)=0s       p(99.9)=1.76ms  
     http_req_duration..............: avg=89.86ms  min=1.85ms  med=84.98ms max=423.42ms p(90)=171.57ms p(95)=189.23ms p(99.9)=255ms   
       { expected_response:true }...: avg=89.86ms  min=1.85ms  med=84.98ms max=423.42ms p(90)=171.57ms p(95)=189.23ms p(99.9)=255ms   
     http_req_failed................: 0.00%   ✓ 0           ✗ 158253
     http_req_receiving.............: avg=641.09µs min=53.35µs med=105.3µs max=167.01ms p(90)=1.15ms   p(95)=2.1ms    p(99.9)=28.01ms 
     http_req_sending...............: avg=68.7µs   min=4.51µs  med=9.27µs  max=165.79ms p(90)=17.56µs  p(95)=117.55µs p(99.9)=9ms     
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=89.15ms  min=1.78ms  med=84.31ms max=423.12ms p(90)=170.64ms p(95)=188.4ms  p(99.9)=253.26ms
     http_reqs......................: 158253  2545.361762/s
     iteration_duration.............: avg=90.68ms  min=3ms     med=85.89ms max=423.71ms p(90)=172.05ms p(95)=189.72ms p(99.9)=256.6ms 
     iterations.....................: 157253  2529.277632/s
     success_rate...................: 100.00% ✓ 157253      ✗ 0     
     vus............................: 65      min=0         max=496 
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

     checks.........................: 100.00% ✓ 472305      ✗ 0     
     data_received..................: 14 GB   223 MB/s
     data_sent......................: 190 MB  3.0 MB/s
     http_req_blocked...............: avg=19.79µs min=882ns   med=2.07µs  max=49.19ms  p(90)=3.49µs   p(95)=4.56µs   p(99.9)=3.77ms  
     http_req_connecting............: avg=16.69µs min=0s      med=0s      max=48.5ms   p(90)=0s       p(95)=0s       p(99.9)=3.3ms   
     http_req_duration..............: avg=89.74ms min=2ms     med=77.12ms max=1.6s     p(90)=170.41ms p(95)=198.38ms p(99.9)=650.04ms
       { expected_response:true }...: avg=89.74ms min=2ms     med=77.12ms max=1.6s     p(90)=170.41ms p(95)=198.38ms p(99.9)=650.04ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 158435
     http_req_receiving.............: avg=1.34ms  min=52.41µs med=95.91µs max=1.45s    p(90)=1.48ms   p(95)=4.33ms   p(99.9)=76ms    
     http_req_sending...............: avg=61.66µs min=4.5µs   med=8.62µs  max=101.94ms p(90)=16.29µs  p(95)=103.67µs p(99.9)=8.74ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=88.34ms min=1.89ms  med=75.95ms max=1.6s     p(90)=168.72ms p(95)=195.35ms p(99.9)=628.98ms
     http_reqs......................: 158435  2538.062892/s
     iteration_duration.............: avg=90.58ms min=3.36ms  med=78.03ms max=1.6s     p(90)=171.05ms p(95)=199.26ms p(99.9)=650.48ms
     iterations.....................: 157435  2522.043308/s
     success_rate...................: 100.00% ✓ 157435      ✗ 0     
     vus............................: 76      min=0         max=494 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (rust subgraphs) (16.6.1-p.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 451572      ✗ 0     
     data_received..................: 13 GB   213 MB/s
     data_sent......................: 182 MB  2.9 MB/s
     http_req_blocked...............: avg=17.83µs min=902ns   med=2.55µs   max=53.48ms  p(90)=4.09µs   p(95)=5.14µs   p(99.9)=1.65ms  
     http_req_connecting............: avg=14.58µs min=0s      med=0s       max=53.42ms  p(90)=0s       p(95)=0s       p(99.9)=1.59ms  
     http_req_duration..............: avg=93.89ms min=1.94ms  med=80.9ms   max=1.27s    p(90)=181.97ms p(95)=207.81ms p(99.9)=635.31ms
       { expected_response:true }...: avg=93.89ms min=1.94ms  med=80.9ms   max=1.27s    p(90)=181.97ms p(95)=207.81ms p(99.9)=635.31ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 151524
     http_req_receiving.............: avg=1.63ms  min=52.06µs med=104.56µs max=970.56ms p(90)=1.87ms   p(95)=5.08ms   p(99.9)=130.42ms
     http_req_sending...............: avg=67.71µs min=4.47µs  med=9.57µs   max=191.47ms p(90)=17.89µs  p(95)=114.95µs p(99.9)=9.1ms   
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=92.19ms min=1.86ms  med=79.35ms  max=1.27s    p(90)=179.96ms p(95)=204.38ms p(99.9)=630.36ms
     http_reqs......................: 151524  2431.853577/s
     iteration_duration.............: avg=94.78ms min=3.38ms  med=82.04ms  max=1.27s    p(90)=182.56ms p(95)=208.34ms p(99.9)=636.26ms
     iterations.....................: 150524  2415.804281/s
     success_rate...................: 100.00% ✓ 150524      ✗ 0     
     vus............................: 70      min=0         max=495 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (rust subgraphs) (16.6.1-p.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 436869      ✗ 0     
     data_received..................: 13 GB   208 MB/s
     data_sent......................: 176 MB  2.8 MB/s
     http_req_blocked...............: avg=13.44µs min=812ns   med=2.15µs  max=61.25ms p(90)=3.67µs   p(95)=4.75µs   p(99.9)=775.15µs
     http_req_connecting............: avg=10.67µs min=0s      med=0s      max=61.19ms p(90)=0s       p(95)=0s       p(99.9)=700.31µs
     http_req_duration..............: avg=97.08ms min=1.66ms  med=85.3ms  max=1.66s   p(90)=184.61ms p(95)=216.84ms p(99.9)=812.33ms
       { expected_response:true }...: avg=97.08ms min=1.66ms  med=85.3ms  max=1.66s   p(90)=184.61ms p(95)=216.84ms p(99.9)=812.33ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 146623
     http_req_receiving.............: avg=1.43ms  min=51.66µs med=99.03µs max=1.21s   p(90)=1.57ms   p(95)=4.1ms    p(99.9)=99.88ms 
     http_req_sending...............: avg=56.09µs min=4.47µs  med=9.03µs  max=51.58ms p(90)=16.87µs  p(95)=98.95µs  p(99.9)=7.53ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=95.59ms min=1.59ms  med=84.19ms max=1.66s   p(90)=182.91ms p(95)=213.21ms p(99.9)=779.84ms
     http_reqs......................: 146623  2363.524768/s
     iteration_duration.............: avg=97.99ms min=3.09ms  med=86.33ms max=1.66s   p(90)=185.26ms p(95)=217.57ms p(99.9)=813.15ms
     iterations.....................: 145623  2347.405027/s
     success_rate...................: 100.00% ✓ 145623      ✗ 0     
     vus............................: 59      min=0         max=498 
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

     checks.........................: 100.00% ✓ 221079      ✗ 0    
     data_received..................: 6.6 GB  105 MB/s
     data_sent......................: 90 MB   1.4 MB/s
     http_req_blocked...............: avg=5.61µs   min=1.09µs  med=2.57µs   max=7.78ms   p(90)=4.16µs   p(95)=5.04µs   p(99.9)=560.48µs
     http_req_connecting............: avg=2.31µs   min=0s      med=0s       max=7.73ms   p(90)=0s       p(95)=0s       p(99.9)=500.46µs
     http_req_duration..............: avg=191.03ms min=1.86ms  med=193.24ms max=501.21ms p(90)=353.48ms p(95)=377.79ms p(99.9)=447.52ms
       { expected_response:true }...: avg=191.03ms min=1.86ms  med=193.24ms max=501.21ms p(90)=353.48ms p(95)=377.79ms p(99.9)=447.52ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 74693
     http_req_receiving.............: avg=74.27µs  min=28.66µs med=60.86µs  max=36.22ms  p(90)=98.41µs  p(95)=113.07µs p(99.9)=1.02ms  
     http_req_sending...............: avg=28.13µs  min=4.9µs   med=10.93µs  max=125.17ms p(90)=17.06µs  p(95)=20.88µs  p(99.9)=3.06ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=190.93ms min=1.81ms  med=193.16ms max=501.13ms p(90)=353.38ms p(95)=377.7ms  p(99.9)=447.47ms
     http_reqs......................: 74693   1195.466468/s
     iteration_duration.............: avg=193.85ms min=3.92ms  med=196.39ms max=501.34ms p(90)=354.29ms p(95)=378.45ms p(99.9)=448.53ms
     iterations.....................: 73693   1179.461401/s
     success_rate...................: 100.00% ✓ 73693       ✗ 0    
     vus............................: 80      min=0         max=494
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

     checks.........................: 100.00% ✓ 104919     ✗ 0    
     data_received..................: 3.2 GB  49 MB/s
     data_sent......................: 43 MB   672 kB/s
     http_req_blocked...............: avg=9.69µs   min=1.25µs  med=3.21µs   max=17.88ms p(90)=4.96µs   p(95)=5.99µs   p(99.9)=1.51ms 
     http_req_connecting............: avg=5.47µs   min=0s      med=0s       max=17.8ms  p(90)=0s       p(95)=0s       p(99.9)=1.45ms 
     http_req_duration..............: avg=398.8ms  min=3.56ms  med=372.72ms max=1.71s   p(90)=781.4ms  p(95)=851.45ms p(99.9)=1.21s  
       { expected_response:true }...: avg=398.8ms  min=3.56ms  med=372.72ms max=1.71s   p(90)=781.4ms  p(95)=851.45ms p(99.9)=1.21s  
     http_req_failed................: 0.00%   ✓ 0          ✗ 35973
     http_req_receiving.............: avg=82.35µs  min=30.36µs med=71.86µs  max=33.95ms p(90)=111.11µs p(95)=126.09µs p(99.9)=934.4µs
     http_req_sending...............: avg=29µs     min=5.4µs   med=14.35µs  max=78.81ms p(90)=21.5µs   p(95)=24.59µs  p(99.9)=2.71ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=398.68ms min=3.49ms  med=372.61ms max=1.71s   p(90)=781.11ms p(95)=851.36ms p(99.9)=1.21s  
     http_reqs......................: 35973   559.408998/s
     iteration_duration.............: avg=410.44ms min=28.29ms med=387.83ms max=1.72s   p(90)=784.94ms p(95)=854.39ms p(99.9)=1.22s  
     iterations.....................: 34973   543.858196/s
     success_rate...................: 100.00% ✓ 34973      ✗ 0    
     vus............................: 73      min=0        max=496
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

     checks.........................: 100.00% ✓ 47373      ✗ 0    
     data_received..................: 1.5 GB  22 MB/s
     data_sent......................: 20 MB   299 kB/s
     http_req_blocked...............: avg=16.21µs  min=1.14µs  med=3.11µs   max=14.91ms p(90)=4.74µs   p(95)=6.08µs  p(99.9)=3.57ms
     http_req_connecting............: avg=11.31µs  min=0s      med=0s       max=14.72ms p(90)=0s       p(95)=0s      p(99.9)=3.16ms
     http_req_duration..............: avg=849.28ms min=5.81ms  med=726.67ms max=21.09s  p(90)=1.44s    p(95)=1.67s   p(99.9)=19.35s
       { expected_response:true }...: avg=849.28ms min=5.81ms  med=726.67ms max=21.09s  p(90)=1.44s    p(95)=1.67s   p(99.9)=19.35s
     http_req_failed................: 0.00%   ✓ 0          ✗ 16791
     http_req_receiving.............: avg=93.57µs  min=32.69µs med=86.9µs   max=7.26ms  p(90)=123.89µs p(95)=138.9µs p(99.9)=1.19ms
     http_req_sending...............: avg=26.4µs   min=5.78µs  med=16.76µs  max=18.14ms p(90)=22.36µs  p(95)=26.53µs p(99.9)=2.31ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s      p(99.9)=0s    
     http_req_waiting...............: avg=849.16ms min=5.73ms  med=726.55ms max=21.09s  p(90)=1.44s    p(95)=1.67s   p(99.9)=19.35s
     http_reqs......................: 16791   248.325597/s
     iteration_duration.............: avg=903.04ms min=37.77ms med=786.43ms max=21.09s  p(90)=1.48s    p(95)=1.69s   p(99.9)=19.44s
     iterations.....................: 15791   233.536389/s
     success_rate...................: 100.00% ✓ 15791      ✗ 0    
     vus............................: 88      min=0        max=499
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

     checks.........................: 100.00% ✓ 48414      ✗ 0    
     data_received..................: 1.5 GB  21 MB/s
     data_sent......................: 21 MB   288 kB/s
     http_req_blocked...............: avg=11.61µs  min=1.3µs   med=3.53µs   max=3.45ms   p(90)=5.2µs    p(95)=6.54µs   p(99.9)=1.38ms  
     http_req_connecting............: avg=6.16µs   min=0s      med=0s       max=3.4ms    p(90)=0s       p(95)=0s       p(99.9)=1.24ms  
     http_req_duration..............: avg=384.32ms min=7.47ms  med=405.87ms max=1.16s    p(90)=671.57ms p(95)=728.1ms  p(99.9)=1.03s   
       { expected_response:true }...: avg=384.32ms min=7.47ms  med=405.87ms max=1.16s    p(90)=671.57ms p(95)=728.1ms  p(99.9)=1.03s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 17138
     http_req_receiving.............: avg=101.83µs min=36.06µs med=87.9µs   max=121.73ms p(90)=127.37µs p(95)=143.38µs p(99.9)=921.32µs
     http_req_sending...............: avg=41.01µs  min=5.7µs   med=17.9µs   max=103.78ms p(90)=23.33µs  p(95)=27.9µs   p(99.9)=2.82ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=384.18ms min=7.33ms  med=405.76ms max=1.16s    p(90)=671.45ms p(95)=728.01ms p(99.9)=1.03s   
     http_reqs......................: 17138   234.663547/s
     iteration_duration.............: avg=408.18ms min=8.2ms   med=435.39ms max=1.17s    p(90)=676.34ms p(95)=734.3ms  p(99.9)=1.03s   
     iterations.....................: 16138   220.97096/s
     success_rate...................: 100.00% ✓ 16138      ✗ 0    
     vus............................: 53      min=0        max=498
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (.net subgraphs) (16.6.1-p.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 456789      ✗ 0     
     data_received..................: 13 GB   218 MB/s
     data_sent......................: 184 MB  3.0 MB/s
     http_req_blocked...............: avg=17µs     min=911ns   med=2.36µs   max=56.62ms  p(90)=4.15µs   p(95)=5.36µs   p(99.9)=1.75ms  
     http_req_connecting............: avg=13.81µs  min=0s      med=0s       max=56.58ms  p(90)=0s       p(95)=0s       p(99.9)=1.67ms  
     http_req_duration..............: avg=92.77ms  min=1.42ms  med=88.08ms  max=343.97ms p(90)=177.12ms p(95)=193.89ms p(99.9)=255.42ms
       { expected_response:true }...: avg=92.77ms  min=1.42ms  med=88.08ms  max=343.97ms p(90)=177.12ms p(95)=193.89ms p(99.9)=255.42ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 153263
     http_req_receiving.............: avg=622.29µs min=50.63µs med=104.58µs max=68.47ms  p(90)=1.22ms   p(95)=2.15ms   p(99.9)=26.67ms 
     http_req_sending...............: avg=65.17µs  min=4.85µs  med=9.7µs    max=142.55ms p(90)=21.3µs   p(95)=116.19µs p(99.9)=8.53ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=92.08ms  min=1.34ms  med=87.31ms  max=334.71ms p(90)=176.35ms p(95)=193.15ms p(99.9)=253.89ms
     http_reqs......................: 153263  2481.73509/s
     iteration_duration.............: avg=93.63ms  min=3.26ms  med=89ms     max=364.69ms p(90)=177.59ms p(95)=194.35ms p(99.9)=256.37ms
     iterations.....................: 152263  2465.542434/s
     success_rate...................: 100.00% ✓ 152263      ✗ 0     
     vus............................: 91      min=0         max=499 
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

     checks.........................: 100.00% ✓ 430008      ✗ 0     
     data_received..................: 13 GB   204 MB/s
     data_sent......................: 173 MB  2.8 MB/s
     http_req_blocked...............: avg=25.87µs  min=1.01µs  med=3.08µs  max=72.66ms  p(90)=5.01µs   p(95)=6.32µs   p(99.9)=3.54ms  
     http_req_connecting............: avg=21.81µs  min=0s      med=0s      max=72.62ms  p(90)=0s       p(95)=0s       p(99.9)=3.31ms  
     http_req_duration..............: avg=98.52ms  min=1.55ms  med=93.52ms max=325.01ms p(90)=190.25ms p(95)=206.93ms p(99.9)=267.25ms
       { expected_response:true }...: avg=98.52ms  min=1.55ms  med=93.52ms max=325.01ms p(90)=190.25ms p(95)=206.93ms p(99.9)=267.25ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 144336
     http_req_receiving.............: avg=146.84µs min=27.38µs med=59.12µs max=54.13ms  p(90)=163.93µs p(95)=395µs    p(99.9)=15.35ms 
     http_req_sending...............: avg=77.14µs  min=5.04µs  med=12µs    max=188.81ms p(90)=23.61µs  p(95)=141.74µs p(99.9)=10.15ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=98.3ms   min=1.46ms  med=93.29ms max=324.94ms p(90)=189.98ms p(95)=206.54ms p(99.9)=266.29ms
     http_reqs......................: 144336  2333.452717/s
     iteration_duration.............: avg=99.48ms  min=3.71ms  med=94.58ms max=325.19ms p(90)=190.78ms p(95)=207.39ms p(99.9)=269.39ms
     iterations.....................: 143336  2317.285907/s
     success_rate...................: 100.00% ✓ 143336      ✗ 0     
     vus............................: 96      min=0         max=500 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.6.1-p.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 427692      ✗ 0     
     data_received..................: 13 GB   203 MB/s
     data_sent......................: 172 MB  2.8 MB/s
     http_req_blocked...............: avg=18.89µs  min=1.11µs  med=2.88µs  max=75.19ms  p(90)=4.64µs   p(95)=5.83µs   p(99.9)=1.82ms  
     http_req_connecting............: avg=15.33µs  min=0s      med=0s      max=75.12ms  p(90)=0s       p(95)=0s       p(99.9)=1.76ms  
     http_req_duration..............: avg=99.09ms  min=1.54ms  med=87.16ms max=1.45s    p(90)=189.31ms p(95)=219.33ms p(99.9)=720.8ms 
       { expected_response:true }...: avg=99.09ms  min=1.54ms  med=87.16ms max=1.45s    p(90)=189.31ms p(95)=219.33ms p(99.9)=720.8ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 143564
     http_req_receiving.............: avg=1.84ms   min=54.87µs med=113.4µs max=881.27ms p(90)=2.04ms   p(95)=5.51ms   p(99.9)=113.3ms 
     http_req_sending...............: avg=69.04µs  min=4.81µs  med=10.71µs max=103.63ms p(90)=20.28µs  p(95)=120.04µs p(99.9)=9.38ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=97.18ms  min=1.46ms  med=85.88ms max=1.45s    p(90)=186.66ms p(95)=215.08ms p(99.9)=658.52ms
     http_reqs......................: 143564  2319.4841/s
     iteration_duration.............: avg=100.06ms min=2.85ms  med=88.17ms max=1.45s    p(90)=190.02ms p(95)=220.3ms  p(99.9)=721.21ms
     iterations.....................: 142564  2303.327653/s
     success_rate...................: 100.00% ✓ 142564      ✗ 0     
     vus............................: 52      min=0         max=499 
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

     checks.........................: 100.00% ✓ 425463      ✗ 0     
     data_received..................: 13 GB   202 MB/s
     data_sent......................: 172 MB  2.8 MB/s
     http_req_blocked...............: avg=13.66µs  min=902ns   med=2.24µs   max=61.36ms  p(90)=3.93µs   p(95)=5.06µs   p(99.9)=1.42ms  
     http_req_connecting............: avg=10.68µs  min=0s      med=0s       max=61.22ms  p(90)=0s       p(95)=0s       p(99.9)=1.35ms  
     http_req_duration..............: avg=99.66ms  min=1.55ms  med=83.85ms  max=1.83s    p(90)=187.05ms p(95)=219.57ms p(99.9)=1.01s   
       { expected_response:true }...: avg=99.66ms  min=1.55ms  med=83.85ms  max=1.83s    p(90)=187.05ms p(95)=219.57ms p(99.9)=1.01s   
     http_req_failed................: 0.00%   ✓ 0           ✗ 142821
     http_req_receiving.............: avg=1.95ms   min=52.89µs med=110.01µs max=932.18ms p(90)=2.09ms   p(95)=5.45ms   p(99.9)=195.16ms
     http_req_sending...............: avg=56.51µs  min=4.64µs  med=9.2µs    max=131.89ms p(90)=18.1µs   p(95)=94.76µs  p(99.9)=7.56ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=97.66ms  min=1.46ms  med=82.42ms  max=1.76s    p(90)=185.25ms p(95)=215.88ms p(99.9)=925.05ms
     http_reqs......................: 142821  2306.816882/s
     iteration_duration.............: avg=100.62ms min=2.83ms  med=84.81ms  max=1.83s    p(90)=187.65ms p(95)=220.28ms p(99.9)=1.01s   
     iterations.....................: 141821  2290.665077/s
     success_rate...................: 100.00% ✓ 141821      ✗ 0     
     vus............................: 53      min=0         max=499 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (.net subgraphs) (16.6.1-p.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 394872      ✗ 0     
     data_received..................: 12 GB   187 MB/s
     data_sent......................: 159 MB  2.6 MB/s
     http_req_blocked...............: avg=12.86µs  min=851ns   med=2.26µs   max=69.66ms  p(90)=3.96µs   p(95)=5.12µs   p(99.9)=827.51µs
     http_req_connecting............: avg=9.95µs   min=0s      med=0s       max=69.49ms  p(90)=0s       p(95)=0s       p(99.9)=757.75µs
     http_req_duration..............: avg=107.36ms min=1.84ms  med=94.74ms  max=1.75s    p(90)=201.49ms p(95)=230.31ms p(99.9)=904.4ms 
       { expected_response:true }...: avg=107.36ms min=1.84ms  med=94.74ms  max=1.75s    p(90)=201.49ms p(95)=230.31ms p(99.9)=904.4ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 132624
     http_req_receiving.............: avg=1.22ms   min=53.64µs med=113.29µs max=1.07s    p(90)=1.69ms   p(95)=3.9ms    p(99.9)=66.25ms 
     http_req_sending...............: avg=60.61µs  min=4.62µs  med=9.7µs    max=251.49ms p(90)=19.2µs   p(95)=93.96µs  p(99.9)=7.69ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=106.07ms min=1.76ms  med=93.53ms  max=1.75s    p(90)=199.7ms  p(95)=227.65ms p(99.9)=870.59ms
     http_reqs......................: 132624  2129.37374/s
     iteration_duration.............: avg=108.42ms min=3.4ms   med=95.99ms  max=1.75s    p(90)=202.1ms  p(95)=231.05ms p(99.9)=905.73ms
     iterations.....................: 131624  2113.318021/s
     success_rate...................: 100.00% ✓ 131624      ✗ 0     
     vus............................: 70      min=0         max=495 
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

     checks.........................: 100.00% ✓ 214569      ✗ 0    
     data_received..................: 6.3 GB  101 MB/s
     data_sent......................: 87 MB   1.4 MB/s
     http_req_blocked...............: avg=6.74µs   min=1.13µs  med=3µs      max=9.06ms   p(90)=4.8µs    p(95)=5.83µs   p(99.9)=620.11µs
     http_req_connecting............: avg=3µs      min=0s      med=0s       max=9ms      p(90)=0s       p(95)=0s       p(99.9)=542.74µs
     http_req_duration..............: avg=196.76ms min=2.01ms  med=196.82ms max=583.12ms p(90)=363.35ms p(95)=391.17ms p(99.9)=491.31ms
       { expected_response:true }...: avg=196.76ms min=2.01ms  med=196.82ms max=583.12ms p(90)=363.35ms p(95)=391.17ms p(99.9)=491.31ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 72523
     http_req_receiving.............: avg=110.75µs min=27.16µs med=65.95µs  max=280.97ms p(90)=107.27µs p(95)=122.18µs p(99.9)=2.01ms  
     http_req_sending...............: avg=38.79µs  min=5.15µs  med=12.85µs  max=288.8ms  p(90)=20.07µs  p(95)=23.93µs  p(99.9)=3.43ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=196.61ms min=1.94ms  med=196.64ms max=583.07ms p(90)=363.22ms p(95)=391.1ms  p(99.9)=491.22ms
     http_reqs......................: 72523   1157.916802/s
     iteration_duration.............: avg=199.75ms min=5.32ms  med=200.36ms max=583.3ms  p(90)=364.39ms p(95)=392.01ms p(99.9)=491.83ms
     iterations.....................: 71523   1141.950601/s
     success_rate...................: 100.00% ✓ 71523       ✗ 0    
     vus............................: 86      min=0         max=496
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

     checks.........................: 100.00% ✓ 97446      ✗ 0    
     data_received..................: 2.9 GB  45 MB/s
     data_sent......................: 40 MB   620 kB/s
     http_req_blocked...............: avg=11.18µs  min=1.13µs  med=3.26µs   max=7.64ms  p(90)=5µs      p(95)=6.06µs   p(99.9)=2.57ms  
     http_req_connecting............: avg=6.83µs   min=0s      med=0s       max=7.52ms  p(90)=0s       p(95)=0s       p(99.9)=2.51ms  
     http_req_duration..............: avg=428.63ms min=3.89ms  med=400.98ms max=1.94s   p(90)=843.47ms p(95)=913.68ms p(99.9)=1.41s   
       { expected_response:true }...: avg=428.63ms min=3.89ms  med=400.98ms max=1.94s   p(90)=843.47ms p(95)=913.68ms p(99.9)=1.41s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 33482
     http_req_receiving.............: avg=90.25µs  min=30.22µs med=75.35µs  max=85.88ms p(90)=113.56µs p(95)=126.8µs  p(99.9)=957.21µs
     http_req_sending...............: avg=29.47µs  min=5.46µs  med=14.98µs  max=23.28ms p(90)=22.17µs  p(95)=25.18µs  p(99.9)=4.05ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=428.51ms min=3.81ms  med=400.9ms  max=1.94s   p(90)=843.4ms  p(95)=913.58ms p(99.9)=1.41s   
     http_reqs......................: 33482   516.456729/s
     iteration_duration.............: avg=442.04ms min=23.59ms med=415.82ms max=1.94s   p(90)=846.92ms p(95)=917.09ms p(99.9)=1.42s   
     iterations.....................: 32482   501.031822/s
     success_rate...................: 100.00% ✓ 32482      ✗ 0    
     vus............................: 96      min=0        max=500
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

     checks.........................: 100.00% ✓ 45147      ✗ 0    
     data_received..................: 1.4 GB  21 MB/s
     data_sent......................: 19 MB   284 kB/s
     http_req_blocked...............: avg=13.94µs  min=1.1µs   med=3.17µs   max=6.36ms p(90)=4.88µs  p(95)=6.52µs   p(99.9)=2.18ms  
     http_req_connecting............: avg=9.09µs   min=0s      med=0s       max=6.29ms p(90)=0s      p(95)=0s       p(99.9)=2.15ms  
     http_req_duration..............: avg=907.62ms min=6.06ms  med=845.86ms max=4.96s  p(90)=1.81s   p(95)=2.04s    p(99.9)=4.18s   
       { expected_response:true }...: avg=907.62ms min=6.06ms  med=845.86ms max=4.96s  p(90)=1.81s   p(95)=2.04s    p(99.9)=4.18s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 16049
     http_req_receiving.............: avg=94.43µs  min=33.2µs  med=89.01µs  max=6.05ms p(90)=125.2µs p(95)=139.95µs p(99.9)=943.37µs
     http_req_sending...............: avg=29.76µs  min=5.75µs  med=17.38µs  max=8.93ms p(90)=22.56µs p(95)=27.61µs  p(99.9)=4.17ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s     p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=907.5ms  min=5.95ms  med=845.72ms max=4.96s  p(90)=1.81s   p(95)=2.04s    p(99.9)=4.18s   
     http_reqs......................: 16049   236.438727/s
     iteration_duration.............: avg=967.91ms min=18.24ms med=909.76ms max=4.96s  p(90)=1.84s   p(95)=2.05s    p(99.9)=4.23s   
     iterations.....................: 15049   221.706425/s
     success_rate...................: 100.00% ✓ 15049      ✗ 0    
     vus............................: 6       min=0        max=500
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

     checks.........................: 100.00% ✓ 44928      ✗ 0    
     data_received..................: 1.4 GB  20 MB/s
     data_sent......................: 19 MB   279 kB/s
     http_req_blocked...............: avg=15.41µs  min=1.22µs  med=3.91µs   max=8.56ms  p(90)=5.73µs   p(95)=7.36µs   p(99.9)=2.39ms  
     http_req_connecting............: avg=9.64µs   min=0s      med=0s       max=8.49ms  p(90)=0s       p(95)=0s       p(99.9)=2.37ms  
     http_req_duration..............: avg=909.86ms min=7.79ms  med=828.68ms max=3.1s    p(90)=1.87s    p(95)=1.96s    p(99.9)=2.77s   
       { expected_response:true }...: avg=909.86ms min=7.79ms  med=828.68ms max=3.1s    p(90)=1.87s    p(95)=1.96s    p(99.9)=2.77s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 15976
     http_req_receiving.............: avg=102.92µs min=34.73µs med=93.32µs  max=39.79ms p(90)=134.03µs p(95)=149.85µs p(99.9)=886.61µs
     http_req_sending...............: avg=38.98µs  min=5.47µs  med=18.51µs  max=77.19ms p(90)=24.66µs  p(95)=30.19µs  p(99.9)=2.08ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=909.72ms min=7.69ms  med=828.56ms max=3.1s    p(90)=1.87s    p(95)=1.96s    p(99.9)=2.77s   
     http_reqs......................: 15976   232.339115/s
     iteration_duration.............: avg=970.62ms min=38.9ms  med=922.8ms  max=3.11s   p(90)=1.88s    p(95)=1.97s    p(99.9)=2.81s   
     iterations.....................: 14976   217.796106/s
     success_rate...................: 100.00% ✓ 14976      ✗ 0    
     vus............................: 94      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

