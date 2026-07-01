## Overview for: `constant-vus-with-latency`

Each benchmark runs a GraphQL gateway with 4 subgraphs and executes a heavy nested query that exercises federation/composition capabilities.

Results are split by subgraph technology:
- **Rust Subgraphs** = [async-graphql](https://github.com/async-graphql/async-graphql) + axum
- **.NET Subgraphs** = [HotChocolate](https://github.com/ChilliCream/graphql-platform)

**Methodology:** Each gateway executes 10 runs of 120s each. The first run is a full-duration warmup (discarded). The remaining 9 runs are measured. Results are ranked by **median RPS** across the 9 measured runs, with best/worst/CV% reported for transparency.

This scenario executes a constant load of **50 VUs** over **120s** with a simulated **4ms IO delay** on each subgraph request. Only .NET subgraphs are used.


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| fusion-nightly | 16.4.0-p.9 | 1,559 | 1,576 | 1,555 | 0.5% |  |
| hive-router | v0.0.74 | 1,549 | 1,577 | 1,541 | 0.7% |  |
| fusion | 16.3.0 | 1,538 | 1,562 | 1,533 | 0.6% |  |
| grafbase | 0.53.5 | 1,108 | 1,132 | 1,100 | 1.0% |  |
| cosmo | 0.326.1 | 1,061 | 1,086 | 1,054 | 0.9% |  |
| hive-gateway-router-runtime | 2.10.0 | 529 | 542 | 520 | 1.2% |  |
| apollo-router | v2.15.1 | 375 | 387 | 370 | 1.4% |  |
| hive-gateway | 2.10.0 | 238 | 242 | 236 | 0.8% |  |
| apollo-gateway | 2.14.2 | 232 | 234 | 231 | 0.5% |  |
| feddi | 77271dc84a06 | 18 | 20 | 18 | 4.0% |  |


### Details

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.4.0-p.9)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 570420      ✗ 0     
     data_received..................: 17 GB   137 MB/s
     data_sent......................: 229 MB  1.9 MB/s
     http_req_blocked...............: avg=3.3µs    min=992ns   med=2.3µs    max=5.08ms   p(90)=4.03µs  p(95)=4.92µs   p(99.9)=35.53µs
     http_req_connecting............: avg=523ns    min=0s      med=0s       max=3.97ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=31.3ms   min=13.41ms med=30.76ms  max=345.55ms p(90)=38.43ms p(95)=41.05ms  p(99.9)=59.44ms
       { expected_response:true }...: avg=31.3ms   min=13.41ms med=30.76ms  max=345.55ms p(90)=38.43ms p(95)=41.05ms  p(99.9)=59.44ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 190240
     http_req_receiving.............: avg=673.79µs min=52.8µs  med=116.48µs max=33.77ms  p(90)=1.91ms  p(95)=2.93ms   p(99.9)=15.07ms
     http_req_sending...............: avg=41.59µs  min=4.91µs  med=9.43µs   max=175.25ms p(90)=20.17µs p(95)=104.45µs p(99.9)=2.47ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=30.59ms  min=13.29ms med=30.07ms  max=344.87ms p(90)=37.5ms  p(95)=40ms     p(99.9)=57.25ms
     http_reqs......................: 190240  1559.342368/s
     iteration_duration.............: avg=31.54ms  min=13.68ms med=30.98ms  max=363.58ms p(90)=38.65ms p(95)=41.27ms  p(99.9)=59.75ms
     iterations.....................: 190140  1558.522697/s
     success_rate...................: 100.00% ✓ 190140      ✗ 0     
     vus............................: 29      min=0         max=50  
     vus_max........................: 50      min=50        max=50
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

     checks.........................: 100.00% ✓ 566769      ✗ 0     
     data_received..................: 17 GB   136 MB/s
     data_sent......................: 227 MB  1.9 MB/s
     http_req_blocked...............: avg=3.54µs  min=1.03µs  med=2.44µs  max=5.6ms    p(90)=4.25µs   p(95)=5.19µs   p(99.9)=36.26µs
     http_req_connecting............: avg=591ns   min=0s      med=0s      max=4.61ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=31.5ms  min=14.61ms med=31.21ms max=340.06ms p(90)=37.49ms  p(95)=39.49ms  p(99.9)=57.3ms 
       { expected_response:true }...: avg=31.5ms  min=14.61ms med=31.21ms max=340.06ms p(90)=37.49ms  p(95)=39.49ms  p(99.9)=57.3ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 189023
     http_req_receiving.............: avg=85.65µs min=27.07µs med=55.84µs max=159.74ms p(90)=105.82µs p(95)=148.31µs p(99.9)=2.13ms 
     http_req_sending...............: avg=35.59µs min=5.24µs  med=10.01µs max=158.17ms p(90)=20.04µs  p(95)=33.68µs  p(99.9)=1.76ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=31.38ms min=14.54ms med=31.1ms  max=339.75ms p(90)=37.36ms  p(95)=39.34ms  p(99.9)=56.26ms
     http_reqs......................: 189023  1549.179108/s
     iteration_duration.............: avg=31.75ms min=14.84ms med=31.43ms max=352.36ms p(90)=37.71ms  p(95)=39.71ms  p(99.9)=57.79ms
     iterations.....................: 188923  1548.359536/s
     success_rate...................: 100.00% ✓ 188923      ✗ 0     
     vus............................: 50      min=0         max=50  
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

     checks.........................: 100.00% ✓ 562878      ✗ 0     
     data_received..................: 17 GB   135 MB/s
     data_sent......................: 226 MB  1.8 MB/s
     http_req_blocked...............: avg=3.41µs   min=1.01µs  med=2.34µs   max=7.4ms    p(90)=4.12µs  p(95)=4.99µs   p(99.9)=34.19µs
     http_req_connecting............: avg=533ns    min=0s      med=0s       max=3.94ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=31.72ms  min=14.12ms med=31.12ms  max=343.54ms p(90)=39.07ms p(95)=41.72ms  p(99.9)=59.73ms
       { expected_response:true }...: avg=31.72ms  min=14.12ms med=31.12ms  max=343.54ms p(90)=39.07ms p(95)=41.72ms  p(99.9)=59.73ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 187726
     http_req_receiving.............: avg=618.21µs min=51.69µs med=116.11µs max=132.32ms p(90)=1.66ms  p(95)=2.6ms    p(99.9)=14.45ms
     http_req_sending...............: avg=35.69µs  min=5.21µs  med=9.67µs   max=118.8ms  p(90)=20.61µs p(95)=104.96µs p(99.9)=1.84ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=31.07ms  min=13.84ms med=30.52ms  max=238.7ms  p(90)=38.24ms p(95)=40.82ms  p(99.9)=57.16ms
     http_reqs......................: 187726  1538.486134/s
     iteration_duration.............: avg=31.97ms  min=14.3ms  med=31.35ms  max=370.64ms p(90)=39.29ms p(95)=41.94ms  p(99.9)=60.1ms 
     iterations.....................: 187626  1537.666595/s
     success_rate...................: 100.00% ✓ 187626      ✗ 0     
     vus............................: 50      min=0         max=50  
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

     checks.........................: 100.00% ✓ 405540      ✗ 0     
     data_received..................: 12 GB   97 MB/s
     data_sent......................: 163 MB  1.3 MB/s
     http_req_blocked...............: avg=3.3µs   min=1µs     med=2.3µs   max=2.67ms   p(90)=4.77µs   p(95)=5.94µs   p(99.9)=47.58µs
     http_req_connecting............: avg=340ns   min=0s      med=0s      max=2.18ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=44.11ms min=16.75ms med=43.65ms max=350.57ms p(90)=53.57ms  p(95)=56.89ms  p(99.9)=81.41ms
       { expected_response:true }...: avg=44.11ms min=16.75ms med=43.65ms max=350.57ms p(90)=53.57ms  p(95)=56.89ms  p(99.9)=81.41ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 135280
     http_req_receiving.............: avg=95.86µs min=29.19µs med=60.66µs max=56.53ms  p(90)=131.83µs p(95)=196.58µs p(99.9)=2.8ms  
     http_req_sending...............: avg=38.97µs min=4.98µs  med=10.2µs  max=200.71ms p(90)=24.48µs  p(95)=105.61µs p(99.9)=2.2ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=43.97ms min=16.65ms med=43.53ms max=350.27ms p(90)=53.43ms  p(95)=56.72ms  p(99.9)=80.84ms
     http_reqs......................: 135280  1108.612338/s
     iteration_duration.............: avg=44.38ms min=17.03ms med=43.9ms  max=358.28ms p(90)=53.81ms  p(95)=57.14ms  p(99.9)=82.09ms
     iterations.....................: 135180  1107.792844/s
     success_rate...................: 100.00% ✓ 135180      ✗ 0     
     vus............................: 50      min=0         max=50  
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

     checks.........................: 100.00% ✓ 388179      ✗ 0     
     data_received..................: 11 GB   93 MB/s
     data_sent......................: 156 MB  1.3 MB/s
     http_req_blocked...............: avg=3.82µs  min=1.11µs  med=2.58µs  max=4.56ms   p(90)=4.27µs   p(95)=5.06µs   p(99.9)=38.7µs 
     http_req_connecting............: avg=847ns   min=0s      med=0s      max=4.52ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=46.11ms min=19.46ms med=45.51ms max=338.62ms p(90)=56.15ms  p(95)=59.42ms  p(99.9)=76.61ms
       { expected_response:true }...: avg=46.11ms min=19.46ms med=45.51ms max=338.62ms p(90)=56.15ms  p(95)=59.42ms  p(99.9)=76.61ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 129493
     http_req_receiving.............: avg=94.97µs min=30.17µs med=71.26µs max=255.53ms p(90)=118.67µs p(95)=145.23µs p(99.9)=1.83ms 
     http_req_sending...............: avg=30.54µs min=5.12µs  med=11.35µs max=255.51ms p(90)=18.92µs  p(95)=23.45µs  p(99.9)=1.25ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=45.99ms min=19.33ms med=45.39ms max=338.41ms p(90)=56.03ms  p(95)=59.29ms  p(99.9)=75.82ms
     http_reqs......................: 129493  1061.031425/s
     iteration_duration.............: avg=46.36ms min=22.11ms med=45.72ms max=371.22ms p(90)=56.36ms  p(95)=59.62ms  p(99.9)=76.9ms 
     iterations.....................: 129393  1060.212051/s
     success_rate...................: 100.00% ✓ 129393      ✗ 0     
     vus............................: 50      min=0         max=50  
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

     checks.........................: 100.00% ✓ 194055     ✗ 0    
     data_received..................: 5.7 GB  46 MB/s
     data_sent......................: 78 MB   636 kB/s
     http_req_blocked...............: avg=5.08µs  min=1.11µs  med=3.26µs  max=4.04ms   p(90)=4.95µs   p(95)=5.65µs   p(99.9)=50.42µs 
     http_req_connecting............: avg=1.56µs  min=0s      med=0s      max=4ms      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=92.4ms  min=18.41ms med=90.51ms max=353.51ms p(90)=109.57ms p(95)=117.21ms p(99.9)=221.25ms
       { expected_response:true }...: avg=92.4ms  min=18.41ms med=90.51ms max=353.51ms p(90)=109.57ms p(95)=117.21ms p(99.9)=221.25ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 64785
     http_req_receiving.............: avg=88.21µs min=32.43µs med=80.39µs max=12.49ms  p(90)=117.1µs  p(95)=131.23µs p(99.9)=857.27µs
     http_req_sending...............: avg=27.52µs min=5.85µs  med=14.81µs max=117.38ms p(90)=22.08µs  p(95)=24.61µs  p(99.9)=702.54µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=92.28ms min=18.23ms med=90.41ms max=352.88ms p(90)=109.46ms p(95)=117.07ms p(99.9)=220.9ms 
     http_reqs......................: 64785   529.257668/s
     iteration_duration.............: avg=92.77ms min=41.12ms med=90.77ms max=379.56ms p(90)=109.83ms p(95)=117.5ms  p(99.9)=222.84ms
     iterations.....................: 64685   528.440723/s
     success_rate...................: 100.00% ✓ 64685      ✗ 0    
     vus............................: 50      min=0        max=50 
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

     checks.........................: 100.00% ✓ 137718     ✗ 0    
     data_received..................: 4.0 GB  33 MB/s
     data_sent......................: 55 MB   451 kB/s
     http_req_blocked...............: avg=6.02µs   min=1.12µs  med=3.42µs   max=4.34ms   p(90)=4.98µs   p(95)=5.61µs   p(99.9)=956.01µs
     http_req_connecting............: avg=2.36µs   min=0s      med=0s       max=4.29ms   p(90)=0s       p(95)=0s       p(99.9)=807.02µs
     http_req_duration..............: avg=130.22ms min=19.76ms med=128.15ms max=373.85ms p(90)=162.62ms p(95)=173.64ms p(99.9)=225ms   
       { expected_response:true }...: avg=130.22ms min=19.76ms med=128.15ms max=373.85ms p(90)=162.62ms p(95)=173.64ms p(99.9)=225ms   
     http_req_failed................: 0.00%   ✓ 0          ✗ 46006
     http_req_receiving.............: avg=95.65µs  min=31.14µs med=86.42µs  max=153.12ms p(90)=119.86µs p(95)=132.79µs p(99.9)=865.16µs
     http_req_sending...............: avg=25.49µs  min=5.64µs  med=16.14µs  max=119.13ms p(90)=22.17µs  p(95)=24.2µs   p(99.9)=601.19µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=130.09ms min=19.61ms med=128.04ms max=373.58ms p(90)=162.51ms p(95)=173.5ms  p(99.9)=224.62ms
     http_reqs......................: 46006   375.614972/s
     iteration_duration.............: avg=130.74ms min=36.57ms med=128.45ms max=390.69ms p(90)=162.92ms p(95)=173.98ms p(99.9)=228.45ms
     iterations.....................: 45906   374.798524/s
     success_rate...................: 100.00% ✓ 45906      ✗ 0    
     vus............................: 50      min=0        max=50 
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

     checks.........................: 100.00% ✓ 87171      ✗ 0    
     data_received..................: 2.6 GB  21 MB/s
     data_sent......................: 35 MB   286 kB/s
     http_req_blocked...............: avg=7.5µs    min=1.26µs  med=3.79µs   max=4.03ms   p(90)=5.41µs   p(95)=6.06µs   p(99.9)=1.8ms   
     http_req_connecting............: avg=3.46µs   min=0s      med=0s       max=3.99ms   p(90)=0s       p(95)=0s       p(99.9)=1.77ms  
     http_req_duration..............: avg=205.66ms min=19.6ms  med=192.69ms max=641.72ms p(90)=234.19ms p(95)=271.71ms p(99.9)=606.49ms
       { expected_response:true }...: avg=205.66ms min=19.6ms  med=192.69ms max=641.72ms p(90)=234.19ms p(95)=271.71ms p(99.9)=606.49ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29157
     http_req_receiving.............: avg=110.23µs min=34.92µs med=98.8µs   max=98.82ms  p(90)=131.98µs p(95)=145.64µs p(99.9)=742.01µs
     http_req_sending...............: avg=30.67µs  min=6.26µs  med=18.66µs  max=97.7ms   p(90)=23.86µs  p(95)=25.78µs  p(99.9)=632.29µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=205.51ms min=19.48ms med=192.57ms max=641.6ms  p(90)=234.07ms p(95)=271.6ms  p(99.9)=606.39ms
     http_reqs......................: 29157   238.411683/s
     iteration_duration.............: avg=206.63ms min=46.81ms med=193.12ms max=641.99ms p(90)=234.69ms p(95)=275.14ms p(99.9)=606.78ms
     iterations.....................: 29057   237.594001/s
     success_rate...................: 100.00% ✓ 29057      ✗ 0    
     vus............................: 50      min=0        max=50 
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

     checks.........................: 100.00% ✓ 85518      ✗ 0    
     data_received..................: 2.5 GB  20 MB/s
     data_sent......................: 34 MB   280 kB/s
     http_req_blocked...............: avg=7.16µs   min=1.31µs  med=3.31µs   max=4.18ms   p(90)=4.69µs   p(95)=5.29µs   p(99.9)=1.91ms  
     http_req_connecting............: avg=3.65µs   min=0s      med=0s       max=4.14ms   p(90)=0s       p(95)=0s       p(99.9)=1.86ms  
     http_req_duration..............: avg=209.7ms  min=24.02ms med=224.07ms max=457.35ms p(90)=243.4ms  p(95)=248.66ms p(99.9)=326.7ms 
       { expected_response:true }...: avg=209.7ms  min=24.02ms med=224.07ms max=457.35ms p(90)=243.4ms  p(95)=248.66ms p(99.9)=326.7ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 28606
     http_req_receiving.............: avg=100.66µs min=34.56µs med=90.72µs  max=76.88ms  p(90)=123.12µs p(95)=135.86µs p(99.9)=682.28µs
     http_req_sending...............: avg=38.16µs  min=5.75µs  med=16.84µs  max=106.47ms p(90)=22.22µs  p(95)=24.19µs  p(99.9)=639.05µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=209.56ms min=23.9ms  med=223.96ms max=456.66ms p(90)=243.29ms p(95)=248.55ms p(99.9)=326.57ms
     http_reqs......................: 28606   232.767909/s
     iteration_duration.............: avg=210.64ms min=70.46ms med=224.47ms max=466.83ms p(90)=243.69ms p(95)=248.94ms p(99.9)=329.32ms
     iterations.....................: 28506   231.954206/s
     success_rate...................: 100.00% ✓ 28506      ✗ 0    
     vus............................: 50      min=0        max=50 
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

     checks.........................: 100.00% ✓ 6918      ✗ 0   
     data_received..................: 230 MB  1.8 MB/s
     data_sent......................: 2.9 MB  23 kB/s
     http_req_blocked...............: avg=45.67µs  min=1.45µs   med=3.73µs   max=3.93ms  p(90)=5.41µs   p(95)=6.26µs   p(99.9)=3.68ms 
     http_req_connecting............: avg=41.26µs  min=0s       med=0s       max=3.89ms  p(90)=0s       p(95)=0s       p(99.9)=3.65ms 
     http_req_duration..............: avg=2.52s    min=40.02ms  med=2.56s    max=5.27s   p(90)=3.34s    p(95)=3.61s    p(99.9)=5.02s  
       { expected_response:true }...: avg=2.52s    min=40.02ms  med=2.56s    max=5.27s   p(90)=3.34s    p(95)=3.61s    p(99.9)=5.02s  
     http_req_failed................: 0.00%   ✓ 0         ✗ 2406
     http_req_receiving.............: avg=180.33µs min=38.64µs  med=108.43µs max=87.14ms p(90)=145.96µs p(95)=159.92µs p(99.9)=15.29ms
     http_req_sending...............: avg=73.38µs  min=6.12µs   med=20.4µs   max=41.94ms p(90)=25.25µs  p(95)=28.78µs  p(99.9)=6.85ms 
     http_req_tls_handshaking.......: avg=0s       min=0s       med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=2.52s    min=39.86ms  med=2.56s    max=5.27s   p(90)=3.34s    p(95)=3.61s    p(99.9)=5.02s  
     http_reqs......................: 2406    18.856554/s
     iteration_duration.............: avg=2.63s    min=216.72ms med=2.6s     max=5.27s   p(90)=3.35s    p(95)=3.63s    p(99.9)=5.04s  
     iterations.....................: 2306    18.072824/s
     success_rate...................: 100.00% ✓ 2306      ✗ 0   
     vus............................: 39      min=0       max=50
     vus_max........................: 50      min=50      max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-185-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

