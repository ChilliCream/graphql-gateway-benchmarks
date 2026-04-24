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
| hive-router | v0.0.49 | 2,746 | 2,852 | 2,710 | 1.8% |  |
| hotchocolate | 16.1.0-p.1.9 | 2,139 | 2,170 | 2,112 | 0.9% |  |
| hive-gateway-router-runtime | 2.5.25 | 488 | 492 | 485 | 0.5% |  |
| hive-gateway | 2.5.25 | 236 | 237 | 234 | 0.5% |  |
| apollo-gateway | 2.13.3 | 202 | 206 | 201 | 0.8% |  |
| apollo-router | v2.13.1 | — | — | — | — | non-compatible response (16860 across 9/9 runs) |
| cosmo | 0.307.0 | — | — | — | — | non-compatible response (16 across 9/9 runs) |
| grafbase | 0.53.3 | — | — | — | — | non-compatible response (521705 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.49 | 2,335 | 2,377 | 2,264 | 1.4% |  |
| hotchocolate | 16.1.0-p.1.9 | 1,931 | 1,957 | 1,916 | 0.7% |  |
| cosmo | 0.307.0 | 1,111 | 1,114 | 1,108 | 0.3% | non-compatible response (13 across 6/9 runs) |
| hive-gateway-router-runtime | 2.5.25 | 477 | 483 | 472 | 0.8% |  |
| hive-gateway | 2.5.25 | 233 | 235 | 231 | 0.6% |  |
| apollo-gateway | 2.13.3 | 206 | 208 | 204 | 0.5% |  |
| apollo-router | v2.13.1 | — | — | — | — | non-compatible response (16671 across 9/9 runs) |
| grafbase | 0.53.3 | — | — | — | — | non-compatible response (351818 across 9/9 runs) |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.49)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 507012      ✗ 0     
     data_received..................: 15 GB   241 MB/s
     data_sent......................: 204 MB  3.3 MB/s
     http_req_blocked...............: avg=30µs    min=1.02µs  med=2.2µs   max=74.53ms  p(90)=3.57µs   p(95)=4.66µs   p(99.9)=10.45ms 
     http_req_connecting............: avg=26.91µs min=0s      med=0s      max=74.44ms  p(90)=0s       p(95)=0s       p(99.9)=9.87ms  
     http_req_duration..............: avg=83.54ms min=1.66ms  med=77.35ms max=351.63ms p(90)=162.55ms p(95)=180.4ms  p(99.9)=248ms   
       { expected_response:true }...: avg=83.54ms min=1.66ms  med=77.35ms max=351.63ms p(90)=162.55ms p(95)=180.4ms  p(99.9)=248ms   
     http_req_failed................: 0.00%   ✓ 0           ✗ 170004
     http_req_receiving.............: avg=351.4µs min=27.83µs med=54.35µs max=243.36ms p(90)=205.56µs p(95)=396.16µs p(99.9)=42.33ms 
     http_req_sending...............: avg=86.83µs min=5.11µs  med=9.5µs   max=206.77ms p(90)=17.14µs  p(95)=126.63µs p(99.9)=14.25ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=83.1ms  min=1.61ms  med=77.04ms max=319.18ms p(90)=161.8ms  p(95)=179.21ms p(99.9)=244.14ms
     http_reqs......................: 170004  2746.426143/s
     iteration_duration.............: avg=84.35ms min=2.22ms  med=78.3ms  max=368.51ms p(90)=163.1ms  p(95)=181.05ms p(99.9)=250.71ms
     iterations.....................: 169004  2730.271075/s
     success_rate...................: 100.00% ✓ 169004      ✗ 0     
     vus............................: 52      min=0         max=499 
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

     checks.........................: 100.00% ✓ 399927      ✗ 0     
     data_received..................: 12 GB   188 MB/s
     data_sent......................: 161 MB  2.6 MB/s
     http_req_blocked...............: avg=18.69µs  min=992ns   med=2.2µs    max=66.56ms  p(90)=3.47µs   p(95)=4.38µs   p(99.9)=1.53ms  
     http_req_connecting............: avg=15.53µs  min=0s      med=0s       max=66.4ms   p(90)=0s       p(95)=0s       p(99.9)=1.48ms  
     http_req_duration..............: avg=105.97ms min=2.38ms  med=95.51ms  max=906.76ms p(90)=206.19ms p(95)=242.82ms p(99.9)=571.79ms
       { expected_response:true }...: avg=105.97ms min=2.38ms  med=95.51ms  max=906.76ms p(90)=206.19ms p(95)=242.82ms p(99.9)=571.79ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 134309
     http_req_receiving.............: avg=2.26ms   min=51.73µs med=109.69µs max=751.69ms p(90)=1.34ms   p(95)=5.28ms   p(99.9)=165.71ms
     http_req_sending...............: avg=71.2µs   min=5.2µs   med=9.39µs   max=212.27ms p(90)=17.43µs  p(95)=122.59µs p(99.9)=10.1ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=103.63ms min=2.29ms  med=94.33ms  max=874.52ms p(90)=202.94ms p(95)=234.52ms p(99.9)=498.44ms
     http_reqs......................: 134309  2139.182514/s
     iteration_duration.............: avg=107.05ms min=3.41ms  med=96.7ms   max=907ms    p(90)=206.93ms p(95)=243.64ms p(99.9)=574.83ms
     iterations.....................: 133309  2123.255193/s
     success_rate...................: 100.00% ✓ 133309      ✗ 0     
     vus............................: 93      min=0         max=500 
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

     checks.........................: 100.00% ✓ 92289      ✗ 0    
     data_received..................: 2.8 GB  43 MB/s
     data_sent......................: 38 MB   587 kB/s
     http_req_blocked...............: avg=10.2µs   min=1.17µs  med=2.6µs    max=16.85ms  p(90)=4.35µs   p(95)=5.31µs   p(99.9)=1.82ms
     http_req_connecting............: avg=6.3µs    min=0s      med=0s       max=16.53ms  p(90)=0s       p(95)=0s       p(99.9)=1.68ms
     http_req_duration..............: avg=452.25ms min=4.16ms  med=421.46ms max=1.76s    p(90)=892.31ms p(95)=964.65ms p(99.9)=1.42s 
       { expected_response:true }...: avg=452.25ms min=4.16ms  med=421.46ms max=1.76s    p(90)=892.31ms p(95)=964.65ms p(99.9)=1.42s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 31763
     http_req_receiving.............: avg=115.48µs min=33.24µs med=72.19µs  max=178.39ms p(90)=107.78µs p(95)=120.67µs p(99.9)=1.43ms
     http_req_sending...............: avg=25.95µs  min=5.61µs  med=12.39µs  max=67.79ms  p(90)=19.57µs  p(95)=22.94µs  p(99.9)=2.7ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=452.11ms min=4.09ms  med=421.29ms max=1.76s    p(90)=892.15ms p(95)=964.56ms p(99.9)=1.42s 
     http_reqs......................: 31763   488.936073/s
     iteration_duration.............: avg=467.16ms min=35.24ms med=439.06ms max=1.77s    p(90)=896.67ms p(95)=967.58ms p(99.9)=1.43s 
     iterations.....................: 30763   473.542815/s
     success_rate...................: 100.00% ✓ 30763      ✗ 0    
     vus............................: 55      min=0        max=499
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

     checks.........................: 100.00% ✓ 45459      ✗ 0    
     data_received..................: 1.4 GB  21 MB/s
     data_sent......................: 20 MB   285 kB/s
     http_req_blocked...............: avg=13.64µs  min=1.33µs  med=3.7µs    max=3.54ms  p(90)=5.59µs   p(95)=7.25µs  p(99.9)=1.99ms  
     http_req_connecting............: avg=8.35µs   min=0s      med=0s       max=3.52ms  p(90)=0s       p(95)=0s      p(99.9)=1.96ms  
     http_req_duration..............: avg=873.85ms min=6.23ms  med=755ms    max=20.37s  p(90)=1.48s    p(95)=1.62s   p(99.9)=18.15s  
       { expected_response:true }...: avg=873.85ms min=6.23ms  med=755ms    max=20.37s  p(90)=1.48s    p(95)=1.62s   p(99.9)=18.15s  
     http_req_failed................: 0.00%   ✓ 0          ✗ 16153
     http_req_receiving.............: avg=106.59µs min=37.85µs med=101.07µs max=17.89ms p(90)=140.72µs p(95)=154.2µs p(99.9)=869.62µs
     http_req_sending...............: avg=34.15µs  min=5.94µs  med=18.35µs  max=48.82ms p(90)=24.52µs  p(95)=29.24µs p(99.9)=2.89ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=873.71ms min=6.1ms   med=754.89ms max=20.37s  p(90)=1.48s    p(95)=1.62s   p(99.9)=18.15s  
     http_reqs......................: 16153   236.465073/s
     iteration_duration.............: avg=931.52ms min=56.66ms med=813.44ms max=20.37s  p(90)=1.5s     p(95)=1.63s   p(99.9)=18.19s  
     iterations.....................: 15153   221.825992/s
     success_rate...................: 100.00% ✓ 15153      ✗ 0    
     vus............................: 71      min=0        max=498
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

     checks.........................: 100.00% ✓ 42081      ✗ 0    
     data_received..................: 1.3 GB  18 MB/s
     data_sent......................: 18 MB   249 kB/s
     http_req_blocked...............: avg=16.81µs  min=1.3µs   med=3.39µs   max=21.8ms  p(90)=5.04µs   p(95)=6.62µs   p(99.9)=2.53ms
     http_req_connecting............: avg=11.68µs  min=0s      med=0s       max=21.75ms p(90)=0s       p(95)=0s       p(99.9)=2.5ms 
     http_req_duration..............: avg=447.69ms min=8.44ms  med=513.34ms max=1.35s   p(90)=746.43ms p(95)=811.71ms p(99.9)=1.15s 
       { expected_response:true }...: avg=447.69ms min=8.44ms  med=513.34ms max=1.35s   p(90)=746.43ms p(95)=811.71ms p(99.9)=1.15s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 15027
     http_req_receiving.............: avg=105.31µs min=37.94µs med=88.82µs  max=89.95ms p(90)=126.68µs p(95)=139.9µs  p(99.9)=1.01ms
     http_req_sending...............: avg=43.45µs  min=6.09µs  med=16.23µs  max=143.7ms p(90)=22.53µs  p(95)=27.1µs   p(99.9)=2.97ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=447.54ms min=8.34ms  med=513.24ms max=1.35s   p(90)=746.26ms p(95)=811.59ms p(99.9)=1.15s 
     http_reqs......................: 15027   202.485253/s
     iteration_duration.............: avg=479.46ms min=9.07ms  med=542.31ms max=1.36s   p(90)=753.43ms p(95)=828.88ms p(99.9)=1.17s 
     iterations.....................: 14027   189.010491/s
     success_rate...................: 100.00% ✓ 14027      ✗ 0    
     vus............................: 59      min=0        max=495
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

     checks.........................: 100.00% ✓ 431841      ✗ 0     
     data_received..................: 13 GB   204 MB/s
     data_sent......................: 174 MB  2.8 MB/s
     http_req_blocked...............: avg=27.16µs  min=962ns   med=2.55µs  max=84.02ms  p(90)=4.52µs   p(95)=5.93µs   p(99.9)=2.74ms  
     http_req_connecting............: avg=23.63µs  min=0s      med=0s      max=83.79ms  p(90)=0s       p(95)=0s       p(99.9)=2.57ms  
     http_req_duration..............: avg=98.05ms  min=1.66ms  med=92.08ms max=313ms    p(90)=188.32ms p(95)=206.44ms p(99.9)=267.49ms
       { expected_response:true }...: avg=98.05ms  min=1.66ms  med=92.08ms max=313ms    p(90)=188.32ms p(95)=206.44ms p(99.9)=267.49ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 144947
     http_req_receiving.............: avg=274.53µs min=29.83µs med=60.9µs  max=143.92ms p(90)=197.9µs  p(95)=433.77µs p(99.9)=31.83ms 
     http_req_sending...............: avg=80.17µs  min=5.26µs  med=10.84µs max=49.87ms  p(90)=21.85µs  p(95)=143.32µs p(99.9)=11.84ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=97.7ms   min=1.61ms  med=91.81ms max=312.93ms p(90)=187.87ms p(95)=205.93ms p(99.9)=265.59ms
     http_reqs......................: 144947  2335.52852/s
     iteration_duration.............: avg=99.06ms  min=4.03ms  med=93.22ms max=411.76ms p(90)=188.96ms p(95)=207.08ms p(99.9)=269.83ms
     iterations.....................: 143947  2319.415537/s
     success_rate...................: 100.00% ✓ 143947      ✗ 0     
     vus............................: 60      min=0         max=497 
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

     checks.........................: 100.00% ✓ 357276      ✗ 0     
     data_received..................: 11 GB   169 MB/s
     data_sent......................: 144 MB  2.3 MB/s
     http_req_blocked...............: avg=15.34µs  min=990ns   med=2.35µs   max=56.57ms  p(90)=4.05µs   p(95)=5.14µs   p(99.9)=1.51ms  
     http_req_connecting............: avg=12.32µs  min=0s      med=0s       max=56.51ms  p(90)=0s       p(95)=0s       p(99.9)=1.46ms  
     http_req_duration..............: avg=118.56ms min=1.77ms  med=111.47ms max=711.49ms p(90)=227.62ms p(95)=257.85ms p(99.9)=552.68ms
       { expected_response:true }...: avg=118.56ms min=1.77ms  med=111.47ms max=711.49ms p(90)=227.62ms p(95)=257.85ms p(99.9)=552.68ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 120092
     http_req_receiving.............: avg=1.58ms   min=51.04µs med=112.43µs max=323.74ms p(90)=1.59ms   p(95)=3.99ms   p(99.9)=119.89ms
     http_req_sending...............: avg=64.81µs  min=5.24µs  med=10.03µs  max=223.93ms p(90)=20.04µs  p(95)=121.83µs p(99.9)=8.59ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=116.91ms min=1.65ms  med=110.21ms max=685.87ms p(90)=225.05ms p(95)=253.15ms p(99.9)=539.93ms
     http_reqs......................: 120092  1931.854358/s
     iteration_duration.............: avg=119.83ms min=2.75ms  med=112.93ms max=711.69ms p(90)=228.32ms p(95)=258.5ms  p(99.9)=556.03ms
     iterations.....................: 119092  1915.767905/s
     success_rate...................: 100.00% ✓ 119092      ✗ 0     
     vus............................: 64      min=0         max=496 
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

     checks.........................: 100.00% ✓ 205854      ✗ 0    
     data_received..................: 6.1 GB  97 MB/s
     data_sent......................: 84 MB   1.3 MB/s
     http_req_blocked...............: avg=6.18µs   min=1.05µs  med=2.35µs   max=7.76ms   p(90)=4.02µs   p(95)=4.97µs   p(99.9)=806.15µs
     http_req_connecting............: avg=3µs      min=0s      med=0s       max=7.6ms    p(90)=0s       p(95)=0s       p(99.9)=717.45µs
     http_req_duration..............: avg=205.01ms min=2.11ms  med=203.98ms max=572.26ms p(90)=381.89ms p(95)=410.84ms p(99.9)=499.83ms
       { expected_response:true }...: avg=205.01ms min=2.11ms  med=203.98ms max=572.26ms p(90)=381.89ms p(95)=410.84ms p(99.9)=499.83ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 69618
     http_req_receiving.............: avg=81.44µs  min=30.31µs med=64.71µs  max=98.61ms  p(90)=101.15µs p(95)=116.04µs p(99.9)=1.45ms  
     http_req_sending...............: avg=28.98µs  min=5.15µs  med=11.09µs  max=64.78ms  p(90)=17.8µs   p(95)=21.36µs  p(99.9)=3.74ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=204.9ms  min=2.03ms  med=203.88ms max=572.2ms  p(90)=381.82ms p(95)=410.69ms p(99.9)=499.75ms
     http_reqs......................: 69618   1111.974897/s
     iteration_duration.............: avg=208.23ms min=5.3ms   med=207.54ms max=572.48ms p(90)=382.96ms p(95)=411.74ms p(99.9)=500.34ms
     iterations.....................: 68618   1096.002377/s
     success_rate...................: 100.00% ✓ 68618       ✗ 0    
     vus............................: 85      min=0         max=496
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

     checks.........................: 100.00% ✓ 90198      ✗ 0    
     data_received..................: 2.7 GB  42 MB/s
     data_sent......................: 37 MB   573 kB/s
     http_req_blocked...............: avg=7.92µs   min=1.18µs  med=2.99µs   max=5.56ms  p(90)=4.77µs   p(95)=5.79µs   p(99.9)=825.22µs
     http_req_connecting............: avg=3.82µs   min=0s      med=0s       max=5.51ms  p(90)=0s       p(95)=0s       p(99.9)=741.49µs
     http_req_duration..............: avg=462.37ms min=4.04ms  med=430.63ms max=1.95s   p(90)=906.22ms p(95)=990.52ms p(99.9)=1.46s   
       { expected_response:true }...: avg=462.37ms min=4.04ms  med=430.63ms max=1.95s   p(90)=906.22ms p(95)=990.52ms p(99.9)=1.46s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 31066
     http_req_receiving.............: avg=92.93µs  min=31.26µs med=78.18µs  max=175.6ms p(90)=115.95µs p(95)=130.3µs  p(99.9)=892.89µs
     http_req_sending...............: avg=27.26µs  min=5.56µs  med=13.52µs  max=55.87ms p(90)=20.85µs  p(95)=24.27µs  p(99.9)=2.7ms   
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=462.25ms min=3.97ms  med=430.54ms max=1.95s   p(90)=906.13ms p(95)=990.43ms p(99.9)=1.46s   
     http_reqs......................: 31066   477.274883/s
     iteration_duration.............: avg=477.96ms min=21.19ms med=451.24ms max=1.96s   p(90)=910.73ms p(95)=994.56ms p(99.9)=1.47s   
     iterations.....................: 30066   461.911628/s
     success_rate...................: 100.00% ✓ 30066      ✗ 0    
     vus............................: 58      min=0        max=498
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

     checks.........................: 100.00% ✓ 44835      ✗ 0    
     data_received..................: 1.4 GB  21 MB/s
     data_sent......................: 19 MB   281 kB/s
     http_req_blocked...............: avg=14.02µs  min=1.28µs  med=3.75µs   max=3.09ms  p(90)=5.62µs  p(95)=7.3µs    p(99.9)=2.08ms
     http_req_connecting............: avg=8.61µs   min=0s      med=0s       max=3.06ms  p(90)=0s      p(95)=0s       p(99.9)=2.05ms
     http_req_duration..............: avg=913.88ms min=6.31ms  med=829.79ms max=5.24s   p(90)=1.81s   p(95)=1.98s    p(99.9)=4.56s 
       { expected_response:true }...: avg=913.88ms min=6.31ms  med=829.79ms max=5.24s   p(90)=1.81s   p(95)=1.98s    p(99.9)=4.56s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 15945
     http_req_receiving.............: avg=108.1µs  min=36.24µs med=101.14µs max=15.89ms p(90)=141.6µs p(95)=154.62µs p(99.9)=1.3ms 
     http_req_sending...............: avg=33.25µs  min=6.07µs  med=18.52µs  max=63.28ms p(90)=24.52µs p(95)=29.24µs  p(99.9)=3.23ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s      p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=913.74ms min=6.2ms   med=829.7ms  max=5.24s   p(90)=1.81s   p(95)=1.98s    p(99.9)=4.55s 
     http_reqs......................: 15945   233.897931/s
     iteration_duration.............: avg=975.06ms min=43.08ms med=911.81ms max=5.25s   p(90)=1.82s   p(95)=1.99s    p(99.9)=4.59s 
     iterations.....................: 14945   219.228886/s
     success_rate...................: 100.00% ✓ 14945      ✗ 0    
     vus............................: 65      min=0        max=500
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

     checks.........................: 100.00% ✓ 40296      ✗ 0    
     data_received..................: 1.3 GB  18 MB/s
     data_sent......................: 17 MB   248 kB/s
     http_req_blocked...............: avg=17.8µs   min=1.31µs  med=3.62µs   max=27.93ms  p(90)=5.35µs   p(95)=7.18µs   p(99.9)=2.48ms
     http_req_connecting............: avg=12.34µs  min=0s      med=0s       max=27.87ms  p(90)=0s       p(95)=0s       p(99.9)=2.43ms
     http_req_duration..............: avg=1.01s    min=8.6ms   med=923.21ms max=4.23s    p(90)=2.04s    p(95)=2.22s    p(99.9)=3.71s 
       { expected_response:true }...: avg=1.01s    min=8.6ms   med=923.21ms max=4.23s    p(90)=2.04s    p(95)=2.22s    p(99.9)=3.71s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 14432
     http_req_receiving.............: avg=123.01µs min=34.87µs med=97.75µs  max=113.68ms p(90)=137.82µs p(95)=150.01µs p(99.9)=1.05ms
     http_req_sending...............: avg=43.5µs   min=6.05µs  med=18.17µs  max=103.66ms p(90)=24.22µs  p(95)=29.38µs  p(99.9)=2.67ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=1.01s    min=8.48ms  med=923.13ms max=4.23s    p(90)=2.04s    p(95)=2.22s    p(99.9)=3.71s 
     http_reqs......................: 14432   206.729115/s
     iteration_duration.............: avg=1.08s    min=45.24ms med=1.01s    max=4.24s    p(90)=2.06s    p(95)=2.22s    p(99.9)=3.73s 
     iterations.....................: 13432   192.404758/s
     success_rate...................: 100.00% ✓ 13432      ✗ 0    
     vus............................: 99      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-176-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

