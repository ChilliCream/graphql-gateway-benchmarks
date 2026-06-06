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
| hive-router | v0.0.49 | 2,700 | 2,795 | 2,648 | 1.6% |  |
| hotchocolate | 16.1.3-p.1 | 2,037 | 2,081 | 2,005 | 1.3% |  |
| cosmo | 0.307.0 | 1,214 | 1,214 | 1,209 | 0.3% | non-compatible response (15 across 7/9 runs) |
| hive-gateway-router-runtime | 2.5.25 | 500 | 507 | 497 | 0.7% |  |
| hive-gateway | 2.5.25 | 219 | 224 | 216 | 1.2% |  |
| apollo-gateway | 2.13.3 | 206 | 210 | 204 | 0.8% |  |
| apollo-router | v2.13.1 | — | — | — | — | non-compatible response (20914 across 9/9 runs) |
| grafbase | 0.53.3 | — | — | — | — | non-compatible response (485896 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.49 | 2,353 | 2,458 | 2,315 | 2.0% |  |
| hotchocolate | 16.1.3-p.1 | 1,924 | 1,952 | 1,809 | 2.2% |  |
| cosmo | 0.307.0 | 1,143 | 1,149 | 1,137 | 0.5% | non-compatible response (8 across 5/9 runs) |
| hive-gateway-router-runtime | 2.5.25 | 483 | 494 | 480 | 1.1% |  |
| hive-gateway | 2.5.25 | 217 | 220 | 214 | 1.0% |  |
| apollo-gateway | 2.13.3 | 209 | 212 | 205 | 1.0% |  |
| apollo-router | v2.13.1 | — | — | — | — | non-compatible response (20589 across 9/9 runs) |
| grafbase | 0.53.3 | — | — | — | — | non-compatible response (174057 across 9/9 runs) |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.49)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 498597      ✗ 0     
     data_received..................: 15 GB   237 MB/s
     data_sent......................: 201 MB  3.2 MB/s
     http_req_blocked...............: avg=26.61µs  min=982ns  med=2.55µs  max=69.86ms  p(90)=4.16µs   p(95)=5.26µs   p(99.9)=2.65ms  
     http_req_connecting............: avg=23.16µs  min=0s     med=0s      max=69.77ms  p(90)=0s       p(95)=0s       p(99.9)=2.06ms  
     http_req_duration..............: avg=84.94ms  min=1.52ms med=77.87ms max=287.83ms p(90)=165.97ms p(95)=179.34ms p(99.9)=235.08ms
       { expected_response:true }...: avg=84.94ms  min=1.52ms med=77.87ms max=287.83ms p(90)=165.97ms p(95)=179.34ms p(99.9)=235.08ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 167199
     http_req_receiving.............: avg=336.97µs min=28.1µs med=57.74µs max=174.99ms p(90)=212.73µs p(95)=414.2µs  p(99.9)=37.8ms  
     http_req_sending...............: avg=87.36µs  min=5.24µs med=10.2µs  max=232.73ms p(90)=19.34µs  p(95)=133.46µs p(99.9)=13.86ms 
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=84.52ms  min=1.46ms med=77.47ms max=287.61ms p(90)=165.42ms p(95)=178.54ms p(99.9)=231.96ms
     http_reqs......................: 167199  2700.096095/s
     iteration_duration.............: avg=85.78ms  min=2.32ms med=78.74ms max=302.74ms p(90)=166.46ms p(95)=179.89ms p(99.9)=236.9ms 
     iterations.....................: 166199  2683.947099/s
     success_rate...................: 100.00% ✓ 166199      ✗ 0     
     vus............................: 54      min=0         max=499 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (rust subgraphs) (16.1.3-p.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 381081      ✗ 0     
     data_received..................: 11 GB   179 MB/s
     data_sent......................: 154 MB  2.4 MB/s
     http_req_blocked...............: avg=14.63µs  min=941ns   med=2.19µs   max=55.64ms  p(90)=3.48µs   p(95)=4.39µs   p(99.9)=1.2ms   
     http_req_connecting............: avg=11.68µs  min=0s      med=0s       max=55.44ms  p(90)=0s       p(95)=0s       p(99.9)=1.11ms  
     http_req_duration..............: avg=111.17ms min=2.4ms   med=102.94ms max=701.11ms p(90)=214.19ms p(95)=250ms    p(99.9)=498.88ms
       { expected_response:true }...: avg=111.17ms min=2.4ms   med=102.94ms max=701.11ms p(90)=214.19ms p(95)=250ms    p(99.9)=498.88ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 128027
     http_req_receiving.............: avg=2.04ms   min=51.87µs med=115.22µs max=334.43ms p(90)=1.48ms   p(95)=5.1ms    p(99.9)=188.42ms
     http_req_sending...............: avg=59.74µs  min=5.35µs  med=9.56µs   max=97.47ms  p(90)=17.13µs  p(95)=116.7µs  p(99.9)=8.25ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=109.06ms min=2.3ms   med=101.73ms max=638.05ms p(90)=211.15ms p(95)=243.47ms p(99.9)=429.27ms
     http_reqs......................: 128027  2037.582349/s
     iteration_duration.............: avg=112.31ms min=3.6ms   med=104.24ms max=701.3ms  p(90)=214.99ms p(95)=251.03ms p(99.9)=499.26ms
     iterations.....................: 127027  2021.667094/s
     success_rate...................: 100.00% ✓ 127027      ✗ 0     
     vus............................: 96      min=0         max=500 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (rust subgraphs) (0.307.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 224628      ✗ 0    
     data_received..................: 6.7 GB  107 MB/s
     data_sent......................: 91 MB   1.5 MB/s
     http_req_blocked...............: avg=6.59µs   min=1.1µs   med=2.53µs   max=24.25ms  p(90)=4.09µs   p(95)=4.97µs   p(99.9)=539.75µs
     http_req_connecting............: avg=3.35µs   min=0s      med=0s       max=24.19ms  p(90)=0s       p(95)=0s       p(99.9)=466.14µs
     http_req_duration..............: avg=188.09ms min=2.02ms  med=189.01ms max=517.21ms p(90)=348.61ms p(95)=372.9ms  p(99.9)=449.05ms
       { expected_response:true }...: avg=188.09ms min=2.02ms  med=189.01ms max=517.21ms p(90)=348.61ms p(95)=372.9ms  p(99.9)=449.05ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 75876
     http_req_receiving.............: avg=79µs     min=29.69µs med=60.32µs  max=198.71ms p(90)=94.51µs  p(95)=108.22µs p(99.9)=1.71ms  
     http_req_sending...............: avg=33.18µs  min=5.37µs  med=10.83µs  max=121.7ms  p(90)=16.84µs  p(95)=20.5µs   p(99.9)=4.26ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=187.98ms min=1.96ms  med=188.86ms max=517.14ms p(90)=348.51ms p(95)=372.82ms p(99.9)=449ms   
     http_reqs......................: 75876   1214.895495/s
     iteration_duration.............: avg=190.83ms min=5.45ms  med=192.01ms max=517.41ms p(90)=349.45ms p(95)=373.59ms p(99.9)=449.64ms
     iterations.....................: 74876   1198.883904/s
     success_rate...................: 100.00% ✓ 74876       ✗ 0    
     vus............................: 79      min=0         max=495
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (rust subgraphs) (2.5.25)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 94293      ✗ 0    
     data_received..................: 2.8 GB  44 MB/s
     data_sent......................: 39 MB   600 kB/s
     http_req_blocked...............: avg=9.84µs   min=1.07µs  med=2.9µs    max=5.66ms   p(90)=4.7µs    p(95)=5.73µs   p(99.9)=1.95ms
     http_req_connecting............: avg=5.87µs   min=0s      med=0s       max=5.61ms   p(90)=0s       p(95)=0s       p(99.9)=1.92ms
     http_req_duration..............: avg=442.59ms min=3.93ms  med=415.26ms max=1.75s    p(90)=881.92ms p(95)=957.08ms p(99.9)=1.34s 
       { expected_response:true }...: avg=442.59ms min=3.93ms  med=415.26ms max=1.75s    p(90)=881.92ms p(95)=957.08ms p(99.9)=1.34s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 32431
     http_req_receiving.............: avg=108.3µs  min=32.41µs med=77.71µs  max=179.99ms p(90)=114.84µs p(95)=128.69µs p(99.9)=1.49ms
     http_req_sending...............: avg=36.4µs   min=5.9µs   med=13.47µs  max=103.67ms p(90)=21.05µs  p(95)=24.37µs  p(99.9)=3.05ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=442.44ms min=3.87ms  med=415.14ms max=1.75s    p(90)=881.73ms p(95)=956.96ms p(99.9)=1.34s 
     http_reqs......................: 32431   500.082999/s
     iteration_duration.............: avg=456.88ms min=11.41ms med=432.67ms max=1.76s    p(90)=885.94ms p(95)=960.09ms p(99.9)=1.36s 
     iterations.....................: 31431   484.663092/s
     success_rate...................: 100.00% ✓ 31431      ✗ 0    
     vus............................: 19      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (rust subgraphs) (2.5.25)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 42153      ✗ 0    
     data_received..................: 1.3 GB  19 MB/s
     data_sent......................: 18 MB   264 kB/s
     http_req_blocked...............: avg=17.93µs  min=1.15µs  med=3.73µs   max=19.42ms p(90)=5.74µs   p(95)=7.73µs   p(99.9)=2.86ms  
     http_req_connecting............: avg=12.47µs  min=0s      med=0s       max=19.34ms p(90)=0s       p(95)=0s       p(99.9)=2.82ms  
     http_req_duration..............: avg=949.84ms min=6.31ms  med=825.42ms max=17.14s  p(90)=1.68s    p(95)=1.84s    p(99.9)=15.45s  
       { expected_response:true }...: avg=949.84ms min=6.31ms  med=825.42ms max=17.14s  p(90)=1.68s    p(95)=1.84s    p(99.9)=15.45s  
     http_req_failed................: 0.00%   ✓ 0          ✗ 15051
     http_req_receiving.............: avg=109.64µs min=36.83µs med=100.74µs max=62.44ms p(90)=140.42µs p(95)=153.21µs p(99.9)=629.61µs
     http_req_sending...............: avg=39.35µs  min=6.1µs   med=18.91µs  max=85.49ms p(90)=25.53µs  p(95)=31.09µs  p(99.9)=3.09ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=949.69ms min=6.22ms  med=825.28ms max=17.14s  p(90)=1.68s    p(95)=1.84s    p(99.9)=15.45s  
     http_reqs......................: 15051   219.61258/s
     iteration_duration.............: avg=1.01s    min=40.99ms med=899.47ms max=17.14s  p(90)=1.7s     p(95)=1.85s    p(99.9)=15.48s  
     iterations.....................: 14051   205.021352/s
     success_rate...................: 100.00% ✓ 14051      ✗ 0    
     vus............................: 86      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-gateway (rust subgraphs) (2.13.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 42972      ✗ 0    
     data_received..................: 1.3 GB  18 MB/s
     data_sent......................: 19 MB   253 kB/s
     http_req_blocked...............: avg=14.57µs  min=1.24µs  med=3.39µs   max=6.82ms  p(90)=5.07µs   p(95)=6.63µs   p(99.9)=2.33ms  
     http_req_connecting............: avg=9.48µs   min=0s      med=0s       max=6.76ms  p(90)=0s       p(95)=0s       p(99.9)=2.3ms   
     http_req_duration..............: avg=433.81ms min=8.42ms  med=458.52ms max=1.29s   p(90)=777.16ms p(95)=819.45ms p(99.9)=1.17s   
       { expected_response:true }...: avg=433.81ms min=8.42ms  med=458.52ms max=1.29s   p(90)=777.16ms p(95)=819.45ms p(99.9)=1.17s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 15324
     http_req_receiving.............: avg=99.2µs   min=35.54µs med=93.56µs  max=8.85ms  p(90)=132.24µs p(95)=145.12µs p(99.9)=660.28µs
     http_req_sending...............: avg=28.64µs  min=5.95µs  med=16.99µs  max=14.16ms p(90)=22.79µs  p(95)=27.71µs  p(99.9)=3.33ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=433.68ms min=8.33ms  med=458.37ms max=1.29s   p(90)=777.06ms p(95)=819.35ms p(99.9)=1.17s   
     http_reqs......................: 15324   206.216898/s
     iteration_duration.............: avg=463.96ms min=9ms     med=483.46ms max=1.3s    p(90)=782.95ms p(95)=827.2ms  p(99.9)=1.18s   
     iterations.....................: 14324   192.759778/s
     success_rate...................: 100.00% ✓ 14324      ✗ 0    
     vus............................: 66      min=0        max=494
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.49)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 436557      ✗ 0     
     data_received..................: 13 GB   206 MB/s
     data_sent......................: 176 MB  2.8 MB/s
     http_req_blocked...............: avg=22.78µs  min=1.02µs  med=2.56µs  max=47.77ms  p(90)=4.43µs   p(95)=5.73µs   p(99.9)=3.12ms  
     http_req_connecting............: avg=19.29µs  min=0s      med=0s      max=47.56ms  p(90)=0s       p(95)=0s       p(99.9)=2.94ms  
     http_req_duration..............: avg=97.04ms  min=1.73ms  med=91.48ms max=333.71ms p(90)=187.35ms p(95)=205.1ms  p(99.9)=259.55ms
       { expected_response:true }...: avg=97.04ms  min=1.73ms  med=91.48ms max=333.71ms p(90)=187.35ms p(95)=205.1ms  p(99.9)=259.55ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 146519
     http_req_receiving.............: avg=273.64µs min=29.24µs med=60.67µs max=63.66ms  p(90)=200.21µs p(95)=429.61µs p(99.9)=33.07ms 
     http_req_sending...............: avg=84.41µs  min=5.31µs  med=10.97µs max=90.33ms  p(90)=22.01µs  p(95)=140.74µs p(99.9)=12.58ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=96.69ms  min=1.64ms  med=91.17ms max=332.59ms p(90)=186.83ms p(95)=204.51ms p(99.9)=256.93ms
     http_reqs......................: 146519  2353.94632/s
     iteration_duration.............: avg=97.99ms  min=4.08ms  med=92.55ms max=371.88ms p(90)=187.9ms  p(95)=205.62ms p(99.9)=260.37ms
     iterations.....................: 145519  2337.880511/s
     success_rate...................: 100.00% ✓ 145519      ✗ 0     
     vus............................: 68      min=0         max=495 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (.net subgraphs) (16.1.3-p.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 356517      ✗ 0     
     data_received..................: 11 GB   169 MB/s
     data_sent......................: 144 MB  2.3 MB/s
     http_req_blocked...............: avg=14.84µs  min=1.03µs  med=2.66µs   max=78.94ms  p(90)=4.38µs   p(95)=5.56µs   p(99.9)=1.31ms  
     http_req_connecting............: avg=11.27µs  min=0s      med=0s       max=78.79ms  p(90)=0s       p(95)=0s       p(99.9)=1.19ms  
     http_req_duration..............: avg=118.78ms min=1.81ms  med=107.84ms max=1s       p(90)=228.51ms p(95)=261.52ms p(99.9)=741.19ms
       { expected_response:true }...: avg=118.78ms min=1.81ms  med=107.84ms max=1s       p(90)=228.51ms p(95)=261.52ms p(99.9)=741.19ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 119839
     http_req_receiving.............: avg=1.56ms   min=52.55µs med=116.26µs max=252.28ms p(90)=1.57ms   p(95)=4.05ms   p(99.9)=151.81ms
     http_req_sending...............: avg=67.42µs  min=5.48µs  med=10.78µs  max=181.84ms p(90)=21.02µs  p(95)=126.95µs p(99.9)=8.62ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=117.15ms min=1.72ms  med=106.71ms max=1s       p(90)=226.06ms p(95)=256.2ms  p(99.9)=740.57ms
     http_reqs......................: 119839  1924.931733/s
     iteration_duration.............: avg=120.08ms min=2.82ms  med=109.32ms max=1s       p(90)=229.23ms p(95)=262.38ms p(99.9)=741.61ms
     iterations.....................: 118839  1908.869084/s
     success_rate...................: 100.00% ✓ 118839      ✗ 0     
     vus............................: 73      min=0         max=495 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (.net subgraphs) (0.307.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 211902      ✗ 0    
     data_received..................: 6.3 GB  100 MB/s
     data_sent......................: 86 MB   1.4 MB/s
     http_req_blocked...............: avg=6.79µs   min=1.06µs  med=2.67µs   max=35.1ms   p(90)=4.41µs   p(95)=5.4µs    p(99.9)=450.66µs
     http_req_connecting............: avg=3.45µs   min=0s      med=0s       max=35.04ms  p(90)=0s       p(95)=0s       p(99.9)=410.44µs
     http_req_duration..............: avg=199.2ms  min=2.12ms  med=200ms    max=584.59ms p(90)=367.97ms p(95)=395.16ms p(99.9)=484.34ms
       { expected_response:true }...: avg=199.2ms  min=2.12ms  med=200ms    max=584.59ms p(90)=367.97ms p(95)=395.16ms p(99.9)=484.34ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 71634
     http_req_receiving.............: avg=84.11µs  min=30.49µs med=66.63µs  max=157.76ms p(90)=105.43µs p(95)=121.66µs p(99.9)=1.64ms  
     http_req_sending...............: avg=34.79µs  min=5.54µs  med=12.16µs  max=182.03ms p(90)=19.53µs  p(95)=23.15µs  p(99.9)=4.1ms   
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=199.08ms min=2.04ms  med=199.89ms max=584.48ms p(90)=367.84ms p(95)=395.06ms p(99.9)=484.23ms
     http_reqs......................: 71634   1143.490089/s
     iteration_duration.............: avg=202.28ms min=4.96ms  med=203.31ms max=584.83ms p(90)=369.04ms p(95)=395.9ms  p(99.9)=484.62ms
     iterations.....................: 70634   1127.527137/s
     success_rate...................: 100.00% ✓ 70634       ✗ 0    
     vus............................: 88      min=0         max=498
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (.net subgraphs) (2.5.25)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 91788      ✗ 0    
     data_received..................: 2.8 GB  42 MB/s
     data_sent......................: 38 MB   580 kB/s
     http_req_blocked...............: avg=9.95µs   min=1.13µs  med=2.93µs   max=8.82ms   p(90)=4.74µs   p(95)=5.76µs   p(99.9)=1.83ms  
     http_req_connecting............: avg=5.84µs   min=0s      med=0s       max=8.53ms   p(90)=0s       p(95)=0s       p(99.9)=1.73ms  
     http_req_duration..............: avg=454.42ms min=4.14ms  med=420.9ms  max=1.88s    p(90)=895.93ms p(95)=971.81ms p(99.9)=1.44s   
       { expected_response:true }...: avg=454.42ms min=4.14ms  med=420.9ms  max=1.88s    p(90)=895.93ms p(95)=971.81ms p(99.9)=1.44s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 31596
     http_req_receiving.............: avg=97.23µs  min=31.68µs med=81.71µs  max=246.03ms p(90)=118.92µs p(95)=133.16µs p(99.9)=814.54µs
     http_req_sending...............: avg=30.49µs  min=5.58µs  med=14.36µs  max=71.57ms  p(90)=21.78µs  p(95)=25.02µs  p(99.9)=2.99ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=454.29ms min=4.08ms  med=420.63ms max=1.88s    p(90)=895.81ms p(95)=971.73ms p(99.9)=1.44s   
     http_reqs......................: 31596   483.487822/s
     iteration_duration.............: avg=469.51ms min=21.36ms med=439.18ms max=1.89s    p(90)=899.71ms p(95)=975.79ms p(99.9)=1.45s   
     iterations.....................: 30596   468.185637/s
     success_rate...................: 100.00% ✓ 30596      ✗ 0    
     vus............................: 74      min=0        max=495
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (.net subgraphs) (2.5.25)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 41727      ✗ 0    
     data_received..................: 1.3 GB  19 MB/s
     data_sent......................: 18 MB   261 kB/s
     http_req_blocked...............: avg=16.96µs  min=1.2µs  med=3.62µs   max=4.35ms  p(90)=5.5µs    p(95)=7.35µs   p(99.9)=2.63ms  
     http_req_connecting............: avg=11.36µs  min=0s     med=0s       max=4.27ms  p(90)=0s       p(95)=0s       p(99.9)=2.59ms  
     http_req_duration..............: avg=980.07ms min=6.45ms med=883.03ms max=6.32s   p(90)=1.94s    p(95)=2.16s    p(99.9)=5.45s   
       { expected_response:true }...: avg=980.07ms min=6.45ms med=883.03ms max=6.32s   p(90)=1.94s    p(95)=2.16s    p(99.9)=5.45s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 14909
     http_req_receiving.............: avg=107.07µs min=37.6µs med=99.13µs  max=35.27ms p(90)=139.33µs p(95)=150.46µs p(99.9)=830.81µs
     http_req_sending...............: avg=33.8µs   min=6.28µs med=17.96µs  max=52.5ms  p(90)=24.19µs  p(95)=29.29µs  p(99.9)=3.56ms  
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=979.93ms min=6.33ms med=882.91ms max=6.32s   p(90)=1.94s    p(95)=2.16s    p(99.9)=5.45s   
     http_reqs......................: 14909   217.067837/s
     iteration_duration.............: avg=1.05s    min=35.5ms med=967.25ms max=6.32s   p(90)=1.97s    p(95)=2.17s    p(99.9)=5.51s   
     iterations.....................: 13909   202.50832/s
     success_rate...................: 100.00% ✓ 13909      ✗ 0    
     vus............................: 81      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-gateway (.net subgraphs) (2.13.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 40962      ✗ 0    
     data_received..................: 1.3 GB  18 MB/s
     data_sent......................: 18 MB   252 kB/s
     http_req_blocked...............: avg=17.92µs  min=1.13µs  med=3.47µs   max=35.74ms p(90)=5.24µs   p(95)=6.92µs   p(99.9)=2.72ms  
     http_req_connecting............: avg=12.61µs  min=0s      med=0s       max=35.68ms p(90)=0s       p(95)=0s       p(99.9)=2.69ms  
     http_req_duration..............: avg=994.82ms min=8.68ms  med=902.56ms max=4.05s   p(90)=2.01s    p(95)=2.15s    p(99.9)=3.52s   
       { expected_response:true }...: avg=994.82ms min=8.68ms  med=902.56ms max=4.05s   p(90)=2.01s    p(95)=2.15s    p(99.9)=3.52s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 14654
     http_req_receiving.............: avg=105.56µs min=37.85µs med=97.05µs  max=20.71ms p(90)=136.65µs p(95)=148.95µs p(99.9)=932.57µs
     http_req_sending...............: avg=33.41µs  min=5.88µs  med=17.81µs  max=34.47ms p(90)=24µs     p(95)=29.35µs  p(99.9)=4.7ms   
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=994.68ms min=8.57ms  med=902.47ms max=4.05s   p(90)=2.01s    p(95)=2.15s    p(99.9)=3.52s   
     http_reqs......................: 14654   209.741827/s
     iteration_duration.............: avg=1.06s    min=45.19ms med=1.01s    max=4.06s   p(90)=2.03s    p(95)=2.16s    p(99.9)=3.55s   
     iterations.....................: 13654   195.428886/s
     success_rate...................: 100.00% ✓ 13654      ✗ 0    
     vus............................: 13      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-181-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

