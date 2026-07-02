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
| hive-router | v0.0.74 | 1,560 | 1,582 | 1,550 | 0.7% |  |
| fusion | 16.3.0 | 1,547 | 1,572 | 1,542 | 0.6% |  |
| fusion-nightly | 16.4.0-p.12 | 1,534 | 1,561 | 1,530 | 0.7% |  |
| grafbase | 0.53.5 | 1,112 | 1,146 | 1,103 | 1.2% |  |
| cosmo | 0.326.1 | 1,094 | 1,113 | 1,087 | 0.8% |  |
| hive-gateway-router-runtime | 2.10.0 | 517 | 532 | 506 | 1.7% |  |
| apollo-router | v2.15.1 | 406 | 418 | 402 | 1.3% |  |
| hive-gateway | 2.10.0 | 238 | 244 | 236 | 1.1% |  |
| apollo-gateway | 2.14.2 | 232 | 235 | 230 | 0.7% |  |
| feddi | 77271dc84a06 | 12 | 12 | 11 | 2.8% |  |


### Details

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.74)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 570843      ✗ 0     
     data_received..................: 17 GB   136 MB/s
     data_sent......................: 229 MB  1.9 MB/s
     http_req_blocked...............: avg=3.07µs  min=971ns   med=2.08µs  max=4.12ms   p(90)=3.89µs   p(95)=4.74µs  p(99.9)=29.48µs
     http_req_connecting............: avg=533ns   min=0s      med=0s      max=4.08ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=31.29ms min=14.12ms med=30.99ms max=319.06ms p(90)=37.26ms  p(95)=39.22ms p(99.9)=57.43ms
       { expected_response:true }...: avg=31.29ms min=14.12ms med=30.99ms max=319.06ms p(90)=37.26ms  p(95)=39.22ms p(99.9)=57.43ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 190381
     http_req_receiving.............: avg=82.03µs min=27.59µs med=52.08µs max=246.69ms p(90)=100.73µs p(95)=138.8µs p(99.9)=2.05ms 
     http_req_sending...............: avg=32.01µs min=5.18µs  med=9.3µs   max=200.88ms p(90)=19.06µs  p(95)=28.69µs p(99.9)=1.6ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=31.17ms min=14.03ms med=30.89ms max=318.15ms p(90)=37.15ms  p(95)=39.08ms p(99.9)=56.09ms
     http_reqs......................: 190381  1560.383453/s
     iteration_duration.............: avg=31.52ms min=14.28ms med=31.21ms max=359.28ms p(90)=37.47ms  p(95)=39.42ms p(99.9)=57.92ms
     iterations.....................: 190281  1559.563842/s
     success_rate...................: 100.00% ✓ 190281      ✗ 0     
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

     checks.........................: 100.00% ✓ 566061      ✗ 0     
     data_received..................: 17 GB   136 MB/s
     data_sent......................: 227 MB  1.9 MB/s
     http_req_blocked...............: avg=3.08µs   min=962ns   med=2.09µs   max=3.98ms   p(90)=3.88µs  p(95)=4.72µs  p(99.9)=30.96µs
     http_req_connecting............: avg=540ns    min=0s      med=0s       max=3.94ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=31.55ms  min=14.24ms med=30.94ms  max=330.9ms  p(90)=38.78ms p(95)=41.43ms p(99.9)=65.79ms
       { expected_response:true }...: avg=31.55ms  min=14.24ms med=30.94ms  max=330.9ms  p(90)=38.78ms p(95)=41.43ms p(99.9)=65.79ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 188787
     http_req_receiving.............: avg=572.56µs min=51.23µs med=106.21µs max=39.43ms  p(90)=1.59ms  p(95)=2.55ms  p(99.9)=14.51ms
     http_req_sending...............: avg=38.39µs  min=4.9µs   med=9.29µs   max=158.86ms p(90)=20.18µs p(95)=106µs   p(99.9)=2.32ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=30.94ms  min=14.04ms med=30.38ms  max=301.42ms p(90)=37.99ms p(95)=40.56ms p(99.9)=63.72ms
     http_reqs......................: 188787  1547.223327/s
     iteration_duration.............: avg=31.79ms  min=14.41ms med=31.17ms  max=349.54ms p(90)=39ms    p(95)=41.64ms p(99.9)=66.48ms
     iterations.....................: 188687  1546.403767/s
     success_rate...................: 100.00% ✓ 188687      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.4.0-p.12)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 561381      ✗ 0     
     data_received..................: 16 GB   135 MB/s
     data_sent......................: 225 MB  1.8 MB/s
     http_req_blocked...............: avg=2.75µs   min=1.01µs  med=2.02µs  max=3.16ms   p(90)=3.69µs  p(95)=4.55µs   p(99.9)=30.43µs
     http_req_connecting............: avg=271ns    min=0s      med=0s      max=2.75ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=31.81ms  min=13.69ms med=31.26ms max=302.72ms p(90)=39.06ms p(95)=41.69ms  p(99.9)=61.53ms
       { expected_response:true }...: avg=31.81ms  min=13.69ms med=31.26ms max=302.72ms p(90)=39.06ms p(95)=41.69ms  p(99.9)=61.53ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 187227
     http_req_receiving.............: avg=933.65µs min=52.09µs med=145.1µs max=239.87ms p(90)=2.62ms  p(95)=3.84ms   p(99.9)=18.88ms
     http_req_sending...............: avg=38.94µs  min=5.3µs   med=9.12µs  max=192.4ms  p(90)=20µs    p(95)=104.55µs p(99.9)=2.52ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=30.84ms  min=13.49ms med=30.37ms max=302.48ms p(90)=37.68ms p(95)=40.1ms   p(99.9)=57.12ms
     http_reqs......................: 187227  1534.736699/s
     iteration_duration.............: avg=32.05ms  min=13.98ms med=31.48ms max=357.93ms p(90)=39.28ms p(95)=41.91ms  p(99.9)=62.08ms
     iterations.....................: 187127  1533.916979/s
     success_rate...................: 100.00% ✓ 187127      ✗ 0     
     vus............................: 3       min=0         max=50  
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

     checks.........................: 100.00% ✓ 406878      ✗ 0     
     data_received..................: 12 GB   97 MB/s
     data_sent......................: 163 MB  1.3 MB/s
     http_req_blocked...............: avg=3.63µs  min=982ns   med=2.25µs  max=4.04ms   p(90)=4.68µs   p(95)=5.79µs   p(99.9)=48.82µs
     http_req_connecting............: avg=738ns   min=0s      med=0s      max=4ms      p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=43.95ms min=15.39ms med=43.57ms max=334.04ms p(90)=53.6ms   p(95)=56.81ms  p(99.9)=80.14ms
       { expected_response:true }...: avg=43.95ms min=15.39ms med=43.57ms max=334.04ms p(90)=53.6ms   p(95)=56.81ms  p(99.9)=80.14ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 135726
     http_req_receiving.............: avg=97.19µs min=29.3µs  med=58.02µs max=156.87ms p(90)=130.55µs p(95)=212.23µs p(99.9)=3.39ms 
     http_req_sending...............: avg=40.04µs min=5.07µs  med=9.86µs  max=156.33ms p(90)=24.09µs  p(95)=114.68µs p(99.9)=2.4ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=43.82ms min=15.23ms med=43.45ms max=333.36ms p(90)=53.46ms  p(95)=56.65ms  p(99.9)=79.41ms
     http_reqs......................: 135726  1112.306396/s
     iteration_duration.............: avg=44.23ms min=18.95ms med=43.81ms max=363.09ms p(90)=53.84ms  p(95)=57.03ms  p(99.9)=80.88ms
     iterations.....................: 135626  1111.486873/s
     success_rate...................: 100.00% ✓ 135626      ✗ 0     
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

     checks.........................: 100.00% ✓ 400494      ✗ 0     
     data_received..................: 12 GB   96 MB/s
     data_sent......................: 161 MB  1.3 MB/s
     http_req_blocked...............: avg=3.38µs  min=1.06µs  med=2.21µs  max=3.92ms   p(90)=3.85µs  p(95)=4.61µs   p(99.9)=35.51µs
     http_req_connecting............: avg=764ns   min=0s      med=0s      max=3.9ms    p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=44.7ms  min=19.04ms med=44.05ms max=338.53ms p(90)=54.44ms p(95)=57.68ms  p(99.9)=76.15ms
       { expected_response:true }...: avg=44.7ms  min=19.04ms med=44.05ms max=338.53ms p(90)=54.44ms p(95)=57.68ms  p(99.9)=76.15ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 133598
     http_req_receiving.............: avg=85.35µs min=27.94µs med=64.82µs max=106.93ms p(90)=109.6µs p(95)=133.57µs p(99.9)=1.7ms  
     http_req_sending...............: avg=29.05µs min=5.18µs  med=10.51µs max=255.65ms p(90)=18.04µs p(95)=22.39µs  p(99.9)=1.08ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=44.59ms min=18.91ms med=43.95ms max=337.64ms p(90)=54.32ms p(95)=57.56ms  p(99.9)=75.73ms
     http_reqs......................: 133598  1094.626934/s
     iteration_duration.............: avg=44.93ms min=20.98ms med=44.26ms max=364.57ms p(90)=54.64ms p(95)=57.88ms  p(99.9)=76.62ms
     iterations.....................: 133498  1093.80759/s
     success_rate...................: 100.00% ✓ 133498      ✗ 0     
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

     checks.........................: 100.00% ✓ 189768     ✗ 0    
     data_received..................: 5.5 GB  45 MB/s
     data_sent......................: 76 MB   622 kB/s
     http_req_blocked...............: avg=4.73µs  min=1.11µs  med=2.77µs  max=4.71ms   p(90)=4.36µs   p(95)=4.94µs   p(99.9)=51.17µs 
     http_req_connecting............: avg=1.61µs  min=0s      med=0s      max=4.66ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=94.51ms min=22.1ms  med=92.62ms max=338.22ms p(90)=112.78ms p(95)=121.09ms p(99.9)=226.15ms
       { expected_response:true }...: avg=94.51ms min=22.1ms  med=92.62ms max=338.22ms p(90)=112.78ms p(95)=121.09ms p(99.9)=226.15ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 63356
     http_req_receiving.............: avg=86.55µs min=31.8µs  med=75.21µs max=90.73ms  p(90)=112.24µs p(95)=126.19µs p(99.9)=1ms     
     http_req_sending...............: avg=23.09µs min=5.74µs  med=13.03µs max=94.89ms  p(90)=19.99µs  p(95)=22.28µs  p(99.9)=680.44µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=94.4ms  min=21.93ms med=92.53ms max=338.01ms p(90)=112.65ms p(95)=120.97ms p(99.9)=226.06ms
     http_reqs......................: 63356   517.620066/s
     iteration_duration.............: avg=94.87ms min=38.41ms med=92.87ms max=382.55ms p(90)=113ms    p(95)=121.36ms p(99.9)=227.23ms
     iterations.....................: 63256   516.803063/s
     success_rate...................: 100.00% ✓ 63256      ✗ 0    
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

     checks.........................: 100.00% ✓ 148956     ✗ 0    
     data_received..................: 4.4 GB  36 MB/s
     data_sent......................: 60 MB   488 kB/s
     http_req_blocked...............: avg=5.42µs   min=1.12µs  med=3.23µs   max=3.91ms   p(90)=4.76µs   p(95)=5.35µs   p(99.9)=206.1µs 
     http_req_connecting............: avg=1.97µs   min=0s      med=0s       max=3.86ms   p(90)=0s       p(95)=0s       p(99.9)=60.88µs 
     http_req_duration..............: avg=120.41ms min=22.12ms med=118.69ms max=383.63ms p(90)=149.53ms p(95)=159ms    p(99.9)=204.81ms
       { expected_response:true }...: avg=120.41ms min=22.12ms med=118.69ms max=383.63ms p(90)=149.53ms p(95)=159ms    p(99.9)=204.81ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 49752
     http_req_receiving.............: avg=93.05µs  min=30.47µs med=84.25µs  max=150.39ms p(90)=117.51µs p(95)=129.89µs p(99.9)=770.86µs
     http_req_sending...............: avg=31.41µs  min=5.82µs  med=15.88µs  max=146.7ms  p(90)=21.54µs  p(95)=23.62µs  p(99.9)=619.37µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=120.28ms min=22.01ms med=118.57ms max=379.72ms p(90)=149.41ms p(95)=158.86ms p(99.9)=202.35ms
     http_reqs......................: 49752   406.171179/s
     iteration_duration.............: avg=120.88ms min=27.47ms med=118.98ms max=394.2ms  p(90)=149.83ms p(95)=159.3ms  p(99.9)=207.89ms
     iterations.....................: 49652   405.354788/s
     success_rate...................: 100.00% ✓ 49652      ✗ 0    
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

     checks.........................: 100.00% ✓ 87135      ✗ 0    
     data_received..................: 2.6 GB  21 MB/s
     data_sent......................: 35 MB   286 kB/s
     http_req_blocked...............: avg=7.63µs   min=1.26µs  med=3.6µs    max=4.06ms   p(90)=5.12µs   p(95)=5.76µs   p(99.9)=1.97ms  
     http_req_connecting............: avg=3.76µs   min=0s      med=0s       max=4.02ms   p(90)=0s       p(95)=0s       p(99.9)=1.9ms   
     http_req_duration..............: avg=205.74ms min=19.48ms med=191.57ms max=696.06ms p(90)=237.64ms p(95)=269.12ms p(99.9)=646.95ms
       { expected_response:true }...: avg=205.74ms min=19.48ms med=191.57ms max=696.06ms p(90)=237.64ms p(95)=269.12ms p(99.9)=646.95ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29145
     http_req_receiving.............: avg=109.01µs min=34.09µs med=99.77µs  max=147.71ms p(90)=132.76µs p(95)=145.75µs p(99.9)=712.49µs
     http_req_sending...............: avg=36.76µs  min=6.45µs  med=18.4µs   max=203.16ms p(90)=23.5µs   p(95)=25.27µs  p(99.9)=675.21µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=205.59ms min=19.37ms med=191.44ms max=695.98ms p(90)=237.5ms  p(95)=268.93ms p(99.9)=646.85ms
     http_reqs......................: 29145   238.124658/s
     iteration_duration.............: avg=206.71ms min=45.41ms med=192.01ms max=696.28ms p(90)=238.06ms p(95)=270.34ms p(99.9)=647.16ms
     iterations.....................: 29045   237.307623/s
     success_rate...................: 100.00% ✓ 29045      ✗ 0    
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

     checks.........................: 100.00% ✓ 85254      ✗ 0    
     data_received..................: 2.5 GB  20 MB/s
     data_sent......................: 34 MB   279 kB/s
     http_req_blocked...............: avg=7.84µs   min=1.27µs  med=3.34µs   max=4.78ms   p(90)=4.72µs   p(95)=5.29µs   p(99.9)=2.08ms  
     http_req_connecting............: avg=4.3µs    min=0s      med=0s       max=4.71ms   p(90)=0s       p(95)=0s       p(99.9)=2.05ms  
     http_req_duration..............: avg=210.31ms min=21.14ms med=209.91ms max=457.55ms p(90)=225.25ms p(95)=230.9ms  p(99.9)=313.35ms
       { expected_response:true }...: avg=210.31ms min=21.14ms med=209.91ms max=457.55ms p(90)=225.25ms p(95)=230.9ms  p(99.9)=313.35ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 28518
     http_req_receiving.............: avg=97.18µs  min=34.73µs med=91.25µs  max=16.92ms  p(90)=127.07µs p(95)=141.24µs p(99.9)=728.41µs
     http_req_sending...............: avg=33.24µs  min=6.04µs  med=16.68µs  max=102.09ms p(90)=22.01µs  p(95)=24.02µs  p(99.9)=531.03µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=210.18ms min=20.99ms med=209.79ms max=456.33ms p(90)=225.13ms p(95)=230.76ms p(99.9)=313.26ms
     http_reqs......................: 28518   232.128598/s
     iteration_duration.............: avg=211.27ms min=64.15ms med=210.25ms max=463.39ms p(90)=225.54ms p(95)=231.22ms p(99.9)=322.19ms
     iterations.....................: 28418   231.314626/s
     success_rate...................: 100.00% ✓ 28418      ✗ 0    
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

     checks.........................: 100.00% ✓ 4491      ✗ 0   
     data_received..................: 153 MB  1.2 MB/s
     data_sent......................: 1.9 MB  15 kB/s
     http_req_blocked...............: avg=222.52µs min=1.37µs  med=3.53µs   max=9.65ms   p(90)=5.03µs   p(95)=6.07µs   p(99.9)=9.42ms  
     http_req_connecting............: avg=214.09µs min=0s      med=0s       max=9.48ms   p(90)=0s       p(95)=0s       p(99.9)=9.37ms  
     http_req_duration..............: avg=3.81s    min=56.64ms med=3.94s    max=6.37s    p(90)=4.83s    p(95)=5.1s     p(99.9)=6.34s   
       { expected_response:true }...: avg=3.81s    min=56.64ms med=3.94s    max=6.37s    p(90)=4.83s    p(95)=5.1s     p(99.9)=6.34s   
     http_req_failed................: 0.00%   ✓ 0         ✗ 1597
     http_req_receiving.............: avg=104.62µs min=37.69µs med=100.96µs max=471.42µs p(90)=145.24µs p(95)=157.27µs p(99.9)=406.65µs
     http_req_sending...............: avg=147.3µs  min=6.89µs  med=18.72µs  max=98.65ms  p(90)=24.48µs  p(95)=30.82µs  p(99.9)=14.56ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=3.81s    min=56.43ms med=3.94s    max=6.37s    p(90)=4.83s    p(95)=5.1s     p(99.9)=6.34s   
     http_reqs......................: 1597    12.372854/s
     iteration_duration.............: avg=4.06s    min=1.28s   med=4s       max=6.37s    p(90)=4.87s    p(95)=5.13s    p(99.9)=6.35s   
     iterations.....................: 1497    11.598098/s
     success_rate...................: 100.00% ✓ 1497      ✗ 0   
     vus............................: 15      min=0       max=50
     vus_max........................: 50      min=50      max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-185-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

