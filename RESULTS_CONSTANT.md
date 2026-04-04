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
| hive-router | v0.0.43 | 3,070 | 3,284 | 3,006 | 2.8% |  |
| hotchocolate | 16.0.0-rc.1.25 | 2,127 | 2,172 | 2,121 | 0.8% |  |
| grafbase | 0.53.2 | 2,071 | 2,131 | 2,049 | 1.3% |  |
| cosmo | 0.298.0 | 1,240 | 1,264 | 1,233 | 0.9% | non-compatible response (2 across 2/9 runs) |
| hive-gateway-router-runtime | 2.5.14 | 628 | 638 | 624 | 0.8% |  |
| apollo-router | v2.12.1 | 407 | 421 | 400 | 1.6% |  |
| hive-gateway | 2.5.14 | 269 | 275 | 268 | 0.9% |  |
| apollo-gateway | 2.13.3 | 251 | 252 | 250 | 0.3% |  |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.43 | 2,494 | 2,622 | 2,467 | 1.9% |  |
| hotchocolate | 16.0.0-rc.1.25 | 1,964 | 2,002 | 1,943 | 1.0% |  |
| grafbase | 0.53.2 | 1,542 | 1,571 | 1,536 | 0.9% |  |
| cosmo | 0.298.0 | 1,212 | 1,229 | 1,203 | 0.7% | non-compatible response (1 across 1/9 runs) |
| hive-gateway-router-runtime | 2.5.14 | 590 | 603 | 585 | 1.0% |  |
| apollo-router | v2.12.1 | 396 | 406 | 393 | 1.1% |  |
| hive-gateway | 2.5.14 | 261 | 266 | 258 | 1.0% |  |
| apollo-gateway | 2.13.3 | 236 | 239 | 235 | 0.6% |  |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.43)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 1107075     ✗ 0     
     data_received..................: 32 GB   269 MB/s
     data_sent......................: 444 MB  3.7 MB/s
     http_req_blocked...............: avg=3µs      min=1.01µs med=2.04µs  max=24.4ms   p(90)=3.24µs  p(95)=3.91µs   p(99.9)=30.99µs
     http_req_connecting............: avg=275ns    min=0s     med=0s      max=4ms      p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=16.01ms  min=1.64ms med=14.95ms max=302.41ms p(90)=23.53ms p(95)=27.96ms  p(99.9)=51.5ms 
       { expected_response:true }...: avg=16.01ms  min=1.64ms med=14.95ms max=302.41ms p(90)=23.53ms p(95)=27.96ms  p(99.9)=51.5ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 369125
     http_req_receiving.............: avg=147.57µs min=27µs   med=47.33µs max=45.19ms  p(90)=97.65µs p(95)=284.62µs p(99.9)=16.65ms
     http_req_sending...............: avg=59.41µs  min=4.95µs med=8.84µs  max=198.03ms p(90)=15.08µs p(95)=119.41µs p(99.9)=9.28ms 
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=15.8ms   min=1.58ms med=14.8ms  max=301.78ms p(90)=23.2ms  p(95)=27.42ms  p(99.9)=49.77ms
     http_reqs......................: 369125  3070.8349/s
     iteration_duration.............: avg=16.24ms  min=2.02ms med=15.16ms max=325.61ms p(90)=23.77ms p(95)=28.25ms  p(99.9)=53.45ms
     iterations.....................: 369025  3070.002977/s
     success_rate...................: 100.00% ✓ 369025      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (rust subgraphs) (16.0.0-rc.1.25)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 767403      ✗ 0     
     data_received..................: 22 GB   187 MB/s
     data_sent......................: 308 MB  2.6 MB/s
     http_req_blocked...............: avg=2.64µs   min=1.02µs med=2.05µs   max=7.16ms   p(90)=3.24µs   p(95)=3.87µs   p(99.9)=32.76µs 
     http_req_connecting............: avg=192ns    min=0s     med=0s       max=2.78ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=23.21ms  min=2.35ms med=14.69ms  max=343.08ms p(90)=52.3ms   p(95)=71.36ms  p(99.9)=169.89ms
       { expected_response:true }...: avg=23.21ms  min=2.35ms med=14.69ms  max=343.08ms p(90)=52.3ms   p(95)=71.36ms  p(99.9)=169.89ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 255901
     http_req_receiving.............: avg=669.89µs min=50.2µs med=104.75µs max=174.89ms p(90)=976.82µs p(95)=1.51ms   p(99.9)=61.3ms  
     http_req_sending...............: avg=41.4µs   min=5.19µs med=8.99µs   max=162.86ms p(90)=15.41µs  p(95)=105.81µs p(99.9)=2.99ms  
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=22.5ms   min=2.27ms med=14.16ms  max=335.41ms p(90)=50.94ms  p(95)=69.9ms   p(99.9)=167.48ms
     http_reqs......................: 255901  2127.529552/s
     iteration_duration.............: avg=23.44ms  min=3.16ms med=14.91ms  max=351.85ms p(90)=52.56ms  p(95)=71.59ms  p(99.9)=170.61ms
     iterations.....................: 255801  2126.698164/s
     success_rate...................: 100.00% ✓ 255801      ✗ 0     
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

     checks.........................: 100.00% ✓ 746856      ✗ 0     
     data_received..................: 22 GB   182 MB/s
     data_sent......................: 299 MB  2.5 MB/s
     http_req_blocked...............: avg=3.35µs   min=1.01µs  med=2.22µs  max=15.35ms  p(90)=3.71µs  p(95)=4.48µs   p(99.9)=47.25µs
     http_req_connecting............: avg=449ns    min=0s      med=0s      max=4.28ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=23.86ms  min=1.88ms  med=23.61ms max=348.93ms p(90)=28.53ms p(95)=30.67ms  p(99.9)=53.7ms 
       { expected_response:true }...: avg=23.86ms  min=1.88ms  med=23.61ms max=348.93ms p(90)=28.53ms p(95)=30.67ms  p(99.9)=53.7ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 249052
     http_req_receiving.............: avg=104.74µs min=27.82µs med=55.5µs  max=77.69ms  p(90)=99.01µs p(95)=196.54µs p(99.9)=8.28ms 
     http_req_sending...............: avg=46.53µs  min=4.82µs  med=9.66µs  max=189.3ms  p(90)=17.09µs p(95)=116.37µs p(99.9)=3.66ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=23.71ms  min=1.83ms  med=23.5ms  max=348.25ms p(90)=28.37ms p(95)=30.42ms  p(99.9)=52.27ms
     http_reqs......................: 249052  2071.146526/s
     iteration_duration.............: avg=24.09ms  min=3.99ms  med=23.82ms max=361.52ms p(90)=28.75ms p(95)=30.91ms  p(99.9)=54.31ms
     iterations.....................: 248952  2070.314914/s
     success_rate...................: 100.00% ✓ 248952      ✗ 0     
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

     checks.........................: 100.00% ✓ 447336      ✗ 0     
     data_received..................: 13 GB   109 MB/s
     data_sent......................: 179 MB  1.5 MB/s
     http_req_blocked...............: avg=3.04µs  min=1.02µs med=2.08µs  max=3.95ms   p(90)=3.34µs  p(95)=3.93µs   p(99.9)=29.88µs
     http_req_connecting............: avg=657ns   min=0s     med=0s      max=3.91ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=40ms    min=2.1ms  med=39.46ms max=323.53ms p(90)=56.39ms p(95)=61.52ms  p(99.9)=87.24ms
       { expected_response:true }...: avg=40ms    min=2.1ms  med=39.46ms max=323.53ms p(90)=56.39ms p(95)=61.52ms  p(99.9)=87.24ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 149212
     http_req_receiving.............: avg=75.87µs min=28.1µs med=57.16µs max=161.82ms p(90)=90.38µs p(95)=106.53µs p(99.9)=1.73ms 
     http_req_sending...............: avg=28.14µs min=5.02µs med=9.73µs  max=163.01ms p(90)=14.84µs p(95)=18.62µs  p(99.9)=1.27ms 
     http_req_tls_handshaking.......: avg=0s      min=0s     med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=39.9ms  min=2.01ms med=39.36ms max=322.91ms p(90)=56.28ms p(95)=61.41ms  p(99.9)=86.95ms
     http_reqs......................: 149212  1240.645109/s
     iteration_duration.............: avg=40.23ms min=4.3ms  med=39.65ms max=340.7ms  p(90)=56.59ms p(95)=61.72ms  p(99.9)=87.92ms
     iterations.....................: 149112  1239.813644/s
     success_rate...................: 100.00% ✓ 149112      ✗ 0     
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

     checks.........................: 100.00% ✓ 226791     ✗ 0    
     data_received..................: 6.6 GB  55 MB/s
     data_sent......................: 91 MB   755 kB/s
     http_req_blocked...............: avg=4.86µs  min=1.19µs  med=2.99µs  max=4.44ms   p(90)=4.58µs   p(95)=5.24µs   p(99.9)=45.06µs 
     http_req_connecting............: avg=1.53µs  min=0s      med=0s      max=4.4ms    p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=79.04ms min=3.86ms  med=76.91ms max=322.83ms p(90)=96.28ms  p(95)=105.69ms p(99.9)=201.66ms
       { expected_response:true }...: avg=79.04ms min=3.86ms  med=76.91ms max=322.83ms p(90)=96.28ms  p(95)=105.69ms p(99.9)=201.66ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 75697
     http_req_receiving.............: avg=88.07µs min=30.82µs med=76.42µs max=167.53ms p(90)=110.87µs p(95)=124.42µs p(99.9)=938.42µs
     http_req_sending...............: avg=26.03µs min=5.56µs  med=13.58µs max=156.78ms p(90)=20.74µs  p(95)=23.21µs  p(99.9)=758.51µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=78.92ms min=3.75ms  med=76.81ms max=322.27ms p(90)=96.16ms  p(95)=105.58ms p(99.9)=201.41ms
     http_reqs......................: 75697   628.175734/s
     iteration_duration.............: avg=79.38ms min=24.2ms  med=77.14ms max=370.02ms p(90)=96.52ms  p(95)=105.95ms p(99.9)=202.86ms
     iterations.....................: 75597   627.345878/s
     success_rate...................: 100.00% ✓ 75597      ✗ 0    
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

     checks.........................: 100.00% ✓ 147165     ✗ 0    
     data_received..................: 4.3 GB  36 MB/s
     data_sent......................: 59 MB   489 kB/s
     http_req_blocked...............: avg=5.88µs   min=1.22µs  med=3.41µs   max=4.52ms   p(90)=4.85µs   p(95)=5.42µs   p(99.9)=357.7µs 
     http_req_connecting............: avg=2.25µs   min=0s      med=0s       max=4.48ms   p(90)=0s       p(95)=0s       p(99.9)=264.69µs
     http_req_duration..............: avg=121.83ms min=5.68ms  med=121.51ms max=351.96ms p(90)=147.7ms  p(95)=155.43ms p(99.9)=193.49ms
       { expected_response:true }...: avg=121.83ms min=5.68ms  med=121.51ms max=351.96ms p(90)=147.7ms  p(95)=155.43ms p(99.9)=193.49ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 49155
     http_req_receiving.............: avg=164.05µs min=31.11µs med=85.66µs  max=234.48ms p(90)=116.75µs p(95)=128.95µs p(99.9)=10ms    
     http_req_sending...............: avg=22.42µs  min=6.01µs  med=15.94µs  max=100.54ms p(90)=21.47µs  p(95)=23.25µs  p(99.9)=603.57µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=121.64ms min=5.54ms  med=121.38ms max=235.37ms p(90)=147.55ms p(95)=155.26ms p(99.9)=191.51ms
     http_reqs......................: 49155   407.215926/s
     iteration_duration.............: avg=122.35ms min=7.26ms  med=121.79ms max=379.3ms  p(90)=147.96ms p(95)=155.71ms p(99.9)=198.28ms
     iterations.....................: 49055   406.387494/s
     success_rate...................: 100.00% ✓ 49055      ✗ 0    
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

     checks.........................: 100.00% ✓ 97242      ✗ 0    
     data_received..................: 2.9 GB  24 MB/s
     data_sent......................: 39 MB   323 kB/s
     http_req_blocked...............: avg=6.57µs   min=1.29µs  med=3.53µs   max=4.02ms   p(90)=5.03µs   p(95)=5.67µs   p(99.9)=1.07ms  
     http_req_connecting............: avg=2.76µs   min=0s      med=0s       max=3.99ms   p(90)=0s       p(95)=0s       p(99.9)=963.75µs
     http_req_duration..............: avg=184.35ms min=5.67ms  med=159.48ms max=667.76ms p(90)=254.88ms p(95)=380.53ms p(99.9)=545.07ms
       { expected_response:true }...: avg=184.35ms min=5.67ms  med=159.48ms max=667.76ms p(90)=254.88ms p(95)=380.53ms p(99.9)=545.07ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32514
     http_req_receiving.............: avg=103.57µs min=35.86µs med=96.3µs   max=27.53ms  p(90)=129.06µs p(95)=142.23µs p(99.9)=685.56µs
     http_req_sending...............: avg=23.28µs  min=6.26µs  med=17.79µs  max=48.39ms  p(90)=23.09µs  p(95)=24.99µs  p(99.9)=550.53µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=184.22ms min=5.58ms  med=159.36ms max=667.66ms p(90)=254.76ms p(95)=380.39ms p(99.9)=544.97ms
     http_reqs......................: 32514   269.140932/s
     iteration_duration.............: avg=185.19ms min=33.7ms  med=159.89ms max=667.96ms p(90)=255.44ms p(95)=382.06ms p(99.9)=545.29ms
     iterations.....................: 32414   268.313162/s
     success_rate...................: 100.00% ✓ 32414      ✗ 0    
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

     checks.........................: 100.00% ✓ 90903      ✗ 0    
     data_received..................: 2.7 GB  22 MB/s
     data_sent......................: 37 MB   302 kB/s
     http_req_blocked...............: avg=8.48µs   min=1.21µs  med=3.33µs   max=7.99ms   p(90)=4.61µs   p(95)=5.13µs   p(99.9)=1.7ms   
     http_req_connecting............: avg=4.9µs    min=0s      med=0s       max=7.95ms   p(90)=0s       p(95)=0s       p(99.9)=1.67ms  
     http_req_duration..............: avg=197.21ms min=8.3ms   med=199.25ms max=423.6ms  p(90)=206.56ms p(95)=212.57ms p(99.9)=276.44ms
       { expected_response:true }...: avg=197.21ms min=8.3ms   med=199.25ms max=423.6ms  p(90)=206.56ms p(95)=212.57ms p(99.9)=276.44ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 30401
     http_req_receiving.............: avg=103.68µs min=34.31µs med=91.81µs  max=174.7ms  p(90)=122.38µs p(95)=134.26µs p(99.9)=582.15µs
     http_req_sending...............: avg=30.14µs  min=6.17µs  med=17.05µs  max=171.72ms p(90)=21.64µs  p(95)=23.33µs  p(99.9)=2.78ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=197.08ms min=8.21ms  med=199.12ms max=419.69ms p(90)=206.45ms p(95)=212.45ms p(99.9)=273.82ms
     http_reqs......................: 30401   251.121899/s
     iteration_duration.............: avg=198.16ms min=32.14ms med=199.63ms max=438.02ms p(90)=206.84ms p(95)=212.92ms p(99.9)=286.87ms
     iterations.....................: 30301   250.295867/s
     success_rate...................: 100.00% ✓ 30301      ✗ 0    
     vus............................: 38      min=38       max=50 
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

     checks.........................: 100.00% ✓ 899589      ✗ 0     
     data_received..................: 26 GB   218 MB/s
     data_sent......................: 360 MB  3.0 MB/s
     http_req_blocked...............: avg=3.05µs   min=982ns   med=2.31µs  max=13.9ms   p(90)=3.93µs   p(95)=4.79µs   p(99.9)=37.05µs
     http_req_connecting............: avg=157ns    min=0s      med=0s      max=2.56ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=19.76ms  min=1.9ms   med=19.24ms max=346.15ms p(90)=27.22ms  p(95)=30.34ms  p(99.9)=52.51ms
       { expected_response:true }...: avg=19.76ms  min=1.9ms   med=19.24ms max=346.15ms p(90)=27.22ms  p(95)=30.34ms  p(99.9)=52.51ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 299963
     http_req_receiving.............: avg=128.66µs min=28.16µs med=54.26µs max=159.9ms  p(90)=108.68µs p(95)=277.6µs  p(99.9)=9.2ms  
     http_req_sending...............: avg=54.39µs  min=5.15µs  med=10.06µs max=247.01ms p(90)=19.49µs  p(95)=129.41µs p(99.9)=4.87ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=19.58ms  min=1.79ms  med=19.1ms  max=189.17ms p(90)=27.02ms  p(95)=30.04ms  p(99.9)=51.53ms
     http_reqs......................: 299963  2494.935361/s
     iteration_duration.............: avg=19.99ms  min=2.8ms   med=19.46ms max=374.65ms p(90)=27.45ms  p(95)=30.58ms  p(99.9)=53.13ms
     iterations.....................: 299863  2494.103613/s
     success_rate...................: 100.00% ✓ 299863      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (.net subgraphs) (16.0.0-rc.1.25)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 708582      ✗ 0     
     data_received..................: 21 GB   172 MB/s
     data_sent......................: 284 MB  2.4 MB/s
     http_req_blocked...............: avg=3.39µs   min=1µs     med=2.51µs   max=12.42ms  p(90)=3.98µs  p(95)=4.72µs   p(99.9)=39.5µs  
     http_req_connecting............: avg=415ns    min=0s      med=0s       max=3.98ms   p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=25.15ms  min=2.05ms  med=17.49ms  max=568.89ms p(90)=52.24ms p(95)=69.18ms  p(99.9)=191.95ms
       { expected_response:true }...: avg=25.15ms  min=2.05ms  med=17.49ms  max=568.89ms p(90)=52.24ms p(95)=69.18ms  p(99.9)=191.95ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 236294
     http_req_receiving.............: avg=691.78µs min=51.52µs med=105.42µs max=248.23ms p(90)=1.14ms  p(95)=1.85ms   p(99.9)=57.94ms 
     http_req_sending...............: avg=46.47µs  min=5.29µs  med=10.21µs  max=242.74ms p(90)=18.94µs p(95)=115.42µs p(99.9)=3.08ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=24.41ms  min=1.91ms  med=16.93ms  max=568.8ms  p(90)=51.02ms p(95)=67.68ms  p(99.9)=181.23ms
     http_reqs......................: 236294  1964.923841/s
     iteration_duration.............: avg=25.39ms  min=2.6ms   med=17.72ms  max=569.12ms p(90)=52.48ms p(95)=69.43ms  p(99.9)=193.82ms
     iterations.....................: 236194  1964.092283/s
     success_rate...................: 100.00% ✓ 236194      ✗ 0     
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

     checks.........................: 100.00% ✓ 556266      ✗ 0     
     data_received..................: 16 GB   135 MB/s
     data_sent......................: 223 MB  1.9 MB/s
     http_req_blocked...............: avg=3.6µs    min=952ns   med=2.36µs  max=6.39ms   p(90)=4.75µs   p(95)=5.85µs   p(99.9)=39.91µs
     http_req_connecting............: avg=556ns    min=0s      med=0s      max=4.09ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=32.08ms  min=2.32ms  med=31.16ms max=321.32ms p(90)=42.7ms   p(95)=47.52ms  p(99.9)=85.78ms
       { expected_response:true }...: avg=32.08ms  min=2.32ms  med=31.16ms max=321.32ms p(90)=42.7ms   p(95)=47.52ms  p(99.9)=85.78ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 185522
     http_req_receiving.............: avg=110.13µs min=29.92µs med=60.84µs max=31.96ms  p(90)=132.71µs p(95)=269.06µs p(99.9)=5.76ms 
     http_req_sending...............: avg=52.44µs  min=5.33µs  med=10.33µs max=282.99ms p(90)=24.38µs  p(95)=133.43µs p(99.9)=3.55ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=31.92ms  min=2.21ms  med=31.02ms max=320.64ms p(90)=42.5ms   p(95)=47.26ms  p(99.9)=84.61ms
     http_reqs......................: 185522  1542.128873/s
     iteration_duration.............: avg=32.34ms  min=4.91ms  med=31.39ms max=354.21ms p(90)=42.94ms  p(95)=47.75ms  p(99.9)=86.45ms
     iterations.....................: 185422  1541.297635/s
     success_rate...................: 100.00% ✓ 185422      ✗ 0     
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

     checks.........................: 100.00% ✓ 437163      ✗ 0     
     data_received..................: 13 GB   106 MB/s
     data_sent......................: 175 MB  1.5 MB/s
     http_req_blocked...............: avg=3.44µs  min=1.1µs   med=2.76µs  max=2.94ms   p(90)=4.35µs  p(95)=5.02µs  p(99.9)=35.08µs
     http_req_connecting............: avg=368ns   min=0s      med=0s      max=2.9ms    p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=40.91ms min=2.23ms  med=40.37ms max=326.46ms p(90)=57.47ms p(95)=62.66ms p(99.9)=87.66ms
       { expected_response:true }...: avg=40.91ms min=2.23ms  med=40.37ms max=326.46ms p(90)=57.47ms p(95)=62.66ms p(99.9)=87.66ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 145821
     http_req_receiving.............: avg=85.44µs min=28.16µs med=67.39µs max=27.31ms  p(90)=107.4µs p(95)=126.8µs p(99.9)=1.81ms 
     http_req_sending...............: avg=29.36µs min=5.29µs  med=11.62µs max=187.9ms  p(90)=18.35µs p(95)=22.19µs p(99.9)=1.28ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=40.8ms  min=2.1ms   med=40.26ms max=326.22ms p(90)=57.35ms p(95)=62.52ms p(99.9)=87.28ms
     http_reqs......................: 145821  1212.303568/s
     iteration_duration.............: avg=41.16ms min=4.02ms  med=40.59ms max=355.21ms p(90)=57.68ms p(95)=62.87ms p(99.9)=88.12ms
     iterations.....................: 145721  1211.472204/s
     success_rate...................: 100.00% ✓ 145721      ✗ 0     
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

     checks.........................: 100.00% ✓ 213066     ✗ 0    
     data_received..................: 6.2 GB  52 MB/s
     data_sent......................: 85 MB   709 kB/s
     http_req_blocked...............: avg=4.99µs  min=1.16µs  med=3.13µs  max=4.31ms   p(90)=4.67µs   p(95)=5.29µs   p(99.9)=46.13µs 
     http_req_connecting............: avg=1.55µs  min=0s      med=0s      max=4.27ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=84.12ms min=3.87ms  med=81.07ms max=357.13ms p(90)=105.15ms p(95)=116.82ms p(99.9)=212.24ms
       { expected_response:true }...: avg=84.12ms min=3.87ms  med=81.07ms max=357.13ms p(90)=105.15ms p(95)=116.82ms p(99.9)=212.24ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 71122
     http_req_receiving.............: avg=90.19µs min=30.89µs med=81.03µs max=81.94ms  p(90)=115.29µs p(95)=129.01µs p(99.9)=823.45µs
     http_req_sending...............: avg=29.39µs min=5.71µs  med=14.45µs max=157.29ms p(90)=21.13µs  p(95)=23.4µs   p(99.9)=746.26µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=84ms    min=3.71ms  med=80.96ms max=356.34ms p(90)=105.02ms p(95)=116.69ms p(99.9)=211.83ms
     http_reqs......................: 71122   590.06259/s
     iteration_duration.............: avg=84.49ms min=17.51ms med=81.34ms max=374.47ms p(90)=105.42ms p(95)=117.16ms p(99.9)=214.26ms
     iterations.....................: 71022   589.232942/s
     success_rate...................: 100.00% ✓ 71022      ✗ 0    
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

     checks.........................: 100.00% ✓ 143232     ✗ 0    
     data_received..................: 4.2 GB  35 MB/s
     data_sent......................: 57 MB   476 kB/s
     http_req_blocked...............: avg=5.86µs   min=1.18µs  med=3.51µs   max=4.2ms    p(90)=5.03µs   p(95)=5.61µs   p(99.9)=182.63µs
     http_req_connecting............: avg=2.16µs   min=0s      med=0s       max=4.16ms   p(90)=0s       p(95)=0s       p(99.9)=112.86µs
     http_req_duration..............: avg=125.16ms min=5.9ms   med=122.71ms max=341.12ms p(90)=165.57ms p(95)=178.45ms p(99.9)=228.85ms
       { expected_response:true }...: avg=125.16ms min=5.9ms   med=122.71ms max=341.12ms p(90)=165.57ms p(95)=178.45ms p(99.9)=228.85ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 47844
     http_req_receiving.............: avg=93.31µs  min=31.69µs med=88.35µs  max=10.82ms  p(90)=120.18µs p(95)=133.26µs p(99.9)=851.81µs
     http_req_sending...............: avg=28.74µs  min=5.66µs  med=17.1µs   max=173.72ms p(90)=22.49µs  p(95)=24.44µs  p(99.9)=636.57µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=125.03ms min=5.81ms  med=122.59ms max=340.5ms  p(90)=165.44ms p(95)=178.33ms p(99.9)=228.52ms
     http_reqs......................: 47844   396.260178/s
     iteration_duration.............: avg=125.69ms min=29.39ms med=123.04ms max=368.33ms p(90)=165.88ms p(95)=178.78ms p(99.9)=231.74ms
     iterations.....................: 47744   395.431945/s
     success_rate...................: 100.00% ✓ 47744      ✗ 0    
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

     checks.........................: 100.00% ✓ 94554      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 38 MB   314 kB/s
     http_req_blocked...............: avg=6.8µs    min=1.25µs  med=3.5µs    max=3.9ms    p(90)=4.95µs   p(95)=5.55µs   p(99.9)=1.52ms  
     http_req_connecting............: avg=3.06µs   min=0s      med=0s       max=3.86ms   p(90)=0s       p(95)=0s       p(99.9)=1.43ms  
     http_req_duration..............: avg=189.61ms min=6.02ms  med=171.69ms max=625.46ms p(90)=229.84ms p(95)=390.91ms p(99.9)=539.87ms
       { expected_response:true }...: avg=189.61ms min=6.02ms  med=171.69ms max=625.46ms p(90)=229.84ms p(95)=390.91ms p(99.9)=539.87ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 31618
     http_req_receiving.............: avg=208.87µs min=32.14µs med=96.11µs  max=266.08ms p(90)=128.02µs p(95)=141.73µs p(99.9)=11.83ms 
     http_req_sending...............: avg=28.14µs  min=5.93µs  med=18.18µs  max=170.63ms p(90)=23.16µs  p(95)=24.8µs   p(99.9)=560.02µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=189.37ms min=5.86ms  med=171.57ms max=625.32ms p(90)=229.45ms p(95)=390.55ms p(99.9)=539.78ms
     http_reqs......................: 31618   261.62349/s
     iteration_duration.............: avg=190.49ms min=22.83ms med=172.04ms max=625.74ms p(90)=230.25ms p(95)=391.97ms p(99.9)=540.12ms
     iterations.....................: 31518   260.796039/s
     success_rate...................: 100.00% ✓ 31518      ✗ 0    
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

     checks.........................: 100.00% ✓ 85785      ✗ 0    
     data_received..................: 2.5 GB  21 MB/s
     data_sent......................: 35 MB   285 kB/s
     http_req_blocked...............: avg=7.48µs   min=1.27µs  med=3.37µs   max=4.65ms   p(90)=4.71µs   p(95)=5.23µs   p(99.9)=1.88ms  
     http_req_connecting............: avg=3.95µs   min=0s      med=0s       max=4.61ms   p(90)=0s       p(95)=0s       p(99.9)=1.86ms  
     http_req_duration..............: avg=208.94ms min=8.64ms  med=206.53ms max=443.98ms p(90)=226.29ms p(95)=236.46ms p(99.9)=300.63ms
       { expected_response:true }...: avg=208.94ms min=8.64ms  med=206.53ms max=443.98ms p(90)=226.29ms p(95)=236.46ms p(99.9)=300.63ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 28695
     http_req_receiving.............: avg=98.34µs  min=35.14µs med=93.05µs  max=22.02ms  p(90)=124.52µs p(95)=137.63µs p(99.9)=609.58µs
     http_req_sending...............: avg=39.94µs  min=6µs     med=17.22µs  max=121.76ms p(90)=21.87µs  p(95)=23.6µs   p(99.9)=670.44µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=208.8ms  min=8.5ms   med=206.41ms max=443.45ms p(90)=226.17ms p(95)=236.28ms p(99.9)=300.03ms
     http_reqs......................: 28695   236.970852/s
     iteration_duration.............: avg=209.94ms min=51.86ms med=206.82ms max=453.79ms p(90)=226.56ms p(95)=236.9ms  p(99.9)=305.38ms
     iterations.....................: 28595   236.145025/s
     success_rate...................: 100.00% ✓ 28595      ✗ 0    
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

