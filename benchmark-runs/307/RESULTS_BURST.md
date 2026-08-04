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
| fusion-nightly-net11 | 16.6.0-p.15 | 2,625 | 2,721 | 2,597 | 1.6% |  |
| fusion-nightly | 16.6.0-p.15 | 2,448 | 2,550 | 2,439 | 1.6% |  |
| fusion | 16.5.1 | 2,427 | 2,517 | 2,412 | 1.5% |  |
| fusion-nightly-fed | 16.6.0-p.15 | 2,271 | 2,368 | 2,260 | 1.6% |  |
| cosmo | 0.334.0 | 1,206 | 1,245 | 1,194 | 1.5% |  |
| hive-gateway-router-runtime | 2.10.8 | 577 | 588 | 576 | 0.8% |  |
| hive-gateway | 2.10.8 | 256 | 263 | 254 | 1.0% |  |
| apollo-gateway | 2.14.3 | 231 | 238 | 230 | 1.1% | 1 failed requests across 1/9 runs |
| apollo-router | v2.16.1 | — | — | — | — | non-compatible response (10922 across 9/9 runs) |
| feddi | — | — | — | — | — | not run |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (545486 across 9/9 runs) |
| hive-router | — | — | — | — | — | benchmark run failed |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| fusion-nightly | 16.6.0-p.15 | 2,397 | 2,479 | 2,385 | 1.3% |  |
| fusion-nightly-net11 | 16.6.0-p.15 | 2,371 | 2,477 | 2,357 | 1.8% |  |
| fusion | 16.5.1 | 2,336 | 2,427 | 2,319 | 1.6% |  |
| fusion-nightly-fed | 16.6.0-p.15 | 2,178 | 2,244 | 2,146 | 1.5% |  |
| cosmo | 0.334.0 | 1,120 | 1,163 | 1,113 | 1.5% |  |
| hive-gateway-router-runtime | 2.10.8 | 530 | 543 | 523 | 1.3% |  |
| hive-gateway | 2.10.8 | 240 | 244 | 237 | 1.0% |  |
| apollo-gateway | 2.14.3 | 229 | 234 | 229 | 0.8% |  |
| apollo-router | v2.16.1 | — | — | — | — | non-compatible response (46982 across 9/9 runs) |
| feddi | — | — | — | — | — | not run |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (459042 across 9/9 runs) |
| hive-router | — | — | — | — | — | benchmark run failed |


### Details

