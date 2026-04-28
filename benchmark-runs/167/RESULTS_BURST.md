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
| hive-router | v0.0.49 | 2,706 | 2,821 | 2,663 | 2.0% |  |
| hotchocolate | 16.1.0-p.1.9 | 2,073 | 2,124 | 2,057 | 1.1% |  |
| cosmo | 0.307.0 | 1,158 | 1,158 | 1,158 | 0.0% | non-compatible response (17 across 8/9 runs) |
| hive-gateway-router-runtime | 2.5.25 | 497 | 502 | 494 | 0.7% |  |
| hive-gateway | 2.5.25 | 229 | 232 | 225 | 0.8% |  |
| apollo-gateway | 2.13.3 | 203 | 205 | 201 | 0.7% |  |
| apollo-router | v2.13.1 | — | — | — | — | non-compatible response (9600 across 9/9 runs) |
| grafbase | 0.53.3 | — | — | — | — | non-compatible response (489206 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.49 | 2,223 | 2,336 | 2,186 | 2.4% |  |
| hotchocolate | 16.1.0-p.1.9 | 1,928 | 1,978 | 1,907 | 1.1% |  |
| hive-gateway-router-runtime | 2.5.25 | 476 | 483 | 468 | 1.1% |  |
| hive-gateway | 2.5.25 | 227 | 229 | 223 | 1.1% |  |
| apollo-gateway | 2.13.3 | 208 | 210 | 207 | 0.5% |  |
| apollo-router | v2.13.1 | — | — | — | — | non-compatible response (15982 across 9/9 runs) |
| cosmo | 0.307.0 | — | — | — | — | non-compatible response (5042429 across 9/9 runs) |
| grafbase | 0.53.3 | — | — | — | — | non-compatible response (192833 across 9/9 runs) |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.49)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 499365      ✗ 0     
     data_received..................: 15 GB   237 MB/s
     data_sent......................: 201 MB  3.3 MB/s
     http_req_blocked...............: avg=29.56µs  min=1.11µs  med=2.7µs   max=102.87ms p(90)=4.22µs   p(95)=5.31µs   p(99.9)=6.58ms  
     http_req_connecting............: avg=25.71µs  min=0s      med=0s      max=64.45ms  p(90)=0s       p(95)=0s       p(99.9)=6.32ms  
     http_req_duration..............: avg=84.82ms  min=1.57ms  med=78.6ms  max=400.84ms p(90)=165.1ms  p(95)=182.35ms p(99.9)=242.04ms
       { expected_response:true }...: avg=84.82ms  min=1.57ms  med=78.6ms  max=400.84ms p(90)=165.1ms  p(95)=182.35ms p(99.9)=242.04ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 167455
     http_req_receiving.............: avg=392.02µs min=29.41µs med=58.25µs max=238.93ms p(90)=243.89µs p(95)=423.72µs p(99.9)=43.05ms 
     http_req_sending...............: avg=96.35µs  min=5.49µs  med=10.48µs max=346.71ms p(90)=19.56µs  p(95)=136.08µs p(99.9)=14.53ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=84.33ms  min=1.5ms   med=78.26ms max=299.79ms p(90)=164.4ms  p(95)=180.95ms p(99.9)=238.02ms
     http_reqs......................: 167455  2706.49434/s
     iteration_duration.............: avg=85.64ms  min=2.26ms  med=79.56ms max=411.95ms p(90)=165.66ms p(95)=182.95ms p(99.9)=243.19ms
     iterations.....................: 166455  2690.331823/s
     success_rate...................: 100.00% ✓ 166455      ✗ 0     
     vus............................: 51      min=0         max=500 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (rust subgraphs) (16.1.0-p.1.9)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 387588      ✗ 0     
     data_received..................: 11 GB   182 MB/s
     data_sent......................: 156 MB  2.5 MB/s
     http_req_blocked...............: avg=18.85µs  min=1.04µs  med=2.57µs   max=64.18ms  p(90)=3.97µs   p(95)=4.89µs   p(99.9)=2.19ms  
     http_req_connecting............: avg=15.24µs  min=0s      med=0s       max=63.95ms  p(90)=0s       p(95)=0s       p(99.9)=2.11ms  
     http_req_duration..............: avg=109.29ms min=2.41ms  med=100.86ms max=692.98ms p(90)=213.81ms p(95)=251.58ms p(99.9)=458.56ms
       { expected_response:true }...: avg=109.29ms min=2.41ms  med=100.86ms max=692.98ms p(90)=213.81ms p(95)=251.58ms p(99.9)=458.56ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 130196
     http_req_receiving.............: avg=2.33ms   min=53.74µs med=116.47µs max=295.31ms p(90)=1.61ms   p(95)=6.13ms   p(99.9)=160.22ms
     http_req_sending...............: avg=66.99µs  min=5.27µs  med=10.27µs  max=224.6ms  p(90)=18.23µs  p(95)=125.46µs p(99.9)=9.45ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=106.89ms min=2.3ms   med=99.65ms  max=600.94ms p(90)=209.47ms p(95)=243.32ms p(99.9)=410.43ms
     http_reqs......................: 130196  2073.103309/s
     iteration_duration.............: avg=110.42ms min=3.1ms   med=102.11ms max=693.18ms p(90)=214.6ms  p(95)=252.43ms p(99.9)=459.64ms
     iterations.....................: 129196  2057.180367/s
     success_rate...................: 100.00% ✓ 129196      ✗ 0     
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

     checks.........................: 100.00% ✓ 214266      ✗ 0    
     data_received..................: 6.4 GB  102 MB/s
     data_sent......................: 87 MB   1.4 MB/s
     http_req_blocked...............: avg=6.32µs   min=1.1µs   med=2.54µs   max=21.97ms  p(90)=4.04µs   p(95)=4.88µs   p(99.9)=528.16µs
     http_req_connecting............: avg=2.97µs   min=0s      med=0s       max=21.91ms  p(90)=0s       p(95)=0s       p(99.9)=426.22µs
     http_req_duration..............: avg=197.07ms min=2.09ms  med=196.94ms max=640.56ms p(90)=365.98ms p(95)=393.26ms p(99.9)=530.58ms
       { expected_response:true }...: avg=197.07ms min=2.09ms  med=196.94ms max=640.56ms p(90)=365.98ms p(95)=393.26ms p(99.9)=530.58ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 72422
     http_req_receiving.............: avg=119.59µs min=30.07µs med=62.65µs  max=155.39ms p(90)=95.26µs  p(95)=108.49µs p(99.9)=2.63ms  
     http_req_sending...............: avg=28.22µs  min=5.49µs  med=10.7µs   max=37.15ms  p(90)=16.17µs  p(95)=19.6µs   p(99.9)=3.59ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=196.92ms min=2.03ms  med=196.64ms max=640.5ms  p(90)=365.9ms  p(95)=393.18ms p(99.9)=530.49ms
     http_reqs......................: 72422   1158.180317/s
     iteration_duration.............: avg=200.08ms min=4.07ms  med=200.33ms max=640.76ms p(90)=366.95ms p(95)=393.95ms p(99.9)=531.35ms
     iterations.....................: 71422   1142.188211/s
     success_rate...................: 100.00% ✓ 71422       ✗ 0    
     vus............................: 83      min=0         max=493
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

     checks.........................: 100.00% ✓ 93696      ✗ 0    
     data_received..................: 2.8 GB  44 MB/s
     data_sent......................: 39 MB   597 kB/s
     http_req_blocked...............: avg=9.31µs   min=1.21µs  med=3.14µs   max=8.16ms  p(90)=4.92µs   p(95)=5.98µs   p(99.9)=1.2ms   
     http_req_connecting............: avg=5.19µs   min=0s      med=0s       max=8.1ms   p(90)=0s       p(95)=0s       p(99.9)=1.17ms  
     http_req_duration..............: avg=445.58ms min=3.93ms  med=416ms    max=1.75s   p(90)=876.46ms p(95)=953.95ms p(99.9)=1.42s   
       { expected_response:true }...: avg=445.58ms min=3.93ms  med=416ms    max=1.75s   p(90)=876.46ms p(95)=953.95ms p(99.9)=1.42s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 32232
     http_req_receiving.............: avg=87.3µs   min=33.53µs med=77.74µs  max=19.09ms p(90)=114.39µs p(95)=127.64µs p(99.9)=867.77µs
     http_req_sending...............: avg=31.86µs  min=5.9µs   med=13.58µs  max=78.57ms p(90)=21.24µs  p(95)=24.52µs  p(99.9)=3.62ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=445.47ms min=3.88ms  med=415.9ms  max=1.75s   p(90)=876.36ms p(95)=953.85ms p(99.9)=1.42s   
     http_reqs......................: 32232   497.078806/s
     iteration_duration.............: avg=460.08ms min=18.39ms med=434.09ms max=1.75s   p(90)=880.78ms p(95)=957.12ms p(99.9)=1.43s   
     iterations.....................: 31232   481.656902/s
     success_rate...................: 100.00% ✓ 31232      ✗ 0    
     vus............................: 94      min=0        max=500
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

     checks.........................: 100.00% ✓ 43893      ✗ 0    
     data_received..................: 1.4 GB  20 MB/s
     data_sent......................: 19 MB   277 kB/s
     http_req_blocked...............: avg=18.01µs  min=1.34µs  med=3.57µs   max=28.7ms  p(90)=5.33µs   p(95)=6.84µs   p(99.9)=2.75ms  
     http_req_connecting............: avg=12.82µs  min=0s      med=0s       max=28.64ms p(90)=0s       p(95)=0s       p(99.9)=2.72ms  
     http_req_duration..............: avg=919.64ms min=6.09ms  med=831.96ms max=14.42s  p(90)=1.7s     p(95)=1.85s    p(99.9)=12.84s  
       { expected_response:true }...: avg=919.64ms min=6.09ms  med=831.96ms max=14.42s  p(90)=1.7s     p(95)=1.85s    p(99.9)=12.84s  
     http_req_failed................: 0.00%   ✓ 0          ✗ 15631
     http_req_receiving.............: avg=108.13µs min=36.02µs med=96.03µs  max=60.54ms p(90)=135.54µs p(95)=148.98µs p(99.9)=956.22µs
     http_req_sending...............: avg=36.18µs  min=6.16µs  med=17.14µs  max=84.56ms p(90)=23.41µs  p(95)=28.36µs  p(99.9)=3.28ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=919.5ms  min=5.96ms  med=831.85ms max=14.42s  p(90)=1.7s     p(95)=1.85s    p(99.9)=12.84s  
     http_reqs......................: 15631   229.889141/s
     iteration_duration.............: avg=982.53ms min=60.86ms med=901.73ms max=14.42s  p(90)=1.72s    p(95)=1.87s    p(99.9)=12.99s  
     iterations.....................: 14631   215.181883/s
     success_rate...................: 100.00% ✓ 14631      ✗ 0    
     vus............................: 49      min=0        max=500
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

     checks.........................: 100.00% ✓ 42402      ✗ 0    
     data_received..................: 1.3 GB  18 MB/s
     data_sent......................: 19 MB   250 kB/s
     http_req_blocked...............: avg=16.45µs  min=1.21µs  med=3.56µs   max=5.28ms  p(90)=5.28µs   p(95)=7µs      p(99.9)=2.74ms  
     http_req_connecting............: avg=11.02µs  min=0s      med=0s       max=5.2ms   p(90)=0s       p(95)=0s       p(99.9)=2.71ms  
     http_req_duration..............: avg=496.45ms min=8.44ms  med=568.11ms max=1.35s   p(90)=836.59ms p(95)=907.19ms p(99.9)=1.24s   
       { expected_response:true }...: avg=496.45ms min=8.44ms  med=568.11ms max=1.35s   p(90)=836.59ms p(95)=907.19ms p(99.9)=1.24s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 15134
     http_req_receiving.............: avg=105.58µs min=34.98µs med=95.6µs   max=63.16ms p(90)=135.44µs p(95)=147.68µs p(99.9)=863.21µs
     http_req_sending...............: avg=41.72µs  min=5.66µs  med=17.13µs  max=89.25ms p(90)=23.17µs  p(95)=28.37µs  p(99.9)=3.32ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=496.3ms  min=8.34ms  med=567.98ms max=1.35s   p(90)=836.52ms p(95)=907ms    p(99.9)=1.24s   
     http_reqs......................: 15134   203.705645/s
     iteration_duration.............: avg=531.48ms min=15.35ms med=614.58ms max=1.36s   p(90)=844.76ms p(95)=913.27ms p(99.9)=1.25s   
     iterations.....................: 14134   190.245513/s
     success_rate...................: 100.00% ✓ 14134      ✗ 0    
     vus............................: 58      min=0        max=497
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

     checks.........................: 100.00% ✓ 411531      ✗ 0     
     data_received..................: 12 GB   194 MB/s
     data_sent......................: 166 MB  2.7 MB/s
     http_req_blocked...............: avg=21.16µs  min=1.04µs  med=3.06µs  max=58.08ms  p(90)=4.94µs   p(95)=6.23µs   p(99.9)=2.72ms  
     http_req_connecting............: avg=17.2µs   min=0s      med=0s      max=58ms     p(90)=0s       p(95)=0s       p(99.9)=2.6ms   
     http_req_duration..............: avg=102.92ms min=1.6ms   med=97.84ms max=336.56ms p(90)=197.96ms p(95)=215.06ms p(99.9)=273.28ms
       { expected_response:true }...: avg=102.92ms min=1.6ms   med=97.84ms max=336.56ms p(90)=197.96ms p(95)=215.06ms p(99.9)=273.28ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 138177
     http_req_receiving.............: avg=209.99µs min=29.14µs med=64µs    max=152.65ms p(90)=174.06µs p(95)=427.87µs p(99.9)=24.23ms 
     http_req_sending...............: avg=80.64µs  min=5.61µs  med=11.71µs max=233.77ms p(90)=21.95µs  p(95)=142.88µs p(99.9)=11.21ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=102.63ms min=1.55ms  med=97.62ms max=322.32ms p(90)=197.64ms p(95)=214.58ms p(99.9)=271.87ms
     http_reqs......................: 138177  2223.675676/s
     iteration_duration.............: avg=103.96ms min=4.39ms  med=99.02ms max=344.07ms p(90)=198.53ms p(95)=215.59ms p(99.9)=274.22ms
     iterations.....................: 137177  2207.582725/s
     success_rate...................: 100.00% ✓ 137177      ✗ 0     
     vus............................: 64      min=0         max=496 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (.net subgraphs) (16.1.0-p.1.9)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 357369      ✗ 0     
     data_received..................: 11 GB   169 MB/s
     data_sent......................: 144 MB  2.3 MB/s
     http_req_blocked...............: avg=18.29µs  min=961ns   med=2.76µs   max=81.22ms  p(90)=4.35µs   p(95)=5.44µs   p(99.9)=2.8ms   
     http_req_connecting............: avg=14.84µs  min=0s      med=0s       max=81.13ms  p(90)=0s       p(95)=0s       p(99.9)=2.74ms  
     http_req_duration..............: avg=118.51ms min=1.8ms   med=110.19ms max=932.98ms p(90)=227.08ms p(95)=257.43ms p(99.9)=609.63ms
       { expected_response:true }...: avg=118.51ms min=1.8ms   med=110.19ms max=932.98ms p(90)=227.08ms p(95)=257.43ms p(99.9)=609.63ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 120123
     http_req_receiving.............: avg=1.5ms    min=53.52µs med=117.62µs max=257.6ms  p(90)=1.6ms    p(95)=4.15ms   p(99.9)=109.64ms
     http_req_sending...............: avg=65.84µs  min=5.42µs  med=11.08µs  max=62.15ms  p(90)=20.58µs  p(95)=126.75µs p(99.9)=8.72ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=116.93ms min=1.69ms  med=108.86ms max=932.87ms p(90)=224.74ms p(95)=253.17ms p(99.9)=607.43ms
     http_reqs......................: 120123  1928.60164/s
     iteration_duration.............: avg=119.78ms min=3.09ms  med=111.69ms max=933.18ms p(90)=227.77ms p(95)=258.17ms p(99.9)=609.93ms
     iterations.....................: 119123  1912.546417/s
     success_rate...................: 100.00% ✓ 119123      ✗ 0     
     vus............................: 71      min=0         max=495 
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

     checks.........................: 100.00% ✓ 90273      ✗ 0    
     data_received..................: 2.7 GB  42 MB/s
     data_sent......................: 37 MB   572 kB/s
     http_req_blocked...............: avg=9.92µs   min=1.22µs med=3.37µs   max=4.13ms   p(90)=5.25µs   p(95)=6.29µs   p(99.9)=1.82ms  
     http_req_connecting............: avg=5.44µs   min=0s     med=0s       max=4.09ms   p(90)=0s       p(95)=0s       p(99.9)=1.77ms  
     http_req_duration..............: avg=462.44ms min=4.21ms med=425.32ms max=1.98s    p(90)=918.67ms p(95)=996.53ms p(99.9)=1.56s   
       { expected_response:true }...: avg=462.44ms min=4.21ms med=425.32ms max=1.98s    p(90)=918.67ms p(95)=996.53ms p(99.9)=1.56s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 31091
     http_req_receiving.............: avg=99.45µs  min=34.1µs med=82.91µs  max=118.97ms p(90)=118.86µs p(95)=132.57µs p(99.9)=844.75µs
     http_req_sending...............: avg=32.73µs  min=5.67µs med=14.94µs  max=74.66ms  p(90)=22.21µs  p(95)=25.57µs  p(99.9)=3.46ms  
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=462.31ms min=4.12ms med=425.23ms max=1.98s    p(90)=918.57ms p(95)=996.4ms  p(99.9)=1.56s   
     http_reqs......................: 31091   476.159219/s
     iteration_duration.............: avg=478.04ms min=22.2ms med=442.28ms max=1.99s    p(90)=922.5ms  p(95)=999.7ms  p(99.9)=1.57s   
     iterations.....................: 30091   460.844201/s
     success_rate...................: 100.00% ✓ 30091      ✗ 0    
     vus............................: 71      min=0        max=497
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

     checks.........................: 100.00% ✓ 43578      ✗ 0    
     data_received..................: 1.4 GB  20 MB/s
     data_sent......................: 19 MB   274 kB/s
     http_req_blocked...............: avg=17.7µs   min=1.14µs  med=3.75µs   max=37.71ms p(90)=5.63µs   p(95)=7.29µs  p(99.9)=2.55ms 
     http_req_connecting............: avg=12µs     min=0s      med=0s       max=37.66ms p(90)=0s       p(95)=0s      p(99.9)=2.5ms  
     http_req_duration..............: avg=938.81ms min=6.25ms  med=867.11ms max=5.44s   p(90)=1.84s    p(95)=2.04s   p(99.9)=4.88s  
       { expected_response:true }...: avg=938.81ms min=6.25ms  med=867.11ms max=5.44s   p(90)=1.84s    p(95)=2.04s   p(99.9)=4.88s  
     http_req_failed................: 0.00%   ✓ 0          ✗ 15526
     http_req_receiving.............: avg=105.88µs min=35.32µs med=99µs     max=29.67ms p(90)=137.67µs p(95)=150.9µs p(99.9)=741.6µs
     http_req_sending...............: avg=34.9µs   min=6.12µs  med=18.53µs  max=56.63ms p(90)=24.54µs  p(95)=29.11µs p(99.9)=2.38ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=938.67ms min=6.16ms  med=867.01ms max=5.44s   p(90)=1.84s    p(95)=2.04s   p(99.9)=4.88s  
     http_reqs......................: 15526   227.968947/s
     iteration_duration.............: avg=1s       min=47.64ms med=931.88ms max=5.45s   p(90)=1.86s    p(95)=2.07s   p(99.9)=4.92s  
     iterations.....................: 14526   213.285903/s
     success_rate...................: 100.00% ✓ 14526      ✗ 0    
     vus............................: 60      min=0        max=499
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

     checks.........................: 100.00% ✓ 40692      ✗ 0    
     data_received..................: 1.3 GB  18 MB/s
     data_sent......................: 18 MB   250 kB/s
     http_req_blocked...............: avg=18.72µs  min=1.25µs  med=3.68µs   max=27.86ms  p(90)=5.58µs   p(95)=7.28µs   p(99.9)=2.65ms  
     http_req_connecting............: avg=13.09µs  min=0s      med=0s       max=27.79ms  p(90)=0s       p(95)=0s       p(99.9)=2.63ms  
     http_req_duration..............: avg=1s       min=8.64ms  med=916.73ms max=4.15s    p(90)=2.03s    p(95)=2.16s    p(99.9)=3.71s   
       { expected_response:true }...: avg=1s       min=8.64ms  med=916.73ms max=4.15s    p(90)=2.03s    p(95)=2.16s    p(99.9)=3.71s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 14564
     http_req_receiving.............: avg=111.97µs min=36.43µs med=99.42µs  max=105.26ms p(90)=140.29µs p(95)=153.04µs p(99.9)=688.84µs
     http_req_sending...............: avg=42.39µs  min=6µs     med=18.08µs  max=55.35ms  p(90)=24.18µs  p(95)=29.55µs  p(99.9)=3.78ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=1s       min=8.53ms  med=916.6ms  max=4.15s    p(90)=2.03s    p(95)=2.16s    p(99.9)=3.71s   
     http_reqs......................: 14564   208.415884/s
     iteration_duration.............: avg=1.07s    min=47.76ms med=995.33ms max=4.16s    p(90)=2.05s    p(95)=2.18s    p(99.9)=3.72s   
     iterations.....................: 13564   194.105537/s
     success_rate...................: 100.00% ✓ 13564      ✗ 0    
     vus............................: 8       min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-176-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

