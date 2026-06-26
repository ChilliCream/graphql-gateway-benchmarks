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
| hive-router | v0.0.72 | 2,629 | 2,748 | 2,605 | 2.0% |  |
| fusion-nightly | 16.4.0-p.3 | 2,094 | 2,124 | 2,081 | 0.7% |  |
| fusion | 16.3.0 | 2,020 | 2,078 | 2,000 | 1.2% |  |
| cosmo | 0.326.0 | 1,130 | 1,149 | 1,123 | 0.7% |  |
| hive-gateway-router-runtime | 2.9.0 | 507 | 516 | 503 | 0.9% |  |
| hive-gateway | 2.9.0 | 216 | 220 | 215 | 0.9% |  |
| apollo-gateway | 2.14.1 | 198 | 203 | 197 | 0.9% |  |
| apollo-router | v2.15.1 | — | — | — | — | non-compatible response (9158 across 9/9 runs) |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (467039 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.72 | 2,142 | 2,243 | 2,099 | 2.2% |  |
| fusion-nightly | 16.4.0-p.3 | 2,019 | 2,060 | 1,992 | 1.2% |  |
| fusion | 16.3.0 | 1,904 | 1,967 | 1,863 | 1.7% |  |
| cosmo | 0.326.0 | 1,037 | 1,060 | 1,026 | 1.1% |  |
| hive-gateway-router-runtime | 2.9.0 | 477 | 490 | 472 | 1.2% |  |
| hive-gateway | 2.9.0 | 219 | 222 | 217 | 0.7% |  |
| apollo-gateway | 2.14.1 | 208 | 212 | 208 | 0.7% |  |
| apollo-router | v2.15.1 | — | — | — | — | non-compatible response (10451 across 9/9 runs) |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (276546 across 9/9 runs) |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.72)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 485790      ✗ 0     
     data_received..................: 14 GB   231 MB/s
     data_sent......................: 196 MB  3.2 MB/s
     http_req_blocked...............: avg=23.29µs  min=972ns   med=2.17µs  max=59.42ms  p(90)=3.54µs   p(95)=4.55µs   p(99.9)=7.03ms  
     http_req_connecting............: avg=20.44µs  min=0s      med=0s      max=59.37ms  p(90)=0s       p(95)=0s       p(99.9)=6.89ms  
     http_req_duration..............: avg=87.22ms  min=1.6ms   med=81.57ms max=319.03ms p(90)=167.86ms p(95)=182.02ms p(99.9)=236.03ms
       { expected_response:true }...: avg=87.22ms  min=1.6ms   med=81.57ms max=319.03ms p(90)=167.86ms p(95)=182.02ms p(99.9)=236.03ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 162930
     http_req_receiving.............: avg=247.17µs min=28.46µs med=55.26µs max=91.74ms  p(90)=173.08µs p(95)=390.66µs p(99.9)=30.89ms 
     http_req_sending...............: avg=74.97µs  min=5.15µs  med=9.65µs  max=40.89ms  p(90)=17.58µs  p(95)=127.83µs p(99.9)=10.88ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=86.9ms   min=1.54ms  med=81.36ms max=316.58ms p(90)=167.43ms p(95)=181.37ms p(99.9)=232.14ms
     http_reqs......................: 162930  2629.645453/s
     iteration_duration.............: avg=88.03ms  min=2.43ms  med=82.46ms max=383.65ms p(90)=168.32ms p(95)=182.52ms p(99.9)=236.92ms
     iterations.....................: 161930  2613.505728/s
     success_rate...................: 100.00% ✓ 161930      ✗ 0     
     vus............................: 56      min=0         max=498 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (rust subgraphs) (16.4.0-p.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 390780      ✗ 0     
     data_received..................: 12 GB   184 MB/s
     data_sent......................: 158 MB  2.5 MB/s
     http_req_blocked...............: avg=14.33µs  min=922ns   med=2.22µs   max=91.26ms  p(90)=3.58µs   p(95)=4.54µs   p(99.9)=1.48ms  
     http_req_connecting............: avg=11.44µs  min=0s      med=0s       max=91.22ms  p(90)=0s       p(95)=0s       p(99.9)=1.39ms  
     http_req_duration..............: avg=108.39ms min=2.29ms  med=101.8ms  max=612.08ms p(90)=206.69ms p(95)=232.69ms p(99.9)=387.04ms
       { expected_response:true }...: avg=108.39ms min=2.29ms  med=101.8ms  max=612.08ms p(90)=206.69ms p(95)=232.69ms p(99.9)=387.04ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 131260
     http_req_receiving.............: avg=1.84ms   min=52.89µs med=314µs    max=302.39ms p(90)=3.16ms   p(95)=6.55ms   p(99.9)=88.99ms 
     http_req_sending...............: avg=59.71µs  min=5.43µs  med=9.56µs   max=151.51ms p(90)=17.77µs  p(95)=118.13µs p(99.9)=8.48ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=106.49ms min=2.19ms  med=100.01ms max=611.99ms p(90)=204.17ms p(95)=229.02ms p(99.9)=372.42ms
     http_reqs......................: 131260  2094.974642/s
     iteration_duration.............: avg=109.5ms  min=3.74ms  med=103ms    max=612.3ms  p(90)=207.31ms p(95)=233.33ms p(99.9)=388.96ms
     iterations.....................: 130260  2079.014146/s
     success_rate...................: 100.00% ✓ 130260      ✗ 0     
     vus............................: 89      min=0         max=496 
     vus_max........................: 500     min=500       max=500
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

     checks.........................: 100.00% ✓ 377769      ✗ 0     
     data_received..................: 11 GB   177 MB/s
     data_sent......................: 152 MB  2.4 MB/s
     http_req_blocked...............: avg=17.55µs  min=1µs    med=2.17µs   max=152.32ms p(90)=3.51µs   p(95)=4.46µs   p(99.9)=1.54ms  
     http_req_connecting............: avg=14.79µs  min=0s     med=0s       max=152.26ms p(90)=0s       p(95)=0s       p(99.9)=1.46ms  
     http_req_duration..............: avg=112.13ms min=2.45ms med=98.95ms  max=783.99ms p(90)=226.46ms p(95)=267.61ms p(99.9)=554.11ms
       { expected_response:true }...: avg=112.13ms min=2.45ms med=98.95ms  max=783.99ms p(90)=226.46ms p(95)=267.61ms p(99.9)=554.11ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 126923
     http_req_receiving.............: avg=3.36ms   min=53.1µs med=167.67µs max=377.43ms p(90)=4.58ms   p(95)=11.95ms  p(99.9)=150.9ms 
     http_req_sending...............: avg=66.1µs   min=5.31µs med=9.46µs   max=179ms    p(90)=17.07µs  p(95)=113.01µs p(99.9)=9.04ms  
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=108.7ms  min=2.33ms med=96.41ms  max=783.91ms p(90)=219.66ms p(95)=258.08ms p(99.9)=470.9ms 
     http_reqs......................: 126923  2020.642362/s
     iteration_duration.............: avg=113.3ms  min=3.47ms med=100.44ms max=784.2ms  p(90)=227.36ms p(95)=268.41ms p(99.9)=555.25ms
     iterations.....................: 125923  2004.722139/s
     success_rate...................: 100.00% ✓ 125923      ✗ 0     
     vus............................: 95      min=0         max=500 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (rust subgraphs) (0.326.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 208980      ✗ 0    
     data_received..................: 6.2 GB  99 MB/s
     data_sent......................: 85 MB   1.4 MB/s
     http_req_blocked...............: avg=8.38µs   min=1.07µs  med=2.29µs   max=140.81ms p(90)=3.89µs   p(95)=4.84µs   p(99.9)=703.46µs
     http_req_connecting............: avg=3.39µs   min=0s      med=0s       max=11.3ms   p(90)=0s       p(95)=0s       p(99.9)=622.81µs
     http_req_duration..............: avg=201.96ms min=2.04ms  med=200.95ms max=607.29ms p(90)=373.16ms p(95)=400.49ms p(99.9)=541.15ms
       { expected_response:true }...: avg=201.96ms min=2.04ms  med=200.95ms max=607.29ms p(90)=373.16ms p(95)=400.49ms p(99.9)=541.15ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 70660
     http_req_receiving.............: avg=82.12µs  min=30.85µs med=63.44µs  max=101.23ms p(90)=99.55µs  p(95)=115.79µs p(99.9)=1.71ms  
     http_req_sending...............: avg=31.06µs  min=5.4µs   med=10.61µs  max=103.79ms p(90)=16.82µs  p(95)=20.8µs   p(99.9)=3.73ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=201.85ms min=1.99ms  med=200.79ms max=607.23ms p(90)=373.05ms p(95)=400.39ms p(99.9)=541.09ms
     http_reqs......................: 70660   1130.249678/s
     iteration_duration.............: avg=205.1ms  min=5.26ms  med=204.41ms max=607.5ms  p(90)=374.05ms p(95)=401.19ms p(99.9)=541.99ms
     iterations.....................: 69660   1114.25407/s
     success_rate...................: 100.00% ✓ 69660       ✗ 0    
     vus............................: 83      min=0         max=493
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (rust subgraphs) (2.9.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 95619      ✗ 0    
     data_received..................: 2.9 GB  45 MB/s
     data_sent......................: 40 MB   609 kB/s
     http_req_blocked...............: avg=10.02µs  min=1.24µs  med=2.89µs   max=30.33ms  p(90)=4.72µs   p(95)=5.75µs   p(99.9)=1.79ms 
     http_req_connecting............: avg=6.04µs   min=0s      med=0s       max=30.27ms  p(90)=0s       p(95)=0s       p(99.9)=1.71ms 
     http_req_duration..............: avg=436.59ms min=3.93ms  med=408.25ms max=1.66s    p(90)=865.73ms p(95)=935.74ms p(99.9)=1.36s  
       { expected_response:true }...: avg=436.59ms min=3.93ms  med=408.25ms max=1.66s    p(90)=865.73ms p(95)=935.74ms p(99.9)=1.36s  
     http_req_failed................: 0.00%   ✓ 0          ✗ 32873
     http_req_receiving.............: avg=150.88µs min=31.55µs med=76.83µs  max=132.47ms p(90)=114.62µs p(95)=128.88µs p(99.9)=14.52ms
     http_req_sending...............: avg=29.51µs  min=5.91µs  med=13.36µs  max=100.88ms p(90)=21.05µs  p(95)=24.53µs  p(99.9)=2.64ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=436.41ms min=3.87ms  med=408.15ms max=1.66s    p(90)=865.64ms p(95)=935.63ms p(99.9)=1.36s  
     http_reqs......................: 32873   507.363428/s
     iteration_duration.............: avg=450.52ms min=8.8ms   med=424ms    max=1.66s    p(90)=868.84ms p(95)=938.3ms  p(99.9)=1.37s  
     iterations.....................: 31873   491.929381/s
     success_rate...................: 100.00% ✓ 31873      ✗ 0    
     vus............................: 94      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (rust subgraphs) (2.9.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 41271      ✗ 0    
     data_received..................: 1.3 GB  19 MB/s
     data_sent......................: 18 MB   261 kB/s
     http_req_blocked...............: avg=15.14µs  min=1.25µs  med=3.6µs    max=19.96ms  p(90)=5.43µs  p(95)=7.02µs   p(99.9)=2ms     
     http_req_connecting............: avg=9.83µs   min=0s      med=0s       max=19.9ms   p(90)=0s      p(95)=0s       p(99.9)=1.92ms  
     http_req_duration..............: avg=963.89ms min=6.25ms  med=850.85ms max=18.07s   p(90)=1.71s   p(95)=1.92s    p(99.9)=17.07s  
       { expected_response:true }...: avg=963.89ms min=6.25ms  med=850.85ms max=18.07s   p(90)=1.71s   p(95)=1.92s    p(99.9)=17.07s  
     http_req_failed................: 0.00%   ✓ 0          ✗ 14757
     http_req_receiving.............: avg=110.77µs min=34.74µs med=98.51µs  max=46.16ms  p(90)=139.1µs p(95)=151.77µs p(99.9)=932.61µs
     http_req_sending...............: avg=45.06µs  min=6.17µs  med=17.92µs  max=113.41ms p(90)=24.17µs p(95)=29.6µs   p(99.9)=3.38ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=963.74ms min=6.13ms  med=850.71ms max=18.07s   p(90)=1.71s   p(95)=1.92s    p(99.9)=17.07s  
     http_reqs......................: 14757   216.360529/s
     iteration_duration.............: avg=1.03s    min=51.83ms med=928.03ms max=18.07s   p(90)=1.74s   p(95)=1.93s    p(99.9)=17.13s  
     iterations.....................: 13757   201.698977/s
     success_rate...................: 100.00% ✓ 13757      ✗ 0    
     vus............................: 70      min=0        max=499
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-gateway (rust subgraphs) (2.14.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 41478      ✗ 0    
     data_received..................: 1.3 GB  18 MB/s
     data_sent......................: 18 MB   244 kB/s
     http_req_blocked...............: avg=15.27µs  min=1.23µs  med=3.43µs   max=37.03ms  p(90)=5.09µs   p(95)=6.7µs    p(99.9)=1.52ms
     http_req_connecting............: avg=9.97µs   min=0s      med=0s       max=36.98ms  p(90)=0s       p(95)=0s       p(99.9)=1.45ms
     http_req_duration..............: avg=466.27ms min=8.59ms  med=509.28ms max=1.44s    p(90)=813.11ms p(95)=855.09ms p(99.9)=1.19s 
       { expected_response:true }...: avg=466.27ms min=8.59ms  med=509.28ms max=1.44s    p(90)=813.11ms p(95)=855.09ms p(99.9)=1.19s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 14826
     http_req_receiving.............: avg=100.29µs min=33.79µs med=91.18µs  max=21.12ms  p(90)=131.65µs p(95)=144.72µs p(99.9)=1.16ms
     http_req_sending...............: avg=38.36µs  min=6.07µs  med=16.97µs  max=121.81ms p(90)=23.35µs  p(95)=28.42µs  p(99.9)=2.62ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=466.13ms min=8.47ms  med=509.11ms max=1.44s    p(90)=812.96ms p(95)=854.97ms p(99.9)=1.19s 
     http_reqs......................: 14826   198.91523/s
     iteration_duration.............: avg=499.93ms min=15.2ms  med=540.56ms max=1.45s    p(90)=818.04ms p(95)=860.44ms p(99.9)=1.2s  
     iterations.....................: 13826   185.498581/s
     success_rate...................: 100.00% ✓ 13826      ✗ 0    
     vus............................: 65      min=0        max=498
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.72)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 397248      ✗ 0     
     data_received..................: 12 GB   187 MB/s
     data_sent......................: 160 MB  2.6 MB/s
     http_req_blocked...............: avg=17.37µs  min=1.01µs  med=2.41µs   max=64ms     p(90)=3.95µs   p(95)=5.06µs   p(99.9)=1.92ms  
     http_req_connecting............: avg=14.15µs  min=0s      med=0s       max=63.85ms  p(90)=0s       p(95)=0s       p(99.9)=1.66ms  
     http_req_duration..............: avg=106.63ms min=1.75ms  med=101.5ms  max=402.85ms p(90)=204.94ms p(95)=222.93ms p(99.9)=272.41ms
       { expected_response:true }...: avg=106.63ms min=1.75ms  med=101.5ms  max=402.85ms p(90)=204.94ms p(95)=222.93ms p(99.9)=272.41ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 133416
     http_req_receiving.............: avg=154.83µs min=29.76µs med=60.95µs  max=74.79ms  p(90)=167.1µs  p(95)=408.05µs p(99.9)=13.8ms  
     http_req_sending...............: avg=72.8µs   min=5.52µs  med=10.9µs   max=339.91ms p(90)=19.98µs  p(95)=136.49µs p(99.9)=8.87ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=106.41ms min=1.68ms  med=101.33ms max=402.29ms p(90)=204.65ms p(95)=222.61ms p(99.9)=271.92ms
     http_reqs......................: 133416  2142.473813/s
     iteration_duration.............: avg=107.7ms  min=4.43ms  med=102.74ms max=411.63ms p(90)=205.5ms  p(95)=223.41ms p(99.9)=273.17ms
     iterations.....................: 132416  2126.415216/s
     success_rate...................: 100.00% ✓ 132416      ✗ 0     
     vus............................: 70      min=0         max=495 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.4.0-p.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 373179      ✗ 0     
     data_received..................: 11 GB   177 MB/s
     data_sent......................: 151 MB  2.4 MB/s
     http_req_blocked...............: avg=17.72µs  min=981ns   med=2.66µs   max=69.18ms  p(90)=4.7µs    p(95)=6.01µs   p(99.9)=2.21ms  
     http_req_connecting............: avg=14.21µs  min=0s      med=0s       max=69.12ms  p(90)=0s       p(95)=0s       p(99.9)=2.13ms  
     http_req_duration..............: avg=113.46ms min=1.67ms  med=106.94ms max=516.25ms p(90)=216.79ms p(95)=239.19ms p(99.9)=354.61ms
       { expected_response:true }...: avg=113.46ms min=1.67ms  med=106.94ms max=516.25ms p(90)=216.79ms p(95)=239.19ms p(99.9)=354.61ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 125393
     http_req_receiving.............: avg=1.64ms   min=53.26µs med=308.31µs max=201.15ms p(90)=3.02ms   p(95)=5.9ms    p(99.9)=77.35ms 
     http_req_sending...............: avg=72.38µs  min=5.4µs   med=10.61µs  max=208.83ms p(90)=22.12µs  p(95)=129.82µs p(99.9)=9.06ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=111.74ms min=1.58ms  med=105.32ms max=515.12ms p(90)=214.45ms p(95)=236.37ms p(99.9)=343.33ms
     http_reqs......................: 125393  2019.464746/s
     iteration_duration.............: avg=114.68ms min=2.29ms  med=108.41ms max=516.57ms p(90)=217.44ms p(95)=239.84ms p(99.9)=358.18ms
     iterations.....................: 124393  2003.359663/s
     success_rate...................: 100.00% ✓ 124393      ✗ 0     
     vus............................: 61      min=0         max=497 
     vus_max........................: 500     min=500       max=500
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

     checks.........................: 100.00% ✓ 352662      ✗ 0     
     data_received..................: 10 GB   167 MB/s
     data_sent......................: 142 MB  2.3 MB/s
     http_req_blocked...............: avg=16.16µs  min=961ns   med=2.32µs   max=69.87ms  p(90)=4.06µs   p(95)=5.25µs   p(99.9)=2.09ms  
     http_req_connecting............: avg=13.16µs  min=0s      med=0s       max=69.69ms  p(90)=0s       p(95)=0s       p(99.9)=2.05ms  
     http_req_duration..............: avg=120.05ms min=1.81ms  med=107.51ms max=874.45ms p(90)=237.15ms p(95)=273.68ms p(99.9)=542.03ms
       { expected_response:true }...: avg=120.05ms min=1.81ms  med=107.51ms max=874.45ms p(90)=237.15ms p(95)=273.68ms p(99.9)=542.03ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 118554
     http_req_receiving.............: avg=3.34ms   min=53.73µs med=160.95µs max=504.74ms p(90)=4.5ms    p(95)=12.33ms  p(99.9)=150.01ms
     http_req_sending...............: avg=64.34µs  min=5.48µs  med=10.13µs  max=239.53ms p(90)=19.93µs  p(95)=116.75µs p(99.9)=8.96ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=116.64ms min=1.72ms  med=105.18ms max=845.86ms p(90)=230.97ms p(95)=263.45ms p(99.9)=526.43ms
     http_reqs......................: 118554  1904.11078/s
     iteration_duration.............: avg=121.38ms min=2.98ms  med=109.01ms max=874.64ms p(90)=237.96ms p(95)=274.57ms p(99.9)=543.03ms
     iterations.....................: 117554  1888.049653/s
     success_rate...................: 100.00% ✓ 117554      ✗ 0     
     vus............................: 69      min=0         max=495 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (.net subgraphs) (0.326.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 192471      ✗ 0    
     data_received..................: 5.7 GB  91 MB/s
     data_sent......................: 78 MB   1.2 MB/s
     http_req_blocked...............: avg=7.34µs   min=1.07µs  med=2.89µs   max=22.88ms  p(90)=4.76µs   p(95)=5.78µs   p(99.9)=924.89µs
     http_req_connecting............: avg=3.68µs   min=0s      med=0s       max=22.72ms  p(90)=0s       p(95)=0s       p(99.9)=852.33µs
     http_req_duration..............: avg=219.15ms min=2.18ms  med=218.25ms max=569.76ms p(90)=405.71ms p(95)=433.9ms  p(99.9)=525.72ms
       { expected_response:true }...: avg=219.15ms min=2.18ms  med=218.25ms max=569.76ms p(90)=405.71ms p(95)=433.9ms  p(99.9)=525.72ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 65157
     http_req_receiving.............: avg=90.84µs  min=30.19µs med=73.25µs  max=207.66ms p(90)=113.55µs p(95)=129.65µs p(99.9)=1.61ms  
     http_req_sending...............: avg=35.82µs  min=5.65µs  med=12.44µs  max=152.55ms p(90)=19.56µs  p(95)=23.39µs  p(99.9)=3.75ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=219.02ms min=2.11ms  med=218.1ms  max=569.67ms p(90)=405.58ms p(95)=433.78ms p(99.9)=525.58ms
     http_reqs......................: 65157   1037.654931/s
     iteration_duration.............: avg=222.81ms min=6.84ms  med=222.67ms max=569.92ms p(90)=406.51ms p(95)=434.75ms p(99.9)=525.99ms
     iterations.....................: 64157   1021.729475/s
     success_rate...................: 100.00% ✓ 64157       ✗ 0    
     vus............................: 94      min=0         max=500
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (.net subgraphs) (2.9.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 90423      ✗ 0    
     data_received..................: 2.7 GB  42 MB/s
     data_sent......................: 37 MB   573 kB/s
     http_req_blocked...............: avg=10.62µs  min=1.2µs   med=2.9µs    max=29.15ms  p(90)=4.69µs   p(95)=5.71µs   p(99.9)=1.26ms
     http_req_connecting............: avg=6.61µs   min=0s      med=0s       max=29.08ms  p(90)=0s       p(95)=0s       p(99.9)=1.17ms
     http_req_duration..............: avg=461.37ms min=4.04ms  med=431.12ms max=1.95s    p(90)=907.24ms p(95)=988.75ms p(99.9)=1.47s 
       { expected_response:true }...: avg=461.37ms min=4.04ms  med=431.12ms max=1.95s    p(90)=907.24ms p(95)=988.75ms p(99.9)=1.47s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 31141
     http_req_receiving.............: avg=90.3µs   min=33.4µs  med=79.46µs  max=15.82ms  p(90)=117.4µs  p(95)=132.76µs p(99.9)=1ms   
     http_req_sending...............: avg=35.2µs   min=5.65µs  med=13.62µs  max=145.94ms p(90)=21.41µs  p(95)=25.02µs  p(99.9)=2.99ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=461.25ms min=3.98ms  med=431.05ms max=1.95s    p(90)=907.11ms p(95)=988.65ms p(99.9)=1.47s 
     http_reqs......................: 31141   477.150154/s
     iteration_duration.............: avg=476.89ms min=31.75ms med=450.63ms max=1.95s    p(90)=911.72ms p(95)=992.77ms p(99.9)=1.47s 
     iterations.....................: 30141   461.827905/s
     success_rate...................: 100.00% ✓ 30141      ✗ 0    
     vus............................: 71      min=0        max=496
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (.net subgraphs) (2.9.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 41982      ✗ 0    
     data_received..................: 1.3 GB  19 MB/s
     data_sent......................: 18 MB   263 kB/s
     http_req_blocked...............: avg=15.31µs  min=1.26µs  med=3.82µs   max=7.27ms  p(90)=5.84µs   p(95)=7.89µs   p(99.9)=2.35ms
     http_req_connecting............: avg=9.36µs   min=0s      med=0s       max=7.2ms   p(90)=0s       p(95)=0s       p(99.9)=2.31ms
     http_req_duration..............: avg=973.46ms min=6.44ms  med=874.73ms max=5.72s   p(90)=1.94s    p(95)=2.18s    p(99.9)=5.26s 
       { expected_response:true }...: avg=973.46ms min=6.44ms  med=874.73ms max=5.72s   p(90)=1.94s    p(95)=2.18s    p(99.9)=5.26s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 14994
     http_req_receiving.............: avg=109.36µs min=33.57µs med=102.54µs max=7.35ms  p(90)=142.08µs p(95)=155.63µs p(99.9)=1.17ms
     http_req_sending...............: avg=30.98µs  min=6.27µs  med=19.09µs  max=10.14ms p(90)=25.55µs  p(95)=30.46µs  p(99.9)=3.63ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=973.32ms min=6.29ms  med=874.6ms  max=5.72s   p(90)=1.94s    p(95)=2.18s    p(99.9)=5.26s 
     http_reqs......................: 14994   219.116267/s
     iteration_duration.............: avg=1.04s    min=37.11ms med=963.72ms max=5.72s   p(90)=1.96s    p(95)=2.19s    p(99.9)=5.27s 
     iterations.....................: 13994   204.502671/s
     success_rate...................: 100.00% ✓ 13994      ✗ 0    
     vus............................: 73      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-gateway (.net subgraphs) (2.14.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 40812      ✗ 0    
     data_received..................: 1.3 GB  18 MB/s
     data_sent......................: 18 MB   250 kB/s
     http_req_blocked...............: avg=18.07µs  min=1.19µs  med=3.67µs   max=31.59ms p(90)=5.55µs   p(95)=7.13µs   p(99.9)=2.89ms  
     http_req_connecting............: avg=12.16µs  min=0s      med=0s       max=31.53ms p(90)=0s       p(95)=0s       p(99.9)=2.76ms  
     http_req_duration..............: avg=997.79ms min=8.7ms   med=904.18ms max=4.09s   p(90)=2.06s    p(95)=2.14s    p(99.9)=3.63s   
       { expected_response:true }...: avg=997.79ms min=8.7ms   med=904.18ms max=4.09s   p(90)=2.06s    p(95)=2.14s    p(99.9)=3.63s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 14604
     http_req_receiving.............: avg=105.05µs min=34.85µs med=99.27µs  max=7.1ms   p(90)=139.53µs p(95)=152.41µs p(99.9)=939.29µs
     http_req_sending...............: avg=34.02µs  min=6.34µs  med=18.75µs  max=42.56ms p(90)=24.95µs  p(95)=30.14µs  p(99.9)=3.25ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=997.65ms min=8.6ms   med=904.05ms max=4.09s   p(90)=2.06s    p(95)=2.14s    p(99.9)=3.63s   
     http_reqs......................: 14604   208.632175/s
     iteration_duration.............: avg=1.07s    min=36.78ms med=1s       max=4.09s   p(90)=2.07s    p(95)=2.15s    p(99.9)=3.65s   
     iterations.....................: 13604   194.346214/s
     success_rate...................: 100.00% ✓ 13604      ✗ 0    
     vus............................: 52      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-181-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