<details>
  <summary>Summary for: fusion-nightly-net11 (rust subgraphs) (16.6.0-p.15)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 486237      ✗ 0     
     data_received..................: 14 GB   230 MB/s
     data_sent......................: 196 MB  3.2 MB/s
     http_req_blocked...............: avg=20.38µs min=990ns   med=2.55µs   max=67.5ms   p(90)=4.14µs   p(95)=5.24µs   p(99.9)=2.1ms   
     http_req_connecting............: avg=17.01µs min=0s      med=0s       max=67.3ms   p(90)=0s       p(95)=0s       p(99.9)=2.06ms  
     http_req_duration..............: avg=87.17ms min=1.83ms  med=82.69ms  max=319.04ms p(90)=167.08ms p(95)=183.8ms  p(99.9)=244.24ms
       { expected_response:true }...: avg=87.17ms min=1.83ms  med=82.69ms  max=319.04ms p(90)=167.08ms p(95)=183.8ms  p(99.9)=244.24ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 163079
     http_req_receiving.............: avg=713.6µs min=53.98µs med=114.34µs max=69.85ms  p(90)=1.48ms   p(95)=2.39ms   p(99.9)=26.66ms 
     http_req_sending...............: avg=71.19µs min=4.34µs  med=9.44µs   max=220.09ms p(90)=18.88µs  p(95)=121.92µs p(99.9)=9.47ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=86.39ms min=1.76ms  med=81.85ms  max=317.97ms p(90)=166.18ms p(95)=183.05ms p(99.9)=242.64ms
     http_reqs......................: 163079  2625.553728/s
     iteration_duration.............: avg=87.96ms min=4.47ms  med=83.57ms  max=330.22ms p(90)=167.54ms p(95)=184.25ms p(99.9)=245.08ms
     iterations.....................: 162079  2609.453839/s
     success_rate...................: 100.00% ✓ 162079      ✗ 0     
     vus............................: 62      min=0         max=497 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (rust subgraphs) (16.6.0-p.15)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 455385      ✗ 0     
     data_received..................: 13 GB   215 MB/s
     data_sent......................: 184 MB  2.9 MB/s
     http_req_blocked...............: avg=13.63µs min=832ns   med=2.03µs  max=42.62ms  p(90)=3.32µs   p(95)=4.27µs   p(99.9)=1.7ms   
     http_req_connecting............: avg=10.85µs min=0s      med=0s      max=42.57ms  p(90)=0s       p(95)=0s       p(99.9)=1.59ms  
     http_req_duration..............: avg=93.12ms min=1.96ms  med=82.66ms max=1.65s    p(90)=175.49ms p(95)=199.59ms p(99.9)=609.95ms
       { expected_response:true }...: avg=93.12ms min=1.96ms  med=82.66ms max=1.65s    p(90)=175.49ms p(95)=199.59ms p(99.9)=609.95ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 152795
     http_req_receiving.............: avg=1.23ms  min=50.31µs med=96.09µs max=553.26ms p(90)=1.54ms   p(95)=3.86ms   p(99.9)=79.46ms 
     http_req_sending...............: avg=58.23µs min=4.47µs  med=8.65µs  max=151.69ms p(90)=15.74µs  p(95)=98.25µs  p(99.9)=8.01ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=91.83ms min=1.87ms  med=81.56ms max=1.65s    p(90)=174.11ms p(95)=197.31ms p(99.9)=595.98ms
     http_reqs......................: 152795  2448.458441/s
     iteration_duration.............: avg=93.96ms min=3.4ms   med=83.68ms max=1.65s    p(90)=176.05ms p(95)=200.12ms p(99.9)=610.51ms
     iterations.....................: 151795  2432.433974/s
     success_rate...................: 100.00% ✓ 151795      ✗ 0     
     vus............................: 75      min=0         max=494 
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

     checks.........................: 100.00% ✓ 450987      ✗ 0     
     data_received..................: 13 GB   213 MB/s
     data_sent......................: 182 MB  2.9 MB/s
     http_req_blocked...............: avg=22.3µs  min=992ns   med=2.62µs   max=70.89ms  p(90)=4.19µs   p(95)=5.33µs   p(99.9)=2.12ms  
     http_req_connecting............: avg=18.75µs min=0s      med=0s       max=65.9ms   p(90)=0s       p(95)=0s       p(99.9)=2.06ms  
     http_req_duration..............: avg=93.98ms min=1.96ms  med=80.39ms  max=1.3s     p(90)=180.06ms p(95)=208.36ms p(99.9)=703.56ms
       { expected_response:true }...: avg=93.98ms min=1.96ms  med=80.39ms  max=1.3s     p(90)=180.06ms p(95)=208.36ms p(99.9)=703.56ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 151329
     http_req_receiving.............: avg=1.45ms  min=52.32µs med=100.67µs max=974.47ms p(90)=1.64ms   p(95)=4.49ms   p(99.9)=97.25ms 
     http_req_sending...............: avg=71.45µs min=4.6µs   med=9.64µs   max=208.95ms p(90)=17.71µs  p(95)=112.28µs p(99.9)=10.17ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=92.46ms min=1.87ms  med=79.01ms  max=1.3s     p(90)=178.27ms p(95)=205.85ms p(99.9)=693.83ms
     http_reqs......................: 151329  2427.402865/s
     iteration_duration.............: avg=94.92ms min=3.57ms  med=81.5ms   max=1.3s     p(90)=180.8ms  p(95)=209.36ms p(99.9)=704.01ms
     iterations.....................: 150329  2411.362298/s
     success_rate...................: 100.00% ✓ 150329      ✗ 0     
     vus............................: 77      min=0         max=494 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (rust subgraphs) (16.6.0-p.15)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 419832      ✗ 0     
     data_received..................: 12 GB   200 MB/s
     data_sent......................: 169 MB  2.7 MB/s
     http_req_blocked...............: avg=13.65µs  min=891ns   med=2.08µs   max=54.93ms  p(90)=3.47µs   p(95)=4.5µs    p(99.9)=1.36ms  
     http_req_connecting............: avg=10.85µs  min=0s      med=0s       max=54.8ms   p(90)=0s       p(95)=0s       p(99.9)=1.2ms   
     http_req_duration..............: avg=100.98ms min=1.63ms  med=88.94ms  max=1.35s    p(90)=190.45ms p(95)=227.9ms  p(99.9)=786.52ms
       { expected_response:true }...: avg=100.98ms min=1.63ms  med=88.94ms  max=1.35s    p(90)=190.45ms p(95)=227.9ms  p(99.9)=786.52ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 140944
     http_req_receiving.............: avg=1.97ms   min=53.24µs med=104.69µs max=741.83ms p(90)=2.13ms   p(95)=5.72ms   p(99.9)=129.39ms
     http_req_sending...............: avg=62.42µs  min=4.6µs   med=8.95µs   max=227.86ms p(90)=16.4µs   p(95)=92.55µs  p(99.9)=8ms     
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=98.94ms  min=1.55ms  med=87.73ms  max=1.35s    p(90)=187.13ms p(95)=221.03ms p(99.9)=767.14ms
     http_reqs......................: 140944  2271.822352/s
     iteration_duration.............: avg=101.94ms min=3.04ms  med=89.92ms  max=1.35s    p(90)=191.11ms p(95)=228.91ms p(99.9)=787.39ms
     iterations.....................: 139944  2255.703735/s
     success_rate...................: 100.00% ✓ 139944      ✗ 0     
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

     checks.........................: 100.00% ✓ 223287      ✗ 0    
     data_received..................: 6.6 GB  106 MB/s
     data_sent......................: 91 MB   1.4 MB/s
     http_req_blocked...............: avg=6.05µs   min=1.07µs  med=2.67µs   max=8.58ms   p(90)=4.28µs   p(95)=5.2µs    p(99.9)=563.94µs
     http_req_connecting............: avg=2.7µs    min=0s      med=0s       max=8.46ms   p(90)=0s       p(95)=0s       p(99.9)=473.05µs
     http_req_duration..............: avg=189.15ms min=1.91ms  med=189.7ms  max=605.27ms p(90)=350.48ms p(95)=377.1ms  p(99.9)=530.43ms
       { expected_response:true }...: avg=189.15ms min=1.91ms  med=189.7ms  max=605.27ms p(90)=350.48ms p(95)=377.1ms  p(99.9)=530.43ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 75429
     http_req_receiving.............: avg=77.13µs  min=28.89µs med=62.91µs  max=87.19ms  p(90)=100.51µs p(95)=116.75µs p(99.9)=1.13ms  
     http_req_sending...............: avg=28.52µs  min=5.1µs   med=11.04µs  max=104.54ms p(90)=17.61µs  p(95)=21.57µs  p(99.9)=3.08ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=189.05ms min=1.85ms  med=189.6ms  max=605.2ms  p(90)=350.38ms p(95)=376.99ms p(99.9)=530.35ms
     http_reqs......................: 75429   1206.552887/s
     iteration_duration.............: avg=191.93ms min=4.32ms  med=192.71ms max=605.43ms p(90)=351.34ms p(95)=377.82ms p(99.9)=531.11ms
     iterations.....................: 74429   1190.557012/s
     success_rate...................: 100.00% ✓ 74429       ✗ 0    
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

     checks.........................: 100.00% ✓ 108246     ✗ 0    
     data_received..................: 3.3 GB  51 MB/s
     data_sent......................: 45 MB   693 kB/s
     http_req_blocked...............: avg=12.68µs  min=1.08µs  med=3.12µs   max=18.56ms  p(90)=4.93µs   p(95)=6µs      p(99.9)=2.42ms 
     http_req_connecting............: avg=8.42µs   min=0s      med=0s       max=18.5ms   p(90)=0s       p(95)=0s       p(99.9)=2.09ms 
     http_req_duration..............: avg=386.53ms min=3.49ms  med=358.92ms max=1.69s    p(90)=764.09ms p(95)=823.85ms p(99.9)=1.2s   
       { expected_response:true }...: avg=386.53ms min=3.49ms  med=358.92ms max=1.69s    p(90)=764.09ms p(95)=823.85ms p(99.9)=1.2s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 37082
     http_req_receiving.............: avg=86.11µs  min=29.51µs med=72.52µs  max=177.75ms p(90)=110.59µs p(95)=126.08µs p(99.9)=816.5µs
     http_req_sending...............: avg=25.27µs  min=5.24µs  med=14.43µs  max=38.59ms  p(90)=22.18µs  p(95)=25.12µs  p(99.9)=2.45ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=386.42ms min=3.38ms  med=358.84ms max=1.69s    p(90)=764.01ms p(95)=823.74ms p(99.9)=1.2s   
     http_reqs......................: 37082   577.583857/s
     iteration_duration.............: avg=397.47ms min=13.79ms med=371.34ms max=1.7s     p(90)=767.5ms  p(95)=826.7ms  p(99.9)=1.21s  
     iterations.....................: 36082   562.008002/s
     success_rate...................: 100.00% ✓ 36082      ✗ 0    
     vus............................: 66      min=0        max=497
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

     checks.........................: 100.00% ✓ 48693      ✗ 0    
     data_received..................: 1.5 GB  23 MB/s
     data_sent......................: 21 MB   309 kB/s
     http_req_blocked...............: avg=17.67µs  min=1.46µs  med=3.87µs   max=68.15ms  p(90)=5.69µs   p(95)=7.07µs   p(99.9)=2.06ms 
     http_req_connecting............: avg=8.18µs   min=0s      med=0s       max=3.77ms   p(90)=0s       p(95)=0s       p(99.9)=1.99ms 
     http_req_duration..............: avg=821.09ms min=5.4ms   med=718.56ms max=18.48s   p(90)=1.44s    p(95)=1.62s    p(99.9)=16.8s  
       { expected_response:true }...: avg=821.09ms min=5.4ms   med=718.56ms max=18.48s   p(90)=1.44s    p(95)=1.62s    p(99.9)=16.8s  
     http_req_failed................: 0.00%   ✓ 0          ✗ 17231
     http_req_receiving.............: avg=101.38µs min=37.51µs med=94.88µs  max=10.05ms  p(90)=134.67µs p(95)=151.44µs p(99.9)=822.7µs
     http_req_sending...............: avg=39.17µs  min=6.44µs  med=18.86µs  max=122.36ms p(90)=24.47µs  p(95)=29.01µs  p(99.9)=2.69ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=820.95ms min=5.32ms  med=718.44ms max=18.48s   p(90)=1.44s    p(95)=1.62s    p(99.9)=16.8s  
     http_reqs......................: 17231   256.677926/s
     iteration_duration.............: avg=871.78ms min=25.44ms med=784.24ms max=18.48s   p(90)=1.47s    p(95)=1.64s    p(99.9)=16.82s 
     iterations.....................: 16231   241.781639/s
     success_rate...................: 100.00% ✓ 16231      ✗ 0    
     vus............................: 62      min=0        max=498
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

     checks.........................: 100.00% ✓ 47874      ✗ 0    
     data_received..................: 1.5 GB  20 MB/s
     data_sent......................: 21 MB   284 kB/s
     http_req_blocked...............: avg=11.9µs   min=1.09µs  med=3.45µs   max=4.98ms  p(90)=5.08µs   p(95)=6.42µs   p(99.9)=1.36ms  
     http_req_connecting............: avg=6.59µs   min=0s      med=0s       max=4.93ms  p(90)=0s       p(95)=0s       p(99.9)=1.32ms  
     http_req_duration..............: avg=363.74ms min=7.5ms   med=402.83ms max=1.15s   p(90)=616ms    p(95)=657.32ms p(99.9)=935.72ms
       { expected_response:true }...: avg=363.74ms min=7.5ms   med=402.83ms max=1.15s   p(90)=616ms    p(95)=657.32ms p(99.9)=935.72ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 16958
     http_req_receiving.............: avg=90.22µs  min=35.12µs med=83.5µs   max=17.14ms p(90)=122.86µs p(95)=137.67µs p(99.9)=550.6µs 
     http_req_sending...............: avg=27.33µs  min=5.71µs  med=17.03µs  max=23.37ms p(90)=22.35µs  p(95)=26.36µs  p(99.9)=2.16ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=363.62ms min=7.39ms  med=402.73ms max=1.15s   p(90)=615.92ms p(95)=657.22ms p(99.9)=935.56ms
     http_reqs......................: 16958   231.798252/s
     iteration_duration.............: avg=386.49ms min=8.41ms  med=424.47ms max=1.16s   p(90)=621.2ms  p(95)=660.23ms p(99.9)=945.52ms
     iterations.....................: 15958   218.129291/s
     success_rate...................: 100.00% ✓ 15958      ✗ 0    
     vus............................: 58      min=0        max=496
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.6.0-p.15)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 442149      ✗ 0     
     data_received..................: 13 GB   210 MB/s
     data_sent......................: 178 MB  2.9 MB/s
     http_req_blocked...............: avg=15.94µs min=862ns   med=2.21µs   max=51.96ms  p(90)=3.96µs   p(95)=5.18µs   p(99.9)=1.91ms  
     http_req_connecting............: avg=12.94µs min=0s      med=0s       max=51.72ms  p(90)=0s       p(95)=0s       p(99.9)=1.8ms   
     http_req_duration..............: avg=95.9ms  min=1.53ms  med=83.22ms  max=1.48s    p(90)=183.68ms p(95)=211.66ms p(99.9)=819.64ms
       { expected_response:true }...: avg=95.9ms  min=1.53ms  med=83.22ms  max=1.48s    p(90)=183.68ms p(95)=211.66ms p(99.9)=819.64ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 148383
     http_req_receiving.............: avg=1.68ms  min=52.76µs med=102.96µs max=1.03s    p(90)=1.72ms   p(95)=4.73ms   p(99.9)=93.5ms  
     http_req_sending...............: avg=67.23µs min=4.7µs   med=9.25µs   max=191.69ms p(90)=18.79µs  p(95)=105.27µs p(99.9)=8.43ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=94.14ms min=1.47ms  med=82.12ms  max=1.48s    p(90)=181.21ms p(95)=207.92ms p(99.9)=796.42ms
     http_reqs......................: 148383  2397.732606/s
     iteration_duration.............: avg=96.82ms min=2.51ms  med=84.17ms  max=1.48s    p(90)=184.31ms p(95)=212.46ms p(99.9)=822.73ms
     iterations.....................: 147383  2381.573528/s
     success_rate...................: 100.00% ✓ 147383      ✗ 0     
     vus............................: 43      min=0         max=500 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (.net subgraphs) (16.6.0-p.15)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 437169      ✗ 0     
     data_received..................: 13 GB   208 MB/s
     data_sent......................: 176 MB  2.8 MB/s
     http_req_blocked...............: avg=19.67µs  min=892ns   med=2.83µs   max=56.83ms  p(90)=4.59µs   p(95)=5.79µs   p(99.9)=1.89ms  
     http_req_connecting............: avg=15.79µs  min=0s      med=0s       max=56.75ms  p(90)=0s       p(95)=0s       p(99.9)=1.66ms  
     http_req_duration..............: avg=96.92ms  min=1.52ms  med=92.62ms  max=319.52ms p(90)=184.68ms p(95)=201.92ms p(99.9)=265.71ms
       { expected_response:true }...: avg=96.92ms  min=1.52ms  med=92.62ms  max=319.52ms p(90)=184.68ms p(95)=201.92ms p(99.9)=265.71ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 146723
     http_req_receiving.............: avg=845.56µs min=55.32µs med=124.41µs max=178.59ms p(90)=1.69ms   p(95)=2.84ms   p(99.9)=28.86ms 
     http_req_sending...............: avg=73.29µs  min=4.93µs  med=10.66µs  max=192.2ms  p(90)=21.57µs  p(95)=123.49µs p(99.9)=10.17ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=96ms     min=1.43ms  med=91.69ms  max=319.4ms  p(90)=183.75ms p(95)=200.93ms p(99.9)=264.41ms
     http_reqs......................: 146723  2371.306547/s
     iteration_duration.............: avg=97.85ms  min=3.34ms  med=93.67ms  max=337.7ms  p(90)=185.21ms p(95)=202.44ms p(99.9)=266.62ms
     iterations.....................: 145723  2355.144755/s
     success_rate...................: 100.00% ✓ 145723      ✗ 0     
     vus............................: 51      min=0         max=499 
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

     checks.........................: 100.00% ✓ 431112      ✗ 0     
     data_received..................: 13 GB   205 MB/s
     data_sent......................: 174 MB  2.8 MB/s
     http_req_blocked...............: avg=19.49µs min=822ns   med=2.64µs   max=111.48ms p(90)=4.52µs   p(95)=5.65µs   p(99.9)=1.89ms  
     http_req_connecting............: avg=15.87µs min=0s      med=0s       max=111.4ms  p(90)=0s       p(95)=0s       p(99.9)=1.78ms  
     http_req_duration..............: avg=98.29ms min=1.54ms  med=85.52ms  max=1.24s    p(90)=190.46ms p(95)=220.96ms p(99.9)=747.4ms 
       { expected_response:true }...: avg=98.29ms min=1.54ms  med=85.52ms  max=1.24s    p(90)=190.46ms p(95)=220.96ms p(99.9)=747.4ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 144704
     http_req_receiving.............: avg=1.58ms  min=51.67µs med=105.66µs max=797.73ms p(90)=1.67ms   p(95)=4.48ms   p(99.9)=130.83ms
     http_req_sending...............: avg=68.43µs min=4.51µs  med=10.09µs  max=76.47ms  p(90)=20.79µs  p(95)=119.3µs  p(99.9)=9.65ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=96.63ms min=1.43ms  med=84.27ms  max=1.24s    p(90)=187.75ms p(95)=217.35ms p(99.9)=716.11ms
     http_reqs......................: 144704  2336.47387/s
     iteration_duration.............: avg=99.25ms min=2.73ms  med=86.62ms  max=1.24s    p(90)=191.08ms p(95)=221.79ms p(99.9)=747.96ms
     iterations.....................: 143704  2320.327296/s
     success_rate...................: 100.00% ✓ 143704      ✗ 0     
     vus............................: 54      min=0         max=499 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (.net subgraphs) (16.6.0-p.15)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 403752      ✗ 0     
     data_received..................: 12 GB   191 MB/s
     data_sent......................: 163 MB  2.6 MB/s
     http_req_blocked...............: avg=15.22µs  min=902ns   med=2.39µs   max=72.32ms  p(90)=4.29µs   p(95)=5.5µs    p(99.9)=1.55ms  
     http_req_connecting............: avg=11.94µs  min=0s      med=0s       max=72.18ms  p(90)=0s       p(95)=0s       p(99.9)=1.38ms  
     http_req_duration..............: avg=104.99ms min=1.83ms  med=91.39ms  max=1.29s    p(90)=199.09ms p(95)=229.28ms p(99.9)=642.84ms
       { expected_response:true }...: avg=104.99ms min=1.83ms  med=91.39ms  max=1.29s    p(90)=199.09ms p(95)=229.28ms p(99.9)=642.84ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 135584
     http_req_receiving.............: avg=1.45ms   min=51.35µs med=111.84µs max=1.19s    p(90)=1.83ms   p(95)=4.48ms   p(99.9)=92.75ms 
     http_req_sending...............: avg=63.59µs  min=4.6µs   med=9.85µs   max=186.07ms p(90)=20.96µs  p(95)=102.55µs p(99.9)=8.19ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=103.47ms min=1.73ms  med=90.19ms  max=1.2s     p(90)=197.3ms  p(95)=226.19ms p(99.9)=630.99ms
     http_reqs......................: 135584  2178.286012/s
     iteration_duration.............: avg=106.02ms min=3.47ms  med=92.6ms   max=1.29s    p(90)=199.64ms p(95)=230.08ms p(99.9)=643.33ms
     iterations.....................: 134584  2162.22006/s
     success_rate...................: 100.00% ✓ 134584      ✗ 0     
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

     checks.........................: 100.00% ✓ 207561      ✗ 0    
     data_received..................: 6.1 GB  98 MB/s
     data_sent......................: 84 MB   1.3 MB/s
     http_req_blocked...............: avg=6.38µs   min=1.2µs   med=3.18µs   max=21.79ms  p(90)=4.99µs   p(95)=5.99µs   p(99.9)=475.18µs
     http_req_connecting............: avg=2.44µs   min=0s      med=0s       max=21.73ms  p(90)=0s       p(95)=0s       p(99.9)=402.32µs
     http_req_duration..............: avg=203.39ms min=1.96ms  med=204.1ms  max=574.08ms p(90)=375.85ms p(95)=403.17ms p(99.9)=490.53ms
       { expected_response:true }...: avg=203.39ms min=1.96ms  med=204.1ms  max=574.08ms p(90)=375.85ms p(95)=403.17ms p(99.9)=490.53ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 70187
     http_req_receiving.............: avg=85.2µs   min=28.82µs med=69.2µs   max=123.44ms p(90)=112.35µs p(95)=128.32µs p(99.9)=1.12ms  
     http_req_sending...............: avg=34.72µs  min=5.18µs  med=12.83µs  max=164.75ms p(90)=20.07µs  p(95)=23.8µs   p(99.9)=3.25ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=203.27ms min=1.89ms  med=203.93ms max=573.97ms p(90)=375.71ms p(95)=403.09ms p(99.9)=490.46ms
     http_reqs......................: 70187   1120.773707/s
     iteration_duration.............: avg=206.58ms min=5.16ms  med=207.47ms max=574.37ms p(90)=376.95ms p(95)=403.92ms p(99.9)=490.79ms
     iterations.....................: 69187   1104.805313/s
     success_rate...................: 100.00% ✓ 69187       ✗ 0    
     vus............................: 87      min=0         max=497
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

     checks.........................: 100.00% ✓ 100017     ✗ 0    
     data_received..................: 3.0 GB  46 MB/s
     data_sent......................: 41 MB   637 kB/s
     http_req_blocked...............: avg=9.22µs   min=1.12µs  med=3.38µs   max=11.13ms  p(90)=5.18µs   p(95)=6.28µs   p(99.9)=1.37ms
     http_req_connecting............: avg=4.84µs   min=0s      med=0s       max=11.07ms  p(90)=0s       p(95)=0s       p(99.9)=1.35ms
     http_req_duration..............: avg=418.1ms  min=3.86ms  med=387.45ms max=2.13s    p(90)=822.62ms p(95)=893.33ms p(99.9)=1.3s  
       { expected_response:true }...: avg=418.1ms  min=3.86ms  med=387.45ms max=2.13s    p(90)=822.62ms p(95)=893.33ms p(99.9)=1.3s  
     http_req_failed................: 0.00%   ✓ 0          ✗ 34339
     http_req_receiving.............: avg=92.06µs  min=30.24µs med=75.76µs  max=213.23ms p(90)=115.01µs p(95)=129.58µs p(99.9)=1.12ms
     http_req_sending...............: avg=39.67µs  min=5.44µs  med=15.31µs  max=175.49ms p(90)=22.49µs  p(95)=25.75µs  p(99.9)=3.2ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=417.97ms min=3.78ms  med=387.34ms max=2.13s    p(90)=822.53ms p(95)=893.23ms p(99.9)=1.3s  
     http_reqs......................: 34339   530.47639/s
     iteration_duration.............: avg=430.88ms min=17.12ms med=405.79ms max=2.14s    p(90)=826.67ms p(95)=896.82ms p(99.9)=1.31s 
     iterations.....................: 33339   515.028171/s
     success_rate...................: 100.00% ✓ 33339      ✗ 0    
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

     checks.........................: 100.00% ✓ 45879      ✗ 0    
     data_received..................: 1.4 GB  21 MB/s
     data_sent......................: 20 MB   289 kB/s
     http_req_blocked...............: avg=13.42µs  min=1.31µs  med=3.79µs   max=3.26ms p(90)=5.65µs  p(95)=7.38µs   p(99.9)=1.69ms
     http_req_connecting............: avg=7.75µs   min=0s      med=0s       max=3.21ms p(90)=0s      p(95)=0s       p(99.9)=1.67ms
     http_req_duration..............: avg=893.67ms min=5.97ms  med=799.96ms max=5.08s  p(90)=1.78s   p(95)=2.04s    p(99.9)=4.39s 
       { expected_response:true }...: avg=893.67ms min=5.97ms  med=799.96ms max=5.08s  p(90)=1.78s   p(95)=2.04s    p(99.9)=4.39s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 16293
     http_req_receiving.............: avg=99.99µs  min=36.09µs med=91.43µs  max=6.89ms p(90)=131.9µs p(95)=147.16µs p(99.9)=1.47ms
     http_req_sending...............: avg=30.38µs  min=6.41µs  med=18.42µs  max=23.3ms p(90)=24.24µs p(95)=29.16µs  p(99.9)=2.05ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s     p(90)=0s      p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=893.53ms min=5.84ms  med=799.89ms max=5.08s  p(90)=1.78s   p(95)=2.04s    p(99.9)=4.39s 
     http_reqs......................: 16293   240.553332/s
     iteration_duration.............: avg=952.1ms  min=38.8ms  med=871.91ms max=5.09s  p(90)=1.8s    p(95)=2.07s    p(99.9)=4.41s 
     iterations.....................: 15293   225.789118/s
     success_rate...................: 100.00% ✓ 15293      ✗ 0    
     vus............................: 94      min=0        max=500
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

     checks.........................: 100.00% ✓ 44433      ✗ 0    
     data_received..................: 1.4 GB  20 MB/s
     data_sent......................: 19 MB   276 kB/s
     http_req_blocked...............: avg=12.71µs  min=1.15µs  med=3.35µs   max=7.17ms   p(90)=5.13µs   p(95)=7.02µs  p(99.9)=1.49ms
     http_req_connecting............: avg=7.58µs   min=0s      med=0s       max=6.9ms    p(90)=0s       p(95)=0s      p(99.9)=1.46ms
     http_req_duration..............: avg=919.2ms  min=7.86ms  med=831.88ms max=3.3s     p(90)=1.87s    p(95)=2s      p(99.9)=2.89s 
       { expected_response:true }...: avg=919.2ms  min=7.86ms  med=831.88ms max=3.3s     p(90)=1.87s    p(95)=2s      p(99.9)=2.89s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 15811
     http_req_receiving.............: avg=97.17µs  min=34.67µs med=89.39µs  max=8.44ms   p(90)=128.77µs p(95)=144.4µs p(99.9)=1.08ms
     http_req_sending...............: avg=40.83µs  min=5.71µs  med=16.94µs  max=103.08ms p(90)=22.67µs  p(95)=27.63µs p(99.9)=3.96ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s    
     http_req_waiting...............: avg=919.06ms min=7.77ms  med=831.77ms max=3.3s     p(90)=1.87s    p(95)=2s      p(99.9)=2.89s 
     http_reqs......................: 15811   229.740645/s
     iteration_duration.............: avg=981.2ms  min=19.75ms med=905.97ms max=3.31s    p(90)=1.88s    p(95)=2.01s   p(99.9)=2.93s 
     iterations.....................: 14811   215.210214/s
     success_rate...................: 100.00% ✓ 14811      ✗ 0    
     vus............................: 92      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

