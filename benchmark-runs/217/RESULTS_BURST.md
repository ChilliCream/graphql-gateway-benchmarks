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
| hive-router | v0.0.65 | 2,770 | 2,889 | 2,723 | 1.8% |  |
| hotchocolate | 16.1.3 | 2,045 | 2,080 | 2,021 | 0.9% |  |
| cosmo | 0.321.1 | 1,127 | 1,141 | 1,114 | 1.2% | non-compatible response (11 across 6/9 runs) |
| hive-gateway-router-runtime | 2.8.2 | 510 | 515 | 506 | 0.6% |  |
| hive-gateway | 2.8.2 | 213 | 216 | 210 | 1.1% |  |
| apollo-gateway | 2.14.1 | 200 | 205 | 198 | 1.1% |  |
| apollo-router | v2.15.0 | — | — | — | — | non-compatible response (8671 across 9/9 runs) |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (469325 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.65 | 2,180 | 2,285 | 2,128 | 2.5% |  |
| hotchocolate | 16.1.3 | 1,882 | 1,926 | 1,855 | 1.4% |  |
| cosmo | 0.321.1 | 1,063 | 1,068 | 1,058 | 0.5% | non-compatible response (15 across 6/9 runs) |
| hive-gateway-router-runtime | 2.8.2 | 494 | 502 | 488 | 1.1% |  |
| hive-gateway | 2.8.2 | 219 | 222 | 216 | 1.0% |  |
| apollo-gateway | 2.14.1 | 206 | 209 | 205 | 0.7% |  |
| apollo-router | v2.15.0 | — | — | — | — | non-compatible response (14953 across 9/9 runs) |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (282995 across 9/9 runs) |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.65)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 511656      ✗ 0     
     data_received..................: 15 GB   243 MB/s
     data_sent......................: 206 MB  3.3 MB/s
     http_req_blocked...............: avg=39.67µs  min=1µs     med=2.62µs  max=87.21ms  p(90)=4.27µs   p(95)=5.4µs    p(99.9)=9.42ms  
     http_req_connecting............: avg=36.23µs  min=0s      med=0s      max=87.13ms  p(90)=0s       p(95)=0s       p(99.9)=9.28ms  
     http_req_duration..............: avg=82.67ms  min=1.65ms  med=74.85ms max=364.73ms p(90)=160.4ms  p(95)=183.16ms p(99.9)=259.17ms
       { expected_response:true }...: avg=82.67ms  min=1.65ms  med=74.85ms max=364.73ms p(90)=160.4ms  p(95)=183.16ms p(99.9)=259.17ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 171552
     http_req_receiving.............: avg=501.53µs min=29.57µs med=57.95µs max=316.11ms p(90)=248.64µs p(95)=440.34µs p(99.9)=60.85ms 
     http_req_sending...............: avg=103.11µs min=5.27µs  med=10.19µs max=156.98ms p(90)=19.89µs  p(95)=139.72µs p(99.9)=17.1ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=82.06ms  min=1.6ms   med=74.46ms max=305.39ms p(90)=159.55ms p(95)=181.26ms p(99.9)=251.17ms
     http_reqs......................: 171552  2770.972783/s
     iteration_duration.............: avg=83.58ms  min=2.65ms  med=75.77ms max=378.95ms p(90)=161.25ms p(95)=184.23ms p(99.9)=262.45ms
     iterations.....................: 170552  2754.820405/s
     success_rate...................: 100.00% ✓ 170552      ✗ 0     
     vus............................: 54      min=0         max=499 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (rust subgraphs) (16.1.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 382443      ✗ 0     
     data_received..................: 11 GB   179 MB/s
     data_sent......................: 154 MB  2.5 MB/s
     http_req_blocked...............: avg=17.93µs  min=1.05µs  med=2.59µs   max=53.92ms  p(90)=3.93µs   p(95)=4.81µs   p(99.9)=1.43ms  
     http_req_connecting............: avg=14.52µs  min=0s      med=0s       max=53.88ms  p(90)=0s       p(95)=0s       p(99.9)=1.34ms  
     http_req_duration..............: avg=110.76ms min=2.37ms  med=100.26ms max=613.5ms  p(90)=216.94ms p(95)=252.12ms p(99.9)=435.52ms
       { expected_response:true }...: avg=110.76ms min=2.37ms  med=100.26ms max=613.5ms  p(90)=216.94ms p(95)=252.12ms p(99.9)=435.52ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 128481
     http_req_receiving.............: avg=2.04ms   min=51.95µs med=118.62µs max=276.95ms p(90)=1.43ms   p(95)=5.3ms    p(99.9)=137.37ms
     http_req_sending...............: avg=67.28µs  min=5.35µs  med=10.03µs  max=172.79ms p(90)=17.68µs  p(95)=124.66µs p(99.9)=8.87ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=108.65ms min=2.29ms  med=99.19ms  max=595.6ms  p(90)=213.05ms p(95)=244.35ms p(99.9)=407.16ms
     http_reqs......................: 128481  2045.897186/s
     iteration_duration.............: avg=111.92ms min=3.49ms  med=101.59ms max=613.7ms  p(90)=217.85ms p(95)=253.03ms p(99.9)=437.55ms
     iterations.....................: 127481  2029.973453/s
     success_rate...................: 100.00% ✓ 127481      ✗ 0     
     vus............................: 93      min=0         max=500 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (rust subgraphs) (0.321.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 208413      ✗ 0    
     data_received..................: 6.2 GB  99 MB/s
     data_sent......................: 85 MB   1.4 MB/s
     http_req_blocked...............: avg=6.11µs   min=1.16µs  med=2.5µs    max=14.07ms  p(90)=3.96µs   p(95)=4.75µs   p(99.9)=527.11µs
     http_req_connecting............: avg=2.91µs   min=0s      med=0s       max=14.01ms  p(90)=0s       p(95)=0s       p(99.9)=473.05µs
     http_req_duration..............: avg=202.53ms min=2.06ms  med=201.29ms max=614.55ms p(90)=376.85ms p(95)=407.45ms p(99.9)=515.43ms
       { expected_response:true }...: avg=202.53ms min=2.06ms  med=201.29ms max=614.55ms p(90)=376.85ms p(95)=407.45ms p(99.9)=515.43ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 70471
     http_req_receiving.............: avg=78.45µs  min=30.07µs med=60.58µs  max=115.11ms p(90)=93.56µs  p(95)=106.64µs p(99.9)=1.52ms  
     http_req_sending...............: avg=31.82µs  min=5.43µs  med=10.65µs  max=230.82ms p(90)=16.19µs  p(95)=19.67µs  p(99.9)=3.73ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=202.42ms min=1.99ms  med=201.15ms max=614.47ms p(90)=376.75ms p(95)=407.35ms p(99.9)=515.36ms
     http_reqs......................: 70471   1127.371444/s
     iteration_duration.............: avg=205.69ms min=4.77ms  med=204.37ms max=614.77ms p(90)=377.87ms p(95)=408.2ms  p(99.9)=516.09ms
     iterations.....................: 69471   1111.373779/s
     success_rate...................: 100.00% ✓ 69471       ✗ 0    
     vus............................: 80      min=0         max=493
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (rust subgraphs) (2.8.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 96126      ✗ 0    
     data_received..................: 2.9 GB  45 MB/s
     data_sent......................: 40 MB   612 kB/s
     http_req_blocked...............: avg=8.86µs   min=1.23µs  med=2.86µs   max=4.97ms  p(90)=4.59µs   p(95)=5.73µs   p(99.9)=1.58ms  
     http_req_connecting............: avg=4.81µs   min=0s      med=0s       max=3.6ms   p(90)=0s       p(95)=0s       p(99.9)=1.43ms  
     http_req_duration..............: avg=434.49ms min=3.95ms  med=404.28ms max=1.71s   p(90)=861.56ms p(95)=933.75ms p(99.9)=1.4s    
       { expected_response:true }...: avg=434.49ms min=3.95ms  med=404.28ms max=1.71s   p(90)=861.56ms p(95)=933.75ms p(99.9)=1.4s    
     http_req_failed................: 0.00%   ✓ 0          ✗ 33042
     http_req_receiving.............: avg=85.46µs  min=33.33µs med=75.56µs  max=40.62ms p(90)=112.02µs p(95)=125.58µs p(99.9)=933.69µs
     http_req_sending...............: avg=27.52µs  min=5.49µs  med=12.94µs  max=70.72ms p(90)=20.33µs  p(95)=23.81µs  p(99.9)=2.3ms   
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=434.38ms min=3.87ms  med=404.2ms  max=1.71s   p(90)=861.44ms p(95)=933.63ms p(99.9)=1.4s    
     http_reqs......................: 33042   510.057582/s
     iteration_duration.............: avg=448.28ms min=31.64ms med=421.5ms  max=1.71s   p(90)=866.17ms p(95)=936.74ms p(99.9)=1.41s   
     iterations.....................: 32042   494.620938/s
     success_rate...................: 100.00% ✓ 32042      ✗ 0    
     vus............................: 95      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (rust subgraphs) (2.8.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 40731      ✗ 0    
     data_received..................: 1.3 GB  19 MB/s
     data_sent......................: 18 MB   257 kB/s
     http_req_blocked...............: avg=15.91µs  min=1.24µs  med=3.52µs   max=4.29ms  p(90)=5.38µs   p(95)=7.16µs  p(99.9)=2.9ms   
     http_req_connecting............: avg=10.59µs  min=0s      med=0s       max=4.26ms  p(90)=0s       p(95)=0s      p(99.9)=2.87ms  
     http_req_duration..............: avg=978.65ms min=6.53ms  med=849.24ms max=18.86s  p(90)=1.7s     p(95)=1.87s   p(99.9)=16.91s  
       { expected_response:true }...: avg=978.65ms min=6.53ms  med=849.24ms max=18.86s  p(90)=1.7s     p(95)=1.87s   p(99.9)=16.91s  
     http_req_failed................: 0.00%   ✓ 0          ✗ 14577
     http_req_receiving.............: avg=103.48µs min=33.34µs med=93.48µs  max=45.61ms p(90)=131.46µs p(95)=144.3µs p(99.9)=726.79µs
     http_req_sending...............: avg=25.72µs  min=5.81µs  med=17.09µs  max=9.41ms  p(90)=23.79µs  p(95)=28.84µs p(99.9)=1.92ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=978.52ms min=6.41ms  med=849.13ms max=18.86s  p(90)=1.7s     p(95)=1.87s   p(99.9)=16.91s  
     http_reqs......................: 14577   213.005135/s
     iteration_duration.............: avg=1.05s    min=36.93ms med=920.53ms max=18.87s  p(90)=1.73s    p(95)=1.89s   p(99.9)=17.24s  
     iterations.....................: 13577   198.392722/s
     success_rate...................: 100.00% ✓ 13577      ✗ 0    
     vus............................: 78      min=0        max=500
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

     checks.........................: 100.00% ✓ 41781      ✗ 0    
     data_received..................: 1.3 GB  18 MB/s
     data_sent......................: 18 MB   246 kB/s
     http_req_blocked...............: avg=20.19µs  min=1.22µs  med=3.32µs   max=46.99ms  p(90)=4.98µs   p(95)=6.51µs   p(99.9)=2.83ms  
     http_req_connecting............: avg=15.27µs  min=0s      med=0s       max=46.93ms  p(90)=0s       p(95)=0s       p(99.9)=2.81ms  
     http_req_duration..............: avg=502.64ms min=8.56ms  med=550.51ms max=1.45s    p(90)=909.57ms p(95)=959.75ms p(99.9)=1.32s   
       { expected_response:true }...: avg=502.64ms min=8.56ms  med=550.51ms max=1.45s    p(90)=909.57ms p(95)=959.75ms p(99.9)=1.32s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 14927
     http_req_receiving.............: avg=108.79µs min=35.85µs med=87.67µs  max=90.08ms  p(90)=128.36µs p(95)=142.04µs p(99.9)=889.87µs
     http_req_sending...............: avg=33.36µs  min=6.18µs  med=15.7µs   max=100.65ms p(90)=22.13µs  p(95)=27.24µs  p(99.9)=1.78ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=502.49ms min=8.48ms  med=550.44ms max=1.45s    p(90)=909.47ms p(95)=959.65ms p(99.9)=1.32s   
     http_reqs......................: 14927   200.413402/s
     iteration_duration.............: avg=538.59ms min=9.36ms  med=587.65ms max=1.46s    p(90)=917.93ms p(95)=965.73ms p(99.9)=1.34s   
     iterations.....................: 13927   186.987168/s
     success_rate...................: 100.00% ✓ 13927      ✗ 0    
     vus............................: 68      min=0        max=499
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.65)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 402702      ✗ 0     
     data_received..................: 12 GB   191 MB/s
     data_sent......................: 162 MB  2.6 MB/s
     http_req_blocked...............: avg=22.02µs  min=1.07µs  med=2.85µs  max=58.77ms  p(90)=4.58µs   p(95)=5.84µs   p(99.9)=2.99ms  
     http_req_connecting............: avg=18.15µs  min=0s      med=0s      max=58.71ms  p(90)=0s       p(95)=0s       p(99.9)=2.8ms   
     http_req_duration..............: avg=105.16ms min=1.61ms  med=99.81ms max=400.48ms p(90)=202.7ms  p(95)=220.19ms p(99.9)=274.72ms
       { expected_response:true }...: avg=105.16ms min=1.61ms  med=99.81ms max=400.48ms p(90)=202.7ms  p(95)=220.19ms p(99.9)=274.72ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 135234
     http_req_receiving.............: avg=262.58µs min=30.25µs med=63.54µs max=245.28ms p(90)=191.55µs p(95)=434.52µs p(99.9)=30.2ms  
     http_req_sending...............: avg=82.76µs  min=5.36µs  med=11.5µs  max=265ms    p(90)=21.75µs  p(95)=142.44µs p(99.9)=10.92ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=104.82ms min=1.56ms  med=99.55ms max=330.55ms p(90)=202.16ms p(95)=219.55ms p(99.9)=270.95ms
     http_reqs......................: 135234  2180.190575/s
     iteration_duration.............: avg=106.24ms min=2.84ms  med=101ms   max=417.91ms p(90)=203.31ms p(95)=220.77ms p(99.9)=277.05ms
     iterations.....................: 134234  2164.068959/s
     success_rate...................: 100.00% ✓ 134234      ✗ 0     
     vus............................: 58      min=0         max=498 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (.net subgraphs) (16.1.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 348759      ✗ 0     
     data_received..................: 10 GB   165 MB/s
     data_sent......................: 141 MB  2.3 MB/s
     http_req_blocked...............: avg=15.63µs  min=1.05µs  med=2.74µs   max=64.1ms   p(90)=4.27µs   p(95)=5.34µs   p(99.9)=1.8ms   
     http_req_connecting............: avg=12.03µs  min=0s      med=0s       max=63.9ms   p(90)=0s       p(95)=0s       p(99.9)=1.71ms  
     http_req_duration..............: avg=121.39ms min=1.81ms  med=106.56ms max=1.6s     p(90)=233.22ms p(95)=270.21ms p(99.9)=1.23s   
       { expected_response:true }...: avg=121.39ms min=1.81ms  med=106.56ms max=1.6s     p(90)=233.22ms p(95)=270.21ms p(99.9)=1.23s   
     http_req_failed................: 0.00%   ✓ 0           ✗ 117253
     http_req_receiving.............: avg=1.98ms   min=53.96µs med=117.96µs max=315.7ms  p(90)=1.72ms   p(95)=5.29ms   p(99.9)=143.76ms
     http_req_sending...............: avg=64.11µs  min=5.38µs  med=10.7µs   max=199.37ms p(90)=19.07µs  p(95)=123.99µs p(99.9)=8.65ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=119.34ms min=1.73ms  med=105.35ms max=1.59s    p(90)=229.76ms p(95)=263.27ms p(99.9)=1.23s   
     http_reqs......................: 117253  1882.378871/s
     iteration_duration.............: avg=122.74ms min=3.24ms  med=108.07ms max=1.6s     p(90)=234.07ms p(95)=271.09ms p(99.9)=1.24s   
     iterations.....................: 116253  1866.324877/s
     success_rate...................: 100.00% ✓ 116253      ✗ 0     
     vus............................: 70      min=0         max=495 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (.net subgraphs) (0.321.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 197109      ✗ 0    
     data_received..................: 5.8 GB  93 MB/s
     data_sent......................: 80 MB   1.3 MB/s
     http_req_blocked...............: avg=9.95µs   min=1.02µs  med=2.75µs   max=30.43ms  p(90)=4.47µs   p(95)=5.51µs   p(99.9)=683.68µs
     http_req_connecting............: avg=6µs      min=0s      med=0s       max=26.48ms  p(90)=0s       p(95)=0s       p(99.9)=599.16µs
     http_req_duration..............: avg=213.99ms min=2.17ms  med=214.77ms max=625.44ms p(90)=395.8ms  p(95)=427.07ms p(99.9)=533.49ms
       { expected_response:true }...: avg=213.99ms min=2.17ms  med=214.77ms max=625.44ms p(90)=395.8ms  p(95)=427.07ms p(99.9)=533.49ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 66703
     http_req_receiving.............: avg=89.82µs  min=29.78µs med=67.04µs  max=258.91ms p(90)=104.41µs p(95)=119.46µs p(99.9)=1.64ms  
     http_req_sending...............: avg=42.79µs  min=5.4µs   med=11.79µs  max=233.55ms p(90)=18.54µs  p(95)=22.06µs  p(99.9)=4.11ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=213.86ms min=2.09ms  med=214.65ms max=625.29ms p(90)=395.69ms p(95)=426.95ms p(99.9)=533.42ms
     http_reqs......................: 66703   1063.891128/s
     iteration_duration.............: avg=217.52ms min=6.72ms  med=218.28ms max=625.68ms p(90)=396.83ms p(95)=427.99ms p(99.9)=533.92ms
     iterations.....................: 65703   1047.941454/s
     success_rate...................: 100.00% ✓ 65703       ✗ 0    
     vus............................: 89      min=0         max=498
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (.net subgraphs) (2.8.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 93540      ✗ 0    
     data_received..................: 2.8 GB  43 MB/s
     data_sent......................: 39 MB   594 kB/s
     http_req_blocked...............: avg=9.75µs   min=1.27µs  med=3.16µs   max=22.18ms  p(90)=4.98µs   p(95)=5.96µs   p(99.9)=1.1ms   
     http_req_connecting............: avg=5.58µs   min=0s      med=0s       max=22.12ms  p(90)=0s       p(95)=0s       p(99.9)=1.07ms  
     http_req_duration..............: avg=446.42ms min=3.98ms  med=416.6ms  max=2.06s    p(90)=877.53ms p(95)=965.47ms p(99.9)=1.46s   
       { expected_response:true }...: avg=446.42ms min=3.98ms  med=416.6ms  max=2.06s    p(90)=877.53ms p(95)=965.47ms p(99.9)=1.46s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 32180
     http_req_receiving.............: avg=90.06µs  min=34.75µs med=81.87µs  max=20.32ms  p(90)=118.56µs p(95)=132.84µs p(99.9)=859.68µs
     http_req_sending...............: avg=37.64µs  min=5.97µs  med=14.43µs  max=160.19ms p(90)=21.97µs  p(95)=25.38µs  p(99.9)=2.15ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=446.3ms  min=3.93ms  med=416.41ms max=2.06s    p(90)=877.46ms p(95)=965.36ms p(99.9)=1.46s   
     http_reqs......................: 32180   494.76144/s
     iteration_duration.............: avg=460.98ms min=21.28ms med=430.71ms max=2.06s    p(90)=882.01ms p(95)=969.05ms p(99.9)=1.46s   
     iterations.....................: 31180   479.386629/s
     success_rate...................: 100.00% ✓ 31180      ✗ 0    
     vus............................: 59      min=0        max=498
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (.net subgraphs) (2.8.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 42081      ✗ 0    
     data_received..................: 1.3 GB  19 MB/s
     data_sent......................: 18 MB   263 kB/s
     http_req_blocked...............: avg=14.71µs  min=1.37µs  med=3.63µs   max=17.52ms p(90)=5.48µs   p(95)=7.35µs   p(99.9)=1.79ms
     http_req_connecting............: avg=9.29µs   min=0s      med=0s       max=17.43ms p(90)=0s       p(95)=0s       p(99.9)=1.75ms
     http_req_duration..............: avg=972.4ms  min=6.51ms  med=878.06ms max=5.97s   p(90)=1.92s    p(95)=2.18s    p(99.9)=5.22s 
       { expected_response:true }...: avg=972.4ms  min=6.51ms  med=878.06ms max=5.97s   p(90)=1.92s    p(95)=2.18s    p(99.9)=5.22s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 15027
     http_req_receiving.............: avg=104.96µs min=36.79µs med=96µs     max=20.26ms p(90)=133.35µs p(95)=144.59µs p(99.9)=1.07ms
     http_req_sending...............: avg=31.46µs  min=6.16µs  med=17.94µs  max=27.77ms p(90)=24.03µs  p(95)=29.11µs  p(99.9)=2.74ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=972.27ms min=6.4ms   med=877.98ms max=5.97s   p(90)=1.92s    p(95)=2.18s    p(99.9)=5.22s 
     http_reqs......................: 15027   219.415609/s
     iteration_duration.............: avg=1.04s    min=49.19ms med=970.94ms max=5.98s   p(90)=1.95s    p(95)=2.19s    p(99.9)=5.23s 
     iterations.....................: 14027   204.814184/s
     success_rate...................: 100.00% ✓ 14027      ✗ 0    
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

     checks.........................: 100.00% ✓ 40308      ✗ 0    
     data_received..................: 1.3 GB  18 MB/s
     data_sent......................: 17 MB   248 kB/s
     http_req_blocked...............: avg=15.9µs  min=1.28µs  med=3.55µs   max=23.89ms  p(90)=5.42µs   p(95)=7.07µs   p(99.9)=1.89ms
     http_req_connecting............: avg=10.4µs  min=0s      med=0s       max=23.83ms  p(90)=0s       p(95)=0s       p(99.9)=1.79ms
     http_req_duration..............: avg=1.01s   min=8.73ms  med=931.48ms max=4.19s    p(90)=2.05s    p(95)=2.18s    p(99.9)=3.65s 
       { expected_response:true }...: avg=1.01s   min=8.73ms  med=931.48ms max=4.19s    p(90)=2.05s    p(95)=2.18s    p(99.9)=3.65s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 14436
     http_req_receiving.............: avg=176.2µs min=31.73µs med=97.68µs  max=134.62ms p(90)=139.19µs p(95)=152.62µs p(99.9)=3.51ms
     http_req_sending...............: avg=40.21µs min=5.88µs  med=17.85µs  max=91.14ms  p(90)=24.11µs  p(95)=29.8µs   p(99.9)=3.61ms
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=1.01s   min=8.62ms  med=931.34ms max=4.19s    p(90)=2.05s    p(95)=2.18s    p(99.9)=3.65s 
     http_reqs......................: 14436   206.51956/s
     iteration_duration.............: avg=1.08s   min=73.2ms  med=1s       max=4.19s    p(90)=2.06s    p(95)=2.19s    p(99.9)=3.68s 
     iterations.....................: 13436   192.213689/s
     success_rate...................: 100.00% ✓ 13436      ✗ 0    
     vus............................: 30      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-181-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

