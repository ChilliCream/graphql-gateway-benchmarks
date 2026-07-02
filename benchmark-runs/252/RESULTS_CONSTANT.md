## Overview for: `constant-vus-over-time`

Each benchmark runs a GraphQL gateway with 4 subgraphs and executes a heavy nested query that exercises federation/composition capabilities.

Results are split by subgraph technology:
- **Rust Subgraphs** = [async-graphql](https://github.com/async-graphql/async-graphql) + axum
- **.NET Subgraphs** = [HotChocolate](https://github.com/ChilliCream/graphql-platform)

**Methodology:** Each gateway executes 10 runs of 120s each. The first run is a full-duration warmup (discarded). The remaining 9 runs are measured. Results are ranked by **median RPS** across the 9 measured runs, with best/worst/CV% reported for transparency.

This scenario executes a constant load of **50 VUs** over **120s**.


### Rust Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.74 | 2,778 | 2,962 | 2,730 | 2.8% |  |
| fusion | 16.3.0 | 2,200 | 2,249 | 2,181 | 1.0% |  |
| fusion-nightly | 16.4.0-p.12 | 2,175 | 2,234 | 2,152 | 1.2% |  |
| grafbase | 0.53.5 | 2,051 | 2,109 | 2,011 | 1.6% |  |
| cosmo | 0.326.1 | 1,189 | 1,215 | 1,181 | 0.9% |  |
| hive-gateway-router-runtime | 2.10.0 | 559 | 574 | 553 | 1.3% |  |
| apollo-router | v2.15.1 | 408 | 422 | 402 | 1.7% |  |
| hive-gateway | 2.10.0 | 249 | 254 | 247 | 1.1% |  |
| apollo-gateway | 2.14.2 | 243 | 246 | 241 | 0.7% |  |
| feddi | 77271dc84a06 | 0 | 0 | 0 | 0.0% | non-compatible response (730 across 5/6 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.74 | 2,259 | 2,408 | 2,220 | 2.7% |  |
| fusion-nightly | 16.4.0-p.12 | 2,107 | 2,158 | 2,092 | 1.0% |  |
| fusion | 16.3.0 | 1,974 | 2,030 | 1,939 | 1.4% |  |
| grafbase | 0.53.5 | 1,504 | 1,533 | 1,486 | 0.9% |  |
| cosmo | 0.326.1 | 1,121 | 1,146 | 1,115 | 0.9% |  |
| hive-gateway-router-runtime | 2.10.0 | 532 | 548 | 527 | 1.3% |  |
| apollo-router | v2.15.1 | 381 | 395 | 375 | 1.7% |  |
| apollo-gateway | 2.14.2 | 237 | 239 | 236 | 0.5% |  |
| hive-gateway | 2.10.0 | 231 | 237 | 229 | 1.2% |  |
| feddi | 77271dc84a06 | 14 | 15 | 11 | 8.1% |  |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.74)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 1001766     ✗ 0     
     data_received..................: 29 GB   244 MB/s
     data_sent......................: 401 MB  3.3 MB/s
     http_req_blocked...............: avg=2.94µs   min=992ns   med=2.02µs  max=21.53ms  p(90)=3.12µs  p(95)=3.73µs   p(99.9)=30.57µs
     http_req_connecting............: avg=344ns    min=0s      med=0s      max=4.82ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=17.73ms  min=1.63ms  med=16.87ms max=337.27ms p(90)=26.48ms p(95)=30.17ms  p(99.9)=51.97ms
       { expected_response:true }...: avg=17.73ms  min=1.63ms  med=16.87ms max=337.27ms p(90)=26.48ms p(95)=30.17ms  p(99.9)=51.97ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 334022
     http_req_receiving.............: avg=121.81µs min=28.29µs med=49.78µs max=153.26ms p(90)=94.94µs p(95)=262.58µs p(99.9)=11.82ms
     http_req_sending...............: avg=55.13µs  min=5.31µs  med=9.05µs  max=221.49ms p(90)=15.24µs p(95)=119.78µs p(99.9)=6.85ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=17.55ms  min=1.58ms  med=16.73ms max=315.53ms p(90)=26.25ms p(95)=29.85ms  p(99.9)=50.73ms
     http_reqs......................: 334022  2778.973325/s
     iteration_duration.............: avg=17.95ms  min=2.03ms  med=17.08ms max=350.97ms p(90)=26.7ms  p(95)=30.41ms  p(99.9)=52.99ms
     iterations.....................: 333922  2778.141352/s
     success_rate...................: 100.00% ✓ 333922      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
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

     checks.........................: 100.00% ✓ 793725      ✗ 0     
     data_received..................: 23 GB   193 MB/s
     data_sent......................: 318 MB  2.6 MB/s
     http_req_blocked...............: avg=2.78µs   min=971ns   med=2.06µs   max=15.32ms  p(90)=3.19µs  p(95)=3.81µs   p(99.9)=32.5µs  
     http_req_connecting............: avg=277ns    min=0s      med=0s       max=3.5ms    p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=22.43ms  min=2.45ms  med=14.81ms  max=296.87ms p(90)=49.02ms p(95)=66.34ms  p(99.9)=159.97ms
       { expected_response:true }...: avg=22.43ms  min=2.45ms  med=14.81ms  max=296.87ms p(90)=49.02ms p(95)=66.34ms  p(99.9)=159.97ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 264675
     http_req_receiving.............: avg=909.19µs min=52.07µs med=124.24µs max=254.14ms p(90)=1.35ms  p(95)=2.23ms   p(99.9)=61.36ms 
     http_req_sending...............: avg=42.02µs  min=5.29µs  med=9.19µs   max=31.06ms  p(90)=15.85µs p(95)=107.92µs p(99.9)=2.8ms   
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=21.48ms  min=2.36ms  med=14.07ms  max=296.22ms p(90)=47.32ms p(95)=64.46ms  p(99.9)=157.34ms
     http_reqs......................: 264675  2200.036339/s
     iteration_duration.............: avg=22.67ms  min=3.08ms  med=15.03ms  max=335.6ms  p(90)=49.27ms p(95)=66.59ms  p(99.9)=161.22ms
     iterations.....................: 264575  2199.205117/s
     success_rate...................: 100.00% ✓ 264575      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (rust subgraphs) (16.4.0-p.12)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 784686      ✗ 0     
     data_received..................: 23 GB   191 MB/s
     data_sent......................: 314 MB  2.6 MB/s
     http_req_blocked...............: avg=2.73µs  min=1.01µs  med=2.04µs   max=12.46ms  p(90)=3.24µs  p(95)=3.92µs   p(99.9)=29.69µs 
     http_req_connecting............: avg=279ns   min=0s      med=0s       max=3.32ms   p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=22.69ms min=2.35ms  med=19.43ms  max=313.53ms p(90)=38.75ms p(95)=48.31ms  p(99.9)=112.67ms
       { expected_response:true }...: avg=22.69ms min=2.35ms  med=19.43ms  max=313.53ms p(90)=38.75ms p(95)=48.31ms  p(99.9)=112.67ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 261662
     http_req_receiving.............: avg=1.16ms  min=51.79µs med=391.93µs max=236.85ms p(90)=2.37ms  p(95)=3.52ms   p(99.9)=43.46ms 
     http_req_sending...............: avg=45.26µs min=5.28µs  med=9.12µs   max=92.54ms  p(90)=16.92µs p(95)=111.97µs p(99.9)=4.02ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=21.48ms min=2.24ms  med=18.28ms  max=196.14ms p(90)=37.02ms p(95)=46.34ms  p(99.9)=108.07ms
     http_reqs......................: 261662  2175.327393/s
     iteration_duration.............: avg=22.93ms min=3.04ms  med=19.65ms  max=343.92ms p(90)=39ms    p(95)=48.57ms  p(99.9)=113.64ms
     iterations.....................: 261562  2174.496043/s
     success_rate...................: 100.00% ✓ 261562      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: grafbase (rust subgraphs) (0.53.5)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 739614      ✗ 0     
     data_received..................: 22 GB   180 MB/s
     data_sent......................: 296 MB  2.5 MB/s
     http_req_blocked...............: avg=3.09µs   min=1.01µs  med=2.4µs   max=7.18ms   p(90)=4µs      p(95)=4.79µs   p(99.9)=43.71µs
     http_req_connecting............: avg=177ns    min=0s      med=0s      max=2.47ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=24.09ms  min=1.96ms  med=23.86ms max=330.82ms p(90)=28.81ms  p(95)=30.95ms  p(99.9)=52.73ms
       { expected_response:true }...: avg=24.09ms  min=1.96ms  med=23.86ms max=330.82ms p(90)=28.81ms  p(95)=30.95ms  p(99.9)=52.73ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 246638
     http_req_receiving.............: avg=105.09µs min=28.91µs med=58.62µs max=298.8ms  p(90)=101.88µs p(95)=178.77µs p(99.9)=7.9ms  
     http_req_sending...............: avg=42.19µs  min=4.75µs  med=10.54µs max=110.96ms p(90)=18.46µs  p(95)=112.73µs p(99.9)=2.08ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=23.94ms  min=1.87ms  med=23.74ms max=317.41ms p(90)=28.65ms  p(95)=30.72ms  p(99.9)=51.35ms
     http_reqs......................: 246638  2051.068223/s
     iteration_duration.............: avg=24.32ms  min=3.74ms  med=24.07ms max=341.84ms p(90)=29.03ms  p(95)=31.17ms  p(99.9)=53.53ms
     iterations.....................: 246538  2050.236612/s
     success_rate...................: 100.00% ✓ 246538      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (rust subgraphs) (0.326.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 428853      ✗ 0     
     data_received..................: 13 GB   104 MB/s
     data_sent......................: 172 MB  1.4 MB/s
     http_req_blocked...............: avg=3.2µs    min=1.07µs  med=2.16µs  max=3.93ms   p(90)=3.58µs  p(95)=4.2µs    p(99.9)=37.63µs
     http_req_connecting............: avg=703ns    min=0s      med=0s      max=3.88ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=41.73ms  min=2.15ms  med=41.16ms max=340.27ms p(90)=58.92ms p(95)=64.44ms  p(99.9)=89.13ms
       { expected_response:true }...: avg=41.73ms  min=2.15ms  med=41.16ms max=340.27ms p(90)=58.92ms p(95)=64.44ms  p(99.9)=89.13ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 143051
     http_req_receiving.............: avg=103.02µs min=29.04µs med=62.13µs max=193.37ms p(90)=98.07µs p(95)=115.15µs p(99.9)=1.94ms 
     http_req_sending...............: avg=26.18µs  min=5.45µs  med=10.23µs max=266.06ms p(90)=16.11µs p(95)=19.56µs  p(99.9)=1.11ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=41.6ms   min=2.05ms  med=41.06ms max=146.7ms  p(90)=58.81ms p(95)=64.32ms  p(99.9)=88.26ms
     http_reqs......................: 143051  1189.372361/s
     iteration_duration.............: avg=41.96ms  min=4.21ms  med=41.36ms max=364.91ms p(90)=59.12ms p(95)=64.65ms  p(99.9)=89.66ms
     iterations.....................: 142951  1188.540929/s
     success_rate...................: 100.00% ✓ 142951      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (rust subgraphs) (2.10.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 202110     ✗ 0    
     data_received..................: 5.9 GB  49 MB/s
     data_sent......................: 81 MB   672 kB/s
     http_req_blocked...............: avg=3.56µs  min=1.11µs  med=2.52µs  max=3.82ms   p(90)=4.13µs   p(95)=4.72µs   p(99.9)=43.95µs 
     http_req_connecting............: avg=651ns   min=0s      med=0s      max=2.34ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=88.71ms min=3.96ms  med=86.59ms max=313.49ms p(90)=107.14ms p(95)=117.3ms  p(99.9)=214.64ms
       { expected_response:true }...: avg=88.71ms min=3.96ms  med=86.59ms max=313.49ms p(90)=107.14ms p(95)=117.3ms  p(99.9)=214.64ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 67470
     http_req_receiving.............: avg=82.56µs min=30.03µs med=73.8µs  max=49.33ms  p(90)=108.94µs p(95)=121.86µs p(99.9)=916.29µs
     http_req_sending...............: avg=25.35µs min=5.63µs  med=12.43µs max=130.65ms p(90)=19.46µs  p(95)=21.55µs  p(99.9)=652.64µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=88.6ms  min=3.86ms  med=86.49ms max=312.79ms p(90)=107.04ms p(95)=117.2ms  p(99.9)=214.55ms
     http_reqs......................: 67470   559.767068/s
     iteration_duration.............: avg=89.07ms min=26.85ms med=86.81ms max=339.49ms p(90)=107.39ms p(95)=117.54ms p(99.9)=216.29ms
     iterations.....................: 67370   558.937414/s
     success_rate...................: 100.00% ✓ 67370      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-router (rust subgraphs) (v2.15.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 147498     ✗ 0    
     data_received..................: 4.3 GB  36 MB/s
     data_sent......................: 59 MB   490 kB/s
     http_req_blocked...............: avg=3.98µs   min=1.16µs  med=2.96µs   max=1.94ms   p(90)=4.29µs   p(95)=4.79µs   p(99.9)=93.69µs 
     http_req_connecting............: avg=855ns    min=0s      med=0s       max=1.91ms   p(90)=0s       p(95)=0s       p(99.9)=68.4µs  
     http_req_duration..............: avg=121.57ms min=5.27ms  med=121.27ms max=375.32ms p(90)=146.81ms p(95)=154.21ms p(99.9)=189.46ms
       { expected_response:true }...: avg=121.57ms min=5.27ms  med=121.27ms max=375.32ms p(90)=146.81ms p(95)=154.21ms p(99.9)=189.46ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 49266
     http_req_receiving.............: avg=95.72µs  min=31.09µs med=80.58µs  max=203.01ms p(90)=112.22µs p(95)=124.23µs p(99.9)=826.01µs
     http_req_sending...............: avg=30.86µs  min=5.85µs  med=14.33µs  max=219.63ms p(90)=19.76µs  p(95)=21.54µs  p(99.9)=557.27µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=121.44ms min=5.17ms  med=121.17ms max=364.19ms p(90)=146.68ms p(95)=154.09ms p(99.9)=188.53ms
     http_reqs......................: 49266   408.251438/s
     iteration_duration.............: avg=122.06ms min=27.99ms med=121.55ms max=383.75ms p(90)=147.06ms p(95)=154.48ms p(99.9)=192.96ms
     iterations.....................: 49166   407.42277/s
     success_rate...................: 100.00% ✓ 49166      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (rust subgraphs) (2.10.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 90054      ✗ 0    
     data_received..................: 2.6 GB  22 MB/s
     data_sent......................: 36 MB   299 kB/s
     http_req_blocked...............: avg=5.14µs   min=1.2µs   med=3.51µs   max=2.05ms   p(90)=4.93µs   p(95)=5.52µs   p(99.9)=650.68µs
     http_req_connecting............: avg=1.45µs   min=0s      med=0s       max=2.02ms   p(90)=0s       p(95)=0s       p(99.9)=612.88µs
     http_req_duration..............: avg=199.05ms min=6.12ms  med=180.83ms max=712.1ms  p(90)=228.49ms p(95)=276.07ms p(99.9)=614.46ms
       { expected_response:true }...: avg=199.05ms min=6.12ms  med=180.83ms max=712.1ms  p(90)=228.49ms p(95)=276.07ms p(99.9)=614.46ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 30118
     http_req_receiving.............: avg=103.46µs min=35.21µs med=98.13µs  max=35.36ms  p(90)=130µs    p(95)=144.11µs p(99.9)=654.53µs
     http_req_sending...............: avg=35.52µs  min=6µs     med=17.87µs  max=178.71ms p(90)=22.94µs  p(95)=24.92µs  p(99.9)=548.12µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=198.91ms min=6.03ms  med=180.71ms max=711.98ms p(90)=228.37ms p(95)=275.95ms p(99.9)=612.94ms
     http_reqs......................: 30118   249.09217/s
     iteration_duration.............: avg=200.01ms min=63.61ms med=181.19ms max=712.43ms p(90)=228.88ms p(95)=277.81ms p(99.9)=617.18ms
     iterations.....................: 30018   248.265116/s
     success_rate...................: 100.00% ✓ 30018      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
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

     checks.........................: 100.00% ✓ 88122      ✗ 0    
     data_received..................: 2.6 GB  21 MB/s
     data_sent......................: 35 MB   292 kB/s
     http_req_blocked...............: avg=6.6µs    min=1.27µs  med=3.15µs   max=3.9ms    p(90)=4.36µs   p(95)=4.85µs   p(99.9)=1.68ms  
     http_req_connecting............: avg=3.31µs   min=0s      med=0s       max=3.86ms   p(90)=0s       p(95)=0s       p(99.9)=1.66ms  
     http_req_duration..............: avg=203.41ms min=8.59ms  med=210.82ms max=401.37ms p(90)=243.64ms p(95)=250.18ms p(99.9)=324.34ms
       { expected_response:true }...: avg=203.41ms min=8.59ms  med=210.82ms max=401.37ms p(90)=243.64ms p(95)=250.18ms p(99.9)=324.34ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29474
     http_req_receiving.............: avg=90.83µs  min=35µs    med=86.48µs  max=11.11ms  p(90)=118.31µs p(95)=130.05µs p(99.9)=448.81µs
     http_req_sending...............: avg=32.74µs  min=5.88µs  med=15.26µs  max=125.93ms p(90)=20.15µs  p(95)=21.89µs  p(99.9)=565.12µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=203.29ms min=8.45ms  med=210.66ms max=400.69ms p(90)=243.53ms p(95)=250.06ms p(99.9)=324.24ms
     http_reqs......................: 29474   243.46135/s
     iteration_duration.............: avg=204.37ms min=58.08ms med=212.27ms max=409.45ms p(90)=243.99ms p(95)=250.47ms p(99.9)=327.18ms
     iterations.....................: 29374   242.635329/s
     success_rate...................: 100.00% ✓ 29374      ✗ 0    
     vus............................: 27      min=27       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: feddi (rust subgraphs) (77271dc84a06)</summary>

  **K6 Output**


```
data_received..................: 4.4 MB 73 kB/s
     data_sent......................: 56 kB  939 B/s
     http_req_blocked...............: avg=9.4µs    min=3.08µs  med=3.86µs   max=197.93µs p(90)=5.53µs   p(95)=6.02µs   p(99.9)=191.56µs
     http_req_connecting............: avg=2.51µs   min=0s      med=0s       max=115.59µs p(90)=0s       p(95)=0s       p(99.9)=110.39µs
     http_req_duration..............: avg=686.44ms min=25.01ms med=33.21ms  max=30.02s   p(90)=44.19ms  p(95)=49.4ms   p(99.9)=28.67s  
       { expected_response:true }...: avg=686.44ms min=25.01ms med=33.21ms  max=30.02s   p(90)=44.19ms  p(95)=49.4ms   p(99.9)=28.67s  
     http_req_failed................: 0.00%  ✓ 0        ✗ 46  
     http_req_receiving.............: avg=152.07µs min=88.59µs med=154.72µs max=406.05µs p(90)=189.86µs p(95)=200.39µs p(99.9)=399.7µs 
     http_req_sending...............: avg=23.3µs   min=14.91µs med=21.66µs  max=67.06µs  p(90)=25.33µs  p(95)=33.38µs  p(99.9)=65.86µs 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=686.26ms min=24.83ms med=33.09ms  max=30.02s   p(90)=43.89ms  p(95)=49.19ms  p(99.9)=28.67s  
     http_reqs......................: 46     0.766658/s
     vus............................: 0      min=0      max=0 
     vus_max........................: 50     min=50     max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.74)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 814743      ✗ 0     
     data_received..................: 24 GB   198 MB/s
     data_sent......................: 327 MB  2.7 MB/s
     http_req_blocked...............: avg=2.93µs   min=992ns   med=2.13µs  max=13.16ms  p(90)=3.45µs  p(95)=4.21µs   p(99.9)=36.72µs
     http_req_connecting............: avg=311ns    min=0s      med=0s      max=3.66ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=21.85ms  min=1.95ms  med=21.4ms  max=325.66ms p(90)=30.32ms p(95)=33.37ms  p(99.9)=55.05ms
       { expected_response:true }...: avg=21.85ms  min=1.95ms  med=21.4ms  max=325.66ms p(90)=30.32ms p(95)=33.37ms  p(99.9)=55.05ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 271681
     http_req_receiving.............: avg=111.47µs min=28.29µs med=54.38µs max=156.65ms p(90)=99.42µs p(95)=232.88µs p(99.9)=9.24ms 
     http_req_sending...............: avg=52.06µs  min=5.29µs  med=9.78µs  max=213.18ms p(90)=17.08µs p(95)=118.83µs p(99.9)=5.36ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=21.69ms  min=1.87ms  med=21.26ms max=322.17ms p(90)=30.14ms p(95)=33.1ms   p(99.9)=54.19ms
     http_reqs......................: 271681  2259.178459/s
     iteration_duration.............: avg=22.08ms  min=3.27ms  med=21.61ms max=338.47ms p(90)=30.55ms p(95)=33.61ms  p(99.9)=55.56ms
     iterations.....................: 271581  2258.346903/s
     success_rate...................: 100.00% ✓ 271581      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.4.0-p.12)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 759894      ✗ 0     
     data_received..................: 22 GB   185 MB/s
     data_sent......................: 305 MB  2.5 MB/s
     http_req_blocked...............: avg=2.9µs   min=962ns   med=2.19µs   max=4.04ms   p(90)=3.85µs  p(95)=4.69µs   p(99.9)=32.98µs 
     http_req_connecting............: avg=250ns   min=0s      med=0s       max=3.22ms   p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=23.42ms min=1.83ms  med=20.93ms  max=328.31ms p(90)=38.34ms p(95)=46.65ms  p(99.9)=101.06ms
       { expected_response:true }...: avg=23.42ms min=1.83ms  med=20.93ms  max=328.31ms p(90)=38.34ms p(95)=46.65ms  p(99.9)=101.06ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 253398
     http_req_receiving.............: avg=1.22ms  min=51.47µs med=373.21µs max=254.87ms p(90)=2.78ms  p(95)=4.11ms   p(99.9)=36.53ms 
     http_req_sending...............: avg=49.57µs min=5.06µs  med=9.64µs   max=140.97ms p(90)=20.08µs p(95)=118.92µs p(99.9)=4.27ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=22.15ms min=1.69ms  med=19.64ms  max=310.32ms p(90)=36.62ms p(95)=44.61ms  p(99.9)=98.95ms 
     http_reqs......................: 253398  2107.566515/s
     iteration_duration.............: avg=23.67ms min=2.23ms  med=21.16ms  max=340.54ms p(90)=38.59ms p(95)=46.91ms  p(99.9)=102.05ms
     iterations.....................: 253298  2106.734793/s
     success_rate...................: 100.00% ✓ 253298      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
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

     checks.........................: 100.00% ✓ 711837      ✗ 0     
     data_received..................: 21 GB   173 MB/s
     data_sent......................: 285 MB  2.4 MB/s
     http_req_blocked...............: avg=5.19µs   min=1µs     med=2.15µs   max=68.8ms   p(90)=3.54µs  p(95)=4.27µs   p(99.9)=34.55µs 
     http_req_connecting............: avg=2.62µs   min=0s      med=0s       max=68.76ms  p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=25.03ms  min=1.82ms  med=18.12ms  max=303.5ms  p(90)=51.06ms p(95)=67.93ms  p(99.9)=161.19ms
       { expected_response:true }...: avg=25.03ms  min=1.82ms  med=18.12ms  max=303.5ms  p(90)=51.06ms p(95)=67.93ms  p(99.9)=161.19ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 237379
     http_req_receiving.............: avg=991.59µs min=52.85µs med=139.21µs max=163.78ms p(90)=1.6ms   p(95)=2.58ms   p(99.9)=59.5ms  
     http_req_sending...............: avg=45.99µs  min=5.38µs  med=9.65µs   max=206.09ms p(90)=17.88µs p(95)=109.93µs p(99.9)=3.54ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=24ms     min=1.68ms  med=17.3ms   max=298.57ms p(90)=49.1ms  p(95)=65.85ms  p(99.9)=159.03ms
     http_reqs......................: 237379  1974.372255/s
     iteration_duration.............: avg=25.27ms  min=2.38ms  med=18.35ms  max=339.76ms p(90)=51.29ms p(95)=68.16ms  p(99.9)=162.87ms
     iterations.....................: 237279  1973.540517/s
     success_rate...................: 100.00% ✓ 237279      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: grafbase (.net subgraphs) (0.53.5)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 542853      ✗ 0     
     data_received..................: 16 GB   132 MB/s
     data_sent......................: 218 MB  1.8 MB/s
     http_req_blocked...............: avg=3.44µs   min=972ns   med=2.32µs  max=4.43ms   p(90)=4.59µs   p(95)=5.74µs   p(99.9)=46.18µs
     http_req_connecting............: avg=502ns    min=0s      med=0s      max=3.67ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=32.88ms  min=2.38ms  med=31.98ms max=324.8ms  p(90)=43.89ms  p(95)=48.85ms  p(99.9)=89.45ms
       { expected_response:true }...: avg=32.88ms  min=2.38ms  med=31.98ms max=324.8ms  p(90)=43.89ms  p(95)=48.85ms  p(99.9)=89.45ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 181051
     http_req_receiving.............: avg=109.32µs min=29.91µs med=59.52µs max=158.89ms p(90)=132.12µs p(95)=282.01µs p(99.9)=4.81ms 
     http_req_sending...............: avg=45.81µs  min=5.37µs  med=10.18µs max=146.71ms p(90)=24.05µs  p(95)=133.35µs p(99.9)=3.42ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=32.73ms  min=2.27ms  med=31.84ms max=324.25ms p(90)=43.71ms  p(95)=48.61ms  p(99.9)=89.26ms
     http_reqs......................: 181051  1504.984212/s
     iteration_duration.............: avg=33.14ms  min=4.99ms  med=32.22ms max=330.9ms  p(90)=44.13ms  p(95)=49.08ms  p(99.9)=90ms   
     iterations.....................: 180951  1504.152963/s
     success_rate...................: 100.00% ✓ 180951      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (.net subgraphs) (0.326.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 404547      ✗ 0     
     data_received..................: 12 GB   98 MB/s
     data_sent......................: 162 MB  1.3 MB/s
     http_req_blocked...............: avg=3.72µs  min=1.08µs  med=2.48µs  max=4.72ms   p(90)=4.11µs   p(95)=4.79µs   p(99.9)=38.39µs
     http_req_connecting............: avg=883ns   min=0s      med=0s      max=4.69ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=44.22ms min=2.33ms  med=43.66ms max=319.06ms p(90)=61.88ms  p(95)=67.38ms  p(99.9)=95.78ms
       { expected_response:true }...: avg=44.22ms min=2.33ms  med=43.66ms max=319.06ms p(90)=61.88ms  p(95)=67.38ms  p(99.9)=95.78ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 134949
     http_req_receiving.............: avg=87.84µs min=28.48µs med=68.57µs max=156.12ms p(90)=107.07µs p(95)=125.42µs p(99.9)=1.85ms 
     http_req_sending...............: avg=28.27µs min=5.22µs  med=11.72µs max=233.98ms p(90)=18.85µs  p(95)=22.5µs   p(99.9)=1.25ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=44.11ms min=2.22ms  med=43.55ms max=318.77ms p(90)=61.77ms  p(95)=67.26ms  p(99.9)=95.27ms
     http_reqs......................: 134949  1121.690961/s
     iteration_duration.............: avg=44.49ms min=4.54ms  med=43.88ms max=342.68ms p(90)=62.1ms   p(95)=67.61ms  p(99.9)=96.38ms
     iterations.....................: 134849  1120.859765/s
     success_rate...................: 100.00% ✓ 134849      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (.net subgraphs) (2.10.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 192444     ✗ 0    
     data_received..................: 5.6 GB  47 MB/s
     data_sent......................: 77 MB   640 kB/s
     http_req_blocked...............: avg=5.01µs  min=1.11µs  med=2.82µs  max=5.08ms   p(90)=4.37µs   p(95)=4.94µs   p(99.9)=48.43µs 
     http_req_connecting............: avg=1.93µs  min=0s      med=0s      max=5.04ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=93.16ms min=4.17ms  med=92.45ms max=356.83ms p(90)=118.94ms p(95)=131.24ms p(99.9)=234.52ms
       { expected_response:true }...: avg=93.16ms min=4.17ms  med=92.45ms max=356.83ms p(90)=118.94ms p(95)=131.24ms p(99.9)=234.52ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 64248
     http_req_receiving.............: avg=92.9µs  min=31.59µs med=79.48µs max=163.37ms p(90)=114.34µs p(95)=127µs    p(99.9)=849.13µs
     http_req_sending...............: avg=32.6µs  min=5.72µs  med=13.48µs max=211.77ms p(90)=20.16µs  p(95)=22.3µs   p(99.9)=730.28µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=93.03ms min=4.11ms  med=92.34ms max=346.7ms  p(90)=118.82ms p(95)=131.11ms p(99.9)=233.61ms
     http_reqs......................: 64248   532.793321/s
     iteration_duration.............: avg=93.54ms min=22.19ms med=92.71ms max=369.79ms p(90)=119.19ms p(95)=131.54ms p(99.9)=236.52ms
     iterations.....................: 64148   531.964045/s
     success_rate...................: 100.00% ✓ 64148      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-router (.net subgraphs) (v2.15.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 137724     ✗ 0    
     data_received..................: 4.0 GB  33 MB/s
     data_sent......................: 55 MB   458 kB/s
     http_req_blocked...............: avg=5.6µs    min=1.15µs  med=3.23µs   max=4.16ms   p(90)=4.62µs   p(95)=5.15µs   p(99.9)=221.79µs
     http_req_connecting............: avg=2.19µs   min=0s      med=0s       max=4.12ms   p(90)=0s       p(95)=0s       p(99.9)=120.71µs
     http_req_duration..............: avg=130.17ms min=5.56ms  med=127.55ms max=347.14ms p(90)=172.84ms p(95)=186ms    p(99.9)=237.66ms
       { expected_response:true }...: avg=130.17ms min=5.56ms  med=127.55ms max=347.14ms p(90)=172.84ms p(95)=186ms    p(99.9)=237.66ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 46008
     http_req_receiving.............: avg=164.19µs min=30.61µs med=87.16µs  max=164.51ms p(90)=118.28µs p(95)=130.22µs p(99.9)=1.15ms  
     http_req_sending...............: avg=25µs     min=5.82µs  med=16.18µs  max=178.92ms p(90)=21.13µs  p(95)=22.84µs  p(99.9)=560.79µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=129.98ms min=5.47ms  med=127.41ms max=271.88ms p(90)=172.65ms p(95)=185.61ms p(99.9)=233.39ms
     http_reqs......................: 46008   381.07639/s
     iteration_duration.............: avg=130.73ms min=14.63ms med=127.88ms max=362.7ms  p(90)=173.15ms p(95)=186.31ms p(99.9)=240.03ms
     iterations.....................: 45908   380.248107/s
     success_rate...................: 100.00% ✓ 45908      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
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

     checks.........................: 100.00% ✓ 86154      ✗ 0    
     data_received..................: 2.5 GB  21 MB/s
     data_sent......................: 35 MB   286 kB/s
     http_req_blocked...............: avg=5.65µs   min=1.25µs  med=3.44µs   max=3.13ms   p(90)=4.73µs   p(95)=5.27µs   p(99.9)=749.89µs
     http_req_connecting............: avg=2.07µs   min=0s      med=0s       max=3.1ms    p(90)=0s       p(95)=0s       p(99.9)=725.58µs
     http_req_duration..............: avg=208.08ms min=8.78ms  med=209.03ms max=376.03ms p(90)=222.44ms p(95)=226.43ms p(99.9)=305.91ms
       { expected_response:true }...: avg=208.08ms min=8.78ms  med=209.03ms max=376.03ms p(90)=222.44ms p(95)=226.43ms p(99.9)=305.91ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 28818
     http_req_receiving.............: avg=123.45µs min=33.59µs med=93.57µs  max=145.84ms p(90)=125.92µs p(95)=139.37µs p(99.9)=888.51µs
     http_req_sending...............: avg=23.18µs  min=6.14µs  med=17.31µs  max=40.56ms  p(90)=22.04µs  p(95)=24.04µs  p(99.9)=474.73µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=207.94ms min=8.68ms  med=208.89ms max=375.29ms p(90)=222.31ms p(95)=226.29ms p(99.9)=305.59ms
     http_reqs......................: 28818   237.932314/s
     iteration_duration.............: avg=209.07ms min=72.43ms med=209.49ms max=383.3ms  p(90)=222.73ms p(95)=226.71ms p(99.9)=306.44ms
     iterations.....................: 28718   237.106676/s
     success_rate...................: 100.00% ✓ 28718      ✗ 0    
     vus............................: 45      min=45       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (.net subgraphs) (2.10.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 83859      ✗ 0    
     data_received..................: 2.5 GB  20 MB/s
     data_sent......................: 34 MB   279 kB/s
     http_req_blocked...............: avg=6.85µs   min=1.24µs  med=3.45µs   max=4.17ms   p(90)=4.77µs   p(95)=5.31µs   p(99.9)=1.45ms  
     http_req_connecting............: avg=3.22µs   min=0s      med=0s       max=4.14ms   p(90)=0s       p(95)=0s       p(99.9)=1.42ms  
     http_req_duration..............: avg=213.77ms min=6.87ms  med=196.31ms max=774.9ms  p(90)=251.33ms p(95)=320.31ms p(99.9)=630.88ms
       { expected_response:true }...: avg=213.77ms min=6.87ms  med=196.31ms max=774.9ms  p(90)=251.33ms p(95)=320.31ms p(99.9)=630.88ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 28053
     http_req_receiving.............: avg=107.39µs min=33.69µs med=97.53µs  max=55.83ms  p(90)=128.35µs p(95)=141.48µs p(99.9)=771.17µs
     http_req_sending...............: avg=24.97µs  min=6.09µs  med=17.77µs  max=67.77ms  p(90)=22.21µs  p(95)=23.86µs  p(99.9)=555.6µs 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=213.64ms min=6.71ms  med=196.18ms max=774.79ms p(90)=251.21ms p(95)=320.17ms p(99.9)=630.79ms
     http_reqs......................: 28053   231.930003/s
     iteration_duration.............: avg=214.78ms min=31.74ms med=196.71ms max=775.14ms p(90)=251.83ms p(95)=321.55ms p(99.9)=631.15ms
     iterations.....................: 27953   231.103246/s
     success_rate...................: 100.00% ✓ 27953      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: feddi (.net subgraphs) (77271dc84a06)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 5187      ✗ 0   
     data_received..................: 175 MB  1.4 MB/s
     data_sent......................: 2.2 MB  17 kB/s
     http_req_blocked...............: avg=144.55µs min=1.42µs   med=3.48µs  max=10.1ms  p(90)=4.85µs   p(95)=6µs      p(99.9)=9.73ms 
     http_req_connecting............: avg=134.74µs min=0s       med=0s      max=10.05ms p(90)=0s       p(95)=0s       p(99.9)=9.7ms  
     http_req_duration..............: avg=3.31s    min=50.71ms  med=3.4s    max=15.36s  p(90)=4.23s    p(95)=4.54s    p(99.9)=13.01s 
       { expected_response:true }...: avg=3.31s    min=50.71ms  med=3.4s    max=15.36s  p(90)=4.23s    p(95)=4.54s    p(99.9)=13.01s 
     http_req_failed................: 0.00%   ✓ 0         ✗ 1829
     http_req_receiving.............: avg=137.43µs min=37.73µs  med=101.6µs max=42.33ms p(90)=141.16µs p(95)=153.34µs p(99.9)=4.04ms 
     http_req_sending...............: avg=125.28µs min=6.38µs   med=18.97µs max=25.01ms p(90)=23.76µs  p(95)=28.54µs  p(99.9)=14.71ms
     http_req_tls_handshaking.......: avg=0s       min=0s       med=0s      max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=3.31s    min=50.55ms  med=3.4s    max=15.36s  p(90)=4.23s    p(95)=4.54s    p(99.9)=13.01s 
     http_reqs......................: 1829    14.34948/s
     iteration_duration.............: avg=3.5s     min=427.21ms med=3.47s   max=15.37s  p(90)=4.25s    p(95)=4.55s    p(99.9)=13.09s 
     iterations.....................: 1729    13.564926/s
     success_rate...................: 100.00% ✓ 1729      ✗ 0   
     vus............................: 25      min=0       max=50
     vus_max........................: 50      min=50      max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-185-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

