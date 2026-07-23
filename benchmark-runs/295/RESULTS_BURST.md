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
| hive-router | v0.0.83 | 2,730 | 2,906 | 2,682 | 2.9% |  |
| fusion-nightly-net11 | 16.6.0-p.2 | 2,607 | 2,705 | 2,587 | 1.6% |  |
| fusion-nightly | 16.6.0-p.2 | 2,437 | 2,539 | 2,420 | 1.7% |  |
| fusion | 16.5.1 | 2,363 | 2,463 | 2,346 | 1.7% |  |
| cosmo | 0.331.1 | 1,242 | 1,284 | 1,237 | 1.4% |  |
| hive-gateway-router-runtime | 2.10.4 | 558 | 572 | 556 | 1.1% |  |
| hive-gateway | 2.10.4 | 256 | 263 | 253 | 1.1% |  |
| apollo-gateway | 2.14.2 | 233 | 240 | 232 | 1.0% |  |
| apollo-router | v2.16.0 | — | — | — | — | non-compatible response (6553 across 9/9 runs) |
| feddi | — | — | — | — | — | not run |
| fusion-nightly-fed | — | — | — | — | — | not run |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (496441 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| fusion-nightly-net11 | 16.6.0-p.2 | 2,465 | 2,552 | 2,454 | 1.3% |  |
| fusion | 16.5.1 | 2,362 | 2,439 | 2,348 | 1.2% |  |
| hive-router | v0.0.83 | 2,361 | 2,518 | 2,345 | 2.5% |  |
| fusion-nightly | 16.6.0-p.2 | 2,309 | 2,403 | 2,300 | 1.5% |  |
| fusion-nightly-fed | 16.6.0-p.2 | 2,202 | 2,305 | 2,196 | 1.7% |  |
| cosmo | 0.331.1 | 1,136 | 1,174 | 1,126 | 1.4% |  |
| hive-gateway-router-runtime | 2.10.4 | 548 | 561 | 547 | 0.9% |  |
| hive-gateway | 2.10.4 | 241 | 245 | 238 | 0.8% |  |
| apollo-gateway | 2.14.2 | 237 | 241 | 236 | 0.6% |  |
| apollo-router | v2.16.0 | — | — | — | — | non-compatible response (42234 across 9/9 runs) |
| feddi | — | — | — | — | — | not run |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (275725 across 9/9 runs) |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.83)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 502683      ✗ 0     
     data_received..................: 15 GB   240 MB/s
     data_sent......................: 203 MB  3.3 MB/s
     http_req_blocked...............: avg=18.69µs  min=1.07µs  med=2.63µs  max=67.2ms   p(90)=4.21µs   p(95)=5.34µs   p(99.9)=1.19ms  
     http_req_connecting............: avg=15.31µs  min=0s      med=0s      max=67.12ms  p(90)=0s       p(95)=0s       p(99.9)=1.09ms  
     http_req_duration..............: avg=84.32ms  min=1.41ms  med=79.42ms max=292.72ms p(90)=163.11ms p(95)=177.5ms  p(99.9)=232.92ms
       { expected_response:true }...: avg=84.32ms  min=1.41ms  med=79.42ms max=292.72ms p(90)=163.11ms p(95)=177.5ms  p(99.9)=232.92ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 168561
     http_req_receiving.............: avg=161.14µs min=27.43µs med=53.61µs max=55.81ms  p(90)=146.61µs p(95)=351.86µs p(99.9)=21.06ms 
     http_req_sending...............: avg=72.01µs  min=4.59µs  med=9.97µs  max=255.1ms  p(90)=18.19µs  p(95)=122.85µs p(99.9)=9.19ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=84.08ms  min=1.36ms  med=79.23ms max=274.32ms p(90)=162.87ms p(95)=177.04ms p(99.9)=231.02ms
     http_reqs......................: 168561  2730.32591/s
     iteration_duration.............: avg=85.07ms  min=1.88ms  med=80.24ms max=324.26ms p(90)=163.57ms p(95)=177.95ms p(99.9)=233.81ms
     iterations.....................: 167561  2714.128059/s
     success_rate...................: 100.00% ✓ 167561      ✗ 0     
     vus............................: 90      min=0         max=498 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (rust subgraphs) (16.6.0-p.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 483684      ✗ 0     
     data_received..................: 14 GB   229 MB/s
     data_sent......................: 195 MB  3.1 MB/s
     http_req_blocked...............: avg=22.44µs min=972ns   med=2.7µs    max=69.9ms   p(90)=4.31µs   p(95)=5.48µs   p(99.9)=2.47ms  
     http_req_connecting............: avg=18.9µs  min=0s      med=0s       max=69.79ms  p(90)=0s       p(95)=0s       p(99.9)=2.31ms  
     http_req_duration..............: avg=87.61ms min=1.93ms  med=82.39ms  max=343.93ms p(90)=168.25ms p(95)=185.47ms p(99.9)=247.24ms
       { expected_response:true }...: avg=87.61ms min=1.93ms  med=82.39ms  max=343.93ms p(90)=168.25ms p(95)=185.47ms p(99.9)=247.24ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 162228
     http_req_receiving.............: avg=705.8µs min=52.92µs med=112.19µs max=73.37ms  p(90)=1.46ms   p(95)=2.38ms   p(99.9)=26.66ms 
     http_req_sending...............: avg=74.3µs  min=4.55µs  med=9.96µs   max=187.08ms p(90)=20.14µs  p(95)=123.56µs p(99.9)=10.4ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=86.83ms min=1.84ms  med=81.59ms  max=343.57ms p(90)=167.34ms p(95)=184.58ms p(99.9)=245.11ms
     http_reqs......................: 162228  2607.021729/s
     iteration_duration.............: avg=88.43ms min=3.72ms  med=83.31ms  max=353.59ms p(90)=168.83ms p(95)=186.02ms p(99.9)=248.91ms
     iterations.....................: 161228  2590.951619/s
     success_rate...................: 100.00% ✓ 161228      ✗ 0     
     vus............................: 67      min=0         max=495 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (rust subgraphs) (16.6.0-p.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 452838      ✗ 0     
     data_received..................: 13 GB   214 MB/s
     data_sent......................: 183 MB  2.9 MB/s
     http_req_blocked...............: avg=15.74µs min=921ns   med=2.48µs   max=66.02ms  p(90)=4.01µs   p(95)=5.05µs   p(99.9)=1.15ms  
     http_req_connecting............: avg=12.55µs min=0s      med=0s       max=65.95ms  p(90)=0s       p(95)=0s       p(99.9)=1.11ms  
     http_req_duration..............: avg=93.62ms min=1.95ms  med=83.29ms  max=1.14s    p(90)=179.29ms p(95)=205.67ms p(99.9)=560.86ms
       { expected_response:true }...: avg=93.62ms min=1.95ms  med=83.29ms  max=1.14s    p(90)=179.29ms p(95)=205.67ms p(99.9)=560.86ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 151946
     http_req_receiving.............: avg=1.16ms  min=52.47µs med=102.58µs max=530.56ms p(90)=1.62ms   p(95)=4.09ms   p(99.9)=57.63ms 
     http_req_sending...............: avg=62.46µs min=4.66µs  med=9.24µs   max=96.98ms  p(90)=16.9µs   p(95)=110.2µs  p(99.9)=8.97ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=92.39ms min=1.86ms  med=82.01ms  max=1.14s    p(90)=177.36ms p(95)=202.84ms p(99.9)=558.78ms
     http_reqs......................: 151946  2437.815108/s
     iteration_duration.............: avg=94.49ms min=3.38ms  med=84.34ms  max=1.14s    p(90)=179.86ms p(95)=206.27ms p(99.9)=562.26ms
     iterations.....................: 150946  2421.771151/s
     success_rate...................: 100.00% ✓ 150946      ✗ 0     
     vus............................: 71      min=0         max=495 
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

     checks.........................: 100.00% ✓ 440016      ✗ 0     
     data_received..................: 13 GB   207 MB/s
     data_sent......................: 177 MB  2.8 MB/s
     http_req_blocked...............: avg=12.42µs min=852ns   med=2µs     max=76.04ms  p(90)=3.27µs   p(95)=4.26µs   p(99.9)=849.08µs
     http_req_connecting............: avg=9.74µs  min=0s      med=0s      max=75.99ms  p(90)=0s       p(95)=0s       p(99.9)=759.73µs
     http_req_duration..............: avg=96.35ms min=1.99ms  med=84.47ms max=1.38s    p(90)=180.54ms p(95)=203.94ms p(99.9)=665.77ms
       { expected_response:true }...: avg=96.35ms min=1.99ms  med=84.47ms max=1.38s    p(90)=180.54ms p(95)=203.94ms p(99.9)=665.77ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 147672
     http_req_receiving.............: avg=1.43ms  min=50.29µs med=99.93µs max=579.19ms p(90)=1.78ms   p(95)=4.55ms   p(99.9)=85.76ms 
     http_req_sending...............: avg=56.77µs min=4.76µs  med=8.79µs  max=317.58ms p(90)=15.64µs  p(95)=93.47µs  p(99.9)=7.35ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=94.87ms min=1.86ms  med=83.25ms max=1.36s    p(90)=178.79ms p(95)=200.47ms p(99.9)=663.9ms 
     http_reqs......................: 147672  2363.036464/s
     iteration_duration.............: avg=97.26ms min=3.51ms  med=85.47ms max=1.38s    p(90)=181.05ms p(95)=204.49ms p(99.9)=666.73ms
     iterations.....................: 146672  2347.034538/s
     success_rate...................: 100.00% ✓ 146672      ✗ 0     
     vus............................: 79      min=0         max=493 
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

     checks.........................: 100.00% ✓ 230013      ✗ 0    
     data_received..................: 6.8 GB  109 MB/s
     data_sent......................: 93 MB   1.5 MB/s
     http_req_blocked...............: avg=12.24µs  min=942ns   med=2.15µs   max=61.41ms  p(90)=3.85µs   p(95)=4.81µs   p(99.9)=439.21µs
     http_req_connecting............: avg=9.11µs   min=0s      med=0s       max=61.3ms   p(90)=0s       p(95)=0s       p(99.9)=383.79µs
     http_req_duration..............: avg=183.69ms min=1.87ms  med=183.9ms  max=536.22ms p(90)=342ms    p(95)=366.49ms p(99.9)=463.29ms
       { expected_response:true }...: avg=183.69ms min=1.87ms  med=183.9ms  max=536.22ms p(90)=342ms    p(95)=366.49ms p(99.9)=463.29ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 77671
     http_req_receiving.............: avg=71.42µs  min=25.29µs med=57.26µs  max=41.14ms  p(90)=94.18µs  p(95)=108.05µs p(99.9)=1.18ms  
     http_req_sending...............: avg=33.62µs  min=4.65µs  med=9.98µs   max=146.02ms p(90)=17.34µs  p(95)=20.98µs  p(99.9)=4.68ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=183.58ms min=1.81ms  med=183.82ms max=536.16ms p(90)=341.91ms p(95)=366.4ms  p(99.9)=462.86ms
     http_reqs......................: 77671   1242.787636/s
     iteration_duration.............: avg=186.31ms min=3.4ms   med=186.67ms max=536.36ms p(90)=342.78ms p(95)=367.18ms p(99.9)=463.71ms
     iterations.....................: 76671   1226.786971/s
     success_rate...................: 100.00% ✓ 76671       ✗ 0    
     vus............................: 79      min=0         max=493
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

     checks.........................: 100.00% ✓ 104586     ✗ 0    
     data_received..................: 3.1 GB  49 MB/s
     data_sent......................: 43 MB   670 kB/s
     http_req_blocked...............: avg=8.49µs   min=1.05µs  med=3.02µs   max=13.53ms  p(90)=4.72µs   p(95)=5.76µs   p(99.9)=924.14µs
     http_req_connecting............: avg=4.46µs   min=0s      med=0s       max=13.47ms  p(90)=0s       p(95)=0s       p(99.9)=902.95µs
     http_req_duration..............: avg=399.93ms min=3.5ms   med=372.4ms  max=1.68s    p(90)=783.09ms p(95)=858.09ms p(99.9)=1.33s   
       { expected_response:true }...: avg=399.93ms min=3.5ms   med=372.4ms  max=1.68s    p(90)=783.09ms p(95)=858.09ms p(99.9)=1.33s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 35862
     http_req_receiving.............: avg=82.34µs  min=29.03µs med=70.83µs  max=6.71ms   p(90)=108.43µs p(95)=123.23µs p(99.9)=1.33ms  
     http_req_sending...............: avg=34.16µs  min=5.42µs  med=13.95µs  max=170.03ms p(90)=20.99µs  p(95)=24.15µs  p(99.9)=2.42ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=399.81ms min=3.45ms  med=372.3ms  max=1.68s    p(90)=782.98ms p(95)=858ms    p(99.9)=1.33s   
     http_reqs......................: 35862   558.371961/s
     iteration_duration.............: avg=411.62ms min=15.43ms med=385.74ms max=1.68s    p(90)=786.83ms p(95)=861.26ms p(99.9)=1.34s   
     iterations.....................: 34862   542.801943/s
     success_rate...................: 100.00% ✓ 34862      ✗ 0    
     vus............................: 66      min=0        max=496
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

     checks.........................: 100.00% ✓ 48660      ✗ 0    
     data_received..................: 1.5 GB  23 MB/s
     data_sent......................: 21 MB   309 kB/s
     http_req_blocked...............: avg=13.99µs  min=1.17µs  med=3.78µs   max=3.66ms  p(90)=5.59µs   p(95)=7.07µs   p(99.9)=2.4ms   
     http_req_connecting............: avg=8.54µs   min=0s      med=0s       max=3.61ms  p(90)=0s       p(95)=0s       p(99.9)=2.37ms  
     http_req_duration..............: avg=824.38ms min=5.34ms  med=697.71ms max=22.05s  p(90)=1.35s    p(95)=1.5s     p(99.9)=20.45s  
       { expected_response:true }...: avg=824.38ms min=5.34ms  med=697.71ms max=22.05s  p(90)=1.35s    p(95)=1.5s     p(99.9)=20.45s  
     http_req_failed................: 0.00%   ✓ 0          ✗ 17220
     http_req_receiving.............: avg=99.92µs  min=34.34µs med=92.86µs  max=18.12ms p(90)=130.07µs p(95)=145.98µs p(99.9)=876.95µs
     http_req_sending...............: avg=30.36µs  min=5.68µs  med=18.44µs  max=18.41ms p(90)=24.41µs  p(95)=28.7µs   p(99.9)=2.89ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=824.25ms min=5.26ms  med=697.6ms  max=22.05s  p(90)=1.35s    p(95)=1.5s     p(99.9)=20.45s  
     http_reqs......................: 17220   256.316732/s
     iteration_duration.............: avg=875.26ms min=46.62ms med=765.52ms max=22.05s  p(90)=1.38s    p(95)=1.51s    p(99.9)=20.46s  
     iterations.....................: 16220   241.431904/s
     success_rate...................: 100.00% ✓ 16220      ✗ 0    
     vus............................: 67      min=0        max=498
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

     checks.........................: 100.00% ✓ 48213      ✗ 0    
     data_received..................: 1.5 GB  21 MB/s
     data_sent......................: 21 MB   287 kB/s
     http_req_blocked...............: avg=10.52µs  min=1.11µs  med=3.17µs   max=2.35ms  p(90)=4.83µs   p(95)=6.11µs   p(99.9)=1.16ms
     http_req_connecting............: avg=5.71µs   min=0s      med=0s       max=2.27ms  p(90)=0s       p(95)=0s       p(99.9)=1.08ms
     http_req_duration..............: avg=383.32ms min=7.42ms  med=426.55ms max=1.09s   p(90)=659.71ms p(95)=721.41ms p(99.9)=1.01s 
       { expected_response:true }...: avg=383.32ms min=7.42ms  med=426.55ms max=1.09s   p(90)=659.71ms p(95)=721.41ms p(99.9)=1.01s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 17071
     http_req_receiving.............: avg=107.33µs min=31.59µs med=85.53µs  max=70.24ms p(90)=126.4µs  p(95)=140.73µs p(99.9)=1.12ms
     http_req_sending...............: avg=31.7µs   min=5.27µs  med=16.55µs  max=62.22ms p(90)=21.94µs  p(95)=26.08µs  p(99.9)=2.97ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=383.19ms min=7.31ms  med=426.39ms max=1.09s   p(90)=659.6ms  p(95)=721.34ms p(99.9)=1.01s 
     http_reqs......................: 17071   233.972463/s
     iteration_duration.............: avg=407.17ms min=11.57ms med=451.31ms max=1.09s   p(90)=672.53ms p(95)=728.17ms p(99.9)=1.03s 
     iterations.....................: 16071   220.266619/s
     success_rate...................: 100.00% ✓ 16071      ✗ 0    
     vus............................: 50      min=0        max=498
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (.net subgraphs) (16.6.0-p.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 454176      ✗ 0     
     data_received..................: 13 GB   216 MB/s
     data_sent......................: 183 MB  3.0 MB/s
     http_req_blocked...............: avg=15.39µs  min=862ns   med=2.31µs   max=40.58ms  p(90)=4.15µs   p(95)=5.29µs   p(99.9)=1.63ms  
     http_req_connecting............: avg=12.22µs  min=0s      med=0s       max=40.53ms  p(90)=0s       p(95)=0s       p(99.9)=1.47ms  
     http_req_duration..............: avg=93.3ms   min=1.46ms  med=89.19ms  max=361.85ms p(90)=177.83ms p(95)=192.95ms p(99.9)=249.62ms
       { expected_response:true }...: avg=93.3ms   min=1.46ms  med=89.19ms  max=361.85ms p(90)=177.83ms p(95)=192.95ms p(99.9)=249.62ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 152392
     http_req_receiving.............: avg=779.95µs min=52.62µs med=121.08µs max=135.06ms p(90)=1.64ms   p(95)=2.67ms   p(99.9)=25.4ms  
     http_req_sending...............: avg=62.87µs  min=4.51µs  med=9.45µs   max=180.06ms p(90)=21.39µs  p(95)=111.1µs  p(99.9)=7.81ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=92.46ms  min=1.38ms  med=88.36ms  max=361.7ms  p(90)=176.85ms p(95)=192.05ms p(99.9)=247.91ms
     http_reqs......................: 152392  2465.08809/s
     iteration_duration.............: avg=94.17ms  min=3.18ms  med=90.15ms  max=362.05ms p(90)=178.28ms p(95)=193.39ms p(99.9)=250.5ms 
     iterations.....................: 151392  2448.912123/s
     success_rate...................: 100.00% ✓ 151392      ✗ 0     
     vus............................: 94      min=0         max=500 
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

     checks.........................: 100.00% ✓ 435393      ✗ 0     
     data_received..................: 13 GB   207 MB/s
     data_sent......................: 176 MB  2.8 MB/s
     http_req_blocked...............: avg=16.63µs min=901ns   med=2.33µs   max=60ms     p(90)=4.22µs   p(95)=5.38µs   p(99.9)=1.12ms  
     http_req_connecting............: avg=13.35µs min=0s      med=0s       max=59.91ms  p(90)=0s       p(95)=0s       p(99.9)=1.06ms  
     http_req_duration..............: avg=97.34ms min=1.48ms  med=85.44ms  max=1.56s    p(90)=185.03ms p(95)=214.67ms p(99.9)=643.07ms
       { expected_response:true }...: avg=97.34ms min=1.48ms  med=85.44ms  max=1.56s    p(90)=185.03ms p(95)=214.67ms p(99.9)=643.07ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 146131
     http_req_receiving.............: avg=1.45ms  min=52.21µs med=103.79µs max=977.43ms p(90)=1.68ms   p(95)=4.22ms   p(99.9)=97.01ms 
     http_req_sending...............: avg=66.45µs min=4.63µs  med=9.43µs   max=141.45ms p(90)=20µs     p(95)=107.57µs p(99.9)=8.98ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=95.82ms min=1.4ms   med=84.23ms  max=1.56s    p(90)=182.78ms p(95)=212.03ms p(99.9)=628.44ms
     http_reqs......................: 146131  2362.431172/s
     iteration_duration.............: avg=98.27ms min=2.84ms  med=86.51ms  max=1.56s    p(90)=185.68ms p(95)=215.49ms p(99.9)=643.57ms
     iterations.....................: 145131  2346.264642/s
     success_rate...................: 100.00% ✓ 145131      ✗ 0     
     vus............................: 97      min=0         max=500 
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

     checks.........................: 100.00% ✓ 435297      ✗ 0     
     data_received..................: 13 GB   207 MB/s
     data_sent......................: 176 MB  2.8 MB/s
     http_req_blocked...............: avg=21.68µs  min=892ns   med=2.87µs  max=72.8ms   p(90)=4.93µs   p(95)=6.23µs   p(99.9)=2.18ms  
     http_req_connecting............: avg=17.84µs  min=0s      med=0s      max=72.73ms  p(90)=0s       p(95)=0s       p(99.9)=2.04ms  
     http_req_duration..............: avg=97.35ms  min=1.55ms  med=92.89ms max=343.22ms p(90)=187.81ms p(95)=206.93ms p(99.9)=265.18ms
       { expected_response:true }...: avg=97.35ms  min=1.55ms  med=92.89ms max=343.22ms p(90)=187.81ms p(95)=206.93ms p(99.9)=265.18ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 146099
     http_req_receiving.............: avg=160.55µs min=27.42µs med=58.03µs max=236.21ms p(90)=151.14µs p(95)=381.68µs p(99.9)=18.69ms 
     http_req_sending...............: avg=76.25µs  min=5.09µs  med=11.35µs max=106.38ms p(90)=22.64µs  p(95)=137.43µs p(99.9)=10.52ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=97.11ms  min=1.5ms   med=92.68ms max=332.26ms p(90)=187.5ms  p(95)=206.51ms p(99.9)=263.79ms
     http_reqs......................: 146099  2361.420149/s
     iteration_duration.............: avg=98.28ms  min=4.7ms   med=94.01ms max=351.96ms p(90)=188.33ms p(95)=207.55ms p(99.9)=266.49ms
     iterations.....................: 145099  2345.256998/s
     success_rate...................: 100.00% ✓ 145099      ✗ 0     
     vus............................: 51      min=0         max=499 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.6.0-p.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 425733      ✗ 0     
     data_received..................: 13 GB   203 MB/s
     data_sent......................: 172 MB  2.8 MB/s
     http_req_blocked...............: avg=15.46µs  min=932ns   med=2.29µs   max=65.93ms  p(90)=3.96µs   p(95)=5.1µs    p(99.9)=1.03ms  
     http_req_connecting............: avg=12.38µs  min=0s      med=0s       max=65.88ms  p(90)=0s       p(95)=0s       p(99.9)=944.37µs
     http_req_duration..............: avg=99.57ms  min=1.47ms  med=87.45ms  max=1.47s    p(90)=187.24ms p(95)=215.58ms p(99.9)=719.37ms
       { expected_response:true }...: avg=99.57ms  min=1.47ms  med=87.45ms  max=1.47s    p(90)=187.24ms p(95)=215.58ms p(99.9)=719.37ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 142911
     http_req_receiving.............: avg=1.57ms   min=52.64µs med=108.78µs max=761.91ms p(90)=1.95ms   p(95)=4.94ms   p(99.9)=83.07ms 
     http_req_sending...............: avg=63.09µs  min=4.68µs  med=9.53µs   max=177.36ms p(90)=19.52µs  p(95)=103.6µs  p(99.9)=7.98ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=97.92ms  min=1.38ms  med=86.14ms  max=1.47s    p(90)=185.17ms p(95)=212.05ms p(99.9)=703ms   
     http_reqs......................: 142911  2309.739372/s
     iteration_duration.............: avg=100.52ms min=2.96ms  med=88.49ms  max=1.47s    p(90)=187.83ms p(95)=216.17ms p(99.9)=720.16ms
     iterations.....................: 141911  2293.577289/s
     success_rate...................: 100.00% ✓ 141911      ✗ 0     
     vus............................: 51      min=0         max=499 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (.net subgraphs) (16.6.0-p.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 408957      ✗ 0     
     data_received..................: 12 GB   193 MB/s
     data_sent......................: 165 MB  2.6 MB/s
     http_req_blocked...............: avg=16.69µs  min=852ns   med=2.47µs   max=278.4ms  p(90)=4.51µs   p(95)=5.67µs   p(99.9)=1.74ms  
     http_req_connecting............: avg=11.46µs  min=0s      med=0s       max=48.48ms  p(90)=0s       p(95)=0s       p(99.9)=1.62ms  
     http_req_duration..............: avg=103.63ms min=1.94ms  med=91.65ms  max=2s       p(90)=196.71ms p(95)=224.84ms p(99.9)=648.61ms
       { expected_response:true }...: avg=103.63ms min=1.94ms  med=91.65ms  max=2s       p(90)=196.71ms p(95)=224.84ms p(99.9)=648.61ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 137319
     http_req_receiving.............: avg=1.64ms   min=52.84µs med=109.66µs max=923.43ms p(90)=1.83ms   p(95)=4.8ms    p(99.9)=82.03ms 
     http_req_sending...............: avg=64.3µs   min=4.75µs  med=10.22µs  max=139.79ms p(90)=21.83µs  p(95)=107.52µs p(99.9)=8.48ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=101.92ms min=1.85ms  med=90.52ms  max=2s       p(90)=194.12ms p(95)=219.82ms p(99.9)=643.93ms
     http_reqs......................: 137319  2202.688883/s
     iteration_duration.............: avg=104.66ms min=3.8ms   med=92.78ms  max=2s       p(90)=197.38ms p(95)=225.56ms p(99.9)=650.01ms
     iterations.....................: 136319  2186.648212/s
     success_rate...................: 100.00% ✓ 136319      ✗ 0     
     vus............................: 73      min=0         max=494 
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

     checks.........................: 100.00% ✓ 210549      ✗ 0    
     data_received..................: 6.2 GB  99 MB/s
     data_sent......................: 86 MB   1.4 MB/s
     http_req_blocked...............: avg=5.67µs   min=1.14µs  med=2.93µs   max=17.39ms  p(90)=4.74µs   p(95)=5.76µs   p(99.9)=428.47µs
     http_req_connecting............: avg=1.93µs   min=0s      med=0s       max=17.32ms  p(90)=0s       p(95)=0s       p(99.9)=366.49µs
     http_req_duration..............: avg=200.47ms min=2.05ms  med=203.61ms max=537.73ms p(90)=366.75ms p(95)=390.26ms p(99.9)=462.46ms
       { expected_response:true }...: avg=200.47ms min=2.05ms  med=203.61ms max=537.73ms p(90)=366.75ms p(95)=390.26ms p(99.9)=462.46ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 71183
     http_req_receiving.............: avg=80.77µs  min=26.46µs med=66.75µs  max=71.37ms  p(90)=109.94µs p(95)=126.32µs p(99.9)=1.12ms  
     http_req_sending...............: avg=35.01µs  min=4.96µs  med=12.61µs  max=141.05ms p(90)=19.93µs  p(95)=23.85µs  p(99.9)=3.82ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=200.35ms min=1.97ms  med=203.47ms max=537.66ms p(90)=366.66ms p(95)=390.17ms p(99.9)=462.39ms
     http_reqs......................: 71183   1136.550719/s
     iteration_duration.............: avg=203.56ms min=5.25ms  med=206.8ms  max=537.91ms p(90)=367.62ms p(95)=390.97ms p(99.9)=463.02ms
     iterations.....................: 70183   1120.584115/s
     success_rate...................: 100.00% ✓ 70183       ✗ 0    
     vus............................: 87      min=0         max=497
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

     checks.........................: 100.00% ✓ 103323     ✗ 0    
     data_received..................: 3.1 GB  48 MB/s
     data_sent......................: 43 MB   658 kB/s
     http_req_blocked...............: avg=8.48µs   min=1.06µs  med=3.06µs   max=4.5ms    p(90)=4.83µs   p(95)=5.85µs   p(99.9)=1.5ms 
     http_req_connecting............: avg=4.5µs    min=0s      med=0s       max=4.37ms   p(90)=0s       p(95)=0s       p(99.9)=1.48ms
     http_req_duration..............: avg=404.78ms min=3.86ms  med=379.2ms  max=1.55s    p(90)=802.29ms p(95)=870.39ms p(99.9)=1.26s 
       { expected_response:true }...: avg=404.78ms min=3.86ms  med=379.2ms  max=1.55s    p(90)=802.29ms p(95)=870.39ms p(99.9)=1.26s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 35441
     http_req_receiving.............: avg=121.62µs min=29.2µs  med=73.82µs  max=98.38ms  p(90)=113.69µs p(95)=128.97µs p(99.9)=8.88ms
     http_req_sending...............: avg=36.22µs  min=5.11µs  med=14.08µs  max=115.62ms p(90)=21.51µs  p(95)=24.62µs  p(99.9)=2.44ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=404.62ms min=3.75ms  med=379.11ms max=1.55s    p(90)=802.14ms p(95)=870.26ms p(99.9)=1.26s 
     http_reqs......................: 35441   548.101042/s
     iteration_duration.............: avg=416.78ms min=12.61ms med=392.15ms max=1.55s    p(90)=805.83ms p(95)=873.41ms p(99.9)=1.27s 
     iterations.....................: 34441   532.635874/s
     success_rate...................: 100.00% ✓ 34441      ✗ 0    
     vus............................: 87      min=0        max=500
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

     checks.........................: 100.00% ✓ 46023      ✗ 0    
     data_received..................: 1.4 GB  21 MB/s
     data_sent......................: 20 MB   290 kB/s
     http_req_blocked...............: avg=14.8µs   min=1.12µs  med=3.28µs   max=8.46ms  p(90)=5.13µs  p(95)=6.68µs   p(99.9)=2.17ms  
     http_req_connecting............: avg=9.74µs   min=0s      med=0s       max=8.41ms  p(90)=0s      p(95)=0s       p(99.9)=2.14ms  
     http_req_duration..............: avg=891.34ms min=5.81ms  med=811.79ms max=4.91s   p(90)=1.75s   p(95)=1.98s    p(99.9)=4.12s   
       { expected_response:true }...: avg=891.34ms min=5.81ms  med=811.79ms max=4.91s   p(90)=1.75s   p(95)=1.98s    p(99.9)=4.12s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 16341
     http_req_receiving.............: avg=99.69µs  min=34.25µs med=90.21µs  max=34.84ms p(90)=126.6µs p(95)=141.43µs p(99.9)=999.47µs
     http_req_sending...............: avg=26.31µs  min=5.87µs  med=17.57µs  max=23.38ms p(90)=23.2µs  p(95)=27.74µs  p(99.9)=2.06ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=891.21ms min=5.73ms  med=811.71ms max=4.91s   p(90)=1.75s   p(95)=1.98s    p(99.9)=4.12s   
     http_reqs......................: 16341   241.208099/s
     iteration_duration.............: avg=949.42ms min=27.98ms med=872.89ms max=4.92s   p(90)=1.78s   p(95)=1.99s    p(99.9)=4.15s   
     iterations.....................: 15341   226.447185/s
     success_rate...................: 100.00% ✓ 15341      ✗ 0    
     vus............................: 94      min=0        max=500
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

     checks.........................: 100.00% ✓ 45918      ✗ 0    
     data_received..................: 1.4 GB  21 MB/s
     data_sent......................: 20 MB   285 kB/s
     http_req_blocked...............: avg=15.01µs  min=1.2µs   med=3.6µs    max=4.39ms  p(90)=5.51µs   p(95)=7.01µs   p(99.9)=2.52ms  
     http_req_connecting............: avg=9.63µs   min=0s      med=0s       max=4.35ms  p(90)=0s       p(95)=0s       p(99.9)=2.49ms  
     http_req_duration..............: avg=890.1ms  min=7.68ms  med=811.02ms max=3.01s   p(90)=1.8s     p(95)=1.95s    p(99.9)=2.76s   
       { expected_response:true }...: avg=890.1ms  min=7.68ms  med=811.02ms max=3.01s   p(90)=1.8s     p(95)=1.95s    p(99.9)=2.76s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 16306
     http_req_receiving.............: avg=107.35µs min=33.24µs med=91.64µs  max=54.61ms p(90)=133.72µs p(95)=150.87µs p(99.9)=756.22µs
     http_req_sending...............: avg=33.89µs  min=5.71µs  med=18.11µs  max=95.19ms p(90)=24.1µs   p(95)=29.06µs  p(99.9)=2.37ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=889.96ms min=7.59ms  med=810.93ms max=3.01s   p(90)=1.8s     p(95)=1.95s    p(99.9)=2.76s   
     http_reqs......................: 16306   237.364421/s
     iteration_duration.............: avg=948.25ms min=18.99ms med=886.86ms max=3.02s   p(90)=1.81s    p(95)=1.96s    p(99.9)=2.77s   
     iterations.....................: 15306   222.807545/s
     success_rate...................: 100.00% ✓ 15306      ✗ 0    
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

