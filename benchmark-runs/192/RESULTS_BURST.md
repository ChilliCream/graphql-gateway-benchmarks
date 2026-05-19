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
| hive-router | v0.0.49 | 2,814 | 2,927 | 2,791 | 1.6% |  |
| hotchocolate | 16.1.0-p.1.12 | 2,091 | 2,139 | 2,085 | 0.8% |  |
| cosmo | 0.307.0 | 1,203 | 1,217 | 1,197 | 0.7% | non-compatible response (11 across 4/9 runs) |
| hive-gateway-router-runtime | 2.5.25 | 497 | 500 | 494 | 0.4% |  |
| hive-gateway | 2.5.25 | 232 | 236 | 230 | 0.8% |  |
| apollo-gateway | 2.13.3 | 202 | 206 | 201 | 0.8% |  |
| apollo-router | v2.13.1 | — | — | — | — | non-compatible response (17696 across 9/9 runs) |
| grafbase | 0.53.3 | — | — | — | — | non-compatible response (482889 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.49 | 2,358 | 2,453 | 2,332 | 1.9% |  |
| hotchocolate | 16.1.0-p.1.12 | 1,929 | 1,958 | 1,889 | 1.1% |  |
| cosmo | 0.307.0 | 1,110 | 1,125 | 1,105 | 0.9% | non-compatible response (10 across 5/9 runs) |
| hive-gateway-router-runtime | 2.5.25 | 479 | 485 | 475 | 0.8% |  |
| hive-gateway | 2.5.25 | 233 | 236 | 231 | 0.7% |  |
| apollo-gateway | 2.13.3 | 206 | 209 | 205 | 0.6% |  |
| apollo-router | v2.13.1 | — | — | — | — | non-compatible response (13884 across 9/9 runs) |
| grafbase | 0.53.3 | — | — | — | — | non-compatible response (241371 across 9/9 runs) |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.49)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 519036      ✗ 0     
     data_received..................: 15 GB   247 MB/s
     data_sent......................: 209 MB  3.4 MB/s
     http_req_blocked...............: avg=29.89µs min=951ns   med=2.16µs  max=78.66ms  p(90)=3.62µs   p(95)=4.74µs   p(99.9)=5.15ms  
     http_req_connecting............: avg=26.87µs min=0s      med=0s      max=78.48ms  p(90)=0s       p(95)=0s       p(99.9)=4.94ms  
     http_req_duration..............: avg=81.6ms  min=1.63ms  med=75.59ms max=363.02ms p(90)=157.96ms p(95)=176.17ms p(99.9)=253.48ms
       { expected_response:true }...: avg=81.6ms  min=1.63ms  med=75.59ms max=363.02ms p(90)=157.96ms p(95)=176.17ms p(99.9)=253.48ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 174012
     http_req_receiving.............: avg=408.7µs min=28.68µs med=55.04µs max=130.76ms p(90)=251.49µs p(95)=418.36µs p(99.9)=43.41ms 
     http_req_sending...............: avg=89.98µs min=5.09µs  med=9.47µs  max=143.44ms p(90)=18.08µs  p(95)=132.06µs p(99.9)=13.98ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=81.1ms  min=1.58ms  med=75.2ms  max=362.22ms p(90)=157.02ms p(95)=174.89ms p(99.9)=251.85ms
     http_reqs......................: 174012  2814.453581/s
     iteration_duration.............: avg=82.39ms min=2.27ms  med=76.37ms max=386.1ms  p(90)=158.56ms p(95)=176.94ms p(99.9)=256.4ms 
     iterations.....................: 173012  2798.279676/s
     success_rate...................: 100.00% ✓ 173012      ✗ 0     
     vus............................: 95      min=0         max=500 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (rust subgraphs) (16.1.0-p.1.12)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 390000      ✗ 0     
     data_received..................: 12 GB   183 MB/s
     data_sent......................: 157 MB  2.5 MB/s
     http_req_blocked...............: avg=18.19µs  min=1µs     med=2.27µs   max=64.04ms  p(90)=3.59µs   p(95)=4.47µs   p(99.9)=2.06ms  
     http_req_connecting............: avg=15.21µs  min=0s      med=0s       max=63.99ms  p(90)=0s       p(95)=0s       p(99.9)=1.99ms  
     http_req_duration..............: avg=108.64ms min=2.33ms  med=101.21ms max=705.34ms p(90)=208.69ms p(95)=241.56ms p(99.9)=428.6ms 
       { expected_response:true }...: avg=108.64ms min=2.33ms  med=101.21ms max=705.34ms p(90)=208.69ms p(95)=241.56ms p(99.9)=428.6ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 131000
     http_req_receiving.............: avg=1.41ms   min=51.97µs med=111.12µs max=364.93ms p(90)=1.17ms   p(95)=3.31ms   p(99.9)=122.01ms
     http_req_sending...............: avg=66µs     min=5.08µs  med=9.63µs   max=188.96ms p(90)=17.29µs  p(95)=120.11µs p(99.9)=9.18ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=107.16ms min=2.25ms  med=100.19ms max=705.25ms p(90)=206.21ms p(95)=237.38ms p(99.9)=408.2ms 
     http_reqs......................: 131000  2091.907979/s
     iteration_duration.............: avg=109.74ms min=3.7ms   med=102.5ms  max=705.54ms p(90)=209.37ms p(95)=242.36ms p(99.9)=429.45ms
     iterations.....................: 130000  2075.939216/s
     success_rate...................: 100.00% ✓ 130000      ✗ 0     
     vus............................: 87      min=0         max=496 
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

     checks.........................: 100.00% ✓ 222516      ✗ 0    
     data_received..................: 6.6 GB  106 MB/s
     data_sent......................: 90 MB   1.4 MB/s
     http_req_blocked...............: avg=7.05µs   min=1.02µs  med=2.55µs   max=31.91ms  p(90)=4.19µs   p(95)=5.1µs    p(99.9)=530.64µs
     http_req_connecting............: avg=3.81µs   min=0s      med=0s       max=31.74ms  p(90)=0s       p(95)=0s       p(99.9)=450.45µs
     http_req_duration..............: avg=189.76ms min=2.04ms  med=192.36ms max=479.18ms p(90)=350.08ms p(95)=375.72ms p(99.9)=446.84ms
       { expected_response:true }...: avg=189.76ms min=2.04ms  med=192.36ms max=479.18ms p(90)=350.08ms p(95)=375.72ms p(99.9)=446.84ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 75172
     http_req_receiving.............: avg=80.14µs  min=28.21µs med=62.58µs  max=34.27ms  p(90)=97.62µs  p(95)=111.87µs p(99.9)=2.14ms  
     http_req_sending...............: avg=31.97µs  min=5.1µs   med=10.99µs  max=67.68ms  p(90)=17.34µs  p(95)=21µs     p(99.9)=4.56ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=189.65ms min=1.98ms  med=192.26ms max=479.07ms p(90)=349.97ms p(95)=375.62ms p(99.9)=446.67ms
     http_reqs......................: 75172   1203.206836/s
     iteration_duration.............: avg=192.56ms min=5.29ms  med=195.09ms max=479.38ms p(90)=351ms    p(95)=376.41ms p(99.9)=447.44ms
     iterations.....................: 74172   1187.200786/s
     success_rate...................: 100.00% ✓ 74172       ✗ 0    
     vus............................: 80      min=0         max=494
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

     checks.........................: 100.00% ✓ 93855      ✗ 0    
     data_received..................: 2.8 GB  44 MB/s
     data_sent......................: 39 MB   598 kB/s
     http_req_blocked...............: avg=9.44µs   min=1.13µs  med=2.93µs   max=6.45ms   p(90)=4.76µs   p(95)=5.84µs   p(99.9)=1.83ms  
     http_req_connecting............: avg=5.31µs   min=0s      med=0s       max=6.41ms   p(90)=0s       p(95)=0s       p(99.9)=1.65ms  
     http_req_duration..............: avg=444.65ms min=4ms     med=415.44ms max=1.83s    p(90)=874.42ms p(95)=955.48ms p(99.9)=1.39s   
       { expected_response:true }...: avg=444.65ms min=4ms     med=415.44ms max=1.83s    p(90)=874.42ms p(95)=955.48ms p(99.9)=1.39s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 32285
     http_req_receiving.............: avg=86.63µs  min=32.84µs med=75.63µs  max=77.28ms  p(90)=111.97µs p(95)=125.87µs p(99.9)=843.04µs
     http_req_sending...............: avg=30.25µs  min=5.67µs  med=13.43µs  max=110.29ms p(90)=20.72µs  p(95)=24.06µs  p(99.9)=2.43ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=444.53ms min=3.95ms  med=415.32ms max=1.83s    p(90)=874.3ms  p(95)=955.41ms p(99.9)=1.39s   
     http_reqs......................: 32285   497.876621/s
     iteration_duration.............: avg=459.09ms min=24.02ms med=431.27ms max=1.83s    p(90)=878ms    p(95)=958.59ms p(99.9)=1.39s   
     iterations.....................: 31285   482.455323/s
     success_rate...................: 100.00% ✓ 31285      ✗ 0    
     vus............................: 97      min=0        max=500
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

     checks.........................: 100.00% ✓ 44492      ✗ 0    
     data_received..................: 1.4 GB  20 MB/s
     data_sent......................: 19 MB   280 kB/s
     http_req_blocked...............: avg=17.44µs  min=1.31µs  med=3.81µs   max=26.15ms p(90)=5.7µs    p(95)=7.35µs   p(99.9)=3.03ms 
     http_req_connecting............: avg=11.85µs  min=0s      med=0s       max=26.08ms p(90)=0s       p(95)=0s       p(99.9)=3ms    
     http_req_duration..............: avg=896.58ms min=6.15ms  med=799.29ms max=19.84s  p(90)=1.5s     p(95)=1.6s     p(99.9)=18.15s 
       { expected_response:true }...: avg=896.58ms min=6.15ms  med=799.29ms max=19.84s  p(90)=1.5s     p(95)=1.6s     p(99.9)=18.15s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 15831
     http_req_receiving.............: avg=105.97µs min=37.73µs med=100.42µs max=6.3ms   p(90)=140.28µs p(95)=154.53µs p(99.9)=805.9µs
     http_req_sending...............: avg=33.09µs  min=6.09µs  med=18.68µs  max=26.13ms p(90)=24.93µs  p(95)=29.54µs  p(99.9)=3.91ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=896.44ms min=6.01ms  med=799.19ms max=19.84s  p(90)=1.5s     p(95)=1.6s     p(99.9)=18.15s 
     http_reqs......................: 15831   232.412798/s
     iteration_duration.............: avg=955.86ms min=53.61ms med=877.45ms max=19.84s  p(90)=1.51s    p(95)=1.6s     p(99.9)=18.24s 
     iterations.....................: 14830   217.71725/s
     success_rate...................: 100.00% ✓ 14830      ✗ 0    
     vus............................: 63      min=0        max=499
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

     checks.........................: 100.00% ✓ 42096      ✗ 0    
     data_received..................: 1.3 GB  18 MB/s
     data_sent......................: 19 MB   249 kB/s
     http_req_blocked...............: avg=15.46µs  min=1.23µs  med=3.23µs   max=11.36ms p(90)=4.84µs   p(95)=6.29µs   p(99.9)=2.57ms  
     http_req_connecting............: avg=10.53µs  min=0s      med=0s       max=11.2ms  p(90)=0s       p(95)=0s       p(99.9)=2.55ms  
     http_req_duration..............: avg=441.08ms min=8.3ms   med=518.46ms max=1.31s   p(90)=751.87ms p(95)=803.17ms p(99.9)=1.12s   
       { expected_response:true }...: avg=441.08ms min=8.3ms   med=518.46ms max=1.31s   p(90)=751.87ms p(95)=803.17ms p(99.9)=1.12s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 15032
     http_req_receiving.............: avg=93.51µs  min=30.98µs med=86.49µs  max=10.5ms  p(90)=126.12µs p(95)=138.6µs  p(99.9)=883.46µs
     http_req_sending...............: avg=25.98µs  min=6.06µs  med=15.74µs  max=9.47ms  p(90)=21.88µs  p(95)=26.82µs  p(99.9)=3.02ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=440.96ms min=8.17ms  med=518.37ms max=1.31s   p(90)=751.76ms p(95)=803.08ms p(99.9)=1.12s   
     http_reqs......................: 15032   202.654382/s
     iteration_duration.............: avg=472.32ms min=27.68ms med=547.58ms max=1.31s   p(90)=760.55ms p(95)=810ms    p(99.9)=1.13s   
     iterations.....................: 14032   189.172851/s
     success_rate...................: 100.00% ✓ 14032      ✗ 0    
     vus............................: 52      min=0        max=496
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

     checks.........................: 100.00% ✓ 435687      ✗ 0     
     data_received..................: 13 GB   206 MB/s
     data_sent......................: 176 MB  2.8 MB/s
     http_req_blocked...............: avg=30.36µs min=1.08µs  med=3µs     max=77.53ms  p(90)=4.92µs   p(95)=6.25µs   p(99.9)=4.22ms  
     http_req_connecting............: avg=26.43µs min=0s      med=0s      max=77.48ms  p(90)=0s       p(95)=0s       p(99.9)=4.09ms  
     http_req_duration..............: avg=97.21ms min=1.63ms  med=90.49ms max=337.33ms p(90)=188.52ms p(95)=207.16ms p(99.9)=270.65ms
       { expected_response:true }...: avg=97.21ms min=1.63ms  med=90.49ms max=337.33ms p(90)=188.52ms p(95)=207.16ms p(99.9)=270.65ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 146229
     http_req_receiving.............: avg=279.7µs min=28.06µs med=62.84µs max=65.95ms  p(90)=208.73µs p(95)=449.56µs p(99.9)=32.54ms 
     http_req_sending...............: avg=91.94µs min=5.29µs  med=11.7µs  max=135.51ms p(90)=23.09µs  p(95)=150µs    p(99.9)=14.19ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=96.84ms min=1.57ms  med=90.23ms max=303.95ms p(90)=188ms    p(95)=206.37ms p(99.9)=267.2ms 
     http_reqs......................: 146229  2358.634783/s
     iteration_duration.............: avg=98.19ms min=4.73ms  med=91.63ms max=352.03ms p(90)=189.2ms  p(95)=207.78ms p(99.9)=271.44ms
     iterations.....................: 145229  2342.505049/s
     success_rate...................: 100.00% ✓ 145229      ✗ 0     
     vus............................: 57      min=0         max=498 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (.net subgraphs) (16.1.0-p.1.12)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 356826      ✗ 0     
     data_received..................: 11 GB   169 MB/s
     data_sent......................: 144 MB  2.3 MB/s
     http_req_blocked...............: avg=17.65µs  min=1.02µs  med=2.33µs   max=93.8ms   p(90)=3.93µs   p(95)=5µs      p(99.9)=2.01ms  
     http_req_connecting............: avg=14.58µs  min=0s      med=0s       max=93.74ms  p(90)=0s       p(95)=0s       p(99.9)=1.96ms  
     http_req_duration..............: avg=118.74ms min=1.7ms   med=108.26ms max=916.79ms p(90)=228.64ms p(95)=264.06ms p(99.9)=696.57ms
       { expected_response:true }...: avg=118.74ms min=1.7ms   med=108.26ms max=916.79ms p(90)=228.64ms p(95)=264.06ms p(99.9)=696.57ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 119942
     http_req_receiving.............: avg=1.81ms   min=52.35µs med=113.81µs max=330.49ms p(90)=1.7ms    p(95)=4.68ms   p(99.9)=133.21ms
     http_req_sending...............: avg=62.46µs  min=5.14µs  med=9.98µs   max=247.77ms p(90)=19.69µs  p(95)=118.87µs p(99.9)=8.32ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=116.87ms min=1.62ms  med=107.01ms max=914.76ms p(90)=225.51ms p(95)=258.1ms  p(99.9)=696.24ms
     http_reqs......................: 119942  1929.120479/s
     iteration_duration.............: avg=120.01ms min=3.1ms   med=109.75ms max=917.02ms p(90)=229.42ms p(95)=264.93ms p(99.9)=696.86ms
     iterations.....................: 118942  1913.036702/s
     success_rate...................: 100.00% ✓ 118942      ✗ 0     
     vus............................: 66      min=0         max=496 
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

     checks.........................: 100.00% ✓ 205632      ✗ 0    
     data_received..................: 6.1 GB  97 MB/s
     data_sent......................: 84 MB   1.3 MB/s
     http_req_blocked...............: avg=6.23µs   min=1.15µs  med=2.71µs   max=17.93ms  p(90)=4.43µs   p(95)=5.36µs   p(99.9)=470.86µs
     http_req_connecting............: avg=2.84µs   min=0s      med=0s       max=17.87ms  p(90)=0s       p(95)=0s       p(99.9)=428.39µs
     http_req_duration..............: avg=205.18ms min=2.08ms  med=204.09ms max=568.28ms p(90)=380.55ms p(95)=407.55ms p(99.9)=500.82ms
       { expected_response:true }...: avg=205.18ms min=2.08ms  med=204.09ms max=568.28ms p(90)=380.55ms p(95)=407.55ms p(99.9)=500.82ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 69544
     http_req_receiving.............: avg=86.02µs  min=30.57µs med=67.53µs  max=223.79ms p(90)=104.8µs  p(95)=120.57µs p(99.9)=1.49ms  
     http_req_sending...............: avg=35.03µs  min=5.46µs  med=11.83µs  max=128.44ms p(90)=18.5µs   p(95)=22.19µs  p(99.9)=4.12ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=205.06ms min=2.03ms  med=203.93ms max=568.21ms p(90)=380.43ms p(95)=407.4ms  p(99.9)=500.75ms
     http_reqs......................: 69544   1110.616953/s
     iteration_duration.............: avg=208.43ms min=5.47ms  med=207.82ms max=568.47ms p(90)=381.45ms p(95)=408.34ms p(99.9)=501.35ms
     iterations.....................: 68544   1094.646964/s
     success_rate...................: 100.00% ✓ 68544       ✗ 0    
     vus............................: 86      min=0         max=499
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

     checks.........................: 100.00% ✓ 90897      ✗ 0    
     data_received..................: 2.7 GB  42 MB/s
     data_sent......................: 38 MB   576 kB/s
     http_req_blocked...............: avg=9.32µs   min=1.2µs   med=3.13µs   max=9.49ms   p(90)=4.92µs   p(95)=5.9µs    p(99.9)=1.34ms
     http_req_connecting............: avg=5.18µs   min=0s      med=0s       max=9.33ms   p(90)=0s       p(95)=0s       p(99.9)=1.31ms
     http_req_duration..............: avg=458.91ms min=4.15ms  med=427.29ms max=1.84s    p(90)=908.6ms  p(95)=980.71ms p(99.9)=1.46s 
       { expected_response:true }...: avg=458.91ms min=4.15ms  med=427.29ms max=1.84s    p(90)=908.6ms  p(95)=980.71ms p(99.9)=1.46s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 31299
     http_req_receiving.............: avg=97.25µs  min=33.24µs med=80.4µs   max=113.93ms p(90)=117.28µs p(95)=130.76µs p(99.9)=1.07ms
     http_req_sending...............: avg=26.56µs  min=5.49µs  med=14.01µs  max=62.75ms  p(90)=21.32µs  p(95)=24.44µs  p(99.9)=2.25ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=458.78ms min=4.09ms  med=427.17ms max=1.84s    p(90)=908.5ms  p(95)=980.6ms  p(99.9)=1.46s 
     http_reqs......................: 31299   479.750792/s
     iteration_duration.............: avg=474.29ms min=24.94ms med=443.68ms max=1.85s    p(90)=912.22ms p(95)=984.31ms p(99.9)=1.47s 
     iterations.....................: 30299   464.422801/s
     success_rate...................: 100.00% ✓ 30299      ✗ 0    
     vus............................: 64      min=0        max=496
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

     checks.........................: 100.00% ✓ 44763      ✗ 0    
     data_received..................: 1.4 GB  20 MB/s
     data_sent......................: 19 MB   280 kB/s
     http_req_blocked...............: avg=15.88µs  min=1.31µs  med=3.84µs   max=21.49ms  p(90)=5.87µs   p(95)=7.56µs  p(99.9)=2.1ms 
     http_req_connecting............: avg=10.2µs   min=0s      med=0s       max=21.43ms  p(90)=0s       p(95)=0s      p(99.9)=2.08ms
     http_req_duration..............: avg=914.85ms min=6.38ms  med=830.29ms max=4.8s     p(90)=1.83s    p(95)=2.01s   p(99.9)=4.38s 
       { expected_response:true }...: avg=914.85ms min=6.38ms  med=830.29ms max=4.8s     p(90)=1.83s    p(95)=2.01s   p(99.9)=4.38s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 15921
     http_req_receiving.............: avg=113.76µs min=39.99µs med=101.17µs max=113.99ms p(90)=140.28µs p(95)=153.4µs p(99.9)=1.01ms
     http_req_sending...............: avg=40.38µs  min=6.08µs  med=18.46µs  max=130.92ms p(90)=24.84µs  p(95)=30.02µs p(99.9)=3.17ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s    
     http_req_waiting...............: avg=914.69ms min=6.26ms  med=830.19ms max=4.8s     p(90)=1.83s    p(95)=2.01s   p(99.9)=4.38s 
     http_reqs......................: 15921   233.105237/s
     iteration_duration.............: avg=976.19ms min=45.19ms med=920.47ms max=4.81s    p(90)=1.85s    p(95)=2.02s   p(99.9)=4.42s 
     iterations.....................: 14921   218.463868/s
     success_rate...................: 100.00% ✓ 14921      ✗ 0    
     vus............................: 71      min=0        max=500
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

     checks.........................: 100.00% ✓ 40293      ✗ 0    
     data_received..................: 1.3 GB  18 MB/s
     data_sent......................: 17 MB   248 kB/s
     http_req_blocked...............: avg=14.56µs  min=1.25µs  med=3.51µs   max=3.62ms  p(90)=5.33µs   p(95)=7.02µs   p(99.9)=2.28ms
     http_req_connecting............: avg=9.19µs   min=0s      med=0s       max=3.59ms  p(90)=0s       p(95)=0s       p(99.9)=2.25ms
     http_req_duration..............: avg=1.01s    min=8.57ms  med=931.32ms max=4.24s   p(90)=2.07s    p(95)=2.18s    p(99.9)=3.86s 
       { expected_response:true }...: avg=1.01s    min=8.57ms  med=931.32ms max=4.24s   p(90)=2.07s    p(95)=2.18s    p(99.9)=3.86s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 14431
     http_req_receiving.............: avg=114.23µs min=36.84µs med=94.65µs  max=45.92ms p(90)=136.41µs p(95)=149.41µs p(99.9)=1.3ms 
     http_req_sending...............: avg=32.27µs  min=5.75µs  med=16.91µs  max=37.62ms p(90)=23.16µs  p(95)=28.64µs  p(99.9)=2.93ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=1.01s    min=8.47ms  med=931.2ms  max=4.24s   p(90)=2.07s    p(95)=2.17s    p(99.9)=3.86s 
     http_reqs......................: 14431   206.844886/s
     iteration_duration.............: avg=1.08s    min=48.61ms med=1.02s    max=4.24s   p(90)=2.08s    p(95)=2.18s    p(99.9)=3.9s  
     iterations.....................: 13431   192.511514/s
     success_rate...................: 100.00% ✓ 13431      ✗ 0    
     vus............................: 94      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-177-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

