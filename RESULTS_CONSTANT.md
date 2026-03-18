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
| hive-router | v0.0.41 | 2,834 | 2,945 | 2,759 | 2.2% |  |
| grafbase | 0.53.2 | 2,072 | 2,127 | 2,051 | 1.3% |  |
| hotchocolate | 16.0.0-p.11.47 | 1,839 | 1,870 | 1,822 | 0.8% |  |
| hive-gateway-router-runtime | 2.5.6 | 525 | 537 | 520 | 1.0% |  |
| apollo-router | v2.12.0 | 420 | 429 | 414 | 1.1% |  |
| hive-gateway | 2.5.6 | 275 | 279 | 274 | 0.7% |  |
| apollo-gateway | 2.13.2 | 242 | 244 | 240 | 0.5% |  |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.41 | 2,321 | 2,436 | 2,281 | 2.3% |  |
| hotchocolate | 16.0.0-p.11.47 | 1,735 | 1,756 | 1,715 | 0.8% |  |
| grafbase | 0.53.2 | 1,534 | 1,579 | 1,522 | 1.2% |  |
| cosmo | 0.291.0 | 1,215 | 1,233 | 1,208 | 0.7% | non-compatible response (3 across 2/9 runs) |
| hive-gateway-router-runtime | 2.5.6 | 504 | 517 | 499 | 1.3% |  |
| apollo-router | v2.12.0 | 371 | 384 | 366 | 1.6% |  |
| hive-gateway | 2.5.6 | 261 | 268 | 260 | 1.2% |  |
| apollo-gateway | 2.13.2 | 236 | 240 | 235 | 0.8% |  |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.41)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 1022028     ✗ 0     
     data_received..................: 30 GB   249 MB/s
     data_sent......................: 410 MB  3.4 MB/s
     http_req_blocked...............: avg=2.78µs   min=961ns   med=1.98µs  max=16.43ms  p(90)=3.03µs  p(95)=3.61µs   p(99.9)=33.27µs
     http_req_connecting............: avg=287ns    min=0s      med=0s      max=4.54ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=17.37ms  min=1.59ms  med=16.47ms max=291.92ms p(90)=25.93ms p(95)=29.77ms  p(99.9)=51.83ms
       { expected_response:true }...: avg=17.37ms  min=1.59ms  med=16.47ms max=291.92ms p(90)=25.93ms p(95)=29.77ms  p(99.9)=51.83ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 340776
     http_req_receiving.............: avg=132.65µs min=26.65µs med=47.44µs max=87.36ms  p(90)=90.51µs p(95)=256.87µs p(99.9)=14.97ms
     http_req_sending...............: avg=57.08µs  min=5.37µs  med=8.8µs   max=238.1ms  p(90)=14.42µs p(95)=116.76µs p(99.9)=8.84ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=17.18ms  min=1.5ms   med=16.32ms max=204.5ms  p(90)=25.68ms p(95)=29.38ms  p(99.9)=50.36ms
     http_reqs......................: 340776  2834.883907/s
     iteration_duration.............: avg=17.6ms   min=1.84ms  med=16.67ms max=359.81ms p(90)=26.16ms p(95)=30.03ms  p(99.9)=52.93ms
     iterations.....................: 340676  2834.052017/s
     success_rate...................: 100.00% ✓ 340676      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: grafbase (rust subgraphs) (0.53.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 747312      ✗ 0     
     data_received..................: 22 GB   182 MB/s
     data_sent......................: 299 MB  2.5 MB/s
     http_req_blocked...............: avg=3.26µs   min=942ns   med=2.22µs  max=11.49ms  p(90)=3.75µs   p(95)=4.59µs   p(99.9)=43.85µs
     http_req_connecting............: avg=387ns    min=0s      med=0s      max=3.91ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=23.83ms  min=1.95ms  med=23.58ms max=340.53ms p(90)=28.67ms  p(95)=31.07ms  p(99.9)=54.11ms
       { expected_response:true }...: avg=23.83ms  min=1.95ms  med=23.58ms max=340.53ms p(90)=28.67ms  p(95)=31.07ms  p(99.9)=54.11ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 249204
     http_req_receiving.............: avg=114.34µs min=28.59µs med=56.06µs max=165.84ms p(90)=100.53µs p(95)=204.22µs p(99.9)=10.02ms
     http_req_sending...............: avg=47.62µs  min=4.45µs  med=10.14µs max=184.45ms p(90)=18.4µs   p(95)=118.14µs p(99.9)=3.77ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=23.67ms  min=1.88ms  med=23.47ms max=302.2ms  p(90)=28.48ms  p(95)=30.8ms   p(99.9)=52.65ms
     http_reqs......................: 249204  2072.28997/s
     iteration_duration.............: avg=24.07ms  min=3.98ms  med=23.79ms max=350.16ms p(90)=28.89ms  p(95)=31.33ms  p(99.9)=54.87ms
     iterations.....................: 249104  2071.458406/s
     success_rate...................: 100.00% ✓ 249104      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (rust subgraphs) (16.0.0-p.11.47)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 663894      ✗ 0     
     data_received..................: 19 GB   161 MB/s
     data_sent......................: 266 MB  2.2 MB/s
     http_req_blocked...............: avg=2.74µs   min=1.02µs  med=2.06µs  max=9.35ms   p(90)=3.14µs   p(95)=3.67µs  p(99.9)=32.5µs  
     http_req_connecting............: avg=300ns    min=0s      med=0s      max=3.03ms   p(90)=0s       p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=26.87ms  min=2.8ms   med=15.01ms max=338.86ms p(90)=65.34ms  p(95)=86.28ms p(99.9)=197.11ms
       { expected_response:true }...: avg=26.87ms  min=2.8ms   med=15.01ms max=338.86ms p(90)=65.34ms  p(95)=86.28ms p(99.9)=197.11ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 221398
     http_req_receiving.............: avg=641.81µs min=50.92µs med=109.8µs max=183.79ms p(90)=755.31µs p(95)=1.15ms  p(99.9)=72.23ms 
     http_req_sending...............: avg=35.2µs   min=5.08µs  med=9.14µs  max=152.91ms p(90)=14.35µs  p(95)=25.01µs p(99.9)=1.93ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=26.2ms   min=2.71ms  med=14.5ms  max=328.57ms p(90)=64ms     p(95)=84.8ms  p(99.9)=193.42ms
     http_reqs......................: 221398  1839.700782/s
     iteration_duration.............: avg=27.1ms   min=3.44ms  med=15.22ms max=385.72ms p(90)=65.58ms  p(95)=86.54ms p(99.9)=197.96ms
     iterations.....................: 221298  1838.869834/s
     success_rate...................: 100.00% ✓ 221298      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (rust subgraphs) (2.5.6)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 189918     ✗ 0    
     data_received..................: 5.6 GB  46 MB/s
     data_sent......................: 76 MB   632 kB/s
     http_req_blocked...............: avg=4.28µs  min=1.19µs  med=2.84µs  max=4.03ms   p(90)=4.32µs   p(95)=4.94µs   p(99.9)=57.69µs 
     http_req_connecting............: avg=1.17µs  min=0s      med=0s      max=3.96ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=94.41ms min=4.46ms  med=91.31ms max=336.25ms p(90)=112.89ms p(95)=123.35ms p(99.9)=219.46ms
       { expected_response:true }...: avg=94.41ms min=4.46ms  med=91.31ms max=336.25ms p(90)=112.89ms p(95)=123.35ms p(99.9)=219.46ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 63406
     http_req_receiving.............: avg=85.19µs min=32.2µs  med=77.15µs max=57.2ms   p(90)=111.36µs p(95)=123.6µs  p(99.9)=768.34µs
     http_req_sending...............: avg=25.37µs min=5.72µs  med=13.3µs  max=97.95ms  p(90)=19.9µs   p(95)=22.11µs  p(99.9)=784.41µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=94.3ms  min=4.4ms   med=91.21ms max=332.28ms p(90)=112.79ms p(95)=123.18ms p(99.9)=219.26ms
     http_reqs......................: 63406   525.812639/s
     iteration_duration.............: avg=94.8ms  min=22.05ms med=91.54ms max=344.57ms p(90)=113.15ms p(95)=123.68ms p(99.9)=221.3ms 
     iterations.....................: 63306   524.98336/s
     success_rate...................: 100.00% ✓ 63306      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-router (rust subgraphs) (v2.12.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 151899     ✗ 0    
     data_received..................: 4.5 GB  37 MB/s
     data_sent......................: 61 MB   505 kB/s
     http_req_blocked...............: avg=4.91µs   min=1.16µs  med=3.01µs   max=3.98ms   p(90)=4.38µs   p(95)=4.93µs   p(99.9)=104.35µs
     http_req_connecting............: avg=1.63µs   min=0s      med=0s       max=3.92ms   p(90)=0s       p(95)=0s       p(99.9)=19.99µs 
     http_req_duration..............: avg=118.03ms min=5.49ms  med=117.77ms max=324.33ms p(90)=142.76ms p(95)=150.05ms p(99.9)=188.19ms
       { expected_response:true }...: avg=118.03ms min=5.49ms  med=117.77ms max=324.33ms p(90)=142.76ms p(95)=150.05ms p(99.9)=188.19ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 50733
     http_req_receiving.............: avg=85.88µs  min=31.67µs med=80.27µs  max=15.22ms  p(90)=111.84µs p(95)=123.69µs p(99.9)=652.86µs
     http_req_sending...............: avg=26.16µs  min=5.85µs  med=14.41µs  max=125.11ms p(90)=20.08µs  p(95)=21.96µs  p(99.9)=934.82µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=117.92ms min=5.43ms  med=117.67ms max=323.87ms p(90)=142.66ms p(95)=149.92ms p(99.9)=187.95ms
     http_reqs......................: 50733   420.322992/s
     iteration_duration.............: avg=118.53ms min=17.69ms med=118.05ms max=370.39ms p(90)=143.03ms p(95)=150.32ms p(99.9)=193.08ms
     iterations.....................: 50633   419.494492/s
     success_rate...................: 100.00% ✓ 50633      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (rust subgraphs) (2.5.6)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 99504      ✗ 0    
     data_received..................: 2.9 GB  24 MB/s
     data_sent......................: 40 MB   331 kB/s
     http_req_blocked...............: avg=5.33µs   min=1.25µs  med=3.57µs   max=4.38ms   p(90)=5.08µs   p(95)=5.73µs   p(99.9)=692.68µs
     http_req_connecting............: avg=1.41µs   min=0s      med=0s       max=2.39ms   p(90)=0s       p(95)=0s       p(99.9)=620.54µs
     http_req_duration..............: avg=180.15ms min=5.77ms  med=162.74ms max=605.34ms p(90)=210.53ms p(95)=355.94ms p(99.9)=532.29ms
       { expected_response:true }...: avg=180.15ms min=5.77ms  med=162.74ms max=605.34ms p(90)=210.53ms p(95)=355.94ms p(99.9)=532.29ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 33268
     http_req_receiving.............: avg=107.26µs min=34.56µs med=96.89µs  max=92.56ms  p(90)=129.37µs p(95)=143.13µs p(99.9)=846.57µs
     http_req_sending...............: avg=28.65µs  min=6.3µs   med=17.78µs  max=88.44ms  p(90)=23.05µs  p(95)=24.95µs  p(99.9)=560.16µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=180.01ms min=5.64ms  med=162.61ms max=605.25ms p(90)=210.42ms p(95)=355.8ms  p(99.9)=532.15ms
     http_reqs......................: 33268   275.372657/s
     iteration_duration.............: avg=180.98ms min=37.96ms med=163.12ms max=605.54ms p(90)=210.96ms p(95)=359.48ms p(99.9)=532.58ms
     iterations.....................: 33168   274.544917/s
     success_rate...................: 100.00% ✓ 33168      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-gateway (rust subgraphs) (2.13.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 87786      ✗ 0    
     data_received..................: 2.6 GB  21 MB/s
     data_sent......................: 35 MB   291 kB/s
     http_req_blocked...............: avg=4.6µs    min=1.08µs  med=3.21µs   max=2.25ms   p(90)=4.41µs   p(95)=4.91µs   p(99.9)=506.39µs
     http_req_connecting............: avg=1.28µs   min=0s      med=0s       max=2.2ms    p(90)=0s       p(95)=0s       p(99.9)=476.18µs
     http_req_duration..............: avg=204.25ms min=8.41ms  med=195.68ms max=422.23ms p(90)=235.33ms p(95)=246.48ms p(99.9)=308.77ms
       { expected_response:true }...: avg=204.25ms min=8.41ms  med=195.68ms max=422.23ms p(90)=235.33ms p(95)=246.48ms p(99.9)=308.77ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29362
     http_req_receiving.............: avg=93.89µs  min=31.99µs med=89.36µs  max=6.5ms    p(90)=120.77µs p(95)=132.69µs p(99.9)=654.44µs
     http_req_sending...............: avg=20.71µs  min=5.54µs  med=15.66µs  max=24.95ms  p(90)=20.41µs  p(95)=22.23µs  p(99.9)=582.32µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=204.13ms min=8.27ms  med=195.57ms max=422.03ms p(90)=235.22ms p(95)=246.38ms p(99.9)=308.65ms
     http_reqs......................: 29362   242.509086/s
     iteration_duration.............: avg=205.17ms min=30.21ms med=195.96ms max=428.28ms p(90)=235.68ms p(95)=246.79ms p(99.9)=309.64ms
     iterations.....................: 29262   241.683157/s
     success_rate...................: 100.00% ✓ 29262      ✗ 0    
     vus............................: 38      min=38       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.41)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 836994      ✗ 0     
     data_received..................: 24 GB   203 MB/s
     data_sent......................: 335 MB  2.8 MB/s
     http_req_blocked...............: avg=3.04µs   min=1.03µs  med=2.16µs  max=14.88ms  p(90)=3.51µs  p(95)=4.26µs   p(99.9)=32.97µs
     http_req_connecting............: avg=286ns    min=0s      med=0s      max=3.72ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=21.26ms  min=1.83ms  med=20.79ms max=323.14ms p(90)=28.83ms p(95)=31.84ms  p(99.9)=54.03ms
       { expected_response:true }...: avg=21.26ms  min=1.83ms  med=20.79ms max=323.14ms p(90)=28.83ms p(95)=31.84ms  p(99.9)=54.03ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 279098
     http_req_receiving.............: avg=112.98µs min=28.61µs med=53.64µs max=159.56ms p(90)=99.47µs p(95)=240.79µs p(99.9)=10.13ms
     http_req_sending...............: avg=50.8µs   min=5.16µs  med=9.66µs  max=197.5ms  p(90)=17µs    p(95)=121.48µs p(99.9)=5.34ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=21.1ms   min=1.72ms  med=20.66ms max=321.97ms p(90)=28.64ms p(95)=31.55ms  p(99.9)=53.12ms
     http_reqs......................: 279098  2321.418829/s
     iteration_duration.............: avg=21.49ms  min=3.08ms  med=21ms    max=342.63ms p(90)=29.06ms p(95)=32.08ms  p(99.9)=54.67ms
     iterations.....................: 278998  2320.587071/s
     success_rate...................: 100.00% ✓ 278998      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (.net subgraphs) (16.0.0-p.11.47)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 625947      ✗ 0     
     data_received..................: 18 GB   152 MB/s
     data_sent......................: 251 MB  2.1 MB/s
     http_req_blocked...............: avg=2.98µs   min=1µs     med=2.17µs   max=8.48ms   p(90)=3.48µs   p(95)=4.09µs  p(99.9)=34.45µs 
     http_req_connecting............: avg=412ns    min=0s      med=0s       max=4.08ms   p(90)=0s       p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=28.51ms  min=2.22ms  med=18.1ms   max=600.77ms p(90)=64.23ms  p(95)=84.97ms p(99.9)=211.08ms
       { expected_response:true }...: avg=28.51ms  min=2.22ms  med=18.1ms   max=600.77ms p(90)=64.23ms  p(95)=84.97ms p(99.9)=211.08ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 208749
     http_req_receiving.............: avg=534.43µs min=51.43µs med=106.28µs max=278.91ms p(90)=764.41µs p(95)=1.19ms  p(99.9)=61.21ms 
     http_req_sending...............: avg=36.44µs  min=5.31µs  med=9.92µs   max=163.1ms  p(90)=16.81µs  p(95)=25.54µs p(99.9)=1.81ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=27.94ms  min=2.1ms   med=17.63ms  max=600.58ms p(90)=63.19ms  p(95)=83.76ms p(99.9)=209.35ms
     http_reqs......................: 208749  1735.510641/s
     iteration_duration.............: avg=28.74ms  min=2.97ms  med=18.32ms  max=600.94ms p(90)=64.46ms  p(95)=85.2ms  p(99.9)=213.79ms
     iterations.....................: 208649  1734.679255/s
     success_rate...................: 100.00% ✓ 208649      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: grafbase (.net subgraphs) (0.53.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 553521      ✗ 0     
     data_received..................: 16 GB   134 MB/s
     data_sent......................: 222 MB  1.8 MB/s
     http_req_blocked...............: avg=3.43µs  min=932ns   med=2.27µs  max=4.24ms   p(90)=4.47µs   p(95)=5.64µs   p(99.9)=48.39µs
     http_req_connecting............: avg=558ns   min=0s      med=0s      max=4.2ms    p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=32.24ms min=2.33ms  med=31.41ms max=357.13ms p(90)=42.88ms  p(95)=47.69ms  p(99.9)=85.09ms
       { expected_response:true }...: avg=32.24ms min=2.33ms  med=31.41ms max=357.13ms p(90)=42.88ms  p(95)=47.69ms  p(99.9)=85.09ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 184607
     http_req_receiving.............: avg=121.2µs min=30.16µs med=60.43µs max=214.41ms p(90)=135.31µs p(95)=289.98µs p(99.9)=5.74ms 
     http_req_sending...............: avg=49.6µs  min=5.34µs  med=10.35µs max=223.62ms p(90)=24.62µs  p(95)=136.2µs  p(99.9)=3.84ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=32.07ms min=2.26ms  med=31.27ms max=213.21ms p(90)=42.68ms  p(95)=47.45ms  p(99.9)=83.82ms
     http_reqs......................: 184607  1534.453551/s
     iteration_duration.............: avg=32.51ms min=4.1ms   med=31.65ms max=368.79ms p(90)=43.13ms  p(95)=47.94ms  p(99.9)=86.27ms
     iterations.....................: 184507  1533.622351/s
     success_rate...................: 100.00% ✓ 184507      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (.net subgraphs) (0.291.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 438246      ✗ 0     
     data_received..................: 13 GB   106 MB/s
     data_sent......................: 176 MB  1.5 MB/s
     http_req_blocked...............: avg=4.16µs  min=1.04µs  med=2.63µs  max=87.34ms  p(90)=4.16µs   p(95)=4.84µs   p(99.9)=39.52µs
     http_req_connecting............: avg=1.16µs  min=0s      med=0s      max=87.26ms  p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=40.81ms min=2.31ms  med=40.29ms max=301.05ms p(90)=57.2ms   p(95)=62.3ms   p(99.9)=89.05ms
       { expected_response:true }...: avg=40.81ms min=2.31ms  med=40.29ms max=301.05ms p(90)=57.2ms   p(95)=62.3ms   p(99.9)=89.05ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 146182
     http_req_receiving.............: avg=90.8µs  min=30.22µs med=68.45µs max=139.11ms p(90)=108.18µs p(95)=128.28µs p(99.9)=2ms    
     http_req_sending...............: avg=28.63µs min=5.38µs  med=12.12µs max=80.13ms  p(90)=18.95µs  p(95)=23.15µs  p(99.9)=1.34ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=40.69ms min=2.18ms  med=40.17ms max=300.81ms p(90)=57.07ms  p(95)=62.16ms  p(99.9)=88.38ms
     http_reqs......................: 146182  1215.157427/s
     iteration_duration.............: avg=41.06ms min=4.07ms  med=40.51ms max=339.68ms p(90)=57.42ms  p(95)=62.52ms  p(99.9)=89.85ms
     iterations.....................: 146082  1214.326164/s
     success_rate...................: 100.00% ✓ 146082      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (.net subgraphs) (2.5.6)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 182178     ✗ 0    
     data_received..................: 5.3 GB  44 MB/s
     data_sent......................: 73 MB   606 kB/s
     http_req_blocked...............: avg=5.05µs   min=1.16µs  med=2.97µs  max=4.03ms   p(90)=4.48µs   p(95)=5.07µs   p(99.9)=108.56µs
     http_req_connecting............: avg=1.77µs   min=0s      med=0s      max=3.98ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=98.43ms  min=4.39ms  med=95.06ms max=367.92ms p(90)=118.51ms p(95)=130.54ms p(99.9)=232.15ms
       { expected_response:true }...: avg=98.43ms  min=4.39ms  med=95.06ms max=367.92ms p(90)=118.51ms p(95)=130.54ms p(99.9)=232.15ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 60826
     http_req_receiving.............: avg=170.89µs min=30.91µs med=80.57µs max=260.91ms p(90)=114.72µs p(95)=127.53µs p(99.9)=1.07ms  
     http_req_sending...............: avg=24.53µs  min=5.58µs  med=13.8µs  max=250.13ms p(90)=20.3µs   p(95)=22.42µs  p(99.9)=629.5µs 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=98.24ms  min=4.31ms  med=94.96ms max=250.28ms p(90)=118.34ms p(95)=130.21ms p(99.9)=227.44ms
     http_reqs......................: 60826   504.352494/s
     iteration_duration.............: avg=98.82ms  min=10.71ms med=95.32ms max=392.72ms p(90)=118.76ms p(95)=130.84ms p(99.9)=233.13ms
     iterations.....................: 60726   503.523322/s
     success_rate...................: 100.00% ✓ 60726      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-router (.net subgraphs) (v2.12.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 134391     ✗ 0    
     data_received..................: 3.9 GB  33 MB/s
     data_sent......................: 54 MB   446 kB/s
     http_req_blocked...............: avg=5.67µs   min=1.15µs  med=3.28µs   max=4.04ms   p(90)=4.66µs   p(95)=5.22µs   p(99.9)=233.48µs
     http_req_connecting............: avg=2.21µs   min=0s      med=0s       max=4.01ms   p(90)=0s       p(95)=0s       p(99.9)=193.91µs
     http_req_duration..............: avg=133.42ms min=6.02ms  med=130.85ms max=356.91ms p(90)=176.88ms p(95)=190.99ms p(99.9)=246.07ms
       { expected_response:true }...: avg=133.42ms min=6.02ms  med=130.85ms max=356.91ms p(90)=176.88ms p(95)=190.99ms p(99.9)=246.07ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 44897
     http_req_receiving.............: avg=167.03µs min=31.98µs med=84.87µs  max=209.61ms p(90)=116.51µs p(95)=128.19µs p(99.9)=1.34ms  
     http_req_sending...............: avg=25.72µs  min=6.06µs  med=15.69µs  max=86.38ms  p(90)=21.34µs  p(95)=23.15µs  p(99.9)=630.51µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=133.23ms min=5.89ms  med=130.72ms max=273.61ms p(90)=176.62ms p(95)=190.6ms  p(99.9)=242.53ms
     http_reqs......................: 44897   371.816145/s
     iteration_duration.............: avg=133.97ms min=17.39ms med=131.19ms max=363.93ms p(90)=177.18ms p(95)=191.31ms p(99.9)=249.36ms
     iterations.....................: 44797   370.987991/s
     success_rate...................: 100.00% ✓ 44797      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (.net subgraphs) (2.5.6)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 94602      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 38 MB   314 kB/s
     http_req_blocked...............: avg=6.73µs   min=1.23µs  med=3.36µs   max=4.18ms   p(90)=4.74µs   p(95)=5.33µs   p(99.9)=1.32ms  
     http_req_connecting............: avg=3.16µs   min=0s      med=0s       max=4.15ms   p(90)=0s       p(95)=0s       p(99.9)=1.29ms  
     http_req_duration..............: avg=189.52ms min=6.29ms  med=158.03ms max=712.19ms p(90)=269.06ms p(95)=371.83ms p(99.9)=586.54ms
       { expected_response:true }...: avg=189.52ms min=6.29ms  med=158.03ms max=712.19ms p(90)=269.06ms p(95)=371.83ms p(99.9)=586.54ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 31634
     http_req_receiving.............: avg=98.63µs  min=35.02µs med=94.58µs  max=10.19ms  p(90)=125.69µs p(95)=138.97µs p(99.9)=525µs   
     http_req_sending...............: avg=24.88µs  min=6.23µs  med=17.32µs  max=37.77ms  p(90)=22.32µs  p(95)=24.16µs  p(99.9)=542.05µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=189.4ms  min=6.2ms   med=157.92ms max=712.07ms p(90)=268.94ms p(95)=371.73ms p(99.9)=586.45ms
     http_reqs......................: 31634   261.407819/s
     iteration_duration.............: avg=190.38ms min=28.14ms med=158.48ms max=712.45ms p(90)=269.73ms p(95)=372.48ms p(99.9)=586.78ms
     iterations.....................: 31534   260.581468/s
     success_rate...................: 100.00% ✓ 31534      ✗ 0    
     vus............................: 10      min=10       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-gateway (.net subgraphs) (2.13.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 85734      ✗ 0    
     data_received..................: 2.5 GB  21 MB/s
     data_sent......................: 34 MB   284 kB/s
     http_req_blocked...............: avg=7.28µs   min=1.22µs  med=3.34µs   max=4.37ms   p(90)=4.6µs    p(95)=5.11µs   p(99.9)=1.78ms  
     http_req_connecting............: avg=3.8µs    min=0s      med=0s       max=4.32ms   p(90)=0s       p(95)=0s       p(99.9)=1.75ms  
     http_req_duration..............: avg=209.08ms min=8.6ms   med=213.81ms max=394.7ms  p(90)=253.01ms p(95)=261.47ms p(99.9)=328.79ms
       { expected_response:true }...: avg=209.08ms min=8.6ms   med=213.81ms max=394.7ms  p(90)=253.01ms p(95)=261.47ms p(99.9)=328.79ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 28678
     http_req_receiving.............: avg=97.58µs  min=33.99µs med=92.8µs   max=12.1ms   p(90)=123.99µs p(95)=136.06µs p(99.9)=520.93µs
     http_req_sending...............: avg=33.81µs  min=6.37µs  med=16.51µs  max=132.74ms p(90)=21.22µs  p(95)=22.98µs  p(99.9)=495.51µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=208.95ms min=8.47ms  med=213.67ms max=394.26ms p(90)=252.88ms p(95)=261.35ms p(99.9)=328.68ms
     http_reqs......................: 28678   236.800591/s
     iteration_duration.............: avg=210.09ms min=54.89ms med=215.19ms max=430.46ms p(90)=253.38ms p(95)=261.85ms p(99.9)=333.54ms
     iterations.....................: 28578   235.974869/s
     success_rate...................: 100.00% ✓ 28578      ✗ 0    
     vus............................: 41      min=41       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-173-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

