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
| hive-router | v0.0.72 | 2,839 | 2,940 | 2,800 | 1.7% |  |
| fusion-nightly | 16.3.0-p.1 | 2,119 | 2,160 | 2,102 | 1.0% |  |
| fusion | 16.2.1 | 1,988 | 2,063 | 1,978 | 1.6% |  |
| cosmo | 0.324.0 | 1,112 | 1,138 | 1,101 | 1.0% |  |
| hive-gateway-router-runtime | 2.9.0 | 514 | 520 | 506 | 0.9% |  |
| hive-gateway | 2.9.0 | 221 | 222 | 219 | 0.6% |  |
| apollo-gateway | 2.14.1 | 202 | 206 | 200 | 0.9% |  |
| apollo-router | v2.15.1 | — | — | — | — | non-compatible response (9363 across 9/9 runs) |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (457397 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.72 | 2,139 | 2,221 | 2,108 | 1.7% | non-compatible response (6 across 1/9 runs) |
| fusion-nightly | 16.3.0-p.1 | 1,959 | 2,002 | 1,938 | 1.1% |  |
| fusion | 16.2.1 | 1,906 | 1,954 | 1,887 | 1.1% |  |
| cosmo | 0.324.0 | 1,053 | 1,070 | 1,043 | 0.8% |  |
| hive-gateway-router-runtime | 2.9.0 | 490 | 499 | 485 | 0.9% |  |
| hive-gateway | 2.9.0 | 225 | 227 | 223 | 0.8% |  |
| apollo-gateway | 2.14.1 | 205 | 209 | 203 | 0.9% |  |
| apollo-router | v2.15.1 | — | — | — | — | non-compatible response (29533 across 9/9 runs) |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (239469 across 9/9 runs) |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.72)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 523803      ✗ 0     
     data_received..................: 15 GB   249 MB/s
     data_sent......................: 211 MB  3.4 MB/s
     http_req_blocked...............: avg=39.68µs  min=1.11µs  med=2.9µs   max=85.92ms  p(90)=4.68µs   p(95)=5.93µs   p(99.9)=9.79ms  
     http_req_connecting............: avg=35.68µs  min=0s      med=0s      max=85.67ms  p(90)=0s       p(95)=0s       p(99.9)=9.55ms  
     http_req_duration..............: avg=80.71ms  min=1.56ms  med=72.39ms max=339.08ms p(90)=160.3ms  p(95)=183.87ms p(99.9)=256.27ms
       { expected_response:true }...: avg=80.71ms  min=1.56ms  med=72.39ms max=339.08ms p(90)=160.3ms  p(95)=183.87ms p(99.9)=256.27ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 175601
     http_req_receiving.............: avg=674.57µs min=28.71µs med=58.74µs max=137.5ms  p(90)=274.52µs p(95)=463.97µs p(99.9)=72.55ms 
     http_req_sending...............: avg=111.75µs min=5.1µs   med=10.87µs max=160.08ms p(90)=21.07µs  p(95)=144.52µs p(99.9)=18.24ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=79.92ms  min=1.5ms   med=71.95ms max=318.2ms  p(90)=158.63ms p(95)=180.14ms p(99.9)=248ms   
     http_reqs......................: 175601  2839.984627/s
     iteration_duration.............: avg=81.65ms  min=2.33ms  med=73.3ms  max=355.36ms p(90)=161.16ms p(95)=184.98ms p(99.9)=262.98ms
     iterations.....................: 174601  2823.811686/s
     success_rate...................: 100.00% ✓ 174601      ✗ 0     
     vus............................: 95      min=0         max=500 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (rust subgraphs) (16.3.0-p.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 394857      ✗ 0     
     data_received..................: 12 GB   186 MB/s
     data_sent......................: 159 MB  2.5 MB/s
     http_req_blocked...............: avg=18.56µs  min=1.07µs  med=2.66µs   max=64.07ms  p(90)=4.28µs   p(95)=5.51µs   p(99.9)=1.4ms   
     http_req_connecting............: avg=15.21µs  min=0s      med=0s       max=64ms     p(90)=0s       p(95)=0s       p(99.9)=1.32ms  
     http_req_duration..............: avg=107.28ms min=2.26ms  med=99.34ms  max=746.39ms p(90)=208.41ms p(95)=233.34ms p(99.9)=400.23ms
       { expected_response:true }...: avg=107.28ms min=2.26ms  med=99.34ms  max=746.39ms p(90)=208.41ms p(95)=233.34ms p(99.9)=400.23ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 132619
     http_req_receiving.............: avg=1.76ms   min=52.86µs med=247.31µs max=215.75ms p(90)=2.93ms   p(95)=6.28ms   p(99.9)=85.46ms 
     http_req_sending...............: avg=76.39µs  min=5.43µs  med=10.48µs  max=179ms    p(90)=19.83µs  p(95)=126.3µs  p(99.9)=10.48ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=105.44ms min=2.18ms  med=97.54ms  max=746.31ms p(90)=206ms    p(95)=229.78ms p(99.9)=398.7ms 
     http_reqs......................: 132619  2119.81938/s
     iteration_duration.............: avg=108.37ms min=3.52ms  med=100.59ms max=746.57ms p(90)=209.04ms p(95)=234ms    p(99.9)=400.61ms
     iterations.....................: 131619  2103.835099/s
     success_rate...................: 100.00% ✓ 131619      ✗ 0     
     vus............................: 84      min=0         max=491 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (rust subgraphs) (16.2.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 370965      ✗ 0     
     data_received..................: 11 GB   174 MB/s
     data_sent......................: 150 MB  2.4 MB/s
     http_req_blocked...............: avg=19.36µs  min=1µs     med=2.65µs   max=97.34ms  p(90)=4.19µs   p(95)=5.21µs   p(99.9)=2.26ms  
     http_req_connecting............: avg=15.76µs  min=0s      med=0s       max=94.48ms  p(90)=0s       p(95)=0s       p(99.9)=2.17ms  
     http_req_duration..............: avg=114.17ms min=2.38ms  med=96.66ms  max=1.24s    p(90)=232.93ms p(95)=285.13ms p(99.9)=918.2ms 
       { expected_response:true }...: avg=114.17ms min=2.38ms  med=96.66ms  max=1.24s    p(90)=232.93ms p(95)=285.13ms p(99.9)=918.2ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 124655
     http_req_receiving.............: avg=4.27ms   min=53.65µs med=150.99µs max=1.03s    p(90)=5.38ms   p(95)=17.34ms  p(99.9)=173.54ms
     http_req_sending...............: avg=72.87µs  min=5.63µs  med=10.28µs  max=138.19ms p(90)=18.66µs  p(95)=117.64µs p(99.9)=10.26ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=109.82ms min=2.25ms  med=94.11ms  max=1.22s    p(90)=223.5ms  p(95)=268.29ms p(99.9)=908.07ms
     http_reqs......................: 124655  1988.648225/s
     iteration_duration.............: avg=115.41ms min=3.56ms  med=98.05ms  max=1.24s    p(90)=233.88ms p(95)=286.24ms p(99.9)=919.14ms
     iterations.....................: 123655  1972.695009/s
     success_rate...................: 100.00% ✓ 123655      ✗ 0     
     vus............................: 91      min=0         max=497 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (rust subgraphs) (0.324.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 205740      ✗ 0    
     data_received..................: 6.1 GB  98 MB/s
     data_sent......................: 84 MB   1.3 MB/s
     http_req_blocked...............: avg=7.65µs   min=1.12µs  med=2.77µs   max=10.59ms  p(90)=4.48µs   p(95)=5.48µs   p(99.9)=683.59µs
     http_req_connecting............: avg=4.05µs   min=0s      med=0s       max=10.53ms  p(90)=0s       p(95)=0s       p(99.9)=517µs   
     http_req_duration..............: avg=205.15ms min=2.1ms   med=206.75ms max=629.42ms p(90)=378.14ms p(95)=405.47ms p(99.9)=530.8ms 
       { expected_response:true }...: avg=205.15ms min=2.1ms   med=206.75ms max=629.42ms p(90)=378.14ms p(95)=405.47ms p(99.9)=530.8ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 69580
     http_req_receiving.............: avg=128.11µs min=30.25µs med=67.36µs  max=181.43ms p(90)=104.41µs p(95)=120.81µs p(99.9)=2.87ms  
     http_req_sending...............: avg=29.7µs   min=5.65µs  med=11.53µs  max=22.92ms  p(90)=18.14µs  p(95)=22.02µs  p(99.9)=3.89ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=204.99ms min=2.01ms  med=206.51ms max=629.36ms p(90)=378.04ms p(95)=405.37ms p(99.9)=530.73ms
     http_reqs......................: 69580   1112.497624/s
     iteration_duration.............: avg=208.39ms min=4.93ms  med=210.14ms max=629.57ms p(90)=379.06ms p(95)=406.22ms p(99.9)=531.5ms 
     iterations.....................: 68580   1096.508869/s
     success_rate...................: 100.00% ✓ 68580       ✗ 0    
     vus............................: 82      min=0         max=495
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

     checks.........................: 100.00% ✓ 96867      ✗ 0    
     data_received..................: 2.9 GB  45 MB/s
     data_sent......................: 40 MB   617 kB/s
     http_req_blocked...............: avg=10.06µs  min=1.14µs  med=3.06µs   max=19.24ms  p(90)=4.87µs   p(95)=5.97µs   p(99.9)=1.81ms
     http_req_connecting............: avg=5.9µs    min=0s      med=0s       max=19.19ms  p(90)=0s       p(95)=0s       p(99.9)=1.74ms
     http_req_duration..............: avg=431.23ms min=3.87ms  med=402.27ms max=1.93s    p(90)=845.61ms p(95)=920.08ms p(99.9)=1.39s 
       { expected_response:true }...: avg=431.23ms min=3.87ms  med=402.27ms max=1.93s    p(90)=845.61ms p(95)=920.08ms p(99.9)=1.39s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 33289
     http_req_receiving.............: avg=91.91µs  min=32.73µs med=76.71µs  max=109.15ms p(90)=113.21µs p(95)=126.83µs p(99.9)=1.11ms
     http_req_sending...............: avg=27.15µs  min=6.04µs  med=13.49µs  max=21.08ms  p(90)=21.07µs  p(95)=24.63µs  p(99.9)=3.49ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=431.11ms min=3.8ms   med=402.19ms max=1.93s    p(90)=845.49ms p(95)=919.95ms p(99.9)=1.39s 
     http_reqs......................: 33289   514.156481/s
     iteration_duration.............: avg=444.81ms min=19.02ms med=418.89ms max=1.94s    p(90)=849.44ms p(95)=923.41ms p(99.9)=1.4s  
     iterations.....................: 32289   498.711245/s
     success_rate...................: 100.00% ✓ 32289      ✗ 0    
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

     checks.........................: 100.00% ✓ 42669      ✗ 0    
     data_received..................: 1.3 GB  19 MB/s
     data_sent......................: 18 MB   267 kB/s
     http_req_blocked...............: avg=14.43µs  min=1.2µs   med=3.87µs   max=25.73ms p(90)=5.84µs   p(95)=7.88µs   p(99.9)=1.4ms   
     http_req_connecting............: avg=8.57µs   min=0s      med=0s       max=25.66ms p(90)=0s       p(95)=0s       p(99.9)=1.33ms  
     http_req_duration..............: avg=934.5ms  min=6.46ms  med=842.33ms max=16.37s  p(90)=1.71s    p(95)=1.87s    p(99.9)=14.23s  
       { expected_response:true }...: avg=934.5ms  min=6.46ms  med=842.33ms max=16.37s  p(90)=1.71s    p(95)=1.87s    p(99.9)=14.23s  
     http_req_failed................: 0.00%   ✓ 0          ✗ 15223
     http_req_receiving.............: avg=106.26µs min=33.14µs med=101.84µs max=4.71ms  p(90)=140.61µs p(95)=154.03µs p(99.9)=669.81µs
     http_req_sending...............: avg=34.67µs  min=6.05µs  med=18.51µs  max=49.11ms p(90)=24.61µs  p(95)=30.17µs  p(99.9)=3.65ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=934.36ms min=6.34ms  med=842.2ms  max=16.37s  p(90)=1.71s    p(95)=1.87s    p(99.9)=14.23s  
     http_reqs......................: 15223   221.386838/s
     iteration_duration.............: avg=1s       min=47.85ms med=919.59ms max=16.37s  p(90)=1.76s    p(95)=1.89s    p(99.9)=15s     
     iterations.....................: 14223   206.84392/s
     success_rate...................: 100.00% ✓ 14223      ✗ 0    
     vus............................: 97      min=0        max=500
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

     checks.........................: 100.00% ✓ 42234      ✗ 0    
     data_received..................: 1.3 GB  18 MB/s
     data_sent......................: 19 MB   249 kB/s
     http_req_blocked...............: avg=16.42µs  min=1.34µs  med=3.52µs   max=27.64ms  p(90)=5.22µs   p(95)=6.68µs   p(99.9)=1.98ms
     http_req_connecting............: avg=11.17µs  min=0s      med=0s       max=27.58ms  p(90)=0s       p(95)=0s       p(99.9)=1.91ms
     http_req_duration..............: avg=473.66ms min=8.61ms  med=520.26ms max=1.39s    p(90)=868.75ms p(95)=910.85ms p(99.9)=1.26s 
       { expected_response:true }...: avg=473.66ms min=8.61ms  med=520.26ms max=1.39s    p(90)=868.75ms p(95)=910.85ms p(99.9)=1.26s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 15078
     http_req_receiving.............: avg=130.19µs min=32.86µs med=93µs     max=165.67ms p(90)=133.41µs p(95)=146.31µs p(99.9)=1.07ms
     http_req_sending...............: avg=41.82µs  min=6.09µs  med=17.21µs  max=89.22ms  p(90)=23.36µs  p(95)=28.25µs  p(99.9)=3.5ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=473.49ms min=8.51ms  med=520.16ms max=1.39s    p(90)=868.64ms p(95)=910.61ms p(99.9)=1.26s 
     http_reqs......................: 15078   202.518024/s
     iteration_duration.............: avg=507.23ms min=9.25ms  med=543.84ms max=1.4s     p(90)=874.39ms p(95)=913.61ms p(99.9)=1.27s 
     iterations.....................: 14078   189.086666/s
     success_rate...................: 100.00% ✓ 14078      ✗ 0    
     vus............................: 66      min=0        max=497
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

     checks.........................: 100.00% ✓ 396276      ✗ 0     
     data_received..................: 12 GB   187 MB/s
     data_sent......................: 160 MB  2.6 MB/s
     http_req_blocked...............: avg=20.14µs  min=1.02µs  med=2.98µs   max=53.96ms  p(90)=4.73µs   p(95)=6µs      p(99.9)=1.62ms  
     http_req_connecting............: avg=16.29µs  min=0s      med=0s       max=53.89ms  p(90)=0s       p(95)=0s       p(99.9)=1.47ms  
     http_req_duration..............: avg=106.88ms min=1.64ms  med=101.16ms max=314.17ms p(90)=206.76ms p(95)=223.89ms p(99.9)=269.33ms
       { expected_response:true }...: avg=106.88ms min=1.64ms  med=101.16ms max=314.17ms p(90)=206.76ms p(95)=223.89ms p(99.9)=269.33ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 133092
     http_req_receiving.............: avg=210.02µs min=29.61µs med=65.12µs  max=162.73ms p(90)=173.37µs p(95)=428.31µs p(99.9)=25.53ms 
     http_req_sending...............: avg=77.96µs  min=5.42µs  med=11.89µs  max=153.32ms p(90)=22.21µs  p(95)=142.58µs p(99.9)=10.08ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=106.59ms min=1.59ms  med=100.91ms max=304.64ms p(90)=206.42ms p(95)=223.5ms  p(99.9)=267.42ms
     http_reqs......................: 133092  2139.653291/s
     iteration_duration.............: avg=107.97ms min=3.73ms  med=102.38ms max=351.96ms p(90)=207.31ms p(95)=224.44ms p(99.9)=270.47ms
     iterations.....................: 132092  2123.576793/s
     success_rate...................: 100.00% ✓ 132092      ✗ 0     
     vus............................: 68      min=0         max=496 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.3.0-p.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 361983      ✗ 0     
     data_received..................: 11 GB   172 MB/s
     data_sent......................: 146 MB  2.4 MB/s
     http_req_blocked...............: avg=18.75µs  min=1.06µs  med=2.92µs   max=86.31ms  p(90)=4.71µs   p(95)=6.03µs   p(99.9)=2.53ms  
     http_req_connecting............: avg=14.57µs  min=0s      med=0s       max=58.1ms   p(90)=0s       p(95)=0s       p(99.9)=2.34ms  
     http_req_duration..............: avg=116.97ms min=1.7ms   med=110.4ms  max=482.45ms p(90)=225.48ms p(95)=247ms    p(99.9)=349.96ms
       { expected_response:true }...: avg=116.97ms min=1.7ms   med=110.4ms  max=482.45ms p(90)=225.48ms p(95)=247ms    p(99.9)=349.96ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 121661
     http_req_receiving.............: avg=1.71ms   min=54.03µs med=320.37µs max=197.11ms p(90)=3.09ms   p(95)=5.95ms   p(99.9)=74.75ms 
     http_req_sending...............: avg=67.35µs  min=5.55µs  med=11.13µs  max=142.94ms p(90)=21.23µs  p(95)=127.08µs p(99.9)=9.16ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=115.19ms min=1.61ms  med=108.56ms max=482.03ms p(90)=223.19ms p(95)=244.22ms p(99.9)=344.35ms
     http_reqs......................: 121661  1959.149487/s
     iteration_duration.............: avg=118.23ms min=3.14ms  med=111.96ms max=482.75ms p(90)=226.09ms p(95)=247.58ms p(99.9)=350.36ms
     iterations.....................: 120661  1943.046138/s
     success_rate...................: 100.00% ✓ 120661      ✗ 0     
     vus............................: 63      min=0         max=497 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (.net subgraphs) (16.2.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 352806      ✗ 0     
     data_received..................: 10 GB   167 MB/s
     data_sent......................: 142 MB  2.3 MB/s
     http_req_blocked...............: avg=23µs     min=1.02µs  med=2.87µs   max=70.87ms  p(90)=4.67µs   p(95)=5.86µs   p(99.9)=5.84ms  
     http_req_connecting............: avg=19.23µs  min=0s      med=0s       max=70.8ms   p(90)=0s       p(95)=0s       p(99.9)=5.69ms  
     http_req_duration..............: avg=120.04ms min=1.78ms  med=111.02ms max=697.67ms p(90)=235.86ms p(95)=273.61ms p(99.9)=503.61ms
       { expected_response:true }...: avg=120.04ms min=1.78ms  med=111.02ms max=697.67ms p(90)=235.86ms p(95)=273.61ms p(99.9)=503.61ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 118602
     http_req_receiving.............: avg=3.06ms   min=53.73µs med=150.06µs max=319.28ms p(90)=3.94ms   p(95)=10.2ms   p(99.9)=176.24ms
     http_req_sending...............: avg=74.32µs  min=5.62µs  med=11.1µs   max=202.86ms p(90)=20.82µs  p(95)=122.78µs p(99.9)=10.01ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=116.9ms  min=1.68ms  med=109.12ms max=696.39ms p(90)=230.09ms p(95)=262.43ms p(99.9)=448.39ms
     http_reqs......................: 118602  1906.750244/s
     iteration_duration.............: avg=121.36ms min=2.84ms  med=112.4ms  max=697.92ms p(90)=236.69ms p(95)=274.54ms p(99.9)=504.82ms
     iterations.....................: 117602  1890.673363/s
     success_rate...................: 100.00% ✓ 117602      ✗ 0     
     vus............................: 67      min=0         max=496 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (.net subgraphs) (0.324.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 195243      ✗ 0    
     data_received..................: 5.8 GB  92 MB/s
     data_sent......................: 79 MB   1.3 MB/s
     http_req_blocked...............: avg=7.19µs   min=1µs     med=2.99µs   max=14.98ms  p(90)=4.83µs   p(95)=5.86µs   p(99.9)=509.66µs
     http_req_connecting............: avg=3.34µs   min=0s      med=0s       max=14.91ms  p(90)=0s       p(95)=0s       p(99.9)=436.47µs
     http_req_duration..............: avg=216.06ms min=2.18ms  med=216.99ms max=658.1ms  p(90)=396.45ms p(95)=427.29ms p(99.9)=565.16ms
       { expected_response:true }...: avg=216.06ms min=2.18ms  med=216.99ms max=658.1ms  p(90)=396.45ms p(95)=427.29ms p(99.9)=565.16ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 66081
     http_req_receiving.............: avg=137.46µs min=30.42µs med=73.27µs  max=226.58ms p(90)=112.78µs p(95)=128.97µs p(99.9)=2.37ms  
     http_req_sending...............: avg=29.31µs  min=5.35µs  med=12.47µs  max=37.38ms  p(90)=19.25µs  p(95)=23.14µs  p(99.9)=3.47ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=215.9ms  min=2.09ms  med=216.75ms max=657.99ms p(90)=396.34ms p(95)=427.18ms p(99.9)=564.39ms
     http_reqs......................: 66081   1053.63972/s
     iteration_duration.............: avg=219.63ms min=4.7ms   med=221.35ms max=658.27ms p(90)=397.49ms p(95)=428.05ms p(99.9)=565.74ms
     iterations.....................: 65081   1037.695051/s
     success_rate...................: 100.00% ✓ 65081       ✗ 0    
     vus............................: 92      min=0         max=497
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

     checks.........................: 100.00% ✓ 92955      ✗ 0    
     data_received..................: 2.8 GB  43 MB/s
     data_sent......................: 38 MB   589 kB/s
     http_req_blocked...............: avg=11.03µs  min=1.19µs  med=3.52µs   max=29.54ms  p(90)=5.41µs   p(95)=6.51µs   p(99.9)=1.85ms  
     http_req_connecting............: avg=6.44µs   min=0s      med=0s       max=29.47ms  p(90)=0s       p(95)=0s       p(99.9)=1.82ms  
     http_req_duration..............: avg=448.85ms min=4.05ms  med=420.47ms max=1.84s    p(90)=874.03ms p(95)=950.44ms p(99.9)=1.44s   
       { expected_response:true }...: avg=448.85ms min=4.05ms  med=420.47ms max=1.84s    p(90)=874.03ms p(95)=950.44ms p(99.9)=1.44s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 31985
     http_req_receiving.............: avg=96.02µs  min=33.48µs med=84.29µs  max=125.26ms p(90)=120.87µs p(95)=136.27µs p(99.9)=848.62µs
     http_req_sending...............: avg=31.14µs  min=6.17µs  med=15.05µs  max=65.45ms  p(90)=22.5µs   p(95)=26.04µs  p(99.9)=3.06ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=448.72ms min=3.97ms  med=420.39ms max=1.84s    p(90)=873.85ms p(95)=950.33ms p(99.9)=1.44s   
     http_reqs......................: 31985   490.958741/s
     iteration_duration.............: avg=463.56ms min=18.07ms med=438.76ms max=1.85s    p(90)=877.43ms p(95)=953.81ms p(99.9)=1.46s   
     iterations.....................: 30985   475.609086/s
     success_rate...................: 100.00% ✓ 30985      ✗ 0    
     vus............................: 66      min=0        max=497
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

     checks.........................: 100.00% ✓ 43278      ✗ 0    
     data_received..................: 1.4 GB  20 MB/s
     data_sent......................: 19 MB   270 kB/s
     http_req_blocked...............: avg=15.59µs  min=1.27µs  med=4.07µs   max=4.02ms  p(90)=6.13µs   p(95)=7.76µs   p(99.9)=2.53ms  
     http_req_connecting............: avg=9.59µs   min=0s      med=0s       max=3.99ms  p(90)=0s       p(95)=0s       p(99.9)=2.5ms   
     http_req_duration..............: avg=944.51ms min=6.53ms  med=842.56ms max=5.19s   p(90)=1.85s    p(95)=2.14s    p(99.9)=4.86s   
       { expected_response:true }...: avg=944.51ms min=6.53ms  med=842.56ms max=5.19s   p(90)=1.85s    p(95)=2.14s    p(99.9)=4.86s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 15426
     http_req_receiving.............: avg=109.82µs min=40.68µs med=104.05µs max=14.75ms p(90)=142.72µs p(95)=155.28µs p(99.9)=827.94µs
     http_req_sending...............: avg=31.82µs  min=6.36µs  med=18.97µs  max=26.71ms p(90)=25.32µs  p(95)=30.75µs  p(99.9)=3.88ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=944.37ms min=6.43ms  med=842.42ms max=5.19s   p(90)=1.85s    p(95)=2.14s    p(99.9)=4.86s   
     http_reqs......................: 15426   225.172588/s
     iteration_duration.............: avg=1s       min=43.43ms med=906.23ms max=5.2s    p(90)=1.87s    p(95)=2.16s    p(99.9)=4.87s   
     iterations.....................: 14426   210.575635/s
     success_rate...................: 100.00% ✓ 14426      ✗ 0    
     vus............................: 77      min=0        max=500
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

     checks.........................: 100.00% ✓ 40116      ✗ 0    
     data_received..................: 1.3 GB  18 MB/s
     data_sent......................: 17 MB   247 kB/s
     http_req_blocked...............: avg=17.23µs  min=1.36µs  med=3.78µs   max=6.48ms  p(90)=5.68µs   p(95)=7.77µs   p(99.9)=2.43ms
     http_req_connecting............: avg=11.29µs  min=0s      med=0s       max=6.21ms  p(90)=0s       p(95)=0s       p(99.9)=2.38ms
     http_req_duration..............: avg=1.01s    min=8.69ms  med=931.2ms  max=4.33s   p(90)=2.08s    p(95)=2.18s    p(99.9)=3.96s 
       { expected_response:true }...: avg=1.01s    min=8.69ms  med=931.2ms  max=4.33s   p(90)=2.08s    p(95)=2.18s    p(99.9)=3.96s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 14372
     http_req_receiving.............: avg=109.03µs min=38.68µs med=99.14µs  max=24.59ms p(90)=139.08µs p(95)=151.69µs p(99.9)=1.03ms
     http_req_sending...............: avg=35.71µs  min=6.4µs   med=18.51µs  max=27.44ms p(90)=24.84µs  p(95)=30.46µs  p(99.9)=3.67ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=1.01s    min=8.59ms  med=931.09ms max=4.33s   p(90)=2.08s    p(95)=2.18s    p(99.9)=3.96s 
     http_reqs......................: 14372   205.454529/s
     iteration_duration.............: avg=1.09s    min=48.72ms med=1.01s    max=4.34s   p(90)=2.1s     p(95)=2.19s    p(99.9)=4.01s 
     iterations.....................: 13372   191.159057/s
     success_rate...................: 100.00% ✓ 13372      ✗ 0    
     vus............................: 43      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-181-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

