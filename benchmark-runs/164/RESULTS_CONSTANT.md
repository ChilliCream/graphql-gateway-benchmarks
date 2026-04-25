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
| hive-router | v0.0.49 | 2,880 | 3,091 | 2,829 | 3.0% |  |
| hotchocolate | 16.1.0-p.1.9 | 2,122 | 2,192 | 2,119 | 1.3% |  |
| grafbase | 0.53.3 | 2,035 | 2,086 | 2,014 | 1.1% |  |
| cosmo | 0.307.0 | 1,246 | 1,264 | 1,237 | 0.7% | non-compatible response (1 across 1/9 runs) |
| hive-gateway-router-runtime | 2.5.25 | 548 | 557 | 543 | 0.8% |  |
| apollo-router | v2.13.1 | 399 | 411 | 395 | 1.4% |  |
| hive-gateway | 2.5.25 | 255 | 259 | 254 | 0.7% |  |
| apollo-gateway | 2.13.3 | 244 | 246 | 243 | 0.4% |  |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.49 | 2,394 | 2,516 | 2,355 | 2.2% |  |
| hotchocolate | 16.1.0-p.1.9 | 1,948 | 1,996 | 1,928 | 1.1% |  |
| grafbase | 0.53.3 | 1,511 | 1,554 | 1,485 | 1.5% |  |
| cosmo | 0.307.0 | 1,168 | 1,183 | 1,160 | 0.7% | non-compatible response (1 across 1/9 runs) |
| hive-gateway-router-runtime | 2.5.25 | 525 | 537 | 519 | 1.1% |  |
| apollo-router | v2.13.1 | 405 | 408 | 400 | 1.0% |  |
| hive-gateway | 2.5.25 | 246 | 251 | 244 | 0.9% |  |
| apollo-gateway | 2.13.3 | 237 | 239 | 235 | 0.7% |  |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.49)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 1038645     ✗ 0     
     data_received..................: 30 GB   253 MB/s
     data_sent......................: 416 MB  3.5 MB/s
     http_req_blocked...............: avg=3.36µs   min=992ns   med=2.05µs  max=160.4ms  p(90)=3.1µs   p(95)=3.72µs   p(99.9)=28.55µs
     http_req_connecting............: avg=303ns    min=0s      med=0s      max=4.14ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=17.09ms  min=1.63ms  med=16.34ms max=308.68ms p(90)=24.79ms p(95)=28.2ms   p(99.9)=50.76ms
       { expected_response:true }...: avg=17.09ms  min=1.63ms  med=16.34ms max=308.68ms p(90)=24.79ms p(95)=28.2ms   p(99.9)=50.76ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 346315
     http_req_receiving.............: avg=120.33µs min=28.08µs med=51.45µs max=162.69ms p(90)=97.37µs p(95)=266.53µs p(99.9)=10.56ms
     http_req_sending...............: avg=56.34µs  min=5.31µs  med=9.18µs  max=115.36ms p(90)=15.64µs p(95)=122.08µs p(99.9)=6.94ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=16.92ms  min=1.58ms  med=16.2ms  max=307.86ms p(90)=24.56ms p(95)=27.88ms  p(99.9)=49.54ms
     http_reqs......................: 346315  2880.949244/s
     iteration_duration.............: avg=17.32ms  min=2.16ms  med=16.54ms max=344.83ms p(90)=25.02ms p(95)=28.44ms  p(99.9)=51.68ms
     iterations.....................: 346215  2880.117357/s
     success_rate...................: 100.00% ✓ 346215      ✗ 0     
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

     checks.........................: 100.00% ✓ 765600     ✗ 0     
     data_received..................: 22 GB   186 MB/s
     data_sent......................: 307 MB  2.6 MB/s
     http_req_blocked...............: avg=2.77µs   min=982ns   med=2.01µs   max=12.19ms  p(90)=3.02µs   p(95)=3.57µs   p(99.9)=31.68µs 
     http_req_connecting............: avg=414ns    min=0s      med=0s       max=4.19ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=23.27ms  min=2.43ms  med=14.64ms  max=317.92ms p(90)=52.81ms  p(95)=71.28ms  p(99.9)=173.95ms
       { expected_response:true }...: avg=23.27ms  min=2.43ms  med=14.64ms  max=317.92ms p(90)=52.81ms  p(95)=71.28ms  p(99.9)=173.95ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 255300
     http_req_receiving.............: avg=683.89µs min=51.47µs med=108.69µs max=207.54ms p(90)=958.56µs p(95)=1.47ms   p(99.9)=64.97ms 
     http_req_sending...............: avg=41.37µs  min=4.95µs  med=9.1µs    max=177.93ms p(90)=14.85µs  p(95)=102.42µs p(99.9)=2.64ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=22.54ms  min=2.34ms  med=14.12ms  max=317.5ms  p(90)=51.31ms  p(95)=69.76ms  p(99.9)=171.11ms
     http_reqs......................: 255300  2122.2591/s
     iteration_duration.............: avg=23.5ms   min=3.27ms  med=14.85ms  max=348.35ms p(90)=53.05ms  p(95)=71.51ms  p(99.9)=175.69ms
     iterations.....................: 255200  2121.42782/s
     success_rate...................: 100.00% ✓ 255200     ✗ 0     
     vus............................: 50      min=50       max=50  
     vus_max........................: 50      min=50       max=50
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

     checks.........................: 100.00% ✓ 734052      ✗ 0     
     data_received..................: 22 GB   179 MB/s
     data_sent......................: 294 MB  2.4 MB/s
     http_req_blocked...............: avg=2.94µs   min=982ns   med=2.21µs  max=16.89ms  p(90)=3.61µs   p(95)=4.37µs   p(99.9)=41.87µs
     http_req_connecting............: avg=184ns    min=0s      med=0s      max=2.3ms    p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=24.27ms  min=1.97ms  med=24.02ms max=310.8ms  p(90)=29.13ms  p(95)=31.41ms  p(99.9)=54ms   
       { expected_response:true }...: avg=24.27ms  min=1.97ms  med=24.02ms max=310.8ms  p(90)=29.13ms  p(95)=31.41ms  p(99.9)=54ms   
     http_req_failed................: 0.00%   ✓ 0           ✗ 244784
     http_req_receiving.............: avg=110.96µs min=29.42µs med=57.76µs max=262.66ms p(90)=100.17µs p(95)=179.36µs p(99.9)=9.46ms 
     http_req_sending...............: avg=46.74µs  min=5.08µs  med=10.05µs max=124.47ms p(90)=17.49µs  p(95)=110.33µs p(99.9)=4.04ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=24.11ms  min=1.85ms  med=23.9ms  max=298.92ms p(90)=28.96ms  p(95)=31.14ms  p(99.9)=53.02ms
     http_reqs......................: 244784  2035.558314/s
     iteration_duration.............: avg=24.51ms  min=4.24ms  med=24.23ms max=350.22ms p(90)=29.35ms  p(95)=31.65ms  p(99.9)=54.61ms
     iterations.....................: 244684  2034.72674/s
     success_rate...................: 100.00% ✓ 244684      ✗ 0     
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

     checks.........................: 100.00% ✓ 449313      ✗ 0     
     data_received..................: 13 GB   109 MB/s
     data_sent......................: 180 MB  1.5 MB/s
     http_req_blocked...............: avg=2.7µs    min=1.06µs  med=2.03µs  max=2.87ms   p(90)=3.14µs  p(95)=3.67µs  p(99.9)=33.81µs
     http_req_connecting............: avg=377ns    min=0s      med=0s      max=2.83ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=39.83ms  min=2.14ms  med=39.27ms max=329.11ms p(90)=56.21ms p(95)=61.41ms p(99.9)=86.69ms
       { expected_response:true }...: avg=39.83ms  min=2.14ms  med=39.27ms max=329.11ms p(90)=56.21ms p(95)=61.41ms p(99.9)=86.69ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 149871
     http_req_receiving.............: avg=103.87µs min=27.84µs med=57.24µs max=209.34ms p(90)=90.13µs p(95)=108µs   p(99.9)=2.23ms 
     http_req_sending...............: avg=29.67µs  min=5.17µs  med=9.37µs  max=230.67ms p(90)=14.34µs p(95)=18.47µs p(99.9)=1.36ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=39.69ms  min=2.06ms  med=39.17ms max=119.51ms p(90)=56.1ms  p(95)=61.28ms p(99.9)=85.74ms
     http_reqs......................: 149871  1246.106642/s
     iteration_duration.............: avg=40.05ms  min=4.15ms  med=39.47ms max=344.81ms p(90)=56.4ms  p(95)=61.61ms p(99.9)=87.12ms
     iterations.....................: 149771  1245.275189/s
     success_rate...................: 100.00% ✓ 149771      ✗ 0     
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

     checks.........................: 100.00% ✓ 198051     ✗ 0    
     data_received..................: 5.8 GB  48 MB/s
     data_sent......................: 79 MB   659 kB/s
     http_req_blocked...............: avg=3.97µs  min=1.11µs  med=2.63µs  max=5.05ms   p(90)=4.18µs   p(95)=4.79µs   p(99.9)=44.78µs 
     http_req_connecting............: avg=970ns   min=0s      med=0s      max=3.24ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=90.52ms min=4.12ms  med=86.94ms max=346.25ms p(90)=112.08ms p(95)=126.1ms  p(99.9)=217.37ms
       { expected_response:true }...: avg=90.52ms min=4.12ms  med=86.94ms max=346.25ms p(90)=112.08ms p(95)=126.1ms  p(99.9)=217.37ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 66117
     http_req_receiving.............: avg=88.95µs min=31.13µs med=74.99µs max=157.59ms p(90)=110.96µs p(95)=124.69µs p(99.9)=914.59µs
     http_req_sending...............: avg=20.85µs min=5.35µs  med=12.49µs max=129.31ms p(90)=19.44µs  p(95)=21.74µs  p(99.9)=776.44µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=90.41ms min=4.01ms  med=86.84ms max=320.62ms p(90)=111.96ms p(95)=125.99ms p(99.9)=216.88ms
     http_reqs......................: 66117   548.373276/s
     iteration_duration.............: avg=90.9ms  min=19.03ms med=87.17ms max=375.97ms p(90)=112.31ms p(95)=126.44ms p(99.9)=219.34ms
     iterations.....................: 66017   547.543877/s
     success_rate...................: 100.00% ✓ 66017      ✗ 0    
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

     checks.........................: 100.00% ✓ 144477     ✗ 0    
     data_received..................: 4.2 GB  35 MB/s
     data_sent......................: 58 MB   480 kB/s
     http_req_blocked...............: avg=5.57µs   min=1.22µs  med=3.08µs   max=4.17ms   p(90)=4.46µs   p(95)=5.02µs   p(99.9)=306.95µs
     http_req_connecting............: avg=2.16µs   min=0s      med=0s       max=3.89ms   p(90)=0s       p(95)=0s       p(99.9)=125.36µs
     http_req_duration..............: avg=124.14ms min=5.49ms  med=123.91ms max=350.57ms p(90)=150.01ms p(95)=157.74ms p(99.9)=193.49ms
       { expected_response:true }...: avg=124.14ms min=5.49ms  med=123.91ms max=350.57ms p(90)=150.01ms p(95)=157.74ms p(99.9)=193.49ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 48259
     http_req_receiving.............: avg=87.06µs  min=32.27µs med=80.72µs  max=39.52ms  p(90)=112.37µs p(95)=123.86µs p(99.9)=794.7µs 
     http_req_sending...............: avg=30.9µs   min=5.79µs  med=14.81µs  max=187.44ms p(90)=20.46µs  p(95)=22.34µs  p(99.9)=607.13µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=124.02ms min=5.38ms  med=123.8ms  max=350.17ms p(90)=149.89ms p(95)=157.6ms  p(99.9)=193.37ms
     http_reqs......................: 48259   399.793963/s
     iteration_duration.............: avg=124.64ms min=41.98ms med=124.19ms max=383.78ms p(90)=150.3ms  p(95)=157.98ms p(99.9)=197.13ms
     iterations.....................: 48159   398.965529/s
     success_rate...................: 100.00% ✓ 48159      ✗ 0    
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

     checks.........................: 100.00% ✓ 92259      ✗ 0    
     data_received..................: 2.7 GB  22 MB/s
     data_sent......................: 37 MB   306 kB/s
     http_req_blocked...............: avg=7.06µs   min=1.26µs  med=3.57µs   max=4.02ms   p(90)=5.12µs   p(95)=5.77µs   p(99.9)=1.66ms  
     http_req_connecting............: avg=3.25µs   min=0s      med=0s       max=3.96ms   p(90)=0s       p(95)=0s       p(99.9)=1.64ms  
     http_req_duration..............: avg=194.29ms min=6.32ms  med=177.07ms max=586.97ms p(90)=228.37ms p(95)=397.08ms p(99.9)=519.4ms 
       { expected_response:true }...: avg=194.29ms min=6.32ms  med=177.07ms max=586.97ms p(90)=228.37ms p(95)=397.08ms p(99.9)=519.4ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 30853
     http_req_receiving.............: avg=195.2µs  min=35.11µs med=97.07µs  max=250.16ms p(90)=129.82µs p(95)=144.16µs p(99.9)=1.22ms  
     http_req_sending...............: avg=26.27µs  min=5.57µs  med=18.65µs  max=35.18ms  p(90)=23.98µs  p(95)=25.94µs  p(99.9)=599.44µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=194.07ms min=6.23ms  med=176.9ms  max=586.88ms p(90)=227.98ms p(95)=396.89ms p(99.9)=519.28ms
     http_reqs......................: 30853   255.175613/s
     iteration_duration.............: avg=195.23ms min=44.12ms med=177.45ms max=587.17ms p(90)=228.94ms p(95)=397.93ms p(99.9)=519.76ms
     iterations.....................: 30753   254.348544/s
     success_rate...................: 100.00% ✓ 30753      ✗ 0    
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

     checks.........................: 100.00% ✓ 88647      ✗ 0    
     data_received..................: 2.6 GB  22 MB/s
     data_sent......................: 36 MB   294 kB/s
     http_req_blocked...............: avg=4.74µs   min=1.23µs  med=3.28µs   max=1.87ms   p(90)=4.6µs    p(95)=5.15µs   p(99.9)=554.63µs
     http_req_connecting............: avg=1.25µs   min=0s      med=0s       max=1.84ms   p(90)=0s       p(95)=0s       p(99.9)=515.29µs
     http_req_duration..............: avg=202.24ms min=8.4ms   med=203.98ms max=364.18ms p(90)=216.79ms p(95)=227.34ms p(99.9)=287.49ms
       { expected_response:true }...: avg=202.24ms min=8.4ms   med=203.98ms max=364.18ms p(90)=216.79ms p(95)=227.34ms p(99.9)=287.49ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29649
     http_req_receiving.............: avg=98.7µs   min=29.85µs med=90.28µs  max=98.65ms  p(90)=122.28µs p(95)=134.73µs p(99.9)=801.16µs
     http_req_sending...............: avg=29.52µs  min=5.75µs  med=16.98µs  max=87.82ms  p(90)=21.63µs  p(95)=23.47µs  p(99.9)=664.73µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=202.11ms min=8.27ms  med=203.86ms max=363.8ms  p(90)=216.67ms p(95)=227.14ms p(99.9)=287.4ms 
     http_reqs......................: 29649   244.95636/s
     iteration_duration.............: avg=203.16ms min=55.65ms med=204.27ms max=372.99ms p(90)=217.04ms p(95)=227.79ms p(99.9)=288.62ms
     iterations.....................: 29549   244.130172/s
     success_rate...................: 100.00% ✓ 29549      ✗ 0    
     vus............................: 28      min=28       max=50 
     vus_max........................: 50      min=50       max=50
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

     checks.........................: 100.00% ✓ 863304      ✗ 0     
     data_received..................: 25 GB   209 MB/s
     data_sent......................: 346 MB  2.9 MB/s
     http_req_blocked...............: avg=3.01µs   min=1.01µs  med=2.23µs  max=4.95ms   p(90)=3.65µs   p(95)=4.44µs   p(99.9)=35.31µs
     http_req_connecting............: avg=360ns    min=0s      med=0s      max=4.16ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=20.61ms  min=1.66ms  med=20.12ms max=301.72ms p(90)=28.48ms  p(95)=31.52ms  p(99.9)=53.7ms 
       { expected_response:true }...: avg=20.61ms  min=1.66ms  med=20.12ms max=301.72ms p(90)=28.48ms  p(95)=31.52ms  p(99.9)=53.7ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 287868
     http_req_receiving.............: avg=110.28µs min=28.17µs med=54.57µs max=110.24ms p(90)=102.14µs p(95)=256.33µs p(99.9)=7.89ms 
     http_req_sending...............: avg=52.99µs  min=5.31µs  med=9.79µs  max=183.31ms p(90)=17.81µs  p(95)=122.37µs p(99.9)=5.64ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=20.44ms  min=1.56ms  med=19.98ms max=301.08ms p(90)=28.29ms  p(95)=31.25ms  p(99.9)=53.07ms
     http_reqs......................: 287868  2394.505621/s
     iteration_duration.............: avg=20.84ms  min=3.19ms  med=20.33ms max=340.68ms p(90)=28.7ms   p(95)=31.76ms  p(99.9)=54.39ms
     iterations.....................: 287768  2393.673814/s
     success_rate...................: 100.00% ✓ 287768      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
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

     checks.........................: 100.00% ✓ 702396      ✗ 0     
     data_received..................: 21 GB   171 MB/s
     data_sent......................: 281 MB  2.3 MB/s
     http_req_blocked...............: avg=3.02µs   min=1.01µs  med=2.12µs   max=10.47ms  p(90)=3.35µs  p(95)=4.02µs   p(99.9)=30.64µs 
     http_req_connecting............: avg=419ns    min=0s      med=0s       max=4ms      p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=25.38ms  min=1.94ms  med=17.39ms  max=466.1ms  p(90)=53.83ms p(95)=71.26ms  p(99.9)=186.73ms
       { expected_response:true }...: avg=25.38ms  min=1.94ms  med=17.39ms  max=466.1ms  p(90)=53.83ms p(95)=71.26ms  p(99.9)=186.73ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 234232
     http_req_receiving.............: avg=668.93µs min=51.12µs med=108.34µs max=264.64ms p(90)=1.13ms  p(95)=1.8ms    p(99.9)=55.58ms 
     http_req_sending...............: avg=40.88µs  min=5.17µs  med=9.53µs   max=226.74ms p(90)=17.44µs p(95)=107.25µs p(99.9)=2.5ms   
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=24.67ms  min=1.81ms  med=16.84ms  max=466.02ms p(90)=52.63ms p(95)=69.8ms   p(99.9)=184.96ms
     http_reqs......................: 234232  1948.093708/s
     iteration_duration.............: avg=25.61ms  min=2.53ms  med=17.61ms  max=466.29ms p(90)=54.07ms p(95)=71.51ms  p(99.9)=189.92ms
     iterations.....................: 234132  1947.262014/s
     success_rate...................: 100.00% ✓ 234132      ✗ 0     
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

     checks.........................: 100.00% ✓ 545352      ✗ 0     
     data_received..................: 16 GB   132 MB/s
     data_sent......................: 219 MB  1.8 MB/s
     http_req_blocked...............: avg=3.34µs   min=1µs    med=2.32µs  max=4.26ms   p(90)=4.39µs   p(95)=5.63µs   p(99.9)=40.81µs
     http_req_connecting............: avg=470ns    min=0s     med=0s      max=4.21ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=32.73ms  min=2.41ms med=31.86ms max=331.8ms  p(90)=43.12ms  p(95)=47.67ms  p(99.9)=88.69ms
       { expected_response:true }...: avg=32.73ms  min=2.41ms med=31.86ms max=331.8ms  p(90)=43.12ms  p(95)=47.67ms  p(99.9)=88.69ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 181884
     http_req_receiving.............: avg=113.35µs min=30.2µs med=62.59µs max=125.05ms p(90)=132.54µs p(95)=270.44µs p(99.9)=5.39ms 
     http_req_sending...............: avg=45.94µs  min=5.44µs med=10.48µs max=95.58ms  p(90)=23.91µs  p(95)=133.03µs p(99.9)=3.36ms 
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=32.57ms  min=2.31ms med=31.72ms max=307.52ms p(90)=42.93ms  p(95)=47.45ms  p(99.9)=88.29ms
     http_reqs......................: 181884  1511.912506/s
     iteration_duration.............: avg=32.99ms  min=4.36ms med=32.09ms max=345.06ms p(90)=43.36ms  p(95)=47.92ms  p(99.9)=89.48ms
     iterations.....................: 181784  1511.081255/s
     success_rate...................: 100.00% ✓ 181784      ✗ 0     
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

     checks.........................: 100.00% ✓ 421494      ✗ 0     
     data_received..................: 12 GB   102 MB/s
     data_sent......................: 169 MB  1.4 MB/s
     http_req_blocked...............: avg=3.23µs  min=1.02µs med=2.21µs  max=4.01ms   p(90)=3.54µs  p(95)=4.16µs   p(99.9)=30.67µs
     http_req_connecting............: avg=716ns   min=0s     med=0s      max=3.97ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=42.46ms min=2.15ms med=41.93ms max=322.85ms p(90)=59.68ms p(95)=65.13ms  p(99.9)=91.99ms
       { expected_response:true }...: avg=42.46ms min=2.15ms med=41.93ms max=322.85ms p(90)=59.68ms p(95)=65.13ms  p(99.9)=91.99ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 140598
     http_req_receiving.............: avg=80.64µs min=28.9µs med=63.43µs max=158.86ms p(90)=99.21µs p(95)=116.08µs p(99.9)=1.64ms 
     http_req_sending...............: avg=26.13µs min=5.28µs med=10.72µs max=132.06ms p(90)=16.48µs p(95)=19.93µs  p(99.9)=1.08ms 
     http_req_tls_handshaking.......: avg=0s      min=0s     med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=42.35ms min=2.09ms med=41.82ms max=322.21ms p(90)=59.58ms p(95)=65.03ms  p(99.9)=91.52ms
     http_reqs......................: 140598  1168.742648/s
     iteration_duration.............: avg=42.7ms  min=4.3ms  med=42.13ms max=338.78ms p(90)=59.88ms p(95)=65.33ms  p(99.9)=92.74ms
     iterations.....................: 140498  1167.911382/s
     success_rate...................: 100.00% ✓ 140498      ✗ 0     
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

     checks.........................: 100.00% ✓ 189798     ✗ 0    
     data_received..................: 5.5 GB  46 MB/s
     data_sent......................: 76 MB   631 kB/s
     http_req_blocked...............: avg=3.88µs  min=1.17µs  med=2.82µs  max=4.35ms   p(90)=4.39µs   p(95)=5µs      p(99.9)=45.7µs  
     http_req_connecting............: avg=742ns   min=0s      med=0s      max=2.61ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=94.48ms min=4.21ms  med=91.62ms max=330.57ms p(90)=116.14ms p(95)=129.99ms p(99.9)=219.39ms
       { expected_response:true }...: avg=94.48ms min=4.21ms  med=91.62ms max=330.57ms p(90)=116.14ms p(95)=129.99ms p(99.9)=219.39ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 63366
     http_req_receiving.............: avg=93.09µs min=31.03µs med=78.98µs max=200.28ms p(90)=114.41µs p(95)=127.53µs p(99.9)=895.58µs
     http_req_sending...............: avg=22.65µs min=5.77µs  med=13.53µs max=179.48ms p(90)=20.64µs  p(95)=22.8µs   p(99.9)=629.38µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=94.36ms min=4.14ms  med=91.51ms max=330.37ms p(90)=116.01ms p(95)=129.84ms p(99.9)=218.98ms
     http_reqs......................: 63366   525.366814/s
     iteration_duration.............: avg=94.87ms min=27.93ms med=91.87ms max=353.79ms p(90)=116.39ms p(95)=130.28ms p(99.9)=220.84ms
     iterations.....................: 63266   524.537715/s
     success_rate...................: 100.00% ✓ 63266      ✗ 0    
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

     checks.........................: 100.00% ✓ 146442     ✗ 0    
     data_received..................: 4.3 GB  35 MB/s
     data_sent......................: 59 MB   487 kB/s
     http_req_blocked...............: avg=4.91µs   min=1.15µs  med=3.03µs   max=3.91ms   p(90)=4.41µs   p(95)=4.93µs   p(99.9)=121.76µs
     http_req_connecting............: avg=1.63µs   min=0s      med=0s       max=3.88ms   p(90)=0s       p(95)=0s       p(99.9)=71.61µs 
     http_req_duration..............: avg=122.46ms min=5.88ms  med=119.97ms max=355.46ms p(90)=162.02ms p(95)=174.32ms p(99.9)=223.53ms
       { expected_response:true }...: avg=122.46ms min=5.88ms  med=119.97ms max=355.46ms p(90)=162.02ms p(95)=174.32ms p(99.9)=223.53ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 48914
     http_req_receiving.............: avg=153.57µs min=30.57µs med=83.55µs  max=202.64ms p(90)=114.58µs p(95)=126.5µs  p(99.9)=969.58µs
     http_req_sending...............: avg=26.86µs  min=5.86µs  med=15.6µs   max=199.02ms p(90)=20.86µs  p(95)=22.64µs  p(99.9)=808.85µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=122.28ms min=5.79ms  med=119.87ms max=270.76ms p(90)=161.79ms p(95)=174.07ms p(99.9)=219.61ms
     http_reqs......................: 48914   405.157635/s
     iteration_duration.............: avg=122.95ms min=21.98ms med=120.28ms max=355.73ms p(90)=162.32ms p(95)=174.63ms p(99.9)=224.61ms
     iterations.....................: 48814   404.329329/s
     success_rate...................: 100.00% ✓ 48814      ✗ 0    
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

     checks.........................: 100.00% ✓ 89235      ✗ 0    
     data_received..................: 2.6 GB  22 MB/s
     data_sent......................: 36 MB   296 kB/s
     http_req_blocked...............: avg=8.91µs   min=1.27µs  med=3.45µs   max=42.23ms  p(90)=4.9µs    p(95)=5.49µs   p(99.9)=2.08ms  
     http_req_connecting............: avg=5.15µs   min=0s      med=0s       max=42.16ms  p(90)=0s       p(95)=0s       p(99.9)=1.98ms  
     http_req_duration..............: avg=200.86ms min=6.48ms  med=185.32ms max=623.89ms p(90)=243.52ms p(95)=404.68ms p(99.9)=520.36ms
       { expected_response:true }...: avg=200.86ms min=6.48ms  med=185.32ms max=623.89ms p(90)=243.52ms p(95)=404.68ms p(99.9)=520.36ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29845
     http_req_receiving.............: avg=105.5µs  min=32.68µs med=96.44µs  max=53.86ms  p(90)=128.39µs p(95)=142.85µs p(99.9)=663.83µs
     http_req_sending...............: avg=28.97µs  min=6.01µs  med=18.12µs  max=79.59ms  p(90)=23.19µs  p(95)=24.93µs  p(99.9)=551.36µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=200.73ms min=6.32ms  med=185.18ms max=623.74ms p(90)=243.39ms p(95)=404.54ms p(99.9)=520.28ms
     http_reqs......................: 29845   246.853148/s
     iteration_duration.............: avg=201.82ms min=57.08ms med=185.72ms max=624.16ms p(90)=244.01ms p(95)=405.05ms p(99.9)=520.65ms
     iterations.....................: 29745   246.02603/s
     success_rate...................: 100.00% ✓ 29745      ✗ 0    
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

     checks.........................: 100.00% ✓ 86058      ✗ 0    
     data_received..................: 2.5 GB  21 MB/s
     data_sent......................: 35 MB   285 kB/s
     http_req_blocked...............: avg=5.93µs   min=1.29µs  med=3.34µs   max=5.06ms   p(90)=4.69µs   p(95)=5.22µs   p(99.9)=1ms     
     http_req_connecting............: avg=2.26µs   min=0s      med=0s       max=3.25ms   p(90)=0s       p(95)=0s       p(99.9)=955µs   
     http_req_duration..............: avg=208.31ms min=8.84ms  med=201.6ms  max=420.61ms p(90)=230.02ms p(95)=239.03ms p(99.9)=299.62ms
       { expected_response:true }...: avg=208.31ms min=8.84ms  med=201.6ms  max=420.61ms p(90)=230.02ms p(95)=239.03ms p(99.9)=299.62ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 28786
     http_req_receiving.............: avg=97.61µs  min=33.99µs med=93.39µs  max=3.26ms   p(90)=125.02µs p(95)=138.25µs p(99.9)=579.11µs
     http_req_sending...............: avg=47.62µs  min=6.13µs  med=17.28µs  max=206.08ms p(90)=21.98µs  p(95)=23.81µs  p(99.9)=862.79µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=208.16ms min=8.7ms   med=201.48ms max=420.46ms p(90)=229.87ms p(95)=238.87ms p(99.9)=298.87ms
     http_reqs......................: 28786   237.612413/s
     iteration_duration.............: avg=209.32ms min=53.83ms med=201.91ms max=436.46ms p(90)=230.36ms p(95)=239.45ms p(99.9)=303.56ms
     iterations.....................: 28686   236.786969/s
     success_rate...................: 100.00% ✓ 28686      ✗ 0    
     vus............................: 50      min=0        max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-176-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

