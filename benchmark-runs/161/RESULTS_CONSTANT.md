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
| hive-router | v0.0.49 | 3,000 | 3,191 | 2,897 | 3.1% |  |
| hotchocolate | 16.1.0-p.1.9 | 2,188 | 2,245 | 2,178 | 1.0% |  |
| grafbase | 0.53.3 | 2,076 | 2,130 | 2,056 | 1.1% |  |
| cosmo | 0.307.0 | 1,245 | 1,266 | 1,232 | 1.0% | non-compatible response (2 across 2/9 runs) |
| hive-gateway-router-runtime | 2.5.25 | 533 | 549 | 528 | 1.3% |  |
| apollo-router | v2.13.1 | 429 | 439 | 424 | 1.2% |  |
| hive-gateway | 2.5.25 | 250 | 254 | 247 | 0.9% |  |
| apollo-gateway | 2.13.3 | 240 | 243 | 238 | 0.7% |  |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hotchocolate | 16.1.0-p.1.9 | 2,005 | 2,061 | 1,978 | 1.2% |  |
| grafbase | 0.53.3 | 1,521 | 1,552 | 1,499 | 1.1% |  |
| cosmo | 0.307.0 | 1,198 | 1,223 | 1,192 | 1.0% | non-compatible response (3 across 3/9 runs) |
| hive-gateway-router-runtime | 2.5.25 | 525 | 525 | 525 | 0.0% |  |
| apollo-router | v2.13.1 | 371 | 383 | 366 | 1.6% |  |
| hive-gateway | 2.5.25 | 251 | 255 | 248 | 1.0% |  |
| apollo-gateway | 2.13.3 | 242 | 245 | 239 | 0.9% |  |
| hive-router | — | — | — | — | — | benchmark run failed |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.49)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 1081830     ✗ 0     
     data_received..................: 32 GB   263 MB/s
     data_sent......................: 434 MB  3.6 MB/s
     http_req_blocked...............: avg=2.83µs   min=952ns   med=2.15µs  max=25.39ms  p(90)=3.42µs  p(95)=4.07µs   p(99.9)=34.22µs
     http_req_connecting............: avg=130ns    min=0s      med=0s      max=1.97ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=16.4ms   min=1.63ms  med=15.38ms max=317ms    p(90)=24.32ms p(95)=28.43ms  p(99.9)=52.06ms
       { expected_response:true }...: avg=16.4ms   min=1.63ms  med=15.38ms max=317ms    p(90)=24.32ms p(95)=28.43ms  p(99.9)=52.06ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 360710
     http_req_receiving.............: avg=161.05µs min=26.65µs med=47.97µs max=283.53ms p(90)=99.56µs p(95)=287.92µs p(99.9)=16.1ms 
     http_req_sending...............: avg=60.9µs   min=4.98µs  med=9µs     max=40.44ms  p(90)=15.67µs p(95)=123µs    p(99.9)=12.8ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=16.18ms  min=1.53ms  med=15.22ms max=126.34ms p(90)=23.99ms p(95)=27.96ms  p(99.9)=49.91ms
     http_reqs......................: 360710  3000.637051/s
     iteration_duration.............: avg=16.62ms  min=2.08ms  med=15.58ms max=348.05ms p(90)=24.56ms p(95)=28.7ms   p(99.9)=53.3ms 
     iterations.....................: 360610  2999.805181/s
     success_rate...................: 100.00% ✓ 360610      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
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

     checks.........................: 100.00% ✓ 789678      ✗ 0     
     data_received..................: 23 GB   192 MB/s
     data_sent......................: 316 MB  2.6 MB/s
     http_req_blocked...............: avg=3.04µs   min=1.01µs med=2.2µs    max=19.96ms  p(90)=3.52µs   p(95)=4.17µs   p(99.9)=35.12µs 
     http_req_connecting............: avg=379ns    min=0s     med=0s       max=3.97ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=22.55ms  min=2.44ms med=14.48ms  max=323.68ms p(90)=50.18ms  p(95)=68.46ms  p(99.9)=167.08ms
       { expected_response:true }...: avg=22.55ms  min=2.44ms med=14.48ms  max=323.68ms p(90)=50.18ms  p(95)=68.46ms  p(99.9)=167.08ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 263326
     http_req_receiving.............: avg=676.33µs min=50.7µs med=107.67µs max=194.27ms p(90)=980.58µs p(95)=1.53ms   p(99.9)=62.05ms 
     http_req_sending...............: avg=44.18µs  min=5.23µs med=9.47µs   max=250.87ms p(90)=16.51µs  p(95)=112.53µs p(99.9)=2.63ms  
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=21.83ms  min=2.34ms med=13.95ms  max=252.09ms p(90)=48.8ms   p(95)=67.07ms  p(99.9)=163.11ms
     http_reqs......................: 263326  2188.879362/s
     iteration_duration.............: avg=22.78ms  min=3.34ms med=14.69ms  max=348.71ms p(90)=50.42ms  p(95)=68.69ms  p(99.9)=168.16ms
     iterations.....................: 263226  2188.048118/s
     success_rate...................: 100.00% ✓ 263226      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: grafbase (rust subgraphs) (0.53.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 748698      ✗ 0     
     data_received..................: 22 GB   182 MB/s
     data_sent......................: 300 MB  2.5 MB/s
     http_req_blocked...............: avg=3.4µs    min=1µs     med=2.54µs  max=22.12ms  p(90)=4.14µs   p(95)=4.94µs   p(99.9)=42.74µs
     http_req_connecting............: avg=200ns    min=0s      med=0s      max=2.77ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=23.79ms  min=1.91ms  med=23.52ms max=328.32ms p(90)=28.63ms  p(95)=30.95ms  p(99.9)=54.13ms
       { expected_response:true }...: avg=23.79ms  min=1.91ms  med=23.52ms max=328.32ms p(90)=28.63ms  p(95)=30.95ms  p(99.9)=54.13ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 249666
     http_req_receiving.............: avg=111.73µs min=29.07µs med=58.3µs  max=65.97ms  p(90)=103.59µs p(95)=224.32µs p(99.9)=8.86ms 
     http_req_sending...............: avg=47.13µs  min=5.09µs  med=10.38µs max=93.81ms  p(90)=18.39µs  p(95)=122.78µs p(99.9)=3.44ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=23.63ms  min=1.82ms  med=23.4ms  max=327.35ms p(90)=28.45ms  p(95)=30.68ms  p(99.9)=52.73ms
     http_reqs......................: 249666  2076.21312/s
     iteration_duration.............: avg=24.03ms  min=4.09ms  med=23.73ms max=339.63ms p(90)=28.85ms  p(95)=31.19ms  p(99.9)=54.64ms
     iterations.....................: 249566  2075.381523/s
     success_rate...................: 100.00% ✓ 249566      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
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

     checks.........................: 100.00% ✓ 448974      ✗ 0     
     data_received..................: 13 GB   109 MB/s
     data_sent......................: 180 MB  1.5 MB/s
     http_req_blocked...............: avg=3.38µs  min=1.02µs  med=2.41µs  max=3.99ms   p(90)=3.7µs   p(95)=4.31µs   p(99.9)=36.14µs
     http_req_connecting............: avg=655ns   min=0s      med=0s      max=3.95ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=39.84ms min=2.11ms  med=39.29ms max=299.07ms p(90)=56.23ms p(95)=61.31ms  p(99.9)=86.58ms
       { expected_response:true }...: avg=39.84ms min=2.11ms  med=39.29ms max=299.07ms p(90)=56.23ms p(95)=61.31ms  p(99.9)=86.58ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 149758
     http_req_receiving.............: avg=78.96µs min=28.23µs med=59.61µs max=92.98ms  p(90)=93.99µs p(95)=110.69µs p(99.9)=1.96ms 
     http_req_sending...............: avg=28.12µs min=5.16µs  med=10.59µs max=201.32ms p(90)=15.66µs p(95)=19.55µs  p(99.9)=1.21ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=39.74ms min=2.01ms  med=39.19ms max=298.64ms p(90)=56.12ms p(95)=61.19ms  p(99.9)=86.29ms
     http_reqs......................: 149758  1245.190861/s
     iteration_duration.............: avg=40.08ms min=4.03ms  med=39.49ms max=333.11ms p(90)=56.44ms p(95)=61.51ms  p(99.9)=87.21ms
     iterations.....................: 149658  1244.359392/s
     success_rate...................: 100.00% ✓ 149658      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
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

     checks.........................: 100.00% ✓ 192669     ✗ 0    
     data_received..................: 5.6 GB  47 MB/s
     data_sent......................: 77 MB   641 kB/s
     http_req_blocked...............: avg=4.78µs  min=1.22µs  med=2.92µs  max=4.13ms   p(90)=4.48µs   p(95)=5.09µs   p(99.9)=59.63µs 
     http_req_connecting............: avg=1.57µs  min=0s      med=0s      max=4.1ms    p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=93.07ms min=4.23ms  med=97.51ms max=341.72ms p(90)=132.38ms p(95)=145.83ms p(99.9)=244.23ms
       { expected_response:true }...: avg=93.07ms min=4.23ms  med=97.51ms max=341.72ms p(90)=132.38ms p(95)=145.83ms p(99.9)=244.23ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 64323
     http_req_receiving.............: avg=91.01µs min=31.48µs med=77.63µs max=97.84ms  p(90)=112.73µs p(95)=125.51µs p(99.9)=963.22µs
     http_req_sending...............: avg=25µs    min=5.57µs  med=13.45µs max=83.39ms  p(90)=20.27µs  p(95)=22.48µs  p(99.9)=664.29µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=92.95ms min=4.06ms  med=97.39ms max=341.1ms  p(90)=132.26ms p(95)=145.69ms p(99.9)=244.06ms
     http_reqs......................: 64323   533.589094/s
     iteration_duration.............: avg=93.44ms min=13.22ms med=97.79ms max=362.62ms p(90)=132.63ms p(95)=146.16ms p(99.9)=245.65ms
     iterations.....................: 64223   532.759548/s
     success_rate...................: 100.00% ✓ 64223      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-router (rust subgraphs) (v2.13.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 155148     ✗ 0    
     data_received..................: 4.5 GB  38 MB/s
     data_sent......................: 62 MB   515 kB/s
     http_req_blocked...............: avg=5.75µs   min=1.23µs  med=3.46µs   max=4.06ms   p(90)=4.9µs    p(95)=5.45µs   p(99.9)=103.87µs
     http_req_connecting............: avg=2.07µs   min=0s      med=0s       max=4.01ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=115.56ms min=5.53ms  med=115.3ms  max=349.97ms p(90)=139.2ms  p(95)=146.37ms p(99.9)=179.98ms
       { expected_response:true }...: avg=115.56ms min=5.53ms  med=115.3ms  max=349.97ms p(90)=139.2ms  p(95)=146.37ms p(99.9)=179.98ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 51816
     http_req_receiving.............: avg=92.52µs  min=30.45µs med=85.32µs  max=104.2ms  p(90)=117.56µs p(95)=129.87µs p(99.9)=595.88µs
     http_req_sending...............: avg=25.49µs  min=5.86µs  med=16.06µs  max=141.75ms p(90)=21.55µs  p(95)=23.39µs  p(99.9)=536.12µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=115.45ms min=5.47ms  med=115.19ms max=338.43ms p(90)=139.09ms p(95)=146.23ms p(99.9)=179.42ms
     http_reqs......................: 51816   429.275666/s
     iteration_duration.............: avg=116.05ms min=31.02ms med=115.59ms max=362.92ms p(90)=139.48ms p(95)=146.63ms p(99.9)=183.06ms
     iterations.....................: 51716   428.447204/s
     success_rate...................: 100.00% ✓ 51716      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
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

     checks.........................: 100.00% ✓ 90429      ✗ 0    
     data_received..................: 2.7 GB  22 MB/s
     data_sent......................: 36 MB   300 kB/s
     http_req_blocked...............: avg=6.87µs   min=1.21µs  med=3.48µs   max=3.95ms   p(90)=4.87µs   p(95)=5.49µs   p(99.9)=1.65ms  
     http_req_connecting............: avg=3.21µs   min=0s      med=0s       max=3.92ms   p(90)=0s       p(95)=0s       p(99.9)=1.62ms  
     http_req_duration..............: avg=198.24ms min=6.12ms  med=213.59ms max=813.73ms p(90)=318.64ms p(95)=375.79ms p(99.9)=652.26ms
       { expected_response:true }...: avg=198.24ms min=6.12ms  med=213.59ms max=813.73ms p(90)=318.64ms p(95)=375.79ms p(99.9)=652.26ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 30243
     http_req_receiving.............: avg=99.39µs  min=34.5µs  med=93.77µs  max=17.14ms  p(90)=125.85µs p(95)=139.12µs p(99.9)=710.09µs
     http_req_sending...............: avg=23.29µs  min=5.81µs  med=16.67µs  max=27.95ms  p(90)=21.88µs  p(95)=23.84µs  p(99.9)=598.46µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=198.12ms min=6.02ms  med=213.47ms max=813.65ms p(90)=318.49ms p(95)=375.66ms p(99.9)=652.15ms
     http_reqs......................: 30243   250.218721/s
     iteration_duration.............: avg=199.15ms min=29.24ms med=215.16ms max=813.94ms p(90)=319.17ms p(95)=376.93ms p(99.9)=652.61ms
     iterations.....................: 30143   249.39136/s
     success_rate...................: 100.00% ✓ 30143      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
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

     checks.........................: 100.00% ✓ 87012      ✗ 0    
     data_received..................: 2.6 GB  21 MB/s
     data_sent......................: 35 MB   289 kB/s
     http_req_blocked...............: avg=6.85µs   min=1.28µs  med=3.31µs   max=3.94ms   p(90)=4.55µs   p(95)=5.04µs   p(99.9)=1.8ms   
     http_req_connecting............: avg=3.39µs   min=0s      med=0s       max=3.9ms    p(90)=0s       p(95)=0s       p(99.9)=1.77ms  
     http_req_duration..............: avg=206.01ms min=8.28ms  med=204.22ms max=432.32ms p(90)=221.11ms p(95)=234.68ms p(99.9)=292.6ms 
       { expected_response:true }...: avg=206.01ms min=8.28ms  med=204.22ms max=432.32ms p(90)=221.11ms p(95)=234.68ms p(99.9)=292.6ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 29104
     http_req_receiving.............: avg=99.63µs  min=35.08µs med=88.65µs  max=127.03ms p(90)=119.84µs p(95)=131.87µs p(99.9)=385.56µs
     http_req_sending...............: avg=35.65µs  min=6.49µs  med=15.89µs  max=264.74ms p(90)=20.74µs  p(95)=22.47µs  p(99.9)=572.14µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=205.87ms min=8.11ms  med=204.11ms max=431.62ms p(90)=220.98ms p(95)=234.57ms p(99.9)=291.46ms
     http_reqs......................: 29104   240.427699/s
     iteration_duration.............: avg=207ms    min=60.72ms med=204.51ms max=449.86ms p(90)=221.37ms p(95)=235.11ms p(99.9)=306.41ms
     iterations.....................: 29004   239.6016/s
     success_rate...................: 100.00% ✓ 29004      ✗ 0    
     vus............................: 31      min=31       max=50 
     vus_max........................: 50      min=50       max=50
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

     checks.........................: 100.00% ✓ 723063      ✗ 0     
     data_received..................: 21 GB   176 MB/s
     data_sent......................: 290 MB  2.4 MB/s
     http_req_blocked...............: avg=3.19µs   min=992ns   med=2.31µs   max=8.27ms   p(90)=3.87µs  p(95)=4.63µs   p(99.9)=37.73µs 
     http_req_connecting............: avg=458ns    min=0s      med=0s       max=4.12ms   p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=24.64ms  min=1.9ms   med=17ms     max=618.75ms p(90)=51.67ms p(95)=68.24ms  p(99.9)=185.19ms
       { expected_response:true }...: avg=24.64ms  min=1.9ms   med=17ms     max=618.75ms p(90)=51.67ms p(95)=68.24ms  p(99.9)=185.19ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 241121
     http_req_receiving.............: avg=662.09µs min=50.85µs med=107.12µs max=242.24ms p(90)=1.13ms  p(95)=1.8ms    p(99.9)=56.24ms 
     http_req_sending...............: avg=44.73µs  min=5.11µs  med=9.8µs    max=141.02ms p(90)=18.62µs p(95)=114.43µs p(99.9)=3.05ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=23.94ms  min=1.79ms  med=16.46ms  max=618.21ms p(90)=50.37ms p(95)=66.8ms   p(99.9)=182.78ms
     http_reqs......................: 241121  2005.253347/s
     iteration_duration.............: avg=24.88ms  min=2.53ms  med=17.23ms  max=618.89ms p(90)=51.91ms p(95)=68.49ms  p(99.9)=187.71ms
     iterations.....................: 241021  2004.42171/s
     success_rate...................: 100.00% ✓ 241021      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: grafbase (.net subgraphs) (0.53.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 548802      ✗ 0     
     data_received..................: 16 GB   133 MB/s
     data_sent......................: 220 MB  1.8 MB/s
     http_req_blocked...............: avg=3.6µs    min=972ns   med=2.34µs  max=4.16ms   p(90)=4.78µs   p(95)=5.94µs   p(99.9)=45.34µs
     http_req_connecting............: avg=604ns    min=0s      med=0s      max=4.11ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=32.52ms  min=2.33ms  med=31.65ms max=331.8ms  p(90)=43.27ms  p(95)=48.28ms  p(99.9)=88.88ms
       { expected_response:true }...: avg=32.52ms  min=2.33ms  med=31.65ms max=331.8ms  p(90)=43.27ms  p(95)=48.28ms  p(99.9)=88.88ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 183034
     http_req_receiving.............: avg=148.09µs min=29.99µs med=61.06µs max=284.58ms p(90)=135.36µs p(95)=286.15µs p(99.9)=6.88ms 
     http_req_sending...............: avg=48.25µs  min=5.34µs  med=10.47µs max=284.33ms p(90)=24.64µs  p(95)=136.44µs p(99.9)=4.34ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=32.33ms  min=2.25ms  med=31.51ms max=140.64ms p(90)=43.08ms  p(95)=47.99ms  p(99.9)=85.61ms
     http_reqs......................: 183034  1521.465063/s
     iteration_duration.............: avg=32.78ms  min=3.52ms  med=31.89ms max=363.93ms p(90)=43.5ms   p(95)=48.52ms  p(99.9)=89.36ms
     iterations.....................: 182934  1520.633816/s
     success_rate...................: 100.00% ✓ 182934      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
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

     checks.........................: 100.00% ✓ 432360      ✗ 0     
     data_received..................: 13 GB   105 MB/s
     data_sent......................: 173 MB  1.4 MB/s
     http_req_blocked...............: avg=3.69µs  min=1.05µs  med=2.87µs  max=3.18ms   p(90)=4.46µs   p(95)=5.16µs   p(99.9)=39.71µs
     http_req_connecting............: avg=487ns   min=0s      med=0s      max=3.15ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=41.36ms min=2.23ms  med=40.8ms  max=337.29ms p(90)=58.21ms  p(95)=63.41ms  p(99.9)=90.2ms 
       { expected_response:true }...: avg=41.36ms min=2.23ms  med=40.8ms  max=337.29ms p(90)=58.21ms  p(95)=63.41ms  p(99.9)=90.2ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 144220
     http_req_receiving.............: avg=89.56µs min=30.52µs med=68.49µs max=106.6ms  p(90)=108.23µs p(95)=127.98µs p(99.9)=2.03ms 
     http_req_sending...............: avg=31.52µs min=5.35µs  med=12.41µs max=217.78ms p(90)=19.15µs  p(95)=23.17µs  p(99.9)=1.42ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=41.24ms min=2.11ms  med=40.69ms max=336.78ms p(90)=58.08ms  p(95)=63.27ms  p(99.9)=89.66ms
     http_reqs......................: 144220  1198.834232/s
     iteration_duration.............: avg=41.62ms min=3.66ms  med=41.02ms max=347.19ms p(90)=58.43ms  p(95)=63.63ms  p(99.9)=90.87ms
     iterations.....................: 144120  1198.002978/s
     success_rate...................: 100.00% ✓ 144120      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
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

     checks.........................: 100.00% ✓ 189831     ✗ 0    
     data_received..................: 5.5 GB  46 MB/s
     data_sent......................: 76 MB   631 kB/s
     http_req_blocked...............: avg=4.59µs  min=1.14µs  med=2.99µs  max=3.72ms   p(90)=4.46µs   p(95)=5.02µs   p(99.9)=45.18µs 
     http_req_connecting............: avg=1.37µs  min=0s      med=0s      max=3.68ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=94.45ms min=4.21ms  med=94.2ms  max=304.29ms p(90)=123.2ms  p(95)=136.7ms  p(99.9)=231.42ms
       { expected_response:true }...: avg=94.45ms min=4.21ms  med=94.2ms  max=304.29ms p(90)=123.2ms  p(95)=136.7ms  p(99.9)=231.42ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 63377
     http_req_receiving.............: avg=92.27µs min=31.74µs med=79.83µs max=118.56ms p(90)=115.86µs p(95)=130.62µs p(99.9)=962.87µs
     http_req_sending...............: avg=23.99µs min=5.86µs  med=13.63µs max=138.31ms p(90)=19.67µs  p(95)=21.63µs  p(99.9)=653.78µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=94.34ms min=4.08ms  med=94.1ms  max=303.4ms  p(90)=123.09ms p(95)=136.53ms p(99.9)=230.82ms
     http_reqs......................: 63377   525.563294/s
     iteration_duration.............: avg=94.84ms min=31.61ms med=94.46ms max=352.71ms p(90)=123.45ms p(95)=137.02ms p(99.9)=234.71ms
     iterations.....................: 63277   524.734029/s
     success_rate...................: 100.00% ✓ 63277      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-router (.net subgraphs) (v2.13.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 134190     ✗ 0    
     data_received..................: 3.9 GB  33 MB/s
     data_sent......................: 54 MB   446 kB/s
     http_req_blocked...............: avg=5.97µs   min=1.24µs  med=3.28µs   max=4.38ms   p(90)=4.71µs   p(95)=5.28µs   p(99.9)=1.06ms  
     http_req_connecting............: avg=2.52µs   min=0s      med=0s       max=4.34ms   p(90)=0s       p(95)=0s       p(99.9)=1.03ms  
     http_req_duration..............: avg=133.6ms  min=5.95ms  med=130.89ms max=376.27ms p(90)=177.13ms p(95)=190.7ms  p(99.9)=245.98ms
       { expected_response:true }...: avg=133.6ms  min=5.95ms  med=130.89ms max=376.27ms p(90)=177.13ms p(95)=190.7ms  p(99.9)=245.98ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 44830
     http_req_receiving.............: avg=98.27µs  min=33.29µs med=85.18µs  max=156.21ms p(90)=116.71µs p(95)=129.01µs p(99.9)=702.22µs
     http_req_sending...............: avg=21.63µs  min=6.03µs  med=15.91µs  max=78.35ms  p(90)=21.28µs  p(95)=23.06µs  p(99.9)=509.5µs 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=133.48ms min=5.83ms  med=130.78ms max=375.89ms p(90)=177.01ms p(95)=190.56ms p(99.9)=245.77ms
     http_reqs......................: 44830   371.250524/s
     iteration_duration.............: avg=134.17ms min=37.27ms med=131.23ms max=400.71ms p(90)=177.45ms p(95)=191.1ms  p(99.9)=250.93ms
     iterations.....................: 44730   370.422394/s
     success_rate...................: 100.00% ✓ 44730      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
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

     checks.........................: 100.00% ✓ 90846      ✗ 0    
     data_received..................: 2.7 GB  22 MB/s
     data_sent......................: 37 MB   302 kB/s
     http_req_blocked...............: avg=7.47µs   min=1.26µs  med=3.71µs   max=4.27ms   p(90)=5.2µs    p(95)=5.82µs   p(99.9)=1.7ms   
     http_req_connecting............: avg=3.38µs   min=0s      med=0s       max=3.98ms   p(90)=0s       p(95)=0s       p(99.9)=1.59ms  
     http_req_duration..............: avg=197.29ms min=6.44ms  med=180.02ms max=581.33ms p(90)=235.78ms p(95)=397.84ms p(99.9)=513.34ms
       { expected_response:true }...: avg=197.29ms min=6.44ms  med=180.02ms max=581.33ms p(90)=235.78ms p(95)=397.84ms p(99.9)=513.34ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 30382
     http_req_receiving.............: avg=163.55µs min=35.78µs med=99.97µs  max=192.45ms p(90)=132.31µs p(95)=146.03µs p(99.9)=4.45ms  
     http_req_sending...............: avg=31.33µs  min=6.13µs  med=18.82µs  max=58.53ms  p(90)=23.73µs  p(95)=25.54µs  p(99.9)=897.45µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=197.09ms min=6.28ms  med=179.87ms max=581.23ms p(90)=235.65ms p(95)=397.72ms p(99.9)=513.2ms 
     http_reqs......................: 30382   251.294144/s
     iteration_duration.............: avg=198.23ms min=18ms    med=180.41ms max=581.54ms p(90)=236.26ms p(95)=398.55ms p(99.9)=513.65ms
     iterations.....................: 30282   250.467029/s
     success_rate...................: 100.00% ✓ 30282      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
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

     checks.........................: 100.00% ✓ 87903      ✗ 0    
     data_received..................: 2.6 GB  21 MB/s
     data_sent......................: 35 MB   292 kB/s
     http_req_blocked...............: avg=7.5µs    min=1.25µs  med=3.55µs   max=4.18ms   p(90)=4.91µs   p(95)=5.47µs   p(99.9)=1.97ms  
     http_req_connecting............: avg=3.76µs   min=0s      med=0s       max=4.13ms   p(90)=0s       p(95)=0s       p(99.9)=1.94ms  
     http_req_duration..............: avg=203.87ms min=8.54ms  med=202.15ms max=429.41ms p(90)=218.69ms p(95)=223.39ms p(99.9)=298.95ms
       { expected_response:true }...: avg=203.87ms min=8.54ms  med=202.15ms max=429.41ms p(90)=218.69ms p(95)=223.39ms p(99.9)=298.95ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29401
     http_req_receiving.............: avg=106.46µs min=32.55µs med=95.78µs  max=97.56ms  p(90)=127.19µs p(95)=140.87µs p(99.9)=571.7µs 
     http_req_sending...............: avg=28.39µs  min=6.26µs  med=17.53µs  max=96.58ms  p(90)=22.22µs  p(95)=24.05µs  p(99.9)=488.51µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=203.74ms min=8.43ms  med=202.03ms max=428.97ms p(90)=218.57ms p(95)=223.26ms p(99.9)=298.84ms
     http_reqs......................: 29401   242.820395/s
     iteration_duration.............: avg=204.87ms min=38.48ms med=202.83ms max=454.34ms p(90)=218.96ms p(95)=223.74ms p(99.9)=314.48ms
     iterations.....................: 29301   241.994504/s
     success_rate...................: 100.00% ✓ 29301      ✗ 0    
     vus............................: 37      min=37       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-176-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

