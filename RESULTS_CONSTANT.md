## Overview for: `constant-vus-over-time`

Each benchmark runs a GraphQL gateway with 4 subgraphs and executes a heavy nested query that exercises federation/composition capabilities. The benchmarks cover two schema composition approaches:

- **Apollo Federation** — subgraphs are built with Rust ([async-graphql](https://github.com/async-graphql/async-graphql) + axum)
- **Composite Schema** — subgraphs are built with .NET ([HotChocolate](https://github.com/ChilliCream/graphql-platform)) or Rust ([async-graphql](https://github.com/async-graphql/async-graphql) + axum)

**Methodology:** Each gateway executes 11 runs of 120s each. The first run is a full-duration warmup (discarded). The remaining 10 runs are measured. Results are ranked by **median RPS** across the 10 measured runs, with best/worst/CV% reported for transparency.

This scenario executes a constant load of **50 VUs** over **120s**.


### Comparison

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hotchocolate (rust subgraphs) | 16.0.0-p.11.45 | 1,908 | 1,908 | 1,908 | 0.0% |  |
| hotchocolate (.net subgraphs) | 16.0.0-p.11.45 | 1,718 | 1,718 | 1,718 | 0.0% |  |
| cosmo | 0.291.0 | 1,642 | 1,642 | 1,642 | 0.0% |  |
| hive-router | v0.0.41 | 1,641 | 1,641 | 1,641 | 0.0% |  |
| apollo-router | v2.12.0 | 1,639 | 1,639 | 1,639 | 0.0% |  |
| grafbase | 0.53.2 | 1,624 | 1,624 | 1,624 | 0.0% |  |
| hive-gateway | 2.5.6 | 1,614 | 1,614 | 1,614 | 0.0% |  |
| apollo-gateway | 2.13.2 | 1,610 | 1,610 | 1,610 | 0.0% |  |
| hive-gateway-router-runtime | 2.5.6 | 1,605 | 1,605 | 1,605 | 0.0% |  |


<details>
  <summary>Summary for: hotchocolate (rust subgraphs) (16.0.0-p.11.45)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 688872      ✗ 0     
     data_received..................: 20 GB   167 MB/s
     data_sent......................: 276 MB  2.3 MB/s
     http_req_blocked...............: avg=2.99µs   min=1.05µs  med=2.22µs   max=8.72ms   p(90)=3.21µs   p(95)=3.72µs  p(99.9)=33.41µs 
     http_req_connecting............: avg=448ns    min=0s      med=0s       max=4.09ms   p(90)=0s       p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=25.9ms   min=2.81ms  med=14.29ms  max=446.32ms p(90)=63.4ms   p(95)=84.54ms p(99.9)=195.22ms
       { expected_response:true }...: avg=25.9ms   min=2.81ms  med=14.29ms  max=446.32ms p(90)=63.4ms   p(95)=84.54ms p(99.9)=195.22ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 229724
     http_req_receiving.............: avg=563.35µs min=51.16µs med=107.57µs max=269.88ms p(90)=715.35µs p(95)=1.07ms  p(99.9)=67.62ms 
     http_req_sending...............: avg=34.18µs  min=5.38µs  med=9.42µs   max=140.72ms p(90)=14.26µs  p(95)=24.52µs p(99.9)=1.73ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=25.3ms   min=2.63ms  med=13.83ms  max=446.15ms p(90)=62.28ms  p(95)=83.36ms p(99.9)=193.65ms
     http_reqs......................: 229724  1908.934956/s
     iteration_duration.............: avg=26.12ms  min=3.38ms  med=14.5ms   max=446.52ms p(90)=63.64ms  p(95)=84.8ms  p(99.9)=196.32ms
     iterations.....................: 229624  1908.103987/s
     success_rate...................: 100.00% ✓ 229624      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
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

     checks.........................: 100.00% ✓ 619848      ✗ 0     
     data_received..................: 18 GB   151 MB/s
     data_sent......................: 248 MB  2.1 MB/s
     http_req_blocked...............: avg=3.37µs  min=1.06µs  med=2.46µs   max=4.56ms   p(90)=3.65µs  p(95)=4.25µs  p(99.9)=36.41µs 
     http_req_connecting............: avg=564ns   min=0s      med=0s       max=4.52ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=28.8ms  min=2.24ms  med=18.03ms  max=847.93ms p(90)=66.16ms p(95)=86.72ms p(99.9)=222.26ms
       { expected_response:true }...: avg=28.8ms  min=2.24ms  med=18.03ms  max=847.93ms p(90)=66.16ms p(95)=86.72ms p(99.9)=222.26ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 206716
     http_req_receiving.............: avg=522µs   min=52.35µs med=112.22µs max=162.61ms p(90)=743.8µs p(95)=1.15ms  p(99.9)=59.5ms  
     http_req_sending...............: avg=34.31µs min=5.57µs  med=10.22µs  max=261.91ms p(90)=16.2µs  p(95)=24.12µs p(99.9)=1.64ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=28.25ms min=2.09ms  med=17.57ms  max=847.41ms p(90)=65.18ms p(95)=85.74ms p(99.9)=217.97ms
     http_reqs......................: 206716  1718.058407/s
     iteration_duration.............: avg=29.04ms min=2.74ms  med=18.25ms  max=848.09ms p(90)=66.39ms p(95)=86.96ms p(99.9)=224.06ms
     iterations.....................: 206616  1717.227287/s
     success_rate...................: 100.00% ✓ 206616      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
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

     checks.........................: 100.00% ✓ 592029      ✗ 0     
     data_received..................: 17 GB   144 MB/s
     data_sent......................: 237 MB  2.0 MB/s
     http_req_blocked...............: avg=2.91µs  min=1.07µs  med=2.13µs  max=4.19ms   p(90)=3.06µs  p(95)=3.55µs  p(99.9)=28.29µs
     http_req_connecting............: avg=512ns   min=0s      med=0s      max=4.16ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=30.19ms min=1.54ms  med=29.44ms max=291.03ms p(90)=46.12ms p(95)=51.65ms p(99.9)=83.5ms 
       { expected_response:true }...: avg=30.19ms min=1.54ms  med=29.44ms max=291.03ms p(90)=46.12ms p(95)=51.65ms p(99.9)=83.5ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 197443
     http_req_receiving.............: avg=77.98µs min=27.05µs med=51.41µs max=176.39ms p(90)=80.83µs p(95)=98.17µs p(99.9)=2.81ms 
     http_req_sending...............: avg=27.03µs min=5.44µs  med=9.43µs  max=209.38ms p(90)=13.31µs p(95)=17.1µs  p(99.9)=1.22ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=30.08ms min=1.49ms  med=29.34ms max=290.35ms p(90)=46.01ms p(95)=51.52ms p(99.9)=83.08ms
     http_reqs......................: 197443  1642.594482/s
     iteration_duration.............: avg=30.39ms min=1.93ms  med=29.63ms max=331.86ms p(90)=46.31ms p(95)=51.84ms p(99.9)=83.89ms
     iterations.....................: 197343  1641.762549/s
     success_rate...................: 100.00% ✓ 197343      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
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

     checks.........................: 100.00% ✓ 591723      ✗ 0     
     data_received..................: 17 GB   144 MB/s
     data_sent......................: 237 MB  2.0 MB/s
     http_req_blocked...............: avg=2.94µs  min=1.08µs  med=2.12µs  max=4.36ms   p(90)=3.07µs  p(95)=3.58µs   p(99.9)=27.97µs
     http_req_connecting............: avg=536ns   min=0s      med=0s      max=4.32ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=30.2ms  min=1.57ms  med=29.45ms max=284.51ms p(90)=47.28ms p(95)=53.07ms  p(99.9)=87.21ms
       { expected_response:true }...: avg=30.2ms  min=1.57ms  med=29.45ms max=284.51ms p(90)=47.28ms p(95)=53.07ms  p(99.9)=87.21ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 197341
     http_req_receiving.............: avg=79.37µs min=28.01µs med=51.59µs max=235.56ms p(90)=83.02µs p(95)=101.69µs p(99.9)=2.73ms 
     http_req_sending...............: avg=28.03µs min=5.21µs  med=9.28µs  max=173.18ms p(90)=13.11µs p(95)=17.07µs  p(99.9)=1.31ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=30.09ms min=1.51ms  med=29.35ms max=283.82ms p(90)=47.16ms p(95)=52.95ms  p(99.9)=86.96ms
     http_reqs......................: 197341  1641.773375/s
     iteration_duration.............: avg=30.41ms min=1.95ms  med=29.64ms max=334.92ms p(90)=47.47ms p(95)=53.26ms  p(99.9)=87.84ms
     iterations.....................: 197241  1640.941427/s
     success_rate...................: 100.00% ✓ 197241      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
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

     checks.........................: 100.00% ✓ 590910      ✗ 0     
     data_received..................: 17 GB   144 MB/s
     data_sent......................: 237 MB  2.0 MB/s
     http_req_blocked...............: avg=3.81µs  min=1.07µs  med=2.14µs  max=12.26ms  p(90)=3.13µs  p(95)=3.64µs  p(99.9)=30.32µs
     http_req_connecting............: avg=1.39µs  min=0s      med=0s      max=12.18ms  p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=30.24ms min=1.55ms  med=29.55ms max=305.94ms p(90)=45.21ms p(95)=50.25ms p(99.9)=77.09ms
       { expected_response:true }...: avg=30.24ms min=1.55ms  med=29.55ms max=305.94ms p(90)=45.21ms p(95)=50.25ms p(99.9)=77.09ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 197070
     http_req_receiving.............: avg=78.26µs min=27.55µs med=51.45µs max=83.84ms  p(90)=80.92µs p(95)=98.57µs p(99.9)=2.68ms 
     http_req_sending...............: avg=28.01µs min=5.38µs  med=9.41µs  max=165.34ms p(90)=13.17µs p(95)=17.31µs p(99.9)=1.42ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=30.14ms min=1.46ms  med=29.44ms max=303.78ms p(90)=45.11ms p(95)=50.12ms p(99.9)=76.91ms
     http_reqs......................: 197070  1639.554421/s
     iteration_duration.............: avg=30.45ms min=1.89ms  med=29.73ms max=335.33ms p(90)=45.4ms  p(95)=50.45ms p(99.9)=77.62ms
     iterations.....................: 196970  1638.722456/s
     success_rate...................: 100.00% ✓ 196970      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: grafbase (0.53.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 585624      ✗ 0     
     data_received..................: 17 GB   143 MB/s
     data_sent......................: 235 MB  2.0 MB/s
     http_req_blocked...............: avg=2.94µs  min=1.13µs  med=2.12µs  max=4.51ms   p(90)=3.07µs  p(95)=3.56µs  p(99.9)=28.74µs
     http_req_connecting............: avg=570ns   min=0s      med=0s      max=4.46ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=30.52ms min=1.57ms  med=29.86ms max=308.2ms  p(90)=46.1ms  p(95)=51.17ms p(99.9)=77.47ms
       { expected_response:true }...: avg=30.52ms min=1.57ms  med=29.86ms max=308.2ms  p(90)=46.1ms  p(95)=51.17ms p(99.9)=77.47ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 195308
     http_req_receiving.............: avg=78.82µs min=28.38µs med=51.46µs max=101.95ms p(90)=80.93µs p(95)=97.61µs p(99.9)=2.74ms 
     http_req_sending...............: avg=23.96µs min=5.56µs  med=9.38µs  max=103.23ms p(90)=13.19µs p(95)=17.02µs p(99.9)=1.27ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=30.41ms min=1.5ms   med=29.76ms max=274.74ms p(90)=45.99ms p(95)=51.06ms p(99.9)=77.24ms
     http_reqs......................: 195308  1624.836294/s
     iteration_duration.............: avg=30.73ms min=1.93ms  med=30.04ms max=337.29ms p(90)=46.29ms p(95)=51.36ms p(99.9)=78.27ms
     iterations.....................: 195208  1624.004359/s
     success_rate...................: 100.00% ✓ 195208      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
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

     checks.........................: 100.00% ✓ 581988      ✗ 0     
     data_received..................: 17 GB   142 MB/s
     data_sent......................: 233 MB  1.9 MB/s
     http_req_blocked...............: avg=2.7µs   min=1.05µs med=1.95µs  max=3.95ms   p(90)=2.84µs  p(95)=3.31µs  p(99.9)=25.23µs
     http_req_connecting............: avg=512ns   min=0s     med=0s      max=3.91ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=30.71ms min=1.56ms med=30.18ms max=322.02ms p(90)=47.61ms p(95)=53.11ms p(99.9)=81.67ms
       { expected_response:true }...: avg=30.71ms min=1.56ms med=30.18ms max=322.02ms p(90)=47.61ms p(95)=53.11ms p(99.9)=81.67ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 194096
     http_req_receiving.............: avg=75.78µs min=27.3µs med=50.49µs max=128.21ms p(90)=79.44µs p(95)=96.63µs p(99.9)=2.58ms 
     http_req_sending...............: avg=23.19µs min=5.14µs med=8.9µs   max=119.51ms p(90)=12.63µs p(95)=16.11µs p(99.9)=1.19ms 
     http_req_tls_handshaking.......: avg=0s      min=0s     med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=30.62ms min=1.47ms med=30.09ms max=321.27ms p(90)=47.5ms  p(95)=52.99ms p(99.9)=81.28ms
     http_reqs......................: 194096  1614.765241/s
     iteration_duration.............: avg=30.92ms min=1.93ms med=30.37ms max=353.3ms  p(90)=47.79ms p(95)=53.3ms  p(99.9)=82.28ms
     iterations.....................: 193996  1613.933299/s
     success_rate...................: 100.00% ✓ 193996      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
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

     checks.........................: 100.00% ✓ 580446      ✗ 0     
     data_received..................: 17 GB   141 MB/s
     data_sent......................: 233 MB  1.9 MB/s
     http_req_blocked...............: avg=2.58µs  min=1.12µs  med=2.11µs  max=2.5ms    p(90)=3.05µs  p(95)=3.53µs  p(99.9)=27.37µs
     http_req_connecting............: avg=234ns   min=0s      med=0s      max=2.48ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=30.79ms min=1.46ms  med=30.43ms max=310.21ms p(90)=46.53ms p(95)=51.47ms p(99.9)=76.87ms
       { expected_response:true }...: avg=30.79ms min=1.46ms  med=30.43ms max=310.21ms p(90)=46.53ms p(95)=51.47ms p(99.9)=76.87ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 193582
     http_req_receiving.............: avg=75.98µs min=28.64µs med=51.58µs max=86.42ms  p(90)=81.33µs p(95)=98.85µs p(99.9)=2.56ms 
     http_req_sending...............: avg=26.04µs min=5.31µs  med=9.34µs  max=90.72ms  p(90)=13.22µs p(95)=17.13µs p(99.9)=1.27ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=30.69ms min=1.38ms  med=30.34ms max=310.01ms p(90)=46.41ms p(95)=51.35ms p(99.9)=76.54ms
     http_reqs......................: 193582  1610.550958/s
     iteration_duration.............: avg=31ms    min=2.07ms  med=30.62ms max=335.37ms p(90)=46.72ms p(95)=51.66ms p(99.9)=77.31ms
     iterations.....................: 193482  1609.718984/s
     success_rate...................: 100.00% ✓ 193482      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
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

     checks.........................: 100.00% ✓ 578766      ✗ 0     
     data_received..................: 17 GB   141 MB/s
     data_sent......................: 232 MB  1.9 MB/s
     http_req_blocked...............: avg=2.86µs  min=1.12µs  med=2.12µs  max=3.85ms   p(90)=3.07µs  p(95)=3.55µs  p(99.9)=27.35µs
     http_req_connecting............: avg=505ns   min=0s      med=0s      max=3.82ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=30.88ms min=1.54ms  med=30.45ms max=292.27ms p(90)=48.91ms p(95)=54.57ms p(99.9)=84.32ms
       { expected_response:true }...: avg=30.88ms min=1.54ms  med=30.45ms max=292.27ms p(90)=48.91ms p(95)=54.57ms p(99.9)=84.32ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 193022
     http_req_receiving.............: avg=84.31µs min=28.26µs med=51.54µs max=149.98ms p(90)=80.94µs p(95)=97.89µs p(99.9)=2.73ms 
     http_req_sending...............: avg=27.68µs min=5.37µs  med=9.28µs  max=186.37ms p(90)=13.1µs  p(95)=16.75µs p(99.9)=1.31ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=30.77ms min=1.48ms  med=30.36ms max=209.64ms p(90)=48.8ms  p(95)=54.45ms p(99.9)=83.83ms
     http_reqs......................: 193022  1605.896306/s
     iteration_duration.............: avg=31.09ms min=1.97ms  med=30.64ms max=356.01ms p(90)=49.1ms  p(95)=54.76ms p(99.9)=84.85ms
     iterations.....................: 192922  1605.06433/s
     success_rate...................: 100.00% ✓ 192922      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

