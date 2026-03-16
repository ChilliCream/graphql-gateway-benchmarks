## Overview for: `ramping-vus`

Each benchmark runs a GraphQL gateway with 4 subgraphs and executes a heavy nested query that exercises federation/composition capabilities. The benchmarks cover two schema composition approaches:

- **Apollo Federation** — subgraphs are built with Rust ([async-graphql](https://github.com/async-graphql/async-graphql) + axum)
- **Composite Schema** — subgraphs are built with .NET ([HotChocolate](https://github.com/ChilliCream/graphql-platform)) or Rust ([async-graphql](https://github.com/async-graphql/async-graphql) + axum)

**Methodology:** Each gateway executes 11 runs of 120s each. The first run is a full-duration warmup (discarded). The remaining 10 runs are measured. Results are ranked by **median RPS** across the 10 measured runs, with best/worst/CV% reported for transparency.

This scenario is a stress test that ramps up to **500 VUs** over **120s**.


### Comparison

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| grafbase | 0.53.2 | 1,492 | 1,492 | 1,492 | 0.0% |  |
| hive-router | v0.0.41 | 1,491 | 1,491 | 1,491 | 0.0% |  |
| hive-gateway-router-runtime | 2.5.6 | 1,488 | 1,488 | 1,488 | 0.0% |  |
| apollo-router | v2.12.0 | 1,487 | 1,487 | 1,487 | 0.0% |  |
| cosmo | 0.291.0 | 1,485 | 1,485 | 1,485 | 0.0% |  |
| apollo-gateway | 2.13.2 | 1,484 | 1,484 | 1,484 | 0.0% |  |
| hive-gateway | 2.5.6 | 1,480 | 1,480 | 1,480 | 0.0% |  |
| hotchocolate (rust subgraphs) | 16.0.0-p.11.45 | 1,398 | 1,398 | 1,398 | 0.0% |  |
| hotchocolate (.net subgraphs) | 16.0.0-p.11.45 | 1,323 | 1,323 | 1,323 | 0.0% |  |


<details>
  <summary>Summary for: grafbase (0.53.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 273684      ✗ 0    
     data_received..................: 8.1 GB  131 MB/s
     data_sent......................: 111 MB  1.8 MB/s
     http_req_blocked...............: avg=4.57µs   min=1.11µs med=2.29µs   max=22.13ms  p(90)=3.5µs    p(95)=4.19µs   p(99.9)=203.12µs
     http_req_connecting............: avg=1.72µs   min=0s     med=0s       max=22.06ms  p(90)=0s       p(95)=0s       p(99.9)=147.17µs
     http_req_duration..............: avg=151.83ms min=1.46ms med=147.8ms  max=384.63ms p(90)=298.35ms p(95)=318.93ms p(99.9)=359.9ms 
       { expected_response:true }...: avg=151.83ms min=1.46ms med=147.8ms  max=384.63ms p(90)=298.35ms p(95)=318.93ms p(99.9)=359.9ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 92228
     http_req_receiving.............: avg=72.34µs  min=28.8µs med=52.45µs  max=15.23ms  p(90)=79.04µs  p(95)=91.01µs  p(99.9)=2.82ms  
     http_req_sending...............: avg=26.74µs  min=5.15µs med=9.86µs   max=24.2ms   p(90)=14.22µs  p(95)=17.16µs  p(99.9)=3.49ms  
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=151.73ms min=1.4ms  med=147.7ms  max=384.57ms p(90)=298.21ms p(95)=318.85ms p(99.9)=359.75ms
     http_reqs......................: 92228   1492.662478/s
     iteration_duration.............: avg=153.71ms min=1.59ms med=149.99ms max=384.84ms p(90)=298.99ms p(95)=319.41ms p(99.9)=360.32ms
     iterations.....................: 91228   1476.477995/s
     success_rate...................: 100.00% ✓ 91228       ✗ 0    
     vus............................: 94      min=0         max=500
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-router (v0.0.41)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 273036      ✗ 0    
     data_received..................: 8.1 GB  131 MB/s
     data_sent......................: 111 MB  1.8 MB/s
     http_req_blocked...............: avg=4.7µs    min=1.09µs  med=2.05µs   max=15.02ms  p(90)=3.05µs   p(95)=3.73µs   p(99.9)=203.05µs
     http_req_connecting............: avg=2.12µs   min=0s      med=0s       max=14.97ms  p(90)=0s       p(95)=0s       p(99.9)=152.13µs
     http_req_duration..............: avg=152.16ms min=1.43ms  med=147.47ms max=397.65ms p(90)=300.17ms p(95)=320.45ms p(99.9)=363.1ms 
       { expected_response:true }...: avg=152.16ms min=1.43ms  med=147.47ms max=397.65ms p(90)=300.17ms p(95)=320.45ms p(99.9)=363.1ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 92012
     http_req_receiving.............: avg=68.38µs  min=27.58µs med=51.02µs  max=22.01ms  p(90)=75.91µs  p(95)=88.57µs  p(99.9)=2.6ms   
     http_req_sending...............: avg=27.16µs  min=5.08µs  med=9.48µs   max=22.66ms  p(90)=13.6µs   p(95)=16.51µs  p(99.9)=3.72ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=152.07ms min=1.37ms  med=147.37ms max=397.59ms p(90)=300.06ms p(95)=320.36ms p(99.9)=362.98ms
     http_reqs......................: 92012   1491.497086/s
     iteration_duration.............: avg=154.04ms min=1.65ms  med=149.75ms max=397.8ms  p(90)=300.88ms p(95)=320.92ms p(99.9)=363.39ms
     iterations.....................: 91012   1475.287275/s
     success_rate...................: 100.00% ✓ 91012       ✗ 0    
     vus............................: 90      min=0         max=499
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (2.5.6)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 272769      ✗ 0    
     data_received..................: 8.1 GB  131 MB/s
     data_sent......................: 110 MB  1.8 MB/s
     http_req_blocked...............: avg=4.37µs   min=1.05µs  med=2.06µs   max=25.44ms  p(90)=3.12µs   p(95)=3.79µs   p(99.9)=195.19µs
     http_req_connecting............: avg=1.8µs    min=0s      med=0s       max=25.38ms  p(90)=0s       p(95)=0s       p(99.9)=144.6µs 
     http_req_duration..............: avg=152.31ms min=1.52ms  med=148.73ms max=371.6ms  p(90)=298.67ms p(95)=318.75ms p(99.9)=355.72ms
       { expected_response:true }...: avg=152.31ms min=1.52ms  med=148.73ms max=371.6ms  p(90)=298.67ms p(95)=318.75ms p(99.9)=355.72ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 91923
     http_req_receiving.............: avg=67.78µs  min=27.73µs med=51.23µs  max=23.63ms  p(90)=75.86µs  p(95)=87.19µs  p(99.9)=2.56ms  
     http_req_sending...............: avg=24.64µs  min=5.2µs   med=9.46µs   max=9.8ms    p(90)=13.39µs  p(95)=16.1µs   p(99.9)=3.32ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=152.22ms min=1.45ms  med=148.64ms max=371.53ms p(90)=298.59ms p(95)=318.66ms p(99.9)=355.66ms
     http_reqs......................: 91923   1488.895783/s
     iteration_duration.............: avg=154.19ms min=1.7ms   med=150.86ms max=371.79ms p(90)=299.26ms p(95)=319.16ms p(99.9)=356.07ms
     iterations.....................: 90923   1472.698577/s
     success_rate...................: 100.00% ✓ 90923       ✗ 0    
     vus............................: 92      min=0         max=500
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-router (v2.12.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 272560      ✗ 0    
     data_received..................: 8.1 GB  131 MB/s
     data_sent......................: 110 MB  1.8 MB/s
     http_req_blocked...............: avg=5.15µs   min=1.11µs  med=2.29µs   max=20.58ms  p(90)=3.5µs    p(95)=4.17µs   p(99.9)=213.16µs
     http_req_connecting............: avg=2.19µs   min=0s      med=0s       max=20.53ms  p(90)=0s       p(95)=0s       p(99.9)=151.96µs
     http_req_duration..............: avg=152.45ms min=1.43ms  med=148.41ms max=388.66ms p(90)=300.87ms p(95)=320.33ms p(99.9)=359.86ms
       { expected_response:true }...: avg=152.45ms min=1.43ms  med=148.41ms max=388.66ms p(90)=300.87ms p(95)=320.33ms p(99.9)=359.86ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 91854
     http_req_receiving.............: avg=70.91µs  min=28.21µs med=52.73µs  max=20.36ms  p(90)=79.51µs  p(95)=91.06µs  p(99.9)=2.8ms   
     http_req_sending...............: avg=27.85µs  min=5.2µs   med=9.96µs   max=21.74ms  p(90)=14.29µs  p(95)=17.02µs  p(99.9)=3.75ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=152.35ms min=1.37ms  med=148.33ms max=388.57ms p(90)=300.78ms p(95)=320.25ms p(99.9)=359.63ms
     http_reqs......................: 91854   1487.936214/s
     iteration_duration.............: avg=154.34ms min=1.69ms  med=150.57ms max=389ms    p(90)=301.51ms p(95)=320.76ms p(99.9)=360.12ms
     iterations.....................: 90853   1471.721088/s
     success_rate...................: 100.00% ✓ 90853       ✗ 0    
     vus............................: 92      min=0         max=500
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (0.291.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 272157      ✗ 0    
     data_received..................: 8.0 GB  130 MB/s
     data_sent......................: 110 MB  1.8 MB/s
     http_req_blocked...............: avg=5.47µs   min=1.13µs  med=2.29µs   max=19.9ms   p(90)=3.48µs   p(95)=4.15µs   p(99.9)=208.68µs
     http_req_connecting............: avg=2.55µs   min=0s      med=0s       max=19.83ms  p(90)=0s       p(95)=0s       p(99.9)=150.4µs 
     http_req_duration..............: avg=152.66ms min=1.43ms  med=149.04ms max=384.02ms p(90)=299.26ms p(95)=317.94ms p(99.9)=360.37ms
       { expected_response:true }...: avg=152.66ms min=1.43ms  med=149.04ms max=384.02ms p(90)=299.26ms p(95)=317.94ms p(99.9)=360.37ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 91719
     http_req_receiving.............: avg=71.93µs  min=29.45µs med=52.61µs  max=19.3ms   p(90)=79.51µs  p(95)=93.1µs   p(99.9)=2.65ms  
     http_req_sending...............: avg=28.66µs  min=5.25µs  med=9.89µs   max=20.4ms   p(90)=14.3µs   p(95)=17.38µs  p(99.9)=3.81ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=152.56ms min=1.38ms  med=148.96ms max=383.48ms p(90)=299.15ms p(95)=317.82ms p(99.9)=360.29ms
     http_reqs......................: 91719   1485.682643/s
     iteration_duration.............: avg=154.56ms min=1.62ms  med=151.23ms max=384.24ms p(90)=299.88ms p(95)=318.45ms p(99.9)=360.65ms
     iterations.....................: 90719   1469.484444/s
     success_rate...................: 100.00% ✓ 90719       ✗ 0    
     vus............................: 91      min=0         max=500
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-gateway (2.13.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 272191      ✗ 0    
     data_received..................: 8.0 GB  130 MB/s
     data_sent......................: 110 MB  1.8 MB/s
     http_req_blocked...............: avg=4.75µs   min=1.09µs  med=2.11µs   max=22.71ms  p(90)=3.25µs   p(95)=3.94µs   p(99.9)=198.94µs
     http_req_connecting............: avg=2.08µs   min=0s      med=0s       max=22.66ms  p(90)=0s       p(95)=0s       p(99.9)=147.78µs
     http_req_duration..............: avg=152.62ms min=1.46ms  med=148.67ms max=390.44ms p(90)=299.91ms p(95)=319.2ms  p(99.9)=359.53ms
       { expected_response:true }...: avg=152.62ms min=1.46ms  med=148.67ms max=390.44ms p(90)=299.91ms p(95)=319.2ms  p(99.9)=359.53ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 91731
     http_req_receiving.............: avg=67.93µs  min=28.77µs med=51.42µs  max=11.72ms  p(90)=76.93µs  p(95)=87.8µs   p(99.9)=2.7ms   
     http_req_sending...............: avg=25.51µs  min=5.29µs  med=9.48µs   max=15.3ms   p(90)=13.54µs  p(95)=16.19µs  p(99.9)=3.48ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=152.52ms min=1.41ms  med=148.6ms  max=390.38ms p(90)=299.83ms p(95)=319.12ms p(99.9)=359.47ms
     http_reqs......................: 91731   1484.562441/s
     iteration_duration.............: avg=154.51ms min=1.65ms  med=150.85ms max=390.67ms p(90)=300.6ms  p(95)=319.7ms  p(99.9)=359.76ms
     iterations.....................: 90730   1468.362388/s
     success_rate...................: 100.00% ✓ 90730       ✗ 0    
     vus............................: 93      min=0         max=500
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (2.5.6)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 271330      ✗ 0    
     data_received..................: 8.0 GB  130 MB/s
     data_sent......................: 110 MB  1.8 MB/s
     http_req_blocked...............: avg=4.96µs   min=1.11µs  med=2.27µs   max=24.18ms  p(90)=3.53µs   p(95)=4.27µs   p(99.9)=194.06µs
     http_req_connecting............: avg=2.1µs    min=0s      med=0s       max=24.12ms  p(90)=0s       p(95)=0s       p(99.9)=142.24µs
     http_req_duration..............: avg=153.11ms min=1.47ms  med=148.94ms max=391ms    p(90)=300.8ms  p(95)=319.55ms p(99.9)=364.2ms 
       { expected_response:true }...: avg=153.11ms min=1.47ms  med=148.94ms max=391ms    p(90)=300.8ms  p(95)=319.55ms p(99.9)=364.2ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 91444
     http_req_receiving.............: avg=69.83µs  min=28.46µs med=52.52µs  max=18.9ms   p(90)=79.71µs  p(95)=91.77µs  p(99.9)=2.39ms  
     http_req_sending...............: avg=28.37µs  min=5.21µs  med=9.85µs   max=24.76ms  p(90)=14.23µs  p(95)=17.1µs   p(99.9)=3.91ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=153.01ms min=1.41ms  med=148.84ms max=390.95ms p(90)=300.71ms p(95)=319.44ms p(99.9)=364.09ms
     http_reqs......................: 91444   1480.21648/s
     iteration_duration.............: avg=155.01ms min=1.62ms  med=150.99ms max=391.21ms p(90)=301.35ms p(95)=320.06ms p(99.9)=364.52ms
     iterations.....................: 90443   1464.013156/s
     success_rate...................: 100.00% ✓ 90443       ✗ 0    
     vus............................: 94      min=0         max=500
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (rust subgraphs) (16.0.0-p.11.45)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 261903      ✗ 0    
     data_received..................: 7.7 GB  123 MB/s
     data_sent......................: 106 MB  1.7 MB/s
     http_req_blocked...............: avg=8.18µs   min=992ns   med=2.13µs   max=63.63ms p(90)=3.3µs    p(95)=4.17µs   p(99.9)=237.32µs
     http_req_connecting............: avg=5.42µs   min=0s      med=0s       max=63.58ms p(90)=0s       p(95)=0s       p(99.9)=183.76µs
     http_req_duration..............: avg=158.89ms min=2.7ms   med=67.24ms  max=2.77s   p(90)=428.91ms p(95)=593.07ms p(99.9)=1.71s   
       { expected_response:true }...: avg=158.89ms min=2.7ms   med=67.24ms  max=2.77s   p(90)=428.91ms p(95)=593.07ms p(99.9)=1.71s   
     http_req_failed................: 0.00%   ✓ 0           ✗ 88301
     http_req_receiving.............: avg=3.04ms   min=49.78µs med=104.84µs max=1.08s   p(90)=1.91ms   p(95)=5.75ms   p(99.9)=351.58ms
     http_req_sending...............: avg=40.04µs  min=5.33µs  med=9.39µs   max=94.54ms p(90)=14.74µs  p(95)=20.9µs   p(99.9)=5.76ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=155.8ms  min=2.59ms  med=65.71ms  max=2.77s   p(90)=421.77ms p(95)=585.18ms p(99.9)=1.7s    
     http_reqs......................: 88301   1398.021714/s
     iteration_duration.............: avg=160.94ms min=2.86ms  med=69.42ms  max=2.77s   p(90)=432.27ms p(95)=596.17ms p(99.9)=1.71s   
     iterations.....................: 87301   1382.189258/s
     success_rate...................: 100.00% ✓ 87301       ✗ 0    
     vus............................: 67      min=0         max=496
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (.net subgraphs) (16.0.0-p.11.45)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 245118      ✗ 0    
     data_received..................: 7.2 GB  116 MB/s
     data_sent......................: 99 MB   1.6 MB/s
     http_req_blocked...............: avg=10.04µs  min=1.06µs  med=2.53µs   max=100.92ms p(90)=4.18µs   p(95)=5.2µs    p(99.9)=401.7µs 
     http_req_connecting............: avg=6.82µs   min=0s      med=0s       max=100.77ms p(90)=0s       p(95)=0s       p(99.9)=326.97µs
     http_req_duration..............: avg=169.65ms min=1.96ms  med=86.11ms  max=2.44s    p(90)=438.05ms p(95)=615.99ms p(99.9)=1.62s   
       { expected_response:true }...: avg=169.65ms min=1.96ms  med=86.11ms  max=2.44s    p(90)=438.05ms p(95)=615.99ms p(99.9)=1.62s   
     http_req_failed................: 0.00%   ✓ 0           ✗ 82706
     http_req_receiving.............: avg=2.15ms   min=53.11µs med=108.29µs max=500.51ms p(90)=1.95ms   p(95)=4.53ms   p(99.9)=218.01ms
     http_req_sending...............: avg=46.79µs  min=5.52µs  med=10.52µs  max=49.55ms  p(90)=18.11µs  p(95)=25.14µs  p(99.9)=6.48ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=167.45ms min=1.85ms  med=84.47ms  max=2.43s    p(90)=432.13ms p(95)=611.99ms p(99.9)=1.59s   
     http_reqs......................: 82706   1323.539848/s
     iteration_duration.............: avg=171.97ms min=2.33ms  med=88.64ms  max=2.44s    p(90)=441.38ms p(95)=620.14ms p(99.9)=1.62s   
     iterations.....................: 81706   1307.536899/s
     success_rate...................: 100.00% ✓ 81706       ✗ 0    
     vus............................: 82      min=0         max=496
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

