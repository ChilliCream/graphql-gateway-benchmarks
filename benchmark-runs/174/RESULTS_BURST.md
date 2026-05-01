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
| hive-router | v0.0.49 | 2,697 | 2,816 | 2,606 | 2.4% |  |
| hotchocolate | 16.1.0-p.1.9 | 2,088 | 2,152 | 2,045 | 1.7% |  |
| cosmo | 0.307.0 | 1,199 | 1,214 | 1,186 | 0.9% | non-compatible response (6 across 4/9 runs) |
| hive-gateway-router-runtime | 2.5.25 | 498 | 507 | 492 | 0.9% |  |
| hive-gateway | 2.5.25 | 237 | 239 | 233 | 0.9% |  |
| apollo-gateway | 2.13.3 | 200 | 206 | 199 | 1.0% |  |
| apollo-router | v2.13.1 | — | — | — | — | non-compatible response (25793 across 9/9 runs) |
| grafbase | 0.53.3 | — | — | — | — | non-compatible response (450652 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.49 | 2,177 | 2,297 | 2,151 | 2.3% |  |
| hotchocolate | 16.1.0-p.1.9 | 1,909 | 1,965 | 1,900 | 1.1% |  |
| cosmo | 0.307.0 | 1,114 | 1,123 | 1,105 | 0.8% | non-compatible response (13 across 6/9 runs) |
| hive-gateway-router-runtime | 2.5.25 | 471 | 481 | 467 | 0.9% |  |
| hive-gateway | 2.5.25 | 220 | 222 | 218 | 0.7% |  |
| apollo-gateway | 2.13.3 | 202 | 206 | 201 | 0.8% |  |
| apollo-router | v2.13.1 | — | — | — | — | non-compatible response (16412 across 9/9 runs) |
| grafbase | 0.53.3 | — | — | — | — | non-compatible response (250236 across 9/9 runs) |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.49)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 497778      ✗ 0     
     data_received..................: 15 GB   237 MB/s
     data_sent......................: 201 MB  3.2 MB/s
     http_req_blocked...............: avg=37.52µs  min=1.04µs med=2.65µs  max=87.32ms  p(90)=4.22µs   p(95)=5.39µs   p(99.9)=7.58ms  
     http_req_connecting............: avg=33.75µs  min=0s     med=0s      max=87.29ms  p(90)=0s       p(95)=0s       p(99.9)=6.41ms  
     http_req_duration..............: avg=85.04ms  min=1.53ms med=79.34ms max=332.98ms p(90)=166.19ms p(95)=182.8ms  p(99.9)=239.13ms
       { expected_response:true }...: avg=85.04ms  min=1.53ms med=79.34ms max=332.98ms p(90)=166.19ms p(95)=182.8ms  p(99.9)=239.13ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 166926
     http_req_receiving.............: avg=413.73µs min=30.3µs med=58.38µs max=177.29ms p(90)=260.65µs p(95)=430.01µs p(99.9)=43.3ms  
     http_req_sending...............: avg=113.36µs min=5.28µs med=10.43µs max=322.83ms p(90)=19.57µs  p(95)=136.73µs p(99.9)=16.91ms 
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=84.52ms  min=1.47ms med=79.04ms max=262.28ms p(90)=165.33ms p(95)=181.46ms p(99.9)=230.71ms
     http_reqs......................: 166926  2697.320186/s
     iteration_duration.............: avg=85.92ms  min=2.43ms med=80.3ms  max=397.13ms p(90)=166.75ms p(95)=183.37ms p(99.9)=243.54ms
     iterations.....................: 165926  2681.161408/s
     success_rate...................: 100.00% ✓ 165926      ✗ 0     
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

     checks.........................: 100.00% ✓ 390396      ✗ 0     
     data_received..................: 12 GB   183 MB/s
     data_sent......................: 158 MB  2.5 MB/s
     http_req_blocked...............: avg=17.77µs  min=1.02µs  med=2.47µs   max=81.31ms  p(90)=3.85µs   p(95)=4.76µs   p(99.9)=2.09ms  
     http_req_connecting............: avg=14.34µs  min=0s      med=0s       max=81.16ms  p(90)=0s       p(95)=0s       p(99.9)=1.86ms  
     http_req_duration..............: avg=108.52ms min=2.39ms  med=99.25ms  max=709.15ms p(90)=211.64ms p(95)=246.98ms p(99.9)=433.43ms
       { expected_response:true }...: avg=108.52ms min=2.39ms  med=99.25ms  max=709.15ms p(90)=211.64ms p(95)=246.98ms p(99.9)=433.43ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 131132
     http_req_receiving.............: avg=1.99ms   min=52.12µs med=113.76µs max=285.73ms p(90)=1.28ms   p(95)=4.29ms   p(99.9)=149.34ms
     http_req_sending...............: avg=66.05µs  min=5.06µs  med=10.05µs  max=76.61ms  p(90)=17.84µs  p(95)=122.87µs p(99.9)=9.15ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=106.46ms min=2.31ms  med=97.94ms  max=708.48ms p(90)=208.51ms p(95)=239.33ms p(99.9)=395.02ms
     http_reqs......................: 131132  2088.697612/s
     iteration_duration.............: avg=109.63ms min=3.61ms  med=100.53ms max=709.28ms p(90)=212.3ms  p(95)=247.65ms p(99.9)=433.99ms
     iterations.....................: 130132  2072.769405/s
     success_rate...................: 100.00% ✓ 130132      ✗ 0     
     vus............................: 94      min=0         max=500 
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

     checks.........................: 100.00% ✓ 221745      ✗ 0    
     data_received..................: 6.6 GB  105 MB/s
     data_sent......................: 90 MB   1.4 MB/s
     http_req_blocked...............: avg=5.71µs   min=1.08µs  med=2.42µs   max=13.01ms  p(90)=4.03µs   p(95)=4.96µs   p(99.9)=512.14µs
     http_req_connecting............: avg=2.63µs   min=0s      med=0s       max=12.95ms  p(90)=0s       p(95)=0s       p(99.9)=468.58µs
     http_req_duration..............: avg=190.42ms min=2.04ms  med=190.54ms max=594.35ms p(90)=353.57ms p(95)=381.41ms p(99.9)=517.8ms 
       { expected_response:true }...: avg=190.42ms min=2.04ms  med=190.54ms max=594.35ms p(90)=353.57ms p(95)=381.41ms p(99.9)=517.8ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 74915
     http_req_receiving.............: avg=74.14µs  min=29.89µs med=59.27µs  max=21.73ms  p(90)=94.36µs  p(95)=109.58µs p(99.9)=1.45ms  
     http_req_sending...............: avg=34.5µs   min=5.41µs  med=10.76µs  max=126.82ms p(90)=17.18µs  p(95)=20.91µs  p(99.9)=3.88ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=190.31ms min=1.98ms  med=190.43ms max=594.27ms p(90)=353.5ms  p(95)=381.3ms  p(99.9)=517.71ms
     http_reqs......................: 74915   1199.741309/s
     iteration_duration.............: avg=193.24ms min=4.09ms  med=193.72ms max=594.6ms  p(90)=354.48ms p(95)=382.2ms  p(99.9)=518.23ms
     iterations.....................: 73915   1183.726609/s
     success_rate...................: 100.00% ✓ 73915       ✗ 0    
     vus............................: 78      min=0         max=493
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

     checks.........................: 100.00% ✓ 94191      ✗ 0    
     data_received..................: 2.8 GB  44 MB/s
     data_sent......................: 39 MB   599 kB/s
     http_req_blocked...............: avg=9.61µs   min=1.2µs   med=3.05µs   max=48.47ms p(90)=4.86µs   p(95)=5.89µs   p(99.9)=919.05µs
     http_req_connecting............: avg=5.48µs   min=0s      med=0s       max=48.41ms p(90)=0s       p(95)=0s       p(99.9)=879.71µs
     http_req_duration..............: avg=443.19ms min=4.06ms  med=412.56ms max=1.74s   p(90)=869.56ms p(95)=943.99ms p(99.9)=1.42s   
       { expected_response:true }...: avg=443.19ms min=4.06ms  med=412.56ms max=1.74s   p(90)=869.56ms p(95)=943.99ms p(99.9)=1.42s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 32397
     http_req_receiving.............: avg=90.74µs  min=33.22µs med=79.02µs  max=98.15ms p(90)=115.59µs p(95)=130.14µs p(99.9)=911.72µs
     http_req_sending...............: avg=26.27µs  min=5.99µs  med=13.91µs  max=75.35ms p(90)=21.73µs  p(95)=25.3µs   p(99.9)=2.05ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=443.08ms min=3.94ms  med=412.42ms max=1.74s   p(90)=869.42ms p(95)=943.91ms p(99.9)=1.42s   
     http_reqs......................: 32397   498.741582/s
     iteration_duration.............: avg=457.54ms min=34.14ms med=430.65ms max=1.75s   p(90)=873.59ms p(95)=947.07ms p(99.9)=1.42s   
     iterations.....................: 31397   483.346898/s
     success_rate...................: 100.00% ✓ 31397      ✗ 0    
     vus............................: 53      min=0        max=499
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

     checks.........................: 100.00% ✓ 45318      ✗ 0    
     data_received..................: 1.4 GB  21 MB/s
     data_sent......................: 19 MB   286 kB/s
     http_req_blocked...............: avg=17.15µs  min=1.25µs  med=3.45µs   max=22.98ms p(90)=5.29µs   p(95)=6.83µs   p(99.9)=3.04ms
     http_req_connecting............: avg=12.07µs  min=0s      med=0s       max=22.92ms p(90)=0s       p(95)=0s       p(99.9)=3.01ms
     http_req_duration..............: avg=892.31ms min=5.96ms  med=800.08ms max=14.51s  p(90)=1.64s    p(95)=1.81s    p(99.9)=11.1s 
       { expected_response:true }...: avg=892.31ms min=5.96ms  med=800.08ms max=14.51s  p(90)=1.64s    p(95)=1.81s    p(99.9)=11.1s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 16106
     http_req_receiving.............: avg=105.79µs min=35.05µs med=98.45µs  max=14.18ms p(90)=137.79µs p(95)=151.33µs p(99.9)=1.04ms
     http_req_sending...............: avg=34.21µs  min=6.38µs  med=17.55µs  max=8.06ms  p(90)=23.67µs  p(95)=28.15µs  p(99.9)=3.99ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=892.17ms min=5.88ms  med=799.96ms max=14.51s  p(90)=1.64s    p(95)=1.81s    p(99.9)=11.1s 
     http_reqs......................: 16106   237.411734/s
     iteration_duration.............: avg=951.35ms min=25.01ms med=873.94ms max=14.51s  p(90)=1.65s    p(95)=1.83s    p(99.9)=11.36s
     iterations.....................: 15106   222.671157/s
     success_rate...................: 100.00% ✓ 15106      ✗ 0    
     vus............................: 100     min=0        max=500
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

     checks.........................: 100.00% ✓ 41688      ✗ 0    
     data_received..................: 1.3 GB  18 MB/s
     data_sent......................: 18 MB   246 kB/s
     http_req_blocked...............: avg=28.04µs  min=1.19µs  med=3.3µs    max=32.03ms p(90)=5.02µs   p(95)=6.48µs   p(99.9)=5.95ms  
     http_req_connecting............: avg=22.52µs  min=0s      med=0s       max=31.97ms p(90)=0s       p(95)=0s       p(99.9)=5.9ms   
     http_req_duration..............: avg=450.21ms min=8.46ms  med=530.55ms max=1.29s   p(90)=765.87ms p(95)=829.04ms p(99.9)=1.17s   
       { expected_response:true }...: avg=450.21ms min=8.46ms  med=530.55ms max=1.29s   p(90)=765.87ms p(95)=829.04ms p(99.9)=1.17s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 14896
     http_req_receiving.............: avg=100.58µs min=32.52µs med=91.16µs  max=23.21ms p(90)=131.76µs p(95)=144.37µs p(99.9)=962.18µs
     http_req_sending...............: avg=29.78µs  min=6.09µs  med=16.56µs  max=21.82ms p(90)=22.54µs  p(95)=27.27µs  p(99.9)=2.53ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=450.08ms min=8.33ms  med=530.47ms max=1.29s   p(90)=765.74ms p(95)=828.89ms p(99.9)=1.17s   
     http_reqs......................: 14896   200.324949/s
     iteration_duration.............: avg=482.43ms min=16.26ms med=552.7ms  max=1.3s    p(90)=773.22ms p(95)=837.68ms p(99.9)=1.18s   
     iterations.....................: 13896   186.876712/s
     success_rate...................: 100.00% ✓ 13896      ✗ 0    
     vus............................: 62      min=0        max=494
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

     checks.........................: 100.00% ✓ 401811      ✗ 0     
     data_received..................: 12 GB   190 MB/s
     data_sent......................: 162 MB  2.6 MB/s
     http_req_blocked...............: avg=17.23µs  min=1.04µs  med=2.35µs   max=70.2ms   p(90)=3.98µs   p(95)=5.21µs   p(99.9)=970.64µs
     http_req_connecting............: avg=14.22µs  min=0s      med=0s       max=70.05ms  p(90)=0s       p(95)=0s       p(99.9)=910.02µs
     http_req_duration..............: avg=105.42ms min=1.58ms  med=100.15ms max=356.34ms p(90)=202.47ms p(95)=219.29ms p(99.9)=273.98ms
       { expected_response:true }...: avg=105.42ms min=1.58ms  med=100.15ms max=356.34ms p(90)=202.47ms p(95)=219.29ms p(99.9)=273.98ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 134937
     http_req_receiving.............: avg=176.29µs min=30.42µs med=60.69µs  max=102.67ms p(90)=160.47µs p(95)=401.02µs p(99.9)=18.4ms  
     http_req_sending...............: avg=74.3µs   min=5.44µs  med=10.78µs  max=146.18ms p(90)=20.46µs  p(95)=133.72µs p(99.9)=10ms    
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=105.17ms min=1.53ms  med=99.92ms  max=355.98ms p(90)=202.06ms p(95)=218.92ms p(99.9)=273.06ms
     http_reqs......................: 134937  2177.055916/s
     iteration_duration.............: avg=106.47ms min=4.49ms  med=101.24ms max=405.75ms p(90)=202.99ms p(95)=219.75ms p(99.9)=275.07ms
     iterations.....................: 133937  2160.922046/s
     success_rate...................: 100.00% ✓ 133937      ✗ 0     
     vus............................: 57      min=0         max=498 
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

     checks.........................: 100.00% ✓ 353517      ✗ 0     
     data_received..................: 10 GB   167 MB/s
     data_sent......................: 143 MB  2.3 MB/s
     http_req_blocked...............: avg=17.06µs  min=992ns   med=2.79µs   max=99.86ms  p(90)=4.47µs   p(95)=5.58µs   p(99.9)=1.78ms  
     http_req_connecting............: avg=13.12µs  min=0s      med=0s       max=99.82ms  p(90)=0s       p(95)=0s       p(99.9)=1.61ms  
     http_req_duration..............: avg=119.78ms min=1.79ms  med=110.67ms max=851.98ms p(90)=231.54ms p(95)=261.97ms p(99.9)=583.53ms
       { expected_response:true }...: avg=119.78ms min=1.79ms  med=110.67ms max=851.98ms p(90)=231.54ms p(95)=261.97ms p(99.9)=583.53ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 118839
     http_req_receiving.............: avg=1.65ms   min=53.57µs med=120.78µs max=355.59ms p(90)=1.62ms   p(95)=4.3ms    p(99.9)=123.31ms
     http_req_sending...............: avg=66.57µs  min=5.71µs  med=11.15µs  max=171.4ms  p(90)=20.99µs  p(95)=128.41µs p(99.9)=8.38ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=118.06ms min=1.71ms  med=109.43ms max=851.89ms p(90)=228.69ms p(95)=256.73ms p(99.9)=581.91ms
     http_reqs......................: 118839  1909.945008/s
     iteration_duration.............: avg=121.08ms min=2.73ms  med=112.19ms max=852.18ms p(90)=232.34ms p(95)=262.87ms p(99.9)=584.37ms
     iterations.....................: 117839  1893.873306/s
     success_rate...................: 100.00% ✓ 117839      ✗ 0     
     vus............................: 68      min=0         max=495 
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

     checks.........................: 100.00% ✓ 206301      ✗ 0    
     data_received..................: 6.1 GB  98 MB/s
     data_sent......................: 84 MB   1.3 MB/s
     http_req_blocked...............: avg=7.1µs    min=1.12µs  med=2.73µs   max=22.24ms  p(90)=4.43µs   p(95)=5.39µs   p(99.9)=729.57µs
     http_req_connecting............: avg=3.65µs   min=0s      med=0s       max=22.16ms  p(90)=0s       p(95)=0s       p(99.9)=638.68µs
     http_req_duration..............: avg=204.56ms min=2.06ms  med=205.48ms max=588.09ms p(90)=378.44ms p(95)=407.48ms p(99.9)=518.44ms
       { expected_response:true }...: avg=204.56ms min=2.06ms  med=205.48ms max=588.09ms p(90)=378.44ms p(95)=407.48ms p(99.9)=518.44ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 69767
     http_req_receiving.............: avg=87.38µs  min=31.33µs med=68.8µs   max=163.35ms p(90)=106.29µs p(95)=122.74µs p(99.9)=1.66ms  
     http_req_sending...............: avg=33.61µs  min=5.66µs  med=12.05µs  max=126.85ms p(90)=19.14µs  p(95)=23.08µs  p(99.9)=4.3ms   
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=204.44ms min=2ms     med=205.31ms max=588.04ms p(90)=378.33ms p(95)=407.36ms p(99.9)=518.38ms
     http_reqs......................: 69767   1114.459308/s
     iteration_duration.............: avg=207.79ms min=5.3ms   med=209.05ms max=588.23ms p(90)=379.38ms p(95)=408.23ms p(99.9)=518.72ms
     iterations.....................: 68767   1098.48529/s
     success_rate...................: 100.00% ✓ 68767       ✗ 0    
     vus............................: 87      min=0         max=498
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

     checks.........................: 100.00% ✓ 89277      ✗ 0    
     data_received..................: 2.7 GB  41 MB/s
     data_sent......................: 37 MB   566 kB/s
     http_req_blocked...............: avg=11.99µs  min=1.21µs  med=3.13µs   max=42.02ms  p(90)=4.93µs   p(95)=5.96µs   p(99.9)=1.87ms
     http_req_connecting............: avg=7.81µs   min=0s      med=0s       max=41.96ms  p(90)=0s       p(95)=0s       p(99.9)=1.84ms
     http_req_duration..............: avg=467.03ms min=4.12ms  med=429.64ms max=1.72s    p(90)=931.48ms p(95)=1.01s    p(99.9)=1.45s 
       { expected_response:true }...: avg=467.03ms min=4.12ms  med=429.64ms max=1.72s    p(90)=931.48ms p(95)=1.01s    p(99.9)=1.45s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 30759
     http_req_receiving.............: avg=123.36µs min=30.24µs med=82.24µs  max=140.97ms p(90)=119.15µs p(95)=133.03µs p(99.9)=3.05ms
     http_req_sending...............: avg=37.16µs  min=5.64µs  med=14.68µs  max=143.23ms p(90)=22.07µs  p(95)=25.34µs  p(99.9)=3.01ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=466.87ms min=4.03ms  med=429.54ms max=1.72s    p(90)=931.37ms p(95)=1.01s    p(99.9)=1.45s 
     http_reqs......................: 30759   471.509769/s
     iteration_duration.............: avg=482.95ms min=16.26ms med=447.89ms max=1.72s    p(90)=935.49ms p(95)=1.01s    p(99.9)=1.46s 
     iterations.....................: 29759   456.180605/s
     success_rate...................: 100.00% ✓ 29759      ✗ 0    
     vus............................: 67      min=0        max=496
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

     checks.........................: 100.00% ✓ 42237      ✗ 0    
     data_received..................: 1.3 GB  19 MB/s
     data_sent......................: 18 MB   265 kB/s
     http_req_blocked...............: avg=16.26µs  min=1.24µs  med=3.65µs   max=3.66ms  p(90)=5.48µs   p(95)=7.27µs   p(99.9)=2.8ms 
     http_req_connecting............: avg=10.82µs  min=0s      med=0s       max=3.58ms  p(90)=0s       p(95)=0s       p(99.9)=2.78ms
     http_req_duration..............: avg=967.72ms min=6.37ms  med=892.49ms max=5.89s   p(90)=1.92s    p(95)=2.1s     p(99.9)=5.36s 
       { expected_response:true }...: avg=967.72ms min=6.37ms  med=892.49ms max=5.89s   p(90)=1.92s    p(95)=2.1s     p(99.9)=5.36s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 15079
     http_req_receiving.............: avg=116.75µs min=34.36µs med=99.76µs  max=48.12ms p(90)=139.07µs p(95)=152.31µs p(99.9)=1.32ms
     http_req_sending...............: avg=37.17µs  min=5.92µs  med=18.23µs  max=49.28ms p(90)=24.22µs  p(95)=29.37µs  p(99.9)=3.24ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=967.57ms min=6.26ms  med=892.37ms max=5.89s   p(90)=1.92s    p(95)=2.1s     p(99.9)=5.36s 
     http_reqs......................: 15079   220.82148/s
     iteration_duration.............: avg=1.03s    min=45.47ms med=972.22ms max=5.9s    p(90)=1.94s    p(95)=2.11s    p(99.9)=5.39s 
     iterations.....................: 14079   206.177175/s
     success_rate...................: 100.00% ✓ 14079      ✗ 0    
     vus............................: 70      min=0        max=500
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

     checks.........................: 100.00% ✓ 39513      ✗ 0    
     data_received..................: 1.2 GB  18 MB/s
     data_sent......................: 17 MB   244 kB/s
     http_req_blocked...............: avg=17.14µs  min=1.2µs   med=3.49µs   max=27.57ms p(90)=5.31µs   p(95)=6.99µs   p(99.9)=1.98ms  
     http_req_connecting............: avg=11.49µs  min=0s      med=0s       max=27.52ms p(90)=0s       p(95)=0s       p(99.9)=1.82ms  
     http_req_duration..............: avg=1.02s    min=8.64ms  med=956.54ms max=4.23s   p(90)=2.09s    p(95)=2.21s    p(99.9)=3.83s   
       { expected_response:true }...: avg=1.02s    min=8.64ms  med=956.54ms max=4.23s   p(90)=2.09s    p(95)=2.21s    p(99.9)=3.83s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 14171
     http_req_receiving.............: avg=113.78µs min=33.05µs med=98.18µs  max=94.16ms p(90)=138.68µs p(95)=151.39µs p(99.9)=764.63µs
     http_req_sending...............: avg=33.72µs  min=6.15µs  med=17.97µs  max=80.93ms p(90)=23.82µs  p(95)=28.9µs   p(99.9)=1.48ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=1.02s    min=8.5ms   med=956.42ms max=4.23s   p(90)=2.09s    p(95)=2.21s    p(99.9)=3.83s   
     http_reqs......................: 14171   202.982652/s
     iteration_duration.............: avg=1.1s     min=71.83ms med=1.03s    max=4.23s   p(90)=2.11s    p(95)=2.22s    p(99.9)=3.83s   
     iterations.....................: 13171   188.658847/s
     success_rate...................: 100.00% ✓ 13171      ✗ 0    
     vus............................: 95      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-176-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

