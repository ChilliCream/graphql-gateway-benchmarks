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
| hive-router | v0.0.43 | 2,900 | 3,055 | 2,857 | 2.2% |  |
| hotchocolate | 16.0.0-rc.1.23 | 2,096 | 2,150 | 2,074 | 1.1% |  |
| grafbase | 0.53.2 | 2,032 | 2,087 | 2,009 | 1.4% |  |
| cosmo | 0.298.0 | 1,274 | 1,295 | 1,265 | 0.9% | non-compatible response (2 across 2/9 runs) |
| hive-gateway-router-runtime | 2.5.14 | 607 | 619 | 603 | 0.9% |  |
| apollo-router | v2.12.1 | 396 | 407 | 390 | 1.5% |  |
| hive-gateway | 2.5.14 | 264 | 269 | 260 | 1.1% |  |
| apollo-gateway | 2.13.3 | 242 | 244 | 240 | 0.6% |  |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.43 | 2,412 | 2,523 | 2,366 | 1.9% |  |
| hotchocolate | 16.0.0-rc.1.23 | 1,962 | 1,992 | 1,938 | 1.0% |  |
| grafbase | 0.53.2 | 1,522 | 1,536 | 1,507 | 0.6% |  |
| cosmo | 0.298.0 | 1,173 | 1,188 | 1,163 | 0.7% | non-compatible response (3 across 2/9 runs) |
| hive-gateway-router-runtime | 2.5.14 | 578 | 598 | 575 | 1.5% |  |
| apollo-router | v2.12.1 | 368 | 379 | 362 | 1.6% |  |
| hive-gateway | 2.5.14 | 268 | 274 | 264 | 1.2% |  |
| apollo-gateway | 2.13.3 | 239 | 242 | 238 | 0.6% |  |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.43)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 1045800     ✗ 0     
     data_received..................: 31 GB   254 MB/s
     data_sent......................: 419 MB  3.5 MB/s
     http_req_blocked...............: avg=2.94µs   min=1µs    med=2µs     max=24.57ms  p(90)=3.15µs  p(95)=3.79µs   p(99.9)=33.62µs
     http_req_connecting............: avg=261ns    min=0s     med=0s      max=3.58ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=16.97ms  min=1.68ms med=16.01ms max=325.33ms p(90)=25.23ms p(95)=29.22ms  p(99.9)=52.54ms
       { expected_response:true }...: avg=16.97ms  min=1.68ms med=16.01ms max=325.33ms p(90)=25.23ms p(95)=29.22ms  p(99.9)=52.54ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 348700
     http_req_receiving.............: avg=131.57µs min=27.5µs med=48.34µs max=151.84ms p(90)=94.38µs p(95)=268.2µs  p(99.9)=14.25ms
     http_req_sending...............: avg=59.65µs  min=5.26µs med=8.84µs  max=42.65ms  p(90)=14.92µs p(95)=118.38µs p(99.9)=15.08ms
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=16.78ms  min=1.59ms med=15.87ms max=296.27ms p(90)=24.95ms p(95)=28.77ms  p(99.9)=51.27ms
     http_reqs......................: 348700  2900.565636/s
     iteration_duration.............: avg=17.2ms   min=2.24ms med=16.22ms max=354.17ms p(90)=25.47ms p(95)=29.5ms   p(99.9)=53.75ms
     iterations.....................: 348600  2899.733814/s
     success_rate...................: 100.00% ✓ 348600      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (rust subgraphs) (16.0.0-rc.1.23)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 756078      ✗ 0     
     data_received..................: 22 GB   184 MB/s
     data_sent......................: 303 MB  2.5 MB/s
     http_req_blocked...............: avg=2.77µs   min=1.02µs  med=1.98µs   max=6.33ms   p(90)=3.06µs   p(95)=3.64µs  p(99.9)=30.12µs 
     http_req_connecting............: avg=433ns    min=0s      med=0s       max=4.23ms   p(90)=0s       p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=23.57ms  min=2.39ms  med=14.86ms  max=326.35ms p(90)=53.56ms  p(95)=71.87ms p(99.9)=165.76ms
       { expected_response:true }...: avg=23.57ms  min=2.39ms  med=14.86ms  max=326.35ms p(90)=53.56ms  p(95)=71.87ms p(99.9)=165.76ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 252126
     http_req_receiving.............: avg=663.28µs min=50.42µs med=105.14µs max=219.92ms p(90)=972.29µs p(95)=1.51ms  p(99.9)=61.84ms 
     http_req_sending...............: avg=42.86µs  min=5.02µs  med=8.87µs   max=160.11ms p(90)=14.67µs  p(95)=98.72µs p(99.9)=2.86ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=22.86ms  min=2.31ms  med=14.34ms  max=325.66ms p(90)=52.22ms  p(95)=70.35ms p(99.9)=164.69ms
     http_reqs......................: 252126  2096.142784/s
     iteration_duration.............: avg=23.79ms  min=3.31ms  med=15.07ms  max=360.06ms p(90)=53.79ms  p(95)=72.13ms p(99.9)=167.06ms
     iterations.....................: 252026  2095.311397/s
     success_rate...................: 100.00% ✓ 252026      ✗ 0     
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

     checks.........................: 100.00% ✓ 732831      ✗ 0     
     data_received..................: 22 GB   179 MB/s
     data_sent......................: 294 MB  2.4 MB/s
     http_req_blocked...............: avg=3.63µs  min=1.05µs  med=2.65µs  max=12.14ms  p(90)=4.11µs   p(95)=4.85µs   p(99.9)=40.48µs
     http_req_connecting............: avg=455ns   min=0s      med=0s      max=4.17ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=24.3ms  min=1.91ms  med=24.04ms max=324.96ms p(90)=29.31ms  p(95)=31.75ms  p(99.9)=54.51ms
       { expected_response:true }...: avg=24.3ms  min=1.91ms  med=24.04ms max=324.96ms p(90)=29.31ms  p(95)=31.75ms  p(99.9)=54.51ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 244377
     http_req_receiving.............: avg=114.8µs min=30.56µs med=60.15µs max=39.91ms  p(90)=103.82µs p(95)=195.38µs p(99.9)=10.14ms
     http_req_sending...............: avg=47.88µs min=4.94µs  med=10.78µs max=126.84ms p(90)=18.2µs   p(95)=118.65µs p(99.9)=3.95ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=24.14ms min=1.86ms  med=23.93ms max=324.57ms p(90)=29.12ms  p(95)=31.47ms  p(99.9)=53.06ms
     http_reqs......................: 244377  2032.072681/s
     iteration_duration.............: avg=24.55ms min=3.83ms  med=24.27ms max=353.66ms p(90)=29.55ms  p(95)=32ms     p(99.9)=55.02ms
     iterations.....................: 244277  2031.241149/s
     success_rate...................: 100.00% ✓ 244277      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (rust subgraphs) (0.298.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 459558      ✗ 0     
     data_received..................: 14 GB   112 MB/s
     data_sent......................: 184 MB  1.5 MB/s
     http_req_blocked...............: avg=3.2µs   min=1.06µs  med=2.45µs  max=3.49ms   p(90)=3.79µs  p(95)=4.39µs   p(99.9)=35.34µs
     http_req_connecting............: avg=452ns   min=0s      med=0s      max=3.44ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=38.92ms min=2.1ms   med=38.35ms max=328.35ms p(90)=55.04ms p(95)=59.92ms  p(99.9)=83.91ms
       { expected_response:true }...: avg=38.92ms min=2.1ms   med=38.35ms max=328.35ms p(90)=55.04ms p(95)=59.92ms  p(99.9)=83.91ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 153286
     http_req_receiving.............: avg=84.9µs  min=28.69µs med=61.89µs max=61.98ms  p(90)=98.87µs p(95)=118.34µs p(99.9)=2.3ms  
     http_req_sending...............: avg=31.02µs min=5.32µs  med=10.62µs max=163.91ms p(90)=16.33µs p(95)=20.43µs  p(99.9)=1.4ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=38.8ms  min=2.04ms  med=38.25ms max=316.89ms p(90)=54.92ms p(95)=59.8ms   p(99.9)=83.47ms
     http_reqs......................: 153286  1274.461994/s
     iteration_duration.............: avg=39.16ms min=3.83ms  med=38.56ms max=337.25ms p(90)=55.24ms p(95)=60.13ms  p(99.9)=84.53ms
     iterations.....................: 153186  1273.630567/s
     success_rate...................: 100.00% ✓ 153186      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (rust subgraphs) (2.5.14)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 219321     ✗ 0    
     data_received..................: 6.4 GB  53 MB/s
     data_sent......................: 88 MB   730 kB/s
     http_req_blocked...............: avg=4.65µs  min=1.09µs  med=2.86µs  max=4.08ms   p(90)=4.37µs   p(95)=4.97µs   p(99.9)=40.46µs 
     http_req_connecting............: avg=1.51µs  min=0s      med=0s      max=4.04ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=81.73ms min=3.6ms   med=79.99ms max=344.61ms p(90)=102.84ms p(95)=113.98ms p(99.9)=207.77ms
       { expected_response:true }...: avg=81.73ms min=3.6ms   med=79.99ms max=344.61ms p(90)=102.84ms p(95)=113.98ms p(99.9)=207.77ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 73207
     http_req_receiving.............: avg=83.49µs min=29.12µs med=75.07µs max=14.6ms   p(90)=108.96µs p(95)=121.39µs p(99.9)=909.01µs
     http_req_sending...............: avg=24.57µs min=5.61µs  med=12.62µs max=163.14ms p(90)=18.72µs  p(95)=20.98µs  p(99.9)=746.12µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=81.62ms min=3.55ms  med=79.89ms max=344.4ms  p(90)=102.72ms p(95)=113.84ms p(99.9)=207.64ms
     http_reqs......................: 73207   607.502547/s
     iteration_duration.............: avg=82.08ms min=17.35ms med=80.21ms max=358.45ms p(90)=103.06ms p(95)=114.23ms p(99.9)=210.64ms
     iterations.....................: 73107   606.672705/s
     success_rate...................: 100.00% ✓ 73107      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-router (rust subgraphs) (v2.12.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 143331     ✗ 0    
     data_received..................: 4.2 GB  35 MB/s
     data_sent......................: 58 MB   476 kB/s
     http_req_blocked...............: avg=5.32µs   min=1.17µs  med=3.27µs   max=4.37ms   p(90)=4.58µs   p(95)=5.13µs   p(99.9)=201.94µs
     http_req_connecting............: avg=1.81µs   min=0s      med=0s       max=3.99ms   p(90)=0s       p(95)=0s       p(99.9)=119.46µs
     http_req_duration..............: avg=125.11ms min=5.57ms  med=124.83ms max=359.42ms p(90)=151.12ms p(95)=159.05ms p(99.9)=200.63ms
       { expected_response:true }...: avg=125.11ms min=5.57ms  med=124.83ms max=359.42ms p(90)=151.12ms p(95)=159.05ms p(99.9)=200.63ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 47877
     http_req_receiving.............: avg=91.78µs  min=32.63µs med=80.5µs   max=117.02ms p(90)=112.16µs p(95)=124.27µs p(99.9)=766.62µs
     http_req_sending...............: avg=22.53µs  min=5.77µs  med=14.37µs  max=97.31ms  p(90)=19.89µs  p(95)=21.75µs  p(99.9)=801.61µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=124.99ms min=5.47ms  med=124.71ms max=358.54ms p(90)=151.02ms p(95)=158.93ms p(99.9)=198.88ms
     http_reqs......................: 47877   396.642088/s
     iteration_duration.............: avg=125.62ms min=15.96ms med=125.1ms  max=379.46ms p(90)=151.37ms p(95)=159.32ms p(99.9)=203.44ms
     iterations.....................: 47777   395.813627/s
     success_rate...................: 100.00% ✓ 47777      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (rust subgraphs) (2.5.14)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 95679      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 38 MB   318 kB/s
     http_req_blocked...............: avg=4.85µs   min=1.23µs  med=3.37µs   max=3.82ms   p(90)=4.69µs   p(95)=5.28µs   p(99.9)=483.59µs
     http_req_connecting............: avg=1.19µs   min=0s      med=0s       max=2.33ms   p(90)=0s       p(95)=0s       p(99.9)=445.35µs
     http_req_duration..............: avg=187.41ms min=5.86ms  med=178.3ms  max=646.42ms p(90)=226.54ms p(95)=385.28ms p(99.9)=541.4ms 
       { expected_response:true }...: avg=187.41ms min=5.86ms  med=178.3ms  max=646.42ms p(90)=226.54ms p(95)=385.28ms p(99.9)=541.4ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 31993
     http_req_receiving.............: avg=98.07µs  min=36.07µs med=92.16µs  max=48.73ms  p(90)=123.49µs p(95)=136.29µs p(99.9)=542.54µs
     http_req_sending...............: avg=26.07µs  min=6.13µs  med=16.43µs  max=62.25ms  p(90)=21.5µs   p(95)=23.54µs  p(99.9)=592.12µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=187.28ms min=5.72ms  med=178.18ms max=646.27ms p(90)=226.41ms p(95)=385.18ms p(99.9)=541.28ms
     http_reqs......................: 31993   264.507426/s
     iteration_duration.............: avg=188.25ms min=58.66ms med=178.69ms max=646.71ms p(90)=227.04ms p(95)=386.65ms p(99.9)=541.78ms
     iterations.....................: 31893   263.680659/s
     success_rate...................: 100.00% ✓ 31893      ✗ 0    
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

     checks.........................: 100.00% ✓ 87873      ✗ 0    
     data_received..................: 2.6 GB  21 MB/s
     data_sent......................: 35 MB   291 kB/s
     http_req_blocked...............: avg=7.31µs   min=1.25µs  med=3.31µs   max=4.65ms   p(90)=4.51µs   p(95)=5.01µs   p(99.9)=1.65ms  
     http_req_connecting............: avg=3.75µs   min=0s      med=0s       max=4.62ms   p(90)=0s       p(95)=0s       p(99.9)=1.6ms   
     http_req_duration..............: avg=204.03ms min=8.48ms  med=209.93ms max=410.83ms p(90)=259.86ms p(95)=264.81ms p(99.9)=332.79ms
       { expected_response:true }...: avg=204.03ms min=8.48ms  med=209.93ms max=410.83ms p(90)=259.86ms p(95)=264.81ms p(99.9)=332.79ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29391
     http_req_receiving.............: avg=99.67µs  min=34.95µs med=88.38µs  max=128.72ms p(90)=118.86µs p(95)=130.35µs p(99.9)=549.06µs
     http_req_sending...............: avg=28.66µs  min=6.06µs  med=15.96µs  max=86.12ms  p(90)=20.63µs  p(95)=22.44µs  p(99.9)=509.89µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=203.9ms  min=8.34ms  med=209.82ms max=410.33ms p(90)=259.75ms p(95)=264.7ms  p(99.9)=332.61ms
     http_reqs......................: 29391   242.731507/s
     iteration_duration.............: avg=204.98ms min=43.64ms med=211.29ms max=419.64ms p(90)=260.15ms p(95)=265.07ms p(99.9)=335.78ms
     iterations.....................: 29291   241.905636/s
     success_rate...................: 100.00% ✓ 29291      ✗ 0    
     vus............................: 35      min=35       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.43)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 869961      ✗ 0     
     data_received..................: 25 GB   211 MB/s
     data_sent......................: 349 MB  2.9 MB/s
     http_req_blocked...............: avg=3.41µs   min=992ns   med=2.51µs  max=11.64ms  p(90)=4.05µs   p(95)=4.88µs   p(99.9)=38.43µs
     http_req_connecting............: avg=406ns    min=0s      med=0s      max=4.24ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=20.43ms  min=1.91ms  med=19.84ms max=336.32ms p(90)=28.43ms  p(95)=31.71ms  p(99.9)=53.86ms
       { expected_response:true }...: avg=20.43ms  min=1.91ms  med=19.84ms max=336.32ms p(90)=28.43ms  p(95)=31.71ms  p(99.9)=53.86ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 290087
     http_req_receiving.............: avg=126.93µs min=27.66µs med=55.52µs max=306.45ms p(90)=109.13µs p(95)=279.15µs p(99.9)=10.09ms
     http_req_sending...............: avg=54.8µs   min=5.26µs  med=10.22µs max=219.22ms p(90)=18.88µs  p(95)=129.72µs p(99.9)=6.01ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=20.25ms  min=1.81ms  med=19.69ms max=312.16ms p(90)=28.21ms  p(95)=31.39ms  p(99.9)=52.96ms
     http_reqs......................: 290087  2412.738838/s
     iteration_duration.............: avg=20.68ms  min=3.57ms  med=20.06ms max=348.72ms p(90)=28.66ms  p(95)=31.96ms  p(99.9)=54.58ms
     iterations.....................: 289987  2411.907108/s
     success_rate...................: 100.00% ✓ 289987      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (.net subgraphs) (16.0.0-rc.1.23)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 707571      ✗ 0     
     data_received..................: 21 GB   172 MB/s
     data_sent......................: 284 MB  2.4 MB/s
     http_req_blocked...............: avg=3.62µs   min=1.04µs  med=2.58µs   max=15.37ms  p(90)=4.09µs  p(95)=4.86µs   p(99.9)=40.07µs 
     http_req_connecting............: avg=461ns    min=0s      med=0s       max=4.15ms   p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=25.18ms  min=1.97ms  med=17.55ms  max=504.26ms p(90)=52.64ms p(95)=69.43ms  p(99.9)=188.66ms
       { expected_response:true }...: avg=25.18ms  min=1.97ms  med=17.55ms  max=504.26ms p(90)=52.64ms p(95)=69.43ms  p(99.9)=188.66ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 235957
     http_req_receiving.............: avg=714.48µs min=51.28µs med=107.44µs max=213.35ms p(90)=1.17ms  p(95)=1.9ms    p(99.9)=61.48ms 
     http_req_sending...............: avg=45.94µs  min=4.98µs  med=10.44µs  max=164.74ms p(90)=19.11µs p(95)=117.04µs p(99.9)=2.85ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=24.42ms  min=1.84ms  med=16.99ms  max=504.17ms p(90)=51.25ms p(95)=67.94ms  p(99.9)=183.94ms
     http_reqs......................: 235957  1962.2739/s
     iteration_duration.............: avg=25.43ms  min=2.38ms  med=17.78ms  max=504.5ms  p(90)=52.9ms  p(95)=69.68ms  p(99.9)=190.8ms 
     iterations.....................: 235857  1961.442277/s
     success_rate...................: 100.00% ✓ 235857      ✗ 0     
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

     checks.........................: 100.00% ✓ 549261      ✗ 0     
     data_received..................: 16 GB   133 MB/s
     data_sent......................: 220 MB  1.8 MB/s
     http_req_blocked...............: avg=3.3µs    min=972ns   med=2.32µs  max=3.68ms   p(90)=4.57µs   p(95)=5.7µs    p(99.9)=43.84µs
     http_req_connecting............: avg=388ns    min=0s      med=0s      max=3.64ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=32.49ms  min=2.37ms  med=31.59ms max=331.88ms p(90)=43.15ms  p(95)=47.89ms  p(99.9)=86.61ms
       { expected_response:true }...: avg=32.49ms  min=2.37ms  med=31.59ms max=331.88ms p(90)=43.15ms  p(95)=47.89ms  p(99.9)=86.61ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 183187
     http_req_receiving.............: avg=131.79µs min=29.94µs med=61.17µs max=264.45ms p(90)=134.89µs p(95)=280.79µs p(99.9)=6.93ms 
     http_req_sending...............: avg=46.43µs  min=4.77µs  med=10.23µs max=183.95ms p(90)=23.79µs  p(95)=134.53µs p(99.9)=3.26ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=32.32ms  min=2.25ms  med=31.45ms max=259.39ms p(90)=42.96ms  p(95)=47.61ms  p(99.9)=85.3ms 
     http_reqs......................: 183187  1522.696796/s
     iteration_duration.............: avg=32.76ms  min=5.37ms  med=31.83ms max=373.35ms p(90)=43.39ms  p(95)=48.14ms  p(99.9)=87.24ms
     iterations.....................: 183087  1521.865571/s
     success_rate...................: 100.00% ✓ 183087      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (.net subgraphs) (0.298.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 422991      ✗ 0     
     data_received..................: 12 GB   103 MB/s
     data_sent......................: 170 MB  1.4 MB/s
     http_req_blocked...............: avg=3.72µs  min=1.08µs  med=2.67µs  max=4.08ms   p(90)=4.19µs   p(95)=4.85µs   p(99.9)=37.31µs
     http_req_connecting............: avg=714ns   min=0s      med=0s      max=4.04ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=42.29ms min=2.13ms  med=41.76ms max=312.11ms p(90)=59.46ms  p(95)=64.82ms  p(99.9)=90.59ms
       { expected_response:true }...: avg=42.29ms min=2.13ms  med=41.76ms max=312.11ms p(90)=59.46ms  p(95)=64.82ms  p(99.9)=90.59ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 141097
     http_req_receiving.............: avg=85.88µs min=29.46µs med=67.53µs max=137.41ms p(90)=106.08µs p(95)=124.92µs p(99.9)=1.63ms 
     http_req_sending...............: avg=27.17µs min=5.26µs  med=11.43µs max=118.53ms p(90)=17.61µs  p(95)=21.23µs  p(99.9)=1.23ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=42.18ms min=2.07ms  med=41.65ms max=311.58ms p(90)=59.34ms  p(95)=64.7ms   p(99.9)=90.09ms
     http_reqs......................: 141097  1173.097799/s
     iteration_duration.............: avg=42.54ms min=3.94ms  med=41.98ms max=333.41ms p(90)=59.68ms  p(95)=65.04ms  p(99.9)=91.42ms
     iterations.....................: 140997  1172.266386/s
     success_rate...................: 100.00% ✓ 140997      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (.net subgraphs) (2.5.14)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 208899     ✗ 0    
     data_received..................: 6.1 GB  51 MB/s
     data_sent......................: 84 MB   695 kB/s
     http_req_blocked...............: avg=4.69µs  min=1.14µs  med=3.17µs  max=4.24ms   p(90)=4.64µs   p(95)=5.25µs   p(99.9)=55.17µs 
     http_req_connecting............: avg=1.28µs  min=0s      med=0s      max=4.2ms    p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=85.8ms  min=4.01ms  med=82.92ms max=363.97ms p(90)=104.35ms p(95)=115.23ms p(99.9)=215.61ms
       { expected_response:true }...: avg=85.8ms  min=4.01ms  med=82.92ms max=363.97ms p(90)=104.35ms p(95)=115.23ms p(99.9)=215.61ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 69733
     http_req_receiving.............: avg=91.32µs min=31.89µs med=80.83µs max=98.32ms  p(90)=115.08µs p(95)=128.61µs p(99.9)=870.82µs
     http_req_sending...............: avg=26.79µs min=5.47µs  med=14.06µs max=103.08ms p(90)=20.32µs  p(95)=22.51µs  p(99.9)=892.35µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=85.69ms min=3.88ms  med=82.82ms max=363.15ms p(90)=104.25ms p(95)=115.1ms  p(99.9)=215.33ms
     http_reqs......................: 69733   578.550432/s
     iteration_duration.............: avg=86.18ms min=27.25ms med=83.17ms max=388.16ms p(90)=104.61ms p(95)=115.5ms  p(99.9)=217.03ms
     iterations.....................: 69633   577.720767/s
     success_rate...................: 100.00% ✓ 69633      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-router (.net subgraphs) (v2.12.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 133227     ✗ 0    
     data_received..................: 3.9 GB  32 MB/s
     data_sent......................: 53 MB   443 kB/s
     http_req_blocked...............: avg=5.89µs   min=1.27µs  med=3.41µs   max=3.86ms   p(90)=4.8µs    p(95)=5.34µs   p(99.9)=513.43µs
     http_req_connecting............: avg=2.21µs   min=0s      med=0s       max=3.82ms   p(90)=0s       p(95)=0s       p(99.9)=357.56µs
     http_req_duration..............: avg=134.59ms min=6.1ms   med=132.07ms max=342.41ms p(90)=178.62ms p(95)=192.07ms p(99.9)=245.54ms
       { expected_response:true }...: avg=134.59ms min=6.1ms   med=132.07ms max=342.41ms p(90)=178.62ms p(95)=192.07ms p(99.9)=245.54ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 44509
     http_req_receiving.............: avg=91.36µs  min=33.15µs med=86.95µs  max=3.16ms   p(90)=117.98µs p(95)=130.83µs p(99.9)=693.74µs
     http_req_sending...............: avg=25.36µs  min=5.9µs   med=16.17µs  max=55.68ms  p(90)=21.49µs  p(95)=23.26µs  p(99.9)=774.5µs 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=134.47ms min=5.98ms  med=131.95ms max=342.21ms p(90)=178.5ms  p(95)=191.94ms p(99.9)=245.44ms
     http_reqs......................: 44509   368.55743/s
     iteration_duration.............: avg=135.15ms min=30.12ms med=132.38ms max=357.23ms p(90)=178.93ms p(95)=192.41ms p(99.9)=247.69ms
     iterations.....................: 44409   367.729378/s
     success_rate...................: 100.00% ✓ 44409      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (.net subgraphs) (2.5.14)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 97152      ✗ 0    
     data_received..................: 2.8 GB  24 MB/s
     data_sent......................: 39 MB   323 kB/s
     http_req_blocked...............: avg=7.1µs    min=1.29µs  med=3.6µs    max=3.71ms   p(90)=5.01µs   p(95)=5.57µs   p(99.9)=1.61ms  
     http_req_connecting............: avg=3.24µs   min=0s      med=0s       max=3.67ms   p(90)=0s       p(95)=0s       p(99.9)=1.49ms  
     http_req_duration..............: avg=184.51ms min=6.01ms  med=176.67ms max=633.82ms p(90)=234.75ms p(95)=329.16ms p(99.9)=552.51ms
       { expected_response:true }...: avg=184.51ms min=6.01ms  med=176.67ms max=633.82ms p(90)=234.75ms p(95)=329.16ms p(99.9)=552.51ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32484
     http_req_receiving.............: avg=188.31µs min=36.2µs  med=96.42µs  max=178.9ms  p(90)=128.35µs p(95)=141.58µs p(99.9)=1.33ms  
     http_req_sending...............: avg=23.31µs  min=6.29µs  med=17.67µs  max=29.12ms  p(90)=22.47µs  p(95)=24.19µs  p(99.9)=632.65µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=184.3ms  min=5.86ms  med=176.53ms max=633.72ms p(90)=234.43ms p(95)=322.89ms p(99.9)=552.4ms 
     http_reqs......................: 32484   268.795797/s
     iteration_duration.............: avg=185.37ms min=18.65ms med=177.17ms max=634.04ms p(90)=235.19ms p(95)=334.97ms p(99.9)=552.79ms
     iterations.....................: 32384   267.968325/s
     success_rate...................: 100.00% ✓ 32384      ✗ 0    
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

     checks.........................: 100.00% ✓ 86559      ✗ 0    
     data_received..................: 2.5 GB  21 MB/s
     data_sent......................: 35 MB   287 kB/s
     http_req_blocked...............: avg=7.29µs   min=1.22µs  med=3.57µs   max=4.23ms   p(90)=4.9µs    p(95)=5.48µs   p(99.9)=1.72ms  
     http_req_connecting............: avg=3.55µs   min=0s      med=0s       max=4.18ms   p(90)=0s       p(95)=0s       p(99.9)=1.7ms   
     http_req_duration..............: avg=207.06ms min=8.76ms  med=206.14ms max=455.26ms p(90)=220.66ms p(95)=225.79ms p(99.9)=296.81ms
       { expected_response:true }...: avg=207.06ms min=8.76ms  med=206.14ms max=455.26ms p(90)=220.66ms p(95)=225.79ms p(99.9)=296.81ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 28953
     http_req_receiving.............: avg=111.69µs min=35.12µs med=96.39µs  max=106.71ms p(90)=129.14µs p(95)=142.32µs p(99.9)=804.89µs
     http_req_sending...............: avg=32.63µs  min=5.77µs  med=17.16µs  max=122.48ms p(90)=21.98µs  p(95)=23.76µs  p(99.9)=779.64µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=206.92ms min=8.64ms  med=206.01ms max=454.34ms p(90)=220.53ms p(95)=225.64ms p(99.9)=296.54ms
     http_reqs......................: 28953   239.085952/s
     iteration_duration.............: avg=208.08ms min=60.33ms med=206.49ms max=470.26ms p(90)=220.93ms p(95)=226.12ms p(99.9)=315.8ms 
     iterations.....................: 28853   238.26018/s
     success_rate...................: 100.00% ✓ 28853      ✗ 0    
     vus............................: 44      min=44       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-173-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

