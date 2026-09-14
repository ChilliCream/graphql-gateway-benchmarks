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
| hive-router | v0.0.84 | 2,742 | 2,901 | 2,717 | 2.4% |  |
| fusion-nightly-net11 | 16.7.0-p.6 | 2,600 | 2,702 | 2,587 | 1.5% |  |
| fusion-nightly | 16.7.0-p.6 | 2,522 | 2,613 | 2,513 | 1.4% |  |
| fusion-nightly-fed | 16.7.0-p.6 | 2,342 | 2,399 | 2,303 | 1.2% |  |
| cosmo | 0.334.0 | 1,219 | 1,261 | 1,215 | 1.4% |  |
| hive-gateway-router-runtime | 2.10.8 | 556 | 570 | 552 | 1.2% |  |
| hive-gateway | 2.10.8 | 252 | 259 | 251 | 1.2% |  |
| apollo-gateway | 2.14.3 | 234 | 242 | 234 | 1.2% |  |
| apollo-router | v2.16.1 | — | — | — | — | non-compatible response (6186 across 9/9 runs) |
| feddi | — | — | — | — | — | not run |
| fusion | — | — | — | — | — | benchmark run failed |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (537883 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| fusion-nightly-net11 | 16.7.0-p.6 | 2,461 | 2,553 | 2,449 | 1.4% |  |
| fusion | 16.6.6 | 2,364 | 2,467 | 2,348 | 1.8% |  |
| fusion-nightly | 16.7.0-p.6 | 2,320 | 2,426 | 2,301 | 1.8% |  |
| fusion-nightly-fed | 16.7.0-p.6 | 2,228 | 2,322 | 2,214 | 1.7% |  |
| hive-router | v0.0.84 | 2,190 | 2,362 | 2,166 | 2.8% |  |
| cosmo | 0.334.0 | 1,160 | 1,201 | 1,157 | 1.3% |  |
| hive-gateway-router-runtime | 2.10.8 | 533 | 550 | 531 | 1.1% |  |
| hive-gateway | 2.10.8 | 240 | 247 | 237 | 1.2% |  |
| apollo-gateway | 2.14.3 | 230 | 235 | 229 | 0.9% |  |
| apollo-router | v2.16.1 | — | — | — | — | non-compatible response (26841 across 9/9 runs) |
| feddi | — | — | — | — | — | not run |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (301914 across 9/9 runs) |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.84)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 504759      ✗ 0     
     data_received..................: 15 GB   241 MB/s
     data_sent......................: 203 MB  3.3 MB/s
     http_req_blocked...............: avg=21.47µs  min=990ns   med=2.58µs  max=67.09ms  p(90)=4.17µs   p(95)=5.28µs   p(99.9)=1.42ms  
     http_req_connecting............: avg=17.78µs  min=0s      med=0s      max=67ms     p(90)=0s       p(95)=0s       p(99.9)=1.28ms  
     http_req_duration..............: avg=83.97ms  min=1.4ms   med=79.69ms max=328.18ms p(90)=159.18ms p(95)=175.34ms p(99.9)=231.76ms
       { expected_response:true }...: avg=83.97ms  min=1.4ms   med=79.69ms max=328.18ms p(90)=159.18ms p(95)=175.34ms p(99.9)=231.76ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 169253
     http_req_receiving.............: avg=139.01µs min=28.04µs med=53.45µs max=56.79ms  p(90)=140.34µs p(95)=352.57µs p(99.9)=14.86ms 
     http_req_sending...............: avg=73.11µs  min=4.74µs  med=9.75µs  max=144.02ms p(90)=18.73µs  p(95)=123.99µs p(99.9)=10.22ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=83.76ms  min=1.34ms  med=79.48ms max=327.58ms p(90)=158.94ms p(95)=175ms    p(99.9)=230.22ms
     http_reqs......................: 169253  2742.130474/s
     iteration_duration.............: avg=84.72ms  min=2.35ms  med=80.58ms max=351.78ms p(90)=159.62ms p(95)=175.81ms p(99.9)=232.9ms 
     iterations.....................: 168253  2725.929104/s
     success_rate...................: 100.00% ✓ 168253      ✗ 0     
     vus............................: 90      min=0         max=498 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (rust subgraphs) (16.7.0-p.6)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 482343      ✗ 0     
     data_received..................: 14 GB   228 MB/s
     data_sent......................: 194 MB  3.1 MB/s
     http_req_blocked...............: avg=16.78µs min=852ns   med=2.07µs   max=55ms     p(90)=3.56µs   p(95)=4.67µs   p(99.9)=1.88ms  
     http_req_connecting............: avg=13.91µs min=0s      med=0s       max=54.95ms  p(90)=0s       p(95)=0s       p(99.9)=1.78ms  
     http_req_duration..............: avg=87.89ms min=1.84ms  med=83.62ms  max=330.84ms p(90)=168.61ms p(95)=185.81ms p(99.9)=248.98ms
       { expected_response:true }...: avg=87.89ms min=1.84ms  med=83.62ms  max=330.84ms p(90)=168.61ms p(95)=185.81ms p(99.9)=248.98ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 161781
     http_req_receiving.............: avg=1.44ms  min=51.04µs med=183.34µs max=294.51ms p(90)=3.4ms    p(95)=5.18ms   p(99.9)=38.55ms 
     http_req_sending...............: avg=62.19µs min=4.36µs  med=8.75µs   max=126.31ms p(90)=18.67µs  p(95)=105.19µs p(99.9)=8.63ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=86.39ms min=1.78ms  med=82.04ms  max=330.73ms p(90)=166.86ms p(95)=184.22ms p(99.9)=246.97ms
     http_reqs......................: 161781  2600.01824/s
     iteration_duration.............: avg=88.68ms min=3.87ms  med=84.49ms  max=351.55ms p(90)=169.11ms p(95)=186.25ms p(99.9)=250.61ms
     iterations.....................: 160781  2583.947019/s
     success_rate...................: 100.00% ✓ 160781      ✗ 0     
     vus............................: 66      min=0         max=496 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (rust subgraphs) (16.7.0-p.6)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 468738      ✗ 0     
     data_received..................: 14 GB   221 MB/s
     data_sent......................: 189 MB  3.0 MB/s
     http_req_blocked...............: avg=23.96µs min=902ns   med=2.61µs  max=77.61ms  p(90)=4.23µs   p(95)=5.39µs   p(99.9)=2.74ms  
     http_req_connecting............: avg=20.05µs min=0s      med=0s      max=77.53ms  p(90)=0s       p(95)=0s       p(99.9)=2.6ms   
     http_req_duration..............: avg=90.41ms min=1.96ms  med=77.85ms max=1.31s    p(90)=174.71ms p(95)=202.53ms p(99.9)=587.61ms
       { expected_response:true }...: avg=90.41ms min=1.96ms  med=77.85ms max=1.31s    p(90)=174.71ms p(95)=202.53ms p(99.9)=587.61ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 157246
     http_req_receiving.............: avg=1.29ms  min=53.35µs med=99.1µs  max=986.4ms  p(90)=1.38ms   p(95)=3.85ms   p(99.9)=87.21ms 
     http_req_sending...............: avg=78.93µs min=4.41µs  med=9.55µs  max=201.88ms p(90)=18.29µs  p(95)=118.78µs p(99.9)=11.25ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=89.04ms min=1.89ms  med=76.85ms max=1.27s    p(90)=172.87ms p(95)=199.06ms p(99.9)=557.19ms
     http_reqs......................: 157246  2522.292359/s
     iteration_duration.............: avg=91.27ms min=3.23ms  med=78.74ms max=1.31s    p(90)=175.4ms  p(95)=203.32ms p(99.9)=588.08ms
     iterations.....................: 156246  2506.251936/s
     success_rate...................: 100.00% ✓ 156246      ✗ 0     
     vus............................: 72      min=0         max=494 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (rust subgraphs) (16.7.0-p.6)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 432735      ✗ 0     
     data_received..................: 13 GB   206 MB/s
     data_sent......................: 175 MB  2.8 MB/s
     http_req_blocked...............: avg=15.84µs min=882ns   med=2.36µs   max=60ms     p(90)=3.95µs   p(95)=4.97µs   p(99.9)=1.04ms  
     http_req_connecting............: avg=12.69µs min=0s      med=0s       max=59.93ms  p(90)=0s       p(95)=0s       p(99.9)=985.75µs
     http_req_duration..............: avg=97.94ms min=1.66ms  med=89.93ms  max=846.53ms p(90)=185.02ms p(95)=214.16ms p(99.9)=561.92ms
       { expected_response:true }...: avg=97.94ms min=1.66ms  med=89.93ms  max=846.53ms p(90)=185.02ms p(95)=214.16ms p(99.9)=561.92ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 145245
     http_req_receiving.............: avg=1.35ms  min=53.02µs med=101.88µs max=449.3ms  p(90)=1.76ms   p(95)=4.43ms   p(99.9)=87.25ms 
     http_req_sending...............: avg=55.92µs min=4.69µs  med=9.3µs    max=41.99ms  p(90)=17.29µs  p(95)=103.92µs p(99.9)=7.98ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=96.53ms min=1.57ms  med=88.6ms   max=844.02ms p(90)=182.83ms p(95)=209.94ms p(99.9)=560.59ms
     http_reqs......................: 145245  2342.541429/s
     iteration_duration.............: avg=98.88ms min=2.65ms  med=90.98ms  max=846.71ms p(90)=185.57ms p(95)=214.91ms p(99.9)=562.79ms
     iterations.....................: 144245  2326.413222/s
     success_rate...................: 100.00% ✓ 144245      ✗ 0     
     vus............................: 57      min=0         max=498 
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

     checks.........................: 100.00% ✓ 225576      ✗ 0    
     data_received..................: 6.7 GB  107 MB/s
     data_sent......................: 92 MB   1.5 MB/s
     http_req_blocked...............: avg=4.55µs   min=921ns   med=2.14µs   max=13.18ms  p(90)=3.73µs   p(95)=4.65µs   p(99.9)=372.44µs
     http_req_connecting............: avg=1.74µs   min=0s      med=0s       max=13.14ms  p(90)=0s       p(95)=0s       p(99.9)=295.86µs
     http_req_duration..............: avg=187.27ms min=1.94ms  med=187.63ms max=491.91ms p(90)=349.06ms p(95)=372.96ms p(99.9)=446.19ms
       { expected_response:true }...: avg=187.27ms min=1.94ms  med=187.63ms max=491.91ms p(90)=349.06ms p(95)=372.96ms p(99.9)=446.19ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 76192
     http_req_receiving.............: avg=68.71µs  min=27.16µs med=56.93µs  max=62.17ms  p(90)=93.44µs  p(95)=107.42µs p(99.9)=796.2µs 
     http_req_sending...............: avg=24.52µs  min=4.87µs  med=9.68µs   max=58.72ms  p(90)=16.1µs   p(95)=20.03µs  p(99.9)=2.86ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=187.18ms min=1.88ms  med=187.51ms max=491.85ms p(90)=348.99ms p(95)=372.89ms p(99.9)=446.13ms
     http_reqs......................: 76192   1219.173333/s
     iteration_duration.............: avg=189.99ms min=4.34ms  med=190.74ms max=492.1ms  p(90)=349.86ms p(95)=373.57ms p(99.9)=446.36ms
     iterations.....................: 75192   1203.172003/s
     success_rate...................: 100.00% ✓ 75192       ✗ 0    
     vus............................: 80      min=0         max=495
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

     checks.........................: 100.00% ✓ 104187     ✗ 0    
     data_received..................: 3.1 GB  49 MB/s
     data_sent......................: 43 MB   668 kB/s
     http_req_blocked...............: avg=8.83µs   min=1.08µs  med=3.05µs   max=8.77ms   p(90)=4.79µs   p(95)=5.86µs   p(99.9)=1.41ms
     http_req_connecting............: avg=4.74µs   min=0s      med=0s       max=8.5ms    p(90)=0s       p(95)=0s       p(99.9)=1.37ms
     http_req_duration..............: avg=401.4ms  min=3.53ms  med=372.79ms max=1.63s    p(90)=791.8ms  p(95)=859.33ms p(99.9)=1.27s 
       { expected_response:true }...: avg=401.4ms  min=3.53ms  med=372.79ms max=1.63s    p(90)=791.8ms  p(95)=859.33ms p(99.9)=1.27s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 35729
     http_req_receiving.............: avg=97.07µs  min=31.09µs med=72.02µs  max=169.71ms p(90)=111.47µs p(95)=126.06µs p(99.9)=1.22ms
     http_req_sending...............: avg=33.38µs  min=5.1µs   med=13.98µs  max=110.34ms p(90)=20.94µs  p(95)=24.01µs  p(99.9)=2.94ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=401.27ms min=3.44ms  med=372.68ms max=1.63s    p(90)=791.72ms p(95)=858.99ms p(99.9)=1.27s 
     http_reqs......................: 35729   556.278293/s
     iteration_duration.............: avg=413.19ms min=19.48ms med=387.53ms max=1.64s    p(90)=794.78ms p(95)=862.52ms p(99.9)=1.28s 
     iterations.....................: 34729   540.708915/s
     success_rate...................: 100.00% ✓ 34729      ✗ 0    
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

     checks.........................: 100.00% ✓ 48171      ✗ 0    
     data_received..................: 1.5 GB  22 MB/s
     data_sent......................: 21 MB   304 kB/s
     http_req_blocked...............: avg=14.24µs  min=1.21µs  med=3.69µs   max=5.31ms  p(90)=5.52µs   p(95)=7µs      p(99.9)=2.21ms  
     http_req_connecting............: avg=8.88µs   min=0s      med=0s       max=4.77ms  p(90)=0s       p(95)=0s       p(99.9)=2.19ms  
     http_req_duration..............: avg=836.71ms min=5.69ms  med=731.62ms max=17.95s  p(90)=1.46s    p(95)=1.67s    p(99.9)=16.59s  
       { expected_response:true }...: avg=836.71ms min=5.69ms  med=731.62ms max=17.95s  p(90)=1.46s    p(95)=1.67s    p(99.9)=16.59s  
     http_req_failed................: 0.00%   ✓ 0          ✗ 17057
     http_req_receiving.............: avg=97.3µs   min=38.08µs med=91.47µs  max=6ms     p(90)=128.89µs p(95)=144.59µs p(99.9)=911.64µs
     http_req_sending...............: avg=42.21µs  min=6.07µs  med=18.29µs  max=97.05ms p(90)=24.22µs  p(95)=28.62µs  p(99.9)=3.85ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=836.57ms min=5.59ms  med=731.54ms max=17.95s  p(90)=1.46s    p(95)=1.67s    p(99.9)=16.59s  
     http_reqs......................: 17057   252.403919/s
     iteration_duration.............: avg=888.86ms min=29.36ms med=790.35ms max=17.95s  p(90)=1.49s    p(95)=1.68s    p(99.9)=16.64s  
     iterations.....................: 16057   237.606245/s
     success_rate...................: 100.00% ✓ 16057      ✗ 0    
     vus............................: 91      min=0        max=500
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

     checks.........................: 100.00% ✓ 48549      ✗ 0    
     data_received..................: 1.5 GB  21 MB/s
     data_sent......................: 21 MB   287 kB/s
     http_req_blocked...............: avg=12.1µs   min=1.28µs  med=3.55µs   max=3.17ms  p(90)=5.25µs   p(95)=6.65µs   p(99.9)=1.6ms 
     http_req_connecting............: avg=6.85µs   min=0s      med=0s       max=3.1ms   p(90)=0s       p(95)=0s       p(99.9)=1.58ms
     http_req_duration..............: avg=416.53ms min=7.58ms  med=492.99ms max=1.22s   p(90)=692.2ms  p(95)=736.64ms p(99.9)=1.02s 
       { expected_response:true }...: avg=416.53ms min=7.58ms  med=492.99ms max=1.22s   p(90)=692.2ms  p(95)=736.64ms p(99.9)=1.02s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 17183
     http_req_receiving.............: avg=98.17µs  min=36.69µs med=86.76µs  max=75.35ms p(90)=124.99µs p(95)=139.96µs p(99.9)=1.07ms
     http_req_sending...............: avg=44.91µs  min=5.96µs  med=18.11µs  max=82.83ms p(90)=23.53µs  p(95)=28.18µs  p(99.9)=3.21ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=416.39ms min=7.45ms  med=492.91ms max=1.22s   p(90)=692.1ms  p(95)=736.51ms p(99.9)=1.02s 
     http_reqs......................: 17183   234.718901/s
     iteration_duration.............: avg=442.27ms min=13.89ms med=517.98ms max=1.22s   p(90)=696.39ms p(95)=743.26ms p(99.9)=1.03s 
     iterations.....................: 16183   221.058952/s
     success_rate...................: 100.00% ✓ 16183      ✗ 0    
     vus............................: 53      min=0        max=496
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (.net subgraphs) (16.7.0-p.6)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 453267      ✗ 0     
     data_received..................: 13 GB   216 MB/s
     data_sent......................: 183 MB  3.0 MB/s
     http_req_blocked...............: avg=19.13µs min=882ns   med=2.38µs  max=63.09ms  p(90)=4.33µs   p(95)=5.57µs   p(99.9)=1.8ms   
     http_req_connecting............: avg=15.56µs min=0s      med=0s      max=62.94ms  p(90)=0s       p(95)=0s       p(99.9)=1.72ms  
     http_req_duration..............: avg=93.49ms min=1.46ms  med=89.49ms max=451.87ms p(90)=178.88ms p(95)=195.83ms p(99.9)=268.02ms
       { expected_response:true }...: avg=93.49ms min=1.46ms  med=89.49ms max=451.87ms p(90)=178.88ms p(95)=195.83ms p(99.9)=268.02ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 152089
     http_req_receiving.............: avg=1.39ms  min=53.02µs med=135.6µs max=223.22ms p(90)=3.31ms   p(95)=5.34ms   p(99.9)=38.11ms 
     http_req_sending...............: avg=69.61µs min=5.04µs  med=9.75µs  max=247.84ms p(90)=22.34µs  p(95)=112.02µs p(99.9)=8.93ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=92.02ms min=1.39ms  med=88.02ms max=449.25ms p(90)=177.14ms p(95)=194.04ms p(99.9)=266.22ms
     http_reqs......................: 152089  2461.520137/s
     iteration_duration.............: avg=94.37ms min=3.66ms  med=90.53ms max=452.06ms p(90)=179.35ms p(95)=196.31ms p(99.9)=269.2ms 
     iterations.....................: 151089  2445.335402/s
     success_rate...................: 100.00% ✓ 151089      ✗ 0     
     vus............................: 92      min=0         max=498 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (.net subgraphs) (16.6.6)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 435612      ✗ 0     
     data_received..................: 13 GB   207 MB/s
     data_sent......................: 176 MB  2.8 MB/s
     http_req_blocked...............: avg=18.62µs min=832ns   med=2.22µs   max=78.89ms  p(90)=3.84µs   p(95)=4.96µs   p(99.9)=1.83ms  
     http_req_connecting............: avg=15.73µs min=0s      med=0s       max=78.83ms  p(90)=0s       p(95)=0s       p(99.9)=1.81ms  
     http_req_duration..............: avg=97.27ms min=1.49ms  med=87.95ms  max=1.17s    p(90)=185.56ms p(95)=213.51ms p(99.9)=635.11ms
       { expected_response:true }...: avg=97.27ms min=1.49ms  med=87.95ms  max=1.17s    p(90)=185.56ms p(95)=213.51ms p(99.9)=635.11ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 146204
     http_req_receiving.............: avg=1.56ms  min=52.61µs med=106.25µs max=518.84ms p(90)=1.89ms   p(95)=4.71ms   p(99.9)=102.28ms
     http_req_sending...............: avg=63.14µs min=4.41µs  med=9.27µs   max=179.4ms  p(90)=18.15µs  p(95)=105.22µs p(99.9)=8.66ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=95.65ms min=1.42ms  med=86.68ms  max=1.17s    p(90)=183.24ms p(95)=209.97ms p(99.9)=620.47ms
     http_reqs......................: 146204  2364.256544/s
     iteration_duration.............: avg=98.24ms min=2.78ms  med=89.11ms  max=1.17s    p(90)=186.23ms p(95)=214.19ms p(99.9)=637.23ms
     iterations.....................: 145204  2348.085601/s
     success_rate...................: 100.00% ✓ 145204      ✗ 0     
     vus............................: 94      min=0         max=500 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.7.0-p.6)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 428259      ✗ 0     
     data_received..................: 13 GB   203 MB/s
     data_sent......................: 173 MB  2.8 MB/s
     http_req_blocked...............: avg=18.84µs min=952ns   med=2.58µs   max=95.36ms  p(90)=4.32µs   p(95)=5.41µs   p(99.9)=877.13µs
     http_req_connecting............: avg=15.3µs  min=0s      med=0s       max=90.22ms  p(90)=0s       p(95)=0s       p(99.9)=820.61µs
     http_req_duration..............: avg=98.94ms min=1.52ms  med=87.77ms  max=2.13s    p(90)=185.67ms p(95)=215.88ms p(99.9)=754.6ms 
       { expected_response:true }...: avg=98.94ms min=1.52ms  med=87.77ms  max=2.13s    p(90)=185.67ms p(95)=215.88ms p(99.9)=754.6ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 143753
     http_req_receiving.............: avg=1.53ms  min=52.02µs med=108.58µs max=875.14ms p(90)=1.78ms   p(95)=4.71ms   p(99.9)=117.27ms
     http_req_sending...............: avg=68.26µs min=4.79µs  med=9.82µs   max=253.44ms p(90)=18.88µs  p(95)=113.46µs p(99.9)=9.24ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=97.33ms min=1.44ms  med=86.55ms  max=2.12s    p(90)=183.59ms p(95)=212.84ms p(99.9)=727.04ms
     http_reqs......................: 143753  2320.78898/s
     iteration_duration.............: avg=99.92ms min=2.74ms  med=88.81ms  max=2.13s    p(90)=186.28ms p(95)=216.62ms p(99.9)=756.13ms
     iterations.....................: 142753  2304.644698/s
     success_rate...................: 100.00% ✓ 142753      ✗ 0     
     vus............................: 54      min=0         max=499 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (.net subgraphs) (16.7.0-p.6)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 413595      ✗ 0     
     data_received..................: 12 GB   195 MB/s
     data_sent......................: 167 MB  2.7 MB/s
     http_req_blocked...............: avg=14.41µs  min=901ns   med=2.37µs   max=90.27ms  p(90)=4.28µs   p(95)=5.47µs   p(99.9)=1.56ms  
     http_req_connecting............: avg=11.17µs  min=0s      med=0s       max=67.01ms  p(90)=0s       p(95)=0s       p(99.9)=1.47ms  
     http_req_duration..............: avg=102.52ms min=1.72ms  med=89.87ms  max=1.27s    p(90)=191.87ms p(95)=226.04ms p(99.9)=759.61ms
       { expected_response:true }...: avg=102.52ms min=1.72ms  med=89.87ms  max=1.27s    p(90)=191.87ms p(95)=226.04ms p(99.9)=759.61ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 138865
     http_req_receiving.............: avg=1.55ms   min=52.24µs med=107.32µs max=628.86ms p(90)=1.65ms   p(95)=4.33ms   p(99.9)=105.09ms
     http_req_sending...............: avg=62.54µs  min=4.64µs  med=9.77µs   max=105.83ms p(90)=21.13µs  p(95)=104.39µs p(99.9)=8.16ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=100.9ms  min=1.64ms  med=88.71ms  max=1.27s    p(90)=190.13ms p(95)=222.77ms p(99.9)=721.2ms 
     http_reqs......................: 138865  2228.908481/s
     iteration_duration.............: avg=103.52ms min=3.22ms  med=90.95ms  max=1.27s    p(90)=192.52ms p(95)=226.94ms p(99.9)=760.32ms
     iterations.....................: 137865  2212.857579/s
     success_rate...................: 100.00% ✓ 137865      ✗ 0     
     vus............................: 71      min=0         max=495 
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

     checks.........................: 100.00% ✓ 404622      ✗ 0     
     data_received..................: 12 GB   192 MB/s
     data_sent......................: 163 MB  2.6 MB/s
     http_req_blocked...............: avg=15.49µs  min=1.06µs  med=3.07µs   max=64.62ms  p(90)=4.93µs   p(95)=6.18µs   p(99.9)=1.28ms  
     http_req_connecting............: avg=11.4µs   min=0s      med=0s       max=57.14ms  p(90)=0s       p(95)=0s       p(99.9)=1.16ms  
     http_req_duration..............: avg=104.71ms min=1.6ms   med=99.91ms  max=337.77ms p(90)=201.97ms p(95)=219.15ms p(99.9)=268.79ms
       { expected_response:true }...: avg=104.71ms min=1.6ms   med=99.91ms  max=337.77ms p(90)=201.97ms p(95)=219.15ms p(99.9)=268.79ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 135874
     http_req_receiving.............: avg=130.76µs min=25.91µs med=58.91µs  max=284.09ms p(90)=128.5µs  p(95)=357.65µs p(99.9)=10.4ms  
     http_req_sending...............: avg=67.08µs  min=5.14µs  med=11.79µs  max=260.35ms p(90)=21.68µs  p(95)=127.94µs p(99.9)=8.21ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=104.51ms min=1.54ms  med=99.72ms  max=327.52ms p(90)=201.68ms p(95)=218.86ms p(99.9)=268.15ms
     http_reqs......................: 135874  2190.232537/s
     iteration_duration.............: avg=105.74ms min=4.76ms  med=101.06ms max=346.61ms p(90)=202.47ms p(95)=219.65ms p(99.9)=269.53ms
     iterations.....................: 134874  2174.112952/s
     success_rate...................: 100.00% ✓ 134874      ✗ 0     
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

     checks.........................: 100.00% ✓ 214959      ✗ 0    
     data_received..................: 6.4 GB  102 MB/s
     data_sent......................: 87 MB   1.4 MB/s
     http_req_blocked...............: avg=4.87µs   min=981ns   med=2.43µs   max=3.71ms   p(90)=4.22µs   p(95)=5.19µs   p(99.9)=439.38µs
     http_req_connecting............: avg=1.72µs   min=0s      med=0s       max=2.92ms   p(90)=0s       p(95)=0s       p(99.9)=384.16µs
     http_req_duration..............: avg=196.41ms min=1.93ms  med=198.96ms max=514.78ms p(90)=360.59ms p(95)=387.43ms p(99.9)=464.66ms
       { expected_response:true }...: avg=196.41ms min=1.93ms  med=198.96ms max=514.78ms p(90)=360.59ms p(95)=387.43ms p(99.9)=464.66ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 72653
     http_req_receiving.............: avg=77.52µs  min=26.87µs med=61.19µs  max=201.43ms p(90)=101.29µs p(95)=115.73µs p(99.9)=807.96µs
     http_req_sending...............: avg=31.54µs  min=4.79µs  med=11.54µs  max=147.78ms p(90)=19.31µs  p(95)=22.71µs  p(99.9)=3.01ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=196.3ms  min=1.88ms  med=198.87ms max=514.71ms p(90)=360.5ms  p(95)=387.33ms p(99.9)=464.59ms
     http_reqs......................: 72653   1160.893757/s
     iteration_duration.............: avg=199.39ms min=5.07ms  med=202.25ms max=514.96ms p(90)=361.5ms  p(95)=388.05ms p(99.9)=464.86ms
     iterations.....................: 71653   1144.91515/s
     success_rate...................: 100.00% ✓ 71653       ✗ 0    
     vus............................: 83      min=0         max=496
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

     checks.........................: 100.00% ✓ 100641     ✗ 0    
     data_received..................: 3.0 GB  47 MB/s
     data_sent......................: 42 MB   640 kB/s
     http_req_blocked...............: avg=9.15µs   min=1.03µs  med=2.83µs   max=17.72ms p(90)=4.59µs   p(95)=5.59µs   p(99.9)=1.59ms
     http_req_connecting............: avg=5.35µs   min=0s      med=0s       max=17.64ms p(90)=0s       p(95)=0s       p(99.9)=1.57ms
     http_req_duration..............: avg=415.46ms min=3.94ms  med=385.93ms max=1.65s   p(90)=811.95ms p(95)=886.4ms  p(99.9)=1.34s 
       { expected_response:true }...: avg=415.46ms min=3.94ms  med=385.93ms max=1.65s   p(90)=811.95ms p(95)=886.4ms  p(99.9)=1.34s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 34547
     http_req_receiving.............: avg=86.79µs  min=29.48µs med=73.97µs  max=97.75ms p(90)=114.29µs p(95)=128.45µs p(99.9)=1.02ms
     http_req_sending...............: avg=34.23µs  min=4.92µs  med=14.34µs  max=81.26ms p(90)=21.87µs  p(95)=24.77µs  p(99.9)=3.4ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=415.34ms min=3.81ms  med=385.8ms  max=1.65s   p(90)=811.85ms p(95)=886.31ms p(99.9)=1.34s 
     http_reqs......................: 34547   533.240346/s
     iteration_duration.............: avg=428.05ms min=27.36ms med=400.94ms max=1.66s   p(90)=815.3ms  p(95)=889.99ms p(99.9)=1.35s 
     iterations.....................: 33547   517.805132/s
     success_rate...................: 100.00% ✓ 33547      ✗ 0    
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

     checks.........................: 100.00% ✓ 45774      ✗ 0    
     data_received..................: 1.4 GB  21 MB/s
     data_sent......................: 20 MB   288 kB/s
     http_req_blocked...............: avg=16.4µs   min=1.52µs  med=3.94µs   max=13.41ms p(90)=5.81µs   p(95)=7.29µs   p(99.9)=2.39ms  
     http_req_connecting............: avg=10.7µs   min=0s      med=0s       max=13.35ms p(90)=0s       p(95)=0s       p(99.9)=2.37ms  
     http_req_duration..............: avg=895.77ms min=5.79ms  med=798.37ms max=5.24s   p(90)=1.75s    p(95)=2.02s    p(99.9)=4.41s   
       { expected_response:true }...: avg=895.77ms min=5.79ms  med=798.37ms max=5.24s   p(90)=1.75s    p(95)=2.02s    p(99.9)=4.41s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 16258
     http_req_receiving.............: avg=102.83µs min=38.02µs med=93.06µs  max=38.1ms  p(90)=133.28µs p(95)=149.84µs p(99.9)=951.24µs
     http_req_sending...............: avg=29.32µs  min=5.88µs  med=19.01µs  max=17.56ms p(90)=24.89µs  p(95)=29.99µs  p(99.9)=2.12ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=895.64ms min=5.7ms   med=798.24ms max=5.24s   p(90)=1.75s    p(95)=2.02s    p(99.9)=4.41s   
     http_reqs......................: 16258   240.1665/s
     iteration_duration.............: avg=954.48ms min=33.87ms med=876.18ms max=5.24s   p(90)=1.77s    p(95)=2.04s    p(99.9)=4.47s   
     iterations.....................: 15258   225.394295/s
     success_rate...................: 100.00% ✓ 15258      ✗ 0    
     vus............................: 91      min=0        max=500
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

     checks.........................: 100.00% ✓ 44595      ✗ 0    
     data_received..................: 1.4 GB  20 MB/s
     data_sent......................: 19 MB   277 kB/s
     http_req_blocked...............: avg=11.57µs  min=1.16µs  med=3.19µs   max=2.75ms  p(90)=4.98µs   p(95)=6.66µs   p(99.9)=1.37ms
     http_req_connecting............: avg=6.57µs   min=0s      med=0s       max=2.69ms  p(90)=0s       p(95)=0s       p(99.9)=1.35ms
     http_req_duration..............: avg=916.04ms min=7.86ms  med=838.45ms max=3.2s    p(90)=1.86s    p(95)=1.98s    p(99.9)=2.94s 
       { expected_response:true }...: avg=916.04ms min=7.86ms  med=838.45ms max=3.2s    p(90)=1.86s    p(95)=1.98s    p(99.9)=2.94s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 15865
     http_req_receiving.............: avg=99µs     min=32.79µs med=90.16µs  max=28.96ms p(90)=130.12µs p(95)=147.12µs p(99.9)=1.01ms
     http_req_sending...............: avg=29.04µs  min=5.37µs  med=17.72µs  max=20.73ms p(90)=23.25µs  p(95)=28.54µs  p(99.9)=2.67ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=915.91ms min=7.78ms  med=838.29ms max=3.2s    p(90)=1.86s    p(95)=1.98s    p(99.9)=2.94s 
     http_reqs......................: 15865   230.487055/s
     iteration_duration.............: avg=977.6ms  min=87.75ms med=925.51ms max=3.2s    p(90)=1.87s    p(95)=1.99s    p(99.9)=2.96s 
     iterations.....................: 14865   215.959034/s
     success_rate...................: 100.00% ✓ 14865      ✗ 0    
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

