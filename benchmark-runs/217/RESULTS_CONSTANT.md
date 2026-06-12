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
| hive-router | v0.0.65 | 2,889 | 3,094 | 2,837 | 2.9% |  |
| grafbase | 0.53.5 | 2,052 | 2,112 | 2,008 | 1.6% |  |
| cosmo | 0.321.1 | 1,195 | 1,195 | 1,183 | 0.7% | non-compatible response (8 across 7/9 runs) |
| hive-gateway-router-runtime | 2.8.2 | 558 | 571 | 555 | 1.0% |  |
| apollo-router | v2.15.0 | 425 | 437 | 412 | 1.7% |  |
| apollo-gateway | 2.14.1 | 244 | 247 | 243 | 0.6% |  |
| hive-gateway | 2.8.2 | 240 | 245 | 239 | 0.8% |  |
| hotchocolate | — | — | — | — | — | benchmark run failed |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hotchocolate | 16.1.3 | 1,945 | 1,992 | 1,929 | 1.0% |  |
| grafbase | 0.53.5 | 1,552 | 1,582 | 1,538 | 0.9% |  |
| cosmo | 0.321.1 | 1,126 | 1,146 | 1,119 | 1.0% | non-compatible response (5 across 4/9 runs) |
| hive-gateway-router-runtime | 2.8.2 | 524 | 540 | 518 | 1.4% |  |
| apollo-router | v2.15.0 | 381 | 392 | 377 | 1.3% |  |
| hive-gateway | 2.8.2 | 239 | 243 | 236 | 0.9% |  |
| apollo-gateway | 2.14.1 | 233 | 235 | 231 | 0.7% |  |
| hive-router | — | — | — | — | — | benchmark run failed |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.65)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 1041864     ✗ 0     
     data_received..................: 31 GB   253 MB/s
     data_sent......................: 417 MB  3.5 MB/s
     http_req_blocked...............: avg=2.92µs   min=1µs     med=2.2µs   max=11.37ms  p(90)=3.39µs  p(95)=4.01µs   p(99.9)=34.11µs
     http_req_connecting............: avg=295ns    min=0s      med=0s      max=4.04ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=17.04ms  min=1.64ms  med=16.05ms max=344.83ms p(90)=25.49ms p(95)=29.43ms  p(99.9)=52.31ms
       { expected_response:true }...: avg=17.04ms  min=1.64ms  med=16.05ms max=344.83ms p(90)=25.49ms p(95)=29.43ms  p(99.9)=52.31ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 347388
     http_req_receiving.............: avg=143.07µs min=27.56µs med=49.68µs max=90.53ms  p(90)=98.35µs p(95)=281.8µs  p(99.9)=16.09ms
     http_req_sending...............: avg=58.76µs  min=5.37µs  med=9.16µs  max=121.57ms p(90)=15.61µs p(95)=123.08µs p(99.9)=8.83ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=16.83ms  min=1.57ms  med=15.9ms  max=253.96ms p(90)=25.2ms  p(95)=29ms     p(99.9)=50.77ms
     http_reqs......................: 347388  2889.545204/s
     iteration_duration.............: avg=17.27ms  min=2.12ms  med=16.26ms max=353.94ms p(90)=25.72ms p(95)=29.7ms   p(99.9)=53.17ms
     iterations.....................: 347288  2888.713412/s
     success_rate...................: 100.00% ✓ 347288      ✗ 0     
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

     checks.........................: 100.00% ✓ 740139      ✗ 0     
     data_received..................: 22 GB   180 MB/s
     data_sent......................: 297 MB  2.5 MB/s
     http_req_blocked...............: avg=3.38µs   min=1.03µs  med=2.54µs  max=13.84ms  p(90)=3.96µs   p(95)=4.68µs   p(99.9)=41.9µs 
     http_req_connecting............: avg=267ns    min=0s      med=0s      max=3.28ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=24.06ms  min=1.97ms  med=23.8ms  max=314.02ms p(90)=29.1ms   p(95)=31.57ms  p(99.9)=55.07ms
       { expected_response:true }...: avg=24.06ms  min=1.97ms  med=23.8ms  max=314.02ms p(90)=29.1ms   p(95)=31.57ms  p(99.9)=55.07ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 246813
     http_req_receiving.............: avg=119.48µs min=29.96µs med=59.87µs max=107.84ms p(90)=103.58µs p(95)=222.17µs p(99.9)=10.5ms 
     http_req_sending...............: avg=47.55µs  min=5.14µs  med=10.43µs max=175.94ms p(90)=17.68µs  p(95)=122.94µs p(99.9)=3.83ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=23.89ms  min=1.88ms  med=23.68ms max=313.64ms p(90)=28.91ms  p(95)=31.27ms  p(99.9)=53.85ms
     http_reqs......................: 246813  2052.549977/s
     iteration_duration.............: avg=24.31ms  min=4.04ms  med=24.01ms max=334.75ms p(90)=29.33ms  p(95)=31.84ms  p(99.9)=55.38ms
     iterations.....................: 246713  2051.718355/s
     success_rate...................: 100.00% ✓ 246713      ✗ 0     
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

     checks.........................: 100.00% ✓ 430878      ✗ 0     
     data_received..................: 13 GB   105 MB/s
     data_sent......................: 173 MB  1.4 MB/s
     http_req_blocked...............: avg=3.35µs  min=1.06µs med=2.31µs  max=4.11ms   p(90)=3.51µs  p(95)=4.07µs  p(99.9)=33.65µs
     http_req_connecting............: avg=707ns   min=0s     med=0s      max=4.06ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=41.53ms min=2.09ms med=40.98ms max=302.41ms p(90)=58.63ms p(95)=64.02ms p(99.9)=89.77ms
       { expected_response:true }...: avg=41.53ms min=2.09ms med=40.98ms max=302.41ms p(90)=58.63ms p(95)=64.02ms p(99.9)=89.77ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 143726
     http_req_receiving.............: avg=77.43µs min=28.2µs med=59.23µs max=173.32ms p(90)=93.25µs p(95)=109.8µs p(99.9)=1.56ms 
     http_req_sending...............: avg=24.87µs min=5.27µs med=10.18µs max=139.62ms p(90)=14.69µs p(95)=18.49µs p(99.9)=1.23ms 
     http_req_tls_handshaking.......: avg=0s      min=0s     med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=41.42ms min=2.04ms med=40.88ms max=301.75ms p(90)=58.53ms p(95)=63.93ms p(99.9)=89.32ms
     http_reqs......................: 143726  1195.026886/s
     iteration_duration.............: avg=41.77ms min=3.93ms med=41.18ms max=356.93ms p(90)=58.82ms p(95)=64.22ms p(99.9)=90.74ms
     iterations.....................: 143626  1194.195425/s
     success_rate...................: 100.00% ✓ 143626      ✗ 0     
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

     checks.........................: 100.00% ✓ 201573     ✗ 0    
     data_received..................: 5.9 GB  49 MB/s
     data_sent......................: 81 MB   670 kB/s
     http_req_blocked...............: avg=4.24µs   min=1.21µs  med=2.8µs   max=3.66ms   p(90)=4.35µs   p(95)=4.97µs   p(99.9)=46.2µs  
     http_req_connecting............: avg=1.1µs    min=0s      med=0s      max=3.63ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=88.95ms  min=4.2ms   med=86.36ms max=336.43ms p(90)=111ms    p(95)=122.93ms p(99.9)=220.15ms
       { expected_response:true }...: avg=88.95ms  min=4.2ms   med=86.36ms max=336.43ms p(90)=111ms    p(95)=122.93ms p(99.9)=220.15ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 67291
     http_req_receiving.............: avg=138.99µs min=32.07µs med=76.35µs max=177.98ms p(90)=110.96µs p(95)=123.31µs p(99.9)=1.1ms   
     http_req_sending...............: avg=21.97µs  min=5.86µs  med=12.8µs  max=94.12ms  p(90)=19.75µs  p(95)=22.24µs  p(99.9)=668.47µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=88.79ms  min=4.05ms  med=86.25ms max=252.69ms p(90)=110.9ms  p(95)=122.76ms p(99.9)=217.04ms
     http_reqs......................: 67291   558.237555/s
     iteration_duration.............: avg=89.31ms  min=10.46ms med=86.6ms  max=347.95ms p(90)=111.25ms p(95)=123.25ms p(99.9)=221.79ms
     iterations.....................: 67191   557.407968/s
     success_rate...................: 100.00% ✓ 67191      ✗ 0    
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

     checks.........................: 100.00% ✓ 153633     ✗ 0    
     data_received..................: 4.5 GB  37 MB/s
     data_sent......................: 62 MB   511 kB/s
     http_req_blocked...............: avg=6.12µs   min=1.14µs  med=3.18µs   max=81.21ms  p(90)=4.64µs   p(95)=5.22µs   p(99.9)=92.78µs 
     http_req_connecting............: avg=1.14µs   min=0s      med=0s       max=2.88ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=116.71ms min=5.49ms  med=116.32ms max=338.49ms p(90)=141.04ms p(95)=148.04ms p(99.9)=183.74ms
       { expected_response:true }...: avg=116.71ms min=5.49ms  med=116.32ms max=338.49ms p(90)=141.04ms p(95)=148.04ms p(99.9)=183.74ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 51311
     http_req_receiving.............: avg=90.49µs  min=31.49µs med=81.32µs  max=117.23ms p(90)=113.15µs p(95)=125.35µs p(99.9)=708.62µs
     http_req_sending...............: avg=24.84µs  min=5.77µs  med=14.59µs  max=159.21ms p(90)=20.41µs  p(95)=22.31µs  p(99.9)=777.95µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=116.6ms  min=5.33ms  med=116.22ms max=337.54ms p(90)=140.93ms p(95)=147.93ms p(99.9)=183.57ms
     http_reqs......................: 51311   425.183554/s
     iteration_duration.............: avg=117.19ms min=16.43ms med=116.6ms  max=375.17ms p(90)=141.3ms  p(95)=148.31ms p(99.9)=185.28ms
     iterations.....................: 51211   424.354914/s
     success_rate...................: 100.00% ✓ 51211      ✗ 0    
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

     checks.........................: 100.00% ✓ 88488      ✗ 0    
     data_received..................: 2.6 GB  22 MB/s
     data_sent......................: 36 MB   294 kB/s
     http_req_blocked...............: avg=6.82µs   min=1.13µs  med=3.14µs   max=4.11ms   p(90)=4.35µs   p(95)=4.85µs   p(99.9)=1.76ms  
     http_req_connecting............: avg=3.46µs   min=0s      med=0s       max=4.07ms   p(90)=0s       p(95)=0s       p(99.9)=1.71ms  
     http_req_duration..............: avg=202.59ms min=8.51ms  med=206.94ms max=428.14ms p(90)=225.25ms p(95)=231.74ms p(99.9)=308.95ms
       { expected_response:true }...: avg=202.59ms min=8.51ms  med=206.94ms max=428.14ms p(90)=225.25ms p(95)=231.74ms p(99.9)=308.95ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29596
     http_req_receiving.............: avg=93.81µs  min=34.28µs med=86.8µs   max=39.31ms  p(90)=116.92µs p(95)=128.19µs p(99.9)=663.71µs
     http_req_sending...............: avg=32.96µs  min=5.71µs  med=15.24µs  max=177.7ms  p(90)=20.13µs  p(95)=21.82µs  p(99.9)=546.47µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=202.47ms min=8.37ms  med=206.81ms max=419.26ms p(90)=225.13ms p(95)=231.63ms p(99.9)=308.6ms 
     http_reqs......................: 29596   244.435081/s
     iteration_duration.............: avg=203.55ms min=54.64ms med=207.5ms  max=441.12ms p(90)=225.52ms p(95)=232.02ms p(99.9)=312.27ms
     iterations.....................: 29496   243.609175/s
     success_rate...................: 100.00% ✓ 29496      ✗ 0    
     vus............................: 39      min=39       max=50 
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

     checks.........................: 100.00% ✓ 87066      ✗ 0    
     data_received..................: 2.6 GB  21 MB/s
     data_sent......................: 35 MB   289 kB/s
     http_req_blocked...............: avg=7.44µs   min=1.28µs  med=3.58µs   max=3.82ms   p(90)=5.09µs   p(95)=5.74µs   p(99.9)=1.78ms  
     http_req_connecting............: avg=3.43µs   min=0s      med=0s       max=3.79ms   p(90)=0s       p(95)=0s       p(99.9)=1.58ms  
     http_req_duration..............: avg=205.85ms min=6.53ms  med=186.48ms max=927.25ms p(90)=240.09ms p(95)=400.86ms p(99.9)=652.5ms 
       { expected_response:true }...: avg=205.85ms min=6.53ms  med=186.48ms max=927.25ms p(90)=240.09ms p(95)=400.86ms p(99.9)=652.5ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 29122
     http_req_receiving.............: avg=105.01µs min=37.26µs med=96.91µs  max=82.75ms  p(90)=129.42µs p(95)=142.77µs p(99.9)=827.21µs
     http_req_sending...............: avg=38.68µs  min=6.21µs  med=17.96µs  max=163.19ms p(90)=23.2µs   p(95)=25.02µs  p(99.9)=622.62µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=205.71ms min=6.41ms  med=186.35ms max=927.16ms p(90)=239.96ms p(95)=400.75ms p(99.9)=652.41ms
     http_reqs......................: 29122   240.643677/s
     iteration_duration.............: avg=206.86ms min=19.68ms med=186.84ms max=927.56ms p(90)=240.66ms p(95)=402.99ms p(99.9)=652.71ms
     iterations.....................: 29022   239.817348/s
     success_rate...................: 100.00% ✓ 29022      ✗ 0    
     vus............................: 16      min=16       max=50 
     vus_max........................: 50      min=50       max=50
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

     checks.........................: 100.00% ✓ 701328      ✗ 0     
     data_received..................: 21 GB   171 MB/s
     data_sent......................: 281 MB  2.3 MB/s
     http_req_blocked...............: avg=4.39µs   min=1.02µs med=2.53µs   max=11.4ms   p(90)=3.82µs  p(95)=4.5µs    p(99.9)=37.81µs 
     http_req_connecting............: avg=1.46µs   min=0s     med=0s       max=11.36ms  p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=25.41ms  min=1.91ms med=17.11ms  max=558.32ms p(90)=54.42ms p(95)=71.61ms  p(99.9)=197.6ms 
       { expected_response:true }...: avg=25.41ms  min=1.91ms med=17.11ms  max=558.32ms p(90)=54.42ms p(95)=71.61ms  p(99.9)=197.6ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 233876
     http_req_receiving.............: avg=719.33µs min=52.5µs med=111.85µs max=324.88ms p(90)=1.13ms  p(95)=1.8ms    p(99.9)=61.25ms 
     http_req_sending...............: avg=41.74µs  min=5.15µs med=10.18µs  max=39.76ms  p(90)=17.83µs p(95)=112.34µs p(99.9)=2.59ms  
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=24.65ms  min=1.78ms med=16.55ms  max=558.22ms p(90)=53.02ms p(95)=70.11ms  p(99.9)=191.03ms
     http_reqs......................: 233876  1945.145371/s
     iteration_duration.............: avg=25.65ms  min=2.7ms  med=17.33ms  max=558.49ms p(90)=54.65ms p(95)=71.84ms  p(99.9)=198.5ms 
     iterations.....................: 233776  1944.313671/s
     success_rate...................: 100.00% ✓ 233776      ✗ 0     
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

     checks.........................: 100.00% ✓ 560034      ✗ 0     
     data_received..................: 16 GB   136 MB/s
     data_sent......................: 224 MB  1.9 MB/s
     http_req_blocked...............: avg=3.78µs   min=972ns  med=2.54µs  max=7ms      p(90)=4.89µs   p(95)=6.07µs   p(99.9)=48.11µs
     http_req_connecting............: avg=597ns    min=0s     med=0s      max=4.43ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=31.86ms  min=2.34ms med=30.93ms max=369.38ms p(90)=42.34ms  p(95)=47ms     p(99.9)=85.28ms
       { expected_response:true }...: avg=31.86ms  min=2.34ms med=30.93ms max=369.38ms p(90)=42.34ms  p(95)=47ms     p(99.9)=85.28ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 186778
     http_req_receiving.............: avg=150.01µs min=29.2µs med=63.44µs max=324.76ms p(90)=136.32µs p(95)=273.19µs p(99.9)=6.78ms 
     http_req_sending...............: avg=47.63µs  min=5.31µs med=10.81µs max=40.15ms  p(90)=25.02µs  p(95)=134.26µs p(99.9)=3.78ms 
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=31.67ms  min=2.26ms med=30.79ms max=120.85ms p(90)=42.14ms  p(95)=46.72ms  p(99.9)=83.46ms
     http_reqs......................: 186778  1552.590374/s
     iteration_duration.............: avg=32.13ms  min=3.99ms med=31.17ms max=395.82ms p(90)=42.59ms  p(95)=47.26ms  p(99.9)=85.93ms
     iterations.....................: 186678  1551.759125/s
     success_rate...................: 100.00% ✓ 186678      ✗ 0     
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

     checks.........................: 100.00% ✓ 406434      ✗ 0     
     data_received..................: 12 GB   99 MB/s
     data_sent......................: 163 MB  1.4 MB/s
     http_req_blocked...............: avg=3.7µs   min=1.06µs  med=2.66µs  max=3.92ms   p(90)=4.11µs   p(95)=4.77µs   p(99.9)=36.48µs
     http_req_connecting............: avg=723ns   min=0s      med=0s      max=3.88ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=44.02ms min=2.2ms   med=43.49ms max=335.83ms p(90)=61.96ms  p(95)=67.44ms  p(99.9)=94.54ms
       { expected_response:true }...: avg=44.02ms min=2.2ms   med=43.49ms max=335.83ms p(90)=61.96ms  p(95)=67.44ms  p(99.9)=94.54ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 135578
     http_req_receiving.............: avg=88.13µs min=29.08µs med=68.96µs max=202.92ms p(90)=106.68µs p(95)=124.15µs p(99.9)=1.72ms 
     http_req_sending...............: avg=26.23µs min=5.5µs   med=11.87µs max=145.31ms p(90)=18.3µs   p(95)=21.85µs  p(99.9)=1.14ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=43.91ms min=2.13ms  med=43.38ms max=335.17ms p(90)=61.84ms  p(95)=67.31ms  p(99.9)=94.27ms
     http_reqs......................: 135578  1126.974585/s
     iteration_duration.............: avg=44.28ms min=3.65ms  med=43.7ms  max=349.71ms p(90)=62.18ms  p(95)=67.66ms  p(99.9)=94.95ms
     iterations.....................: 135478  1126.143348/s
     success_rate...................: 100.00% ✓ 135478      ✗ 0     
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

     checks.........................: 100.00% ✓ 189288     ✗ 0    
     data_received..................: 5.5 GB  46 MB/s
     data_sent......................: 76 MB   630 kB/s
     http_req_blocked...............: avg=5.03µs  min=1.19µs  med=3.07µs  max=4.17ms   p(90)=4.59µs   p(95)=5.19µs   p(99.9)=56.79µs 
     http_req_connecting............: avg=1.67µs  min=0s      med=0s      max=4.13ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=94.7ms  min=4.15ms  med=92.28ms max=353.12ms p(90)=117.02ms p(95)=129.63ms p(99.9)=232.27ms
       { expected_response:true }...: avg=94.7ms  min=4.15ms  med=92.28ms max=353.12ms p(90)=117.02ms p(95)=129.63ms p(99.9)=232.27ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 63196
     http_req_receiving.............: avg=91.42µs min=33.13µs med=81.14µs max=87.73ms  p(90)=115.7µs  p(95)=128.67µs p(99.9)=858.47µs
     http_req_sending...............: avg=27.1µs  min=5.31µs  med=13.93µs max=140.42ms p(90)=20.66µs  p(95)=22.91µs  p(99.9)=647.66µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=94.58ms min=4.05ms  med=92.17ms max=352.36ms p(90)=116.9ms  p(95)=129.49ms p(99.9)=232.04ms
     http_reqs......................: 63196   524.175531/s
     iteration_duration.............: avg=95.1ms  min=13.83ms med=92.53ms max=386.24ms p(90)=117.28ms p(95)=129.97ms p(99.9)=234.33ms
     iterations.....................: 63096   523.346087/s
     success_rate...................: 100.00% ✓ 63096      ✗ 0    
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

     checks.........................: 100.00% ✓ 137955     ✗ 0    
     data_received..................: 4.0 GB  33 MB/s
     data_sent......................: 55 MB   458 kB/s
     http_req_blocked...............: avg=4.67µs   min=1.28µs  med=3.56µs   max=2.92ms   p(90)=5.05µs   p(95)=5.61µs   p(99.9)=201.74µs
     http_req_connecting............: avg=871ns    min=0s      med=0s       max=1.88ms   p(90)=0s       p(95)=0s       p(99.9)=132.02µs
     http_req_duration..............: avg=129.96ms min=5.63ms  med=127.48ms max=332.32ms p(90)=172.16ms p(95)=184.34ms p(99.9)=238.04ms
       { expected_response:true }...: avg=129.96ms min=5.63ms  med=127.48ms max=332.32ms p(90)=172.16ms p(95)=184.34ms p(99.9)=238.04ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 46085
     http_req_receiving.............: avg=94.88µs  min=32.36µs med=88.49µs  max=36.16ms  p(90)=119.88µs p(95)=132.42µs p(99.9)=730.27µs
     http_req_sending...............: avg=34.02µs  min=5.89µs  med=16.67µs  max=112.36ms p(90)=21.97µs  p(95)=23.78µs  p(99.9)=582.33µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=129.83ms min=5.5ms   med=127.36ms max=331.69ms p(90)=172.04ms p(95)=184.21ms p(99.9)=237.92ms
     http_reqs......................: 46085   381.717494/s
     iteration_duration.............: avg=130.51ms min=32.13ms med=127.82ms max=371.01ms p(90)=172.46ms p(95)=184.67ms p(99.9)=240.3ms 
     iterations.....................: 45985   380.889204/s
     success_rate...................: 100.00% ✓ 45985      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
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

     checks.........................: 100.00% ✓ 86460      ✗ 0    
     data_received..................: 2.5 GB  21 MB/s
     data_sent......................: 35 MB   287 kB/s
     http_req_blocked...............: avg=5.07µs   min=1.23µs  med=3.56µs   max=1.95ms   p(90)=5.02µs   p(95)=5.64µs   p(99.9)=549.6µs 
     http_req_connecting............: avg=1.33µs   min=0s      med=0s       max=1.9ms    p(90)=0s       p(95)=0s       p(99.9)=522.24µs
     http_req_duration..............: avg=207.31ms min=6.84ms  med=189.36ms max=740.15ms p(90)=236.66ms p(95)=296.02ms p(99.9)=627.37ms
       { expected_response:true }...: avg=207.31ms min=6.84ms  med=189.36ms max=740.15ms p(90)=236.66ms p(95)=296.02ms p(99.9)=627.37ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 28920
     http_req_receiving.............: avg=132.67µs min=36.24µs med=97.27µs  max=89.43ms  p(90)=128.31µs p(95)=141.58µs p(99.9)=1.1ms   
     http_req_sending...............: avg=31.32µs  min=6.16µs  med=18.05µs  max=106.73ms p(90)=22.89µs  p(95)=24.5µs   p(99.9)=620.45µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=207.15ms min=6.67ms  med=189.23ms max=740ms    p(90)=236.5ms  p(95)=294.59ms p(99.9)=627.26ms
     http_reqs......................: 28920   239.089198/s
     iteration_duration.............: avg=208.3ms  min=47.72ms med=189.72ms max=740.44ms p(90)=237.03ms p(95)=297.9ms  p(99.9)=627.74ms
     iterations.....................: 28820   238.262472/s
     success_rate...................: 100.00% ✓ 28820      ✗ 0    
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

     checks.........................: 100.00% ✓ 84522      ✗ 0    
     data_received..................: 2.5 GB  20 MB/s
     data_sent......................: 34 MB   280 kB/s
     http_req_blocked...............: avg=5.19µs   min=1.3µs   med=3.41µs   max=2.53ms   p(90)=4.7µs    p(95)=5.24µs   p(99.9)=549.97µs
     http_req_connecting............: avg=1.64µs   min=0s      med=0s       max=2.51ms   p(90)=0s       p(95)=0s       p(99.9)=519.67µs
     http_req_duration..............: avg=212.09ms min=8.8ms   med=208.88ms max=388.64ms p(90)=242.26ms p(95)=252.8ms  p(99.9)=326.39ms
       { expected_response:true }...: avg=212.09ms min=8.8ms   med=208.88ms max=388.64ms p(90)=242.26ms p(95)=252.8ms  p(99.9)=326.39ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 28274
     http_req_receiving.............: avg=99.64µs  min=34.54µs med=91.91µs  max=40.88ms  p(90)=124.23µs p(95)=137.89µs p(99.9)=732.38µs
     http_req_sending...............: avg=28.65µs  min=5.98µs  med=16.86µs  max=61.57ms  p(90)=21.73µs  p(95)=23.48µs  p(99.9)=754.65µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=211.96ms min=8.63ms  med=208.74ms max=388.5ms  p(90)=242.13ms p(95)=252.66ms p(99.9)=326.05ms
     http_reqs......................: 28274   233.445376/s
     iteration_duration.............: avg=213.1ms  min=41.86ms med=209.39ms max=417.28ms p(90)=242.53ms p(95)=253.12ms p(99.9)=330.57ms
     iterations.....................: 28174   232.619722/s
     success_rate...................: 100.00% ✓ 28174      ✗ 0    
     vus............................: 48      min=48       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-181-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

