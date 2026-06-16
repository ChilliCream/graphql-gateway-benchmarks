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
| hive-router | v0.0.65 | 2,953 | 3,067 | 2,885 | 2.0% |  |
| hotchocolate | 16.1.3 | 2,095 | 2,142 | 2,079 | 1.0% |  |
| grafbase | 0.53.5 | 2,031 | 2,108 | 2,022 | 1.4% |  |
| cosmo | 0.321.1 | 1,227 | 1,238 | 1,213 | 0.8% | non-compatible response (4 across 3/9 runs) |
| hive-gateway-router-runtime | 2.8.2 | 570 | 578 | 563 | 0.9% |  |
| apollo-router | v2.15.0 | 443 | 453 | 440 | 1.0% |  |
| apollo-gateway | 2.14.1 | 247 | 249 | 245 | 0.6% |  |
| hive-gateway | 2.8.2 | 237 | 241 | 235 | 0.9% |  |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.65 | 2,361 | 2,494 | 2,330 | 2.2% |  |
| hotchocolate | 16.1.3 | 1,965 | 2,022 | 1,951 | 1.2% |  |
| grafbase | 0.53.5 | 1,514 | 1,540 | 1,485 | 1.1% |  |
| cosmo | 0.321.1 | 1,124 | 1,144 | 1,112 | 1.2% | non-compatible response (6 across 4/9 runs) |
| hive-gateway-router-runtime | 2.8.2 | 521 | 534 | 516 | 1.3% |  |
| apollo-router | v2.15.0 | 383 | 393 | 378 | 1.2% |  |
| hive-gateway | 2.8.2 | 242 | 247 | 240 | 0.9% |  |
| apollo-gateway | 2.14.1 | 238 | 240 | 236 | 0.6% |  |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.65)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 1064757     ✗ 0     
     data_received..................: 31 GB   259 MB/s
     data_sent......................: 427 MB  3.5 MB/s
     http_req_blocked...............: avg=2.72µs   min=982ns   med=2.02µs  max=18.37ms  p(90)=3.12µs  p(95)=3.72µs   p(99.9)=32.62µs
     http_req_connecting............: avg=187ns    min=0s      med=0s      max=3.25ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=16.66ms  min=1.72ms  med=15.63ms max=315.83ms p(90)=24.8ms  p(95)=29.1ms   p(99.9)=52.95ms
       { expected_response:true }...: avg=16.66ms  min=1.72ms  med=15.63ms max=315.83ms p(90)=24.8ms  p(95)=29.1ms   p(99.9)=52.95ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 355019
     http_req_receiving.............: avg=143.79µs min=27.25µs med=47.69µs max=238.32ms p(90)=95.43µs p(95)=276.86µs p(99.9)=16.44ms
     http_req_sending...............: avg=62.68µs  min=5.03µs  med=8.75µs  max=273.52ms p(90)=14.8µs  p(95)=118.66µs p(99.9)=15.46ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=16.45ms  min=1.66ms  med=15.48ms max=296.49ms p(90)=24.49ms p(95)=28.59ms  p(99.9)=50.89ms
     http_reqs......................: 355019  2953.248979/s
     iteration_duration.............: avg=16.89ms  min=2.11ms  med=15.83ms max=325.4ms  p(90)=25.03ms p(95)=29.38ms  p(99.9)=54.24ms
     iterations.....................: 354919  2952.417122/s
     success_rate...................: 100.00% ✓ 354919      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
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

     checks.........................: 100.00% ✓ 755928      ✗ 0     
     data_received..................: 22 GB   184 MB/s
     data_sent......................: 303 MB  2.5 MB/s
     http_req_blocked...............: avg=2.84µs   min=1µs     med=2.04µs   max=7.78ms   p(90)=3.04µs   p(95)=3.6µs   p(99.9)=30.52µs 
     http_req_connecting............: avg=442ns    min=0s      med=0s       max=4.11ms   p(90)=0s       p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=23.58ms  min=2.42ms  med=14.81ms  max=330.36ms p(90)=53.09ms  p(95)=71.91ms p(99.9)=172.67ms
       { expected_response:true }...: avg=23.58ms  min=2.42ms  med=14.81ms  max=330.36ms p(90)=53.09ms  p(95)=71.91ms p(99.9)=172.67ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 252076
     http_req_receiving.............: avg=695.68µs min=51.96µs med=107.53µs max=256.56ms p(90)=961.07µs p(95)=1.49ms  p(99.9)=67.12ms 
     http_req_sending...............: avg=42.35µs  min=5.24µs  med=8.9µs    max=153.31ms p(90)=14.24µs  p(95)=89.86µs p(99.9)=3.17ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=22.84ms  min=2.33ms  med=14.29ms  max=329.93ms p(90)=51.7ms   p(95)=70.35ms p(99.9)=170.24ms
     http_reqs......................: 252076  2095.367142/s
     iteration_duration.............: avg=23.8ms   min=3.24ms  med=15.03ms  max=349.54ms p(90)=53.33ms  p(95)=72.17ms p(99.9)=173.53ms
     iterations.....................: 251976  2094.535898/s
     success_rate...................: 100.00% ✓ 251976      ✗ 0     
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

     checks.........................: 100.00% ✓ 732534      ✗ 0     
     data_received..................: 22 GB   179 MB/s
     data_sent......................: 294 MB  2.4 MB/s
     http_req_blocked...............: avg=6.44µs   min=1.01µs  med=2.15µs  max=78.14ms  p(90)=3.45µs  p(95)=4.15µs   p(99.9)=38.02µs
     http_req_connecting............: avg=3.87µs   min=0s      med=0s      max=78.08ms  p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=24.33ms  min=1.97ms  med=24.07ms max=278.08ms p(90)=29.17ms p(95)=31.33ms  p(99.9)=52.57ms
       { expected_response:true }...: avg=24.33ms  min=1.97ms  med=24.07ms max=278.08ms p(90)=29.17ms p(95)=31.33ms  p(99.9)=52.57ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 244278
     http_req_receiving.............: avg=105.37µs min=29.54µs med=56.86µs max=118.96ms p(90)=97.33µs p(95)=172.29µs p(99.9)=8.13ms 
     http_req_sending...............: avg=50.18µs  min=4.77µs  med=9.67µs  max=193.44ms p(90)=16.19µs p(95)=107.13µs p(99.9)=3.4ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=24.17ms  min=1.82ms  med=23.95ms max=217.8ms  p(90)=29ms    p(95)=31.1ms   p(99.9)=50.87ms
     http_reqs......................: 244278  2031.449615/s
     iteration_duration.............: avg=24.56ms  min=4.05ms  med=24.27ms max=339.38ms p(90)=29.39ms p(95)=31.57ms  p(99.9)=52.9ms 
     iterations.....................: 244178  2030.618001/s
     success_rate...................: 100.00% ✓ 244178      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
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

     checks.........................: 100.00% ✓ 442554      ✗ 0     
     data_received..................: 13 GB   108 MB/s
     data_sent......................: 177 MB  1.5 MB/s
     http_req_blocked...............: avg=3.14µs  min=1.07µs  med=2.31µs  max=3.51ms   p(90)=3.67µs  p(95)=4.28µs  p(99.9)=36.57µs
     http_req_connecting............: avg=508ns   min=0s      med=0s      max=3.48ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=40.43ms min=2.13ms  med=39.88ms max=320.2ms  p(90)=57.1ms  p(95)=62.23ms p(99.9)=87.61ms
       { expected_response:true }...: avg=40.43ms min=2.13ms  med=39.88ms max=320.2ms  p(90)=57.1ms  p(95)=62.23ms p(99.9)=87.61ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 147618
     http_req_receiving.............: avg=77.48µs min=28.79µs med=60.39µs max=78.56ms  p(90)=95.81µs p(95)=113µs   p(99.9)=1.55ms 
     http_req_sending...............: avg=26.57µs min=5.05µs  med=10.22µs max=165.21ms p(90)=15.68µs p(95)=19.24µs p(99.9)=1.14ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=40.32ms min=2.05ms  med=39.78ms max=319.93ms p(90)=57ms    p(95)=62.13ms p(99.9)=86.72ms
     http_reqs......................: 147618  1227.426162/s
     iteration_duration.............: avg=40.66ms min=3.84ms  med=40.08ms max=341.71ms p(90)=57.31ms p(95)=62.42ms p(99.9)=88.51ms
     iterations.....................: 147518  1226.594674/s
     success_rate...................: 100.00% ✓ 147518      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
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

     checks.........................: 100.00% ✓ 205812     ✗ 0    
     data_received..................: 6.0 GB  50 MB/s
     data_sent......................: 83 MB   685 kB/s
     http_req_blocked...............: avg=4.67µs  min=1.2µs   med=2.85µs  max=4.11ms   p(90)=4.5µs    p(95)=5.13µs   p(99.9)=47.27µs 
     http_req_connecting............: avg=1.51µs  min=0s      med=0s      max=4.07ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=87.1ms  min=3.93ms  med=85.02ms max=375.13ms p(90)=105.09ms p(95)=114.93ms p(99.9)=213.24ms
       { expected_response:true }...: avg=87.1ms  min=3.93ms  med=85.02ms max=375.13ms p(90)=105.09ms p(95)=114.93ms p(99.9)=213.24ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 68704
     http_req_receiving.............: avg=87.28µs min=31.28µs med=77.39µs max=69.07ms  p(90)=112.94µs p(95)=126.22µs p(99.9)=924.31µs
     http_req_sending...............: avg=34.41µs min=5.6µs   med=13.25µs max=196.87ms p(90)=20.01µs  p(95)=22.34µs  p(99.9)=730.52µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=86.98ms min=3.82ms  med=84.91ms max=374.47ms p(90)=104.98ms p(95)=114.81ms p(99.9)=212.91ms
     http_reqs......................: 68704   570.124004/s
     iteration_duration.............: avg=87.46ms min=18.47ms med=85.26ms max=382.86ms p(90)=105.33ms p(95)=115.17ms p(99.9)=214.85ms
     iterations.....................: 68604   569.294178/s
     success_rate...................: 100.00% ✓ 68604      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-router (rust subgraphs) (v2.15.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 160212     ✗ 0    
     data_received..................: 4.7 GB  39 MB/s
     data_sent......................: 64 MB   532 kB/s
     http_req_blocked...............: avg=5.28µs   min=1.24µs  med=3.36µs   max=4.34ms   p(90)=4.82µs   p(95)=5.4µs    p(99.9)=116.82µs
     http_req_connecting............: avg=1.71µs   min=0s      med=0s       max=4.3ms    p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=111.93ms min=5.22ms  med=111.73ms max=336.43ms p(90)=134.72ms p(95)=141.7ms  p(99.9)=174.27ms
       { expected_response:true }...: avg=111.93ms min=5.22ms  med=111.73ms max=336.43ms p(90)=134.72ms p(95)=141.7ms  p(99.9)=174.27ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 53504
     http_req_receiving.............: avg=89.01µs  min=32.72µs med=84.09µs  max=10ms     p(90)=115.64µs p(95)=127.64µs p(99.9)=756.89µs
     http_req_sending...............: avg=26.82µs  min=5.78µs  med=15.7µs   max=94.58ms  p(90)=21.03µs  p(95)=22.91µs  p(99.9)=616.78µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=111.81ms min=5.12ms  med=111.62ms max=336.14ms p(90)=134.61ms p(95)=141.6ms  p(99.9)=173.84ms
     http_reqs......................: 53504   443.349326/s
     iteration_duration.............: avg=112.39ms min=15.5ms  med=112.01ms max=355.63ms p(90)=135ms    p(95)=141.96ms p(99.9)=175.96ms
     iterations.....................: 53404   442.520697/s
     success_rate...................: 100.00% ✓ 53404      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
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

     checks.........................: 100.00% ✓ 89727      ✗ 0    
     data_received..................: 2.6 GB  22 MB/s
     data_sent......................: 36 MB   298 kB/s
     http_req_blocked...............: avg=7.27µs   min=1.27µs  med=3.44µs   max=4.77ms   p(90)=4.78µs   p(95)=5.35µs   p(99.9)=1.63ms  
     http_req_connecting............: avg=3.63µs   min=0s      med=0s       max=4.72ms   p(90)=0s       p(95)=0s       p(99.9)=1.6ms   
     http_req_duration..............: avg=199.79ms min=8.63ms  med=201.19ms max=442.08ms p(90)=207.52ms p(95)=211.87ms p(99.9)=307.11ms
       { expected_response:true }...: avg=199.79ms min=8.63ms  med=201.19ms max=442.08ms p(90)=207.52ms p(95)=211.87ms p(99.9)=307.11ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 30009
     http_req_receiving.............: avg=242.32µs min=34.15µs med=94.69µs  max=230.21ms p(90)=131.46µs p(95)=146.26µs p(99.9)=27.08ms 
     http_req_sending...............: avg=29.95µs  min=5.91µs  med=16.57µs  max=184.78ms p(90)=21.47µs  p(95)=23.33µs  p(99.9)=533.52µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=199.52ms min=8.45ms  med=201.05ms max=309.39ms p(90)=207.39ms p(95)=211.74ms p(99.9)=288.06ms
     http_reqs......................: 30009   247.853889/s
     iteration_duration.............: avg=200.74ms min=9.99ms  med=201.52ms max=471.93ms p(90)=207.79ms p(95)=212.16ms p(99.9)=308.89ms
     iterations.....................: 29909   247.027957/s
     success_rate...................: 100.00% ✓ 29909      ✗ 0    
     vus............................: 36      min=36       max=50 
     vus_max........................: 50      min=50       max=50
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

     checks.........................: 100.00% ✓ 86040      ✗ 0    
     data_received..................: 2.5 GB  21 MB/s
     data_sent......................: 35 MB   286 kB/s
     http_req_blocked...............: avg=6.63µs   min=1.36µs  med=3.35µs   max=4.19ms   p(90)=4.69µs   p(95)=5.25µs   p(99.9)=1.29ms  
     http_req_connecting............: avg=3.11µs   min=0s      med=0s       max=4.16ms   p(90)=0s       p(95)=0s       p(99.9)=1.26ms  
     http_req_duration..............: avg=208.36ms min=6.46ms  med=189.12ms max=679.41ms p(90)=248.16ms p(95)=430.85ms p(99.9)=602.65ms
       { expected_response:true }...: avg=208.36ms min=6.46ms  med=189.12ms max=679.41ms p(90)=248.16ms p(95)=430.85ms p(99.9)=602.65ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 28780
     http_req_receiving.............: avg=116.28µs min=36.67µs med=92.01µs  max=83.37ms  p(90)=124.04µs p(95)=136.92µs p(99.9)=889.87µs
     http_req_sending...............: avg=25.84µs  min=6.16µs  med=16.3µs   max=86.23ms  p(90)=21.4µs   p(95)=23.38µs  p(99.9)=606.76µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=208.22ms min=6.37ms  med=188.99ms max=679.3ms  p(90)=247.97ms p(95)=430.74ms p(99.9)=602.52ms
     http_reqs......................: 28780   237.79567/s
     iteration_duration.............: avg=209.33ms min=30.37ms med=189.46ms max=679.62ms p(90)=248.6ms  p(95)=431.22ms p(99.9)=602.93ms
     iterations.....................: 28680   236.969417/s
     success_rate...................: 100.00% ✓ 28680      ✗ 0    
     vus............................: 17      min=17       max=50 
     vus_max........................: 50      min=50       max=50
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

     checks.........................: 100.00% ✓ 851187      ✗ 0     
     data_received..................: 25 GB   206 MB/s
     data_sent......................: 341 MB  2.8 MB/s
     http_req_blocked...............: avg=3.18µs   min=982ns   med=2.27µs  max=15.27ms  p(90)=3.73µs   p(95)=4.51µs   p(99.9)=36.67µs
     http_req_connecting............: avg=358ns    min=0s      med=0s      max=3.98ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=20.9ms   min=1.71ms  med=20.43ms max=302.27ms p(90)=28.99ms  p(95)=32.07ms  p(99.9)=53.77ms
       { expected_response:true }...: avg=20.9ms   min=1.71ms  med=20.43ms max=302.27ms p(90)=28.99ms  p(95)=32.07ms  p(99.9)=53.77ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 283829
     http_req_receiving.............: avg=117.79µs min=28.62µs med=55.17µs max=58.69ms  p(90)=104.36µs p(95)=263.7µs  p(99.9)=9.66ms 
     http_req_sending...............: avg=53.05µs  min=5.22µs  med=9.76µs  max=123.44ms p(90)=17.73µs  p(95)=123.55µs p(99.9)=5.52ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=20.73ms  min=1.62ms  med=20.29ms max=301.64ms p(90)=28.79ms  p(95)=31.77ms  p(99.9)=52.99ms
     http_reqs......................: 283829  2361.056444/s
     iteration_duration.............: avg=21.13ms  min=3.53ms  med=20.64ms max=352.85ms p(90)=29.21ms  p(95)=32.31ms  p(99.9)=54.34ms
     iterations.....................: 283729  2360.224585/s
     success_rate...................: 100.00% ✓ 283729      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
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

     checks.........................: 100.00% ✓ 708540      ✗ 0     
     data_received..................: 21 GB   172 MB/s
     data_sent......................: 284 MB  2.4 MB/s
     http_req_blocked...............: avg=3.32µs   min=971ns   med=2.51µs   max=5.95ms   p(90)=3.92µs  p(95)=4.67µs  p(99.9)=37.66µs 
     http_req_connecting............: avg=423ns    min=0s      med=0s       max=3.96ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=25.15ms  min=1.9ms   med=17.08ms  max=566.33ms p(90)=53.65ms p(95)=70.62ms p(99.9)=191.08ms
       { expected_response:true }...: avg=25.15ms  min=1.9ms   med=17.08ms  max=566.33ms p(90)=53.65ms p(95)=70.62ms p(99.9)=191.08ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 236280
     http_req_receiving.............: avg=674.35µs min=51.84µs med=110.84µs max=207.99ms p(90)=1.11ms  p(95)=1.76ms  p(99.9)=58.68ms 
     http_req_sending...............: avg=44.08µs  min=5.26µs  med=10.12µs  max=124.63ms p(90)=18.11µs p(95)=112.5µs p(99.9)=2.8ms   
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=24.43ms  min=1.81ms  med=16.53ms  max=566.25ms p(90)=52.35ms p(95)=69.12ms p(99.9)=188.01ms
     http_reqs......................: 236280  1965.168734/s
     iteration_duration.............: avg=25.39ms  min=2.85ms  med=17.3ms   max=566.57ms p(90)=53.91ms p(95)=70.87ms p(99.9)=195.99ms
     iterations.....................: 236180  1964.337022/s
     success_rate...................: 100.00% ✓ 236180      ✗ 0     
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

     checks.........................: 100.00% ✓ 546381      ✗ 0     
     data_received..................: 16 GB   133 MB/s
     data_sent......................: 219 MB  1.8 MB/s
     http_req_blocked...............: avg=3.71µs   min=990ns   med=2.38µs  max=9.39ms   p(90)=4.71µs   p(95)=5.9µs    p(99.9)=50.81µs
     http_req_connecting............: avg=557ns    min=0s      med=0s      max=4.3ms    p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=32.67ms  min=2.43ms  med=31.83ms max=333.79ms p(90)=43.33ms  p(95)=48.01ms  p(99.9)=90.5ms 
       { expected_response:true }...: avg=32.67ms  min=2.43ms  med=31.83ms max=333.79ms p(90)=43.33ms  p(95)=48.01ms  p(99.9)=90.5ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 182227
     http_req_receiving.............: avg=111.64µs min=29.97µs med=61.5µs  max=88.67ms  p(90)=135.96µs p(95)=287.45µs p(99.9)=4.93ms 
     http_req_sending...............: avg=47.39µs  min=5.22µs  med=10.35µs max=160.14ms p(90)=24.01µs  p(95)=137.31µs p(99.9)=3.81ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=32.51ms  min=2.31ms  med=31.69ms max=330.57ms p(90)=43.16ms  p(95)=47.77ms  p(99.9)=89.8ms 
     http_reqs......................: 182227  1514.710616/s
     iteration_duration.............: avg=32.93ms  min=4.51ms  med=32.07ms max=365.61ms p(90)=43.57ms  p(95)=48.25ms  p(99.9)=91.44ms
     iterations.....................: 182127  1513.879394/s
     success_rate...................: 100.00% ✓ 182127      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
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

     checks.........................: 100.00% ✓ 405558      ✗ 0     
     data_received..................: 12 GB   98 MB/s
     data_sent......................: 163 MB  1.4 MB/s
     http_req_blocked...............: avg=3.14µs  min=1.04µs  med=2.47µs  max=2.13ms   p(90)=4.04µs   p(95)=4.7µs    p(99.9)=39.51µs
     http_req_connecting............: avg=312ns   min=0s      med=0s      max=2.09ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=44.12ms min=2.22ms  med=43.59ms max=310.24ms p(90)=61.95ms  p(95)=67.4ms   p(99.9)=93.35ms
       { expected_response:true }...: avg=44.12ms min=2.22ms  med=43.59ms max=310.24ms p(90)=61.95ms  p(95)=67.4ms   p(99.9)=93.35ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 135286
     http_req_receiving.............: avg=81.7µs  min=29.59µs med=65.83µs max=23.32ms  p(90)=103.47µs p(95)=120.46µs p(99.9)=1.62ms 
     http_req_sending...............: avg=24.91µs min=5.43µs  med=11.08µs max=102.55ms p(90)=17.26µs  p(95)=20.71µs  p(99.9)=1.09ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=44.01ms min=2.16ms  med=43.49ms max=309.7ms  p(90)=61.84ms  p(95)=67.29ms  p(99.9)=93ms   
     http_reqs......................: 135286  1124.564187/s
     iteration_duration.............: avg=44.37ms min=4.21ms  med=43.81ms max=334.51ms p(90)=62.15ms  p(95)=67.63ms  p(99.9)=94.42ms
     iterations.....................: 135186  1123.732938/s
     success_rate...................: 100.00% ✓ 135186      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
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

     checks.........................: 100.00% ✓ 188400     ✗ 0    
     data_received..................: 5.5 GB  46 MB/s
     data_sent......................: 76 MB   626 kB/s
     http_req_blocked...............: avg=5.5µs   min=1.12µs  med=3.1µs   max=21.87ms  p(90)=4.64µs   p(95)=5.26µs   p(99.9)=58.32µs 
     http_req_connecting............: avg=1.78µs  min=0s      med=0s      max=4.41ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=95.15ms min=4.23ms  med=91.95ms max=362.48ms p(90)=119.52ms p(95)=132.87ms p(99.9)=240.43ms
       { expected_response:true }...: avg=95.15ms min=4.23ms  med=91.95ms max=362.48ms p(90)=119.52ms p(95)=132.87ms p(99.9)=240.43ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 62900
     http_req_receiving.............: avg=92.44µs min=32.57µs med=81.59µs max=137.77ms p(90)=115.75µs p(95)=129.03µs p(99.9)=913.87µs
     http_req_sending...............: avg=21.4µs  min=5.65µs  med=13.77µs max=54.46ms  p(90)=20.08µs  p(95)=22.32µs  p(99.9)=722.18µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=95.04ms min=4.12ms  med=91.85ms max=351.22ms p(90)=119.4ms  p(95)=132.76ms p(99.9)=240.04ms
     http_reqs......................: 62900   521.584536/s
     iteration_duration.............: avg=95.55ms min=20.15ms med=92.2ms  max=379.53ms p(90)=119.77ms p(95)=133.19ms p(99.9)=242.27ms
     iterations.....................: 62800   520.755308/s
     success_rate...................: 100.00% ✓ 62800      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-router (.net subgraphs) (v2.15.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 138558    ✗ 0    
     data_received..................: 4.0 GB  34 MB/s
     data_sent......................: 56 MB   460 kB/s
     http_req_blocked...............: avg=5.73µs   min=1.22µs  med=3.32µs   max=4.16ms   p(90)=4.77µs   p(95)=5.35µs   p(99.9)=283.5µs 
     http_req_connecting............: avg=2.23µs   min=0s      med=0s       max=4.12ms   p(90)=0s       p(95)=0s       p(99.9)=260.27µs
     http_req_duration..............: avg=129.38ms min=5.48ms  med=126.87ms max=363.02ms p(90)=171.97ms p(95)=185.33ms p(99.9)=239.64ms
       { expected_response:true }...: avg=129.38ms min=5.48ms  med=126.87ms max=363.02ms p(90)=171.97ms p(95)=185.33ms p(99.9)=239.64ms
     http_req_failed................: 0.00%   ✓ 0         ✗ 46286
     http_req_receiving.............: avg=168.51µs min=32.48µs med=85.26µs  max=163.46ms p(90)=116.4µs  p(95)=128.25µs p(99.9)=1.33ms  
     http_req_sending...............: avg=25.19µs  min=5.94µs  med=15.61µs  max=221.23ms p(90)=20.86µs  p(95)=22.67µs  p(99.9)=574.49µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=129.19ms min=5.4ms   med=126.74ms max=275.95ms p(90)=171.79ms p(95)=185.08ms p(99.9)=232.81ms
     http_reqs......................: 46286   383.43303/s
     iteration_duration.............: avg=129.93ms min=6.6ms   med=127.19ms max=383.11ms p(90)=172.28ms p(95)=185.63ms p(99.9)=247.81ms
     iterations.....................: 46186   382.60463/s
     success_rate...................: 100.00% ✓ 46186     ✗ 0    
     vus............................: 50      min=50      max=50 
     vus_max........................: 50      min=50      max=50
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

     checks.........................: 100.00% ✓ 87606      ✗ 0    
     data_received..................: 2.6 GB  21 MB/s
     data_sent......................: 35 MB   291 kB/s
     http_req_blocked...............: avg=6.78µs   min=1.31µs  med=3.53µs   max=3.78ms   p(90)=5.02µs   p(95)=5.66µs   p(99.9)=1.36ms  
     http_req_connecting............: avg=3.03µs   min=0s      med=0s       max=3.75ms   p(90)=0s       p(95)=0s       p(99.9)=1.33ms  
     http_req_duration..............: avg=204.67ms min=6.88ms  med=187.19ms max=697.12ms p(90)=234.55ms p(95)=289.84ms p(99.9)=611.47ms
       { expected_response:true }...: avg=204.67ms min=6.88ms  med=187.19ms max=697.12ms p(90)=234.55ms p(95)=289.84ms p(99.9)=611.47ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29302
     http_req_receiving.............: avg=102.66µs min=35.76µs med=98.28µs  max=8.9ms    p(90)=130.25µs p(95)=144.16µs p(99.9)=656.45µs
     http_req_sending...............: avg=21.5µs   min=6.15µs  med=17.66µs  max=15.82ms  p(90)=22.69µs  p(95)=24.37µs  p(99.9)=531.47µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=204.55ms min=6.74ms  med=187.06ms max=697.02ms p(90)=234.41ms p(95)=289.74ms p(99.9)=611.37ms
     http_reqs......................: 29302   242.230775/s
     iteration_duration.............: avg=205.61ms min=49.09ms med=187.54ms max=697.37ms p(90)=234.98ms p(95)=291.17ms p(99.9)=611.82ms
     iterations.....................: 29202   241.404105/s
     success_rate...................: 100.00% ✓ 29202      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
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

     checks.........................: 100.00% ✓ 86523      ✗ 0    
     data_received..................: 2.5 GB  21 MB/s
     data_sent......................: 35 MB   287 kB/s
     http_req_blocked...............: avg=6.99µs   min=1.29µs  med=3.26µs   max=4.45ms   p(90)=4.48µs   p(95)=5.01µs   p(99.9)=1.71ms  
     http_req_connecting............: avg=3.6µs    min=0s      med=0s       max=4.4ms    p(90)=0s       p(95)=0s       p(99.9)=1.69ms  
     http_req_duration..............: avg=207.17ms min=8.66ms  med=206.08ms max=445.27ms p(90)=217.1ms  p(95)=220.83ms p(99.9)=299.1ms 
       { expected_response:true }...: avg=207.17ms min=8.66ms  med=206.08ms max=445.27ms p(90)=217.1ms  p(95)=220.83ms p(99.9)=299.1ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 28941
     http_req_receiving.............: avg=95.15µs  min=32.87µs med=90.34µs  max=24.76ms  p(90)=121.86µs p(95)=134.53µs p(99.9)=498.21µs
     http_req_sending...............: avg=32.26µs  min=5.93µs  med=16.2µs   max=139.71ms p(90)=21.18µs  p(95)=23.04µs  p(99.9)=788.12µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=207.04ms min=8.55ms  med=205.95ms max=444.74ms p(90)=216.98ms p(95)=220.7ms  p(99.9)=298.77ms
     http_reqs......................: 28941   238.96138/s
     iteration_duration.............: avg=208.17ms min=65.1ms  med=206.36ms max=456.87ms p(90)=217.36ms p(95)=221.11ms p(99.9)=327.6ms 
     iterations.....................: 28841   238.135695/s
     success_rate...................: 100.00% ✓ 28841      ✗ 0    
     vus............................: 44      min=44       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-181-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

