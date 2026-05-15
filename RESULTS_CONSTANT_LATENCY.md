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
| hive-router | v0.0.49 | 1,574 | 1,600 | 1,565 | 0.7% |  |
| hotchocolate | 16.1.0-p.1.10 | 1,444 | 1,461 | 1,439 | 0.5% |  |
| cosmo | 0.307.0 | 1,152 | 1,170 | 1,142 | 0.8% | non-compatible response (1 across 1/9 runs) |
| grafbase | 0.53.3 | 1,128 | 1,144 | 1,115 | 0.8% |  |
| hive-gateway-router-runtime | 2.5.25 | 519 | 532 | 515 | 1.1% |  |
| apollo-router | v2.13.1 | 362 | 374 | 357 | 1.6% |  |
| hive-gateway | 2.5.25 | 239 | 245 | 237 | 1.2% |  |
| apollo-gateway | 2.13.3 | 231 | 234 | 228 | 0.8% |  |


### Details

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.49)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 576147      ✗ 0     
     data_received..................: 17 GB   138 MB/s
     data_sent......................: 231 MB  1.9 MB/s
     http_req_blocked...............: avg=3.33µs  min=972ns   med=2.33µs  max=4.29ms   p(90)=4.19µs   p(95)=5.12µs  p(99.9)=37.6µs 
     http_req_connecting............: avg=542ns   min=0s      med=0s      max=4.23ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=30.99ms min=13.71ms med=30.72ms max=325.71ms p(90)=36.84ms  p(95)=38.81ms p(99.9)=56.32ms
       { expected_response:true }...: avg=30.99ms min=13.71ms med=30.72ms max=325.71ms p(90)=36.84ms  p(95)=38.81ms p(99.9)=56.32ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 192149
     http_req_receiving.............: avg=85.2µs  min=26.9µs  med=54.09µs max=97.82ms  p(90)=106.52µs p(95)=152.2µs p(99.9)=2.61ms 
     http_req_sending...............: avg=36.06µs min=5.17µs  med=9.9µs   max=104.61ms p(90)=20.03µs  p(95)=40.52µs p(99.9)=1.86ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=30.87ms min=13.62ms med=30.61ms max=325.07ms p(90)=36.71ms  p(95)=38.67ms p(99.9)=54.64ms
     http_reqs......................: 192149  1574.319082/s
     iteration_duration.............: avg=31.23ms min=13.95ms med=30.95ms max=336.02ms p(90)=37.06ms  p(95)=39.02ms p(99.9)=56.66ms
     iterations.....................: 192049  1573.49976/s
     success_rate...................: 100.00% ✓ 192049      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (.net subgraphs) (16.1.0-p.1.10)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 528249     ✗ 0     
     data_received..................: 15 GB   127 MB/s
     data_sent......................: 212 MB  1.7 MB/s
     http_req_blocked...............: avg=2.82µs   min=982ns   med=2.1µs    max=3.01ms   p(90)=3.89µs  p(95)=4.77µs   p(99.9)=31.59µs
     http_req_connecting............: avg=241ns    min=0s      med=0s       max=1.82ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=33.82ms  min=13.98ms med=32.49ms  max=698.85ms p(90)=41.4ms  p(95)=45.07ms  p(99.9)=90.48ms
       { expected_response:true }...: avg=33.82ms  min=13.98ms med=32.49ms  max=698.85ms p(90)=41.4ms  p(95)=45.07ms  p(99.9)=90.48ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 176183
     http_req_receiving.............: avg=778.68µs min=50.2µs  med=111.13µs max=252.41ms p(90)=2.22ms  p(95)=3.36ms   p(99.9)=17.13ms
     http_req_sending...............: avg=38.23µs  min=5.19µs  med=9.01µs   max=150.3ms  p(90)=19.96µs p(95)=107.47µs p(99.9)=2.54ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=33ms     min=13.73ms med=31.71ms  max=689.05ms p(90)=40.31ms p(95)=43.92ms  p(99.9)=84.69ms
     http_reqs......................: 176183  1444.0663/s
     iteration_duration.............: avg=34.06ms  min=14.27ms med=32.71ms  max=699.09ms p(90)=41.62ms p(95)=45.29ms  p(99.9)=95.55ms
     iterations.....................: 176083  1443.24666/s
     success_rate...................: 100.00% ✓ 176083     ✗ 0     
     vus............................: 42      min=0        max=50  
     vus_max........................: 50      min=50       max=50
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

     checks.........................: 100.00% ✓ 421809     ✗ 0     
     data_received..................: 12 GB   101 MB/s
     data_sent......................: 169 MB  1.4 MB/s
     http_req_blocked...............: avg=3.43µs  min=1.01µs  med=2.25µs  max=4.55ms   p(90)=3.92µs   p(95)=4.69µs   p(99.9)=35.53µs
     http_req_connecting............: avg=794ns   min=0s      med=0s      max=4.51ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=42.43ms min=19.5ms  med=41.8ms  max=314.1ms  p(90)=51.68ms  p(95)=54.81ms  p(99.9)=71.74ms
       { expected_response:true }...: avg=42.43ms min=19.5ms  med=41.8ms  max=314.1ms  p(90)=51.68ms  p(95)=54.81ms  p(99.9)=71.74ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 140703
     http_req_receiving.............: avg=86µs    min=28.06µs med=62.51µs max=210.19ms p(90)=107.26µs p(95)=132.79µs p(99.9)=1.68ms 
     http_req_sending...............: avg=27.01µs min=5.07µs  med=10.46µs max=200.68ms p(90)=18.4µs   p(95)=23.09µs  p(99.9)=1.14ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=42.32ms min=19.37ms med=41.7ms  max=302.12ms p(90)=51.56ms  p(95)=54.68ms  p(99.9)=71.45ms
     http_reqs......................: 140703  1152.93466/s
     iteration_duration.............: avg=42.66ms min=20.46ms med=42.01ms max=338.01ms p(90)=51.88ms  p(95)=55ms     p(99.9)=72.07ms
     iterations.....................: 140603  1152.11525/s
     success_rate...................: 100.00% ✓ 140603     ✗ 0     
     vus............................: 50      min=0        max=50  
     vus_max........................: 50      min=50       max=50
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

     checks.........................: 100.00% ✓ 412779      ✗ 0     
     data_received..................: 12 GB   99 MB/s
     data_sent......................: 165 MB  1.4 MB/s
     http_req_blocked...............: avg=3.54µs  min=972ns   med=2.17µs  max=4.28ms   p(90)=4.51µs   p(95)=5.71µs   p(99.9)=43.32µs
     http_req_connecting............: avg=760ns   min=0s      med=0s      max=4.24ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=43.33ms min=13.96ms med=42.88ms max=340.9ms  p(90)=52.67ms  p(95)=55.87ms  p(99.9)=81.77ms
       { expected_response:true }...: avg=43.33ms min=13.96ms med=42.88ms max=340.9ms  p(90)=52.67ms  p(95)=55.87ms  p(99.9)=81.77ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 137693
     http_req_receiving.............: avg=96.22µs min=29.1µs  med=58.02µs max=122.6ms  p(90)=129.52µs p(95)=213.75µs p(99.9)=3.19ms 
     http_req_sending...............: avg=37.99µs min=4.88µs  med=9.69µs  max=242.22ms p(90)=23.39µs  p(95)=112.34µs p(99.9)=2.12ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=43.19ms min=13.79ms med=42.76ms max=334.57ms p(90)=52.54ms  p(95)=55.69ms  p(99.9)=80.73ms
     http_reqs......................: 137693  1128.417426/s
     iteration_duration.............: avg=43.6ms  min=14.12ms med=43.12ms max=352.46ms p(90)=52.91ms  p(95)=56.11ms  p(99.9)=82.74ms
     iterations.....................: 137593  1127.597909/s
     success_rate...................: 100.00% ✓ 137593      ✗ 0     
     vus............................: 50      min=0         max=50  
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

     checks.........................: 100.00% ✓ 190695     ✗ 0    
     data_received..................: 5.6 GB  46 MB/s
     data_sent......................: 77 MB   625 kB/s
     http_req_blocked...............: avg=5.32µs  min=1.17µs  med=3.33µs  max=4.15ms   p(90)=4.98µs   p(95)=5.65µs   p(99.9)=56.16µs 
     http_req_connecting............: avg=1.7µs   min=0s      med=0s      max=4.1ms    p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=94.03ms min=19.75ms med=91.84ms max=365.72ms p(90)=110.92ms p(95)=120.25ms p(99.9)=215.3ms 
       { expected_response:true }...: avg=94.03ms min=19.75ms med=91.84ms max=365.72ms p(90)=110.92ms p(95)=120.25ms p(99.9)=215.3ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 63665
     http_req_receiving.............: avg=95.91µs min=32.23µs med=82.05µs max=165.34ms p(90)=118.08µs p(95)=132.57µs p(99.9)=1.03ms  
     http_req_sending...............: avg=27.67µs min=5.84µs  med=15.14µs max=154.62ms p(90)=21.71µs  p(95)=24.12µs  p(99.9)=712.63µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=93.91ms min=19.58ms med=91.72ms max=365.44ms p(90)=110.8ms  p(95)=120.13ms p(99.9)=215.06ms
     http_reqs......................: 63665   519.98502/s
     iteration_duration.............: avg=94.4ms  min=29.55ms med=92.09ms max=380.26ms p(90)=111.18ms p(95)=120.54ms p(99.9)=217.87ms
     iterations.....................: 63565   519.168268/s
     success_rate...................: 100.00% ✓ 63565      ✗ 0    
     vus............................: 50      min=0        max=50 
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

     checks.........................: 100.00% ✓ 132981     ✗ 0    
     data_received..................: 3.9 GB  32 MB/s
     data_sent......................: 53 MB   435 kB/s
     http_req_blocked...............: avg=6.1µs    min=1.22µs  med=3.5µs    max=4.68ms   p(90)=5.04µs   p(95)=5.65µs   p(99.9)=690.75µs
     http_req_connecting............: avg=2.42µs   min=0s      med=0s       max=4.64ms   p(90)=0s       p(95)=0s       p(99.9)=665.55µs
     http_req_duration..............: avg=134.86ms min=20.15ms med=132.97ms max=357.76ms p(90)=168.73ms p(95)=179.91ms p(99.9)=232.18ms
       { expected_response:true }...: avg=134.86ms min=20.15ms med=132.97ms max=357.76ms p(90)=168.73ms p(95)=179.91ms p(99.9)=232.18ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 44427
     http_req_receiving.............: avg=92.97µs  min=33.3µs  med=87.28µs  max=53.55ms  p(90)=120.79µs p(95)=133.76µs p(99.9)=639.93µs
     http_req_sending...............: avg=20.46µs  min=5.99µs  med=16.02µs  max=21.35ms  p(90)=21.73µs  p(95)=23.78µs  p(99.9)=579.45µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=134.75ms min=20ms    med=132.86ms max=357.15ms p(90)=168.6ms  p(95)=179.77ms p(99.9)=232.1ms 
     http_reqs......................: 44427   362.664647/s
     iteration_duration.............: avg=135.41ms min=53.97ms med=133.29ms max=397.49ms p(90)=169.05ms p(95)=180.21ms p(99.9)=237.62ms
     iterations.....................: 44327   361.848331/s
     success_rate...................: 100.00% ✓ 44327      ✗ 0    
     vus............................: 50      min=0        max=50 
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

     checks.........................: 100.00% ✓ 87621      ✗ 0    
     data_received..................: 2.6 GB  21 MB/s
     data_sent......................: 35 MB   288 kB/s
     http_req_blocked...............: avg=7.48µs   min=1.27µs  med=3.69µs   max=4.18ms   p(90)=5.21µs   p(95)=5.82µs   p(99.9)=1.8ms   
     http_req_connecting............: avg=3.54µs   min=0s      med=0s       max=4.13ms   p(90)=0s       p(95)=0s       p(99.9)=1.69ms  
     http_req_duration..............: avg=204.62ms min=18.57ms med=190.35ms max=633.39ms p(90)=294.12ms p(95)=390.77ms p(99.9)=593.53ms
       { expected_response:true }...: avg=204.62ms min=18.57ms med=190.35ms max=633.39ms p(90)=294.12ms p(95)=390.77ms p(99.9)=593.53ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29307
     http_req_receiving.............: avg=105.85µs min=33.84µs med=97.19µs  max=59.8ms   p(90)=130.69µs p(95)=143.86µs p(99.9)=912.83µs
     http_req_sending...............: avg=24.07µs  min=5.99µs  med=18.02µs  max=49.21ms  p(90)=23.05µs  p(95)=24.87µs  p(99.9)=599.4µs 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=204.49ms min=18.41ms med=190.23ms max=633.3ms  p(90)=293.99ms p(95)=390.65ms p(99.9)=593.43ms
     http_reqs......................: 29307   239.706854/s
     iteration_duration.............: avg=205.55ms min=54.13ms med=190.95ms max=633.59ms p(90)=294.63ms p(95)=392.15ms p(99.9)=593.88ms
     iterations.....................: 29207   238.888938/s
     success_rate...................: 100.00% ✓ 29207      ✗ 0    
     vus............................: 50      min=0        max=50 
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

     checks.........................: 100.00% ✓ 85164      ✗ 0    
     data_received..................: 2.5 GB  20 MB/s
     data_sent......................: 34 MB   278 kB/s
     http_req_blocked...............: avg=5.21µs   min=1.3µs   med=3.54µs   max=2.43ms   p(90)=4.9µs    p(95)=5.47µs   p(99.9)=539.16µs
     http_req_connecting............: avg=1.49µs   min=0s      med=0s       max=2.41ms   p(90)=0s       p(95)=0s       p(99.9)=514.77µs
     http_req_duration..............: avg=210.53ms min=20.65ms med=209.8ms  max=385.99ms p(90)=226.42ms p(95)=232.95ms p(99.9)=300.63ms
       { expected_response:true }...: avg=210.53ms min=20.65ms med=209.8ms  max=385.99ms p(90)=226.42ms p(95)=232.95ms p(99.9)=300.63ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 28488
     http_req_receiving.............: avg=96.8µs   min=33.67µs med=92.29µs  max=4.36ms   p(90)=125.03µs p(95)=137.74µs p(99.9)=552.55µs
     http_req_sending...............: avg=29.12µs  min=5.96µs  med=16.9µs   max=60.55ms  p(90)=22.12µs  p(95)=24.14µs  p(99.9)=592.57µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=210.41ms min=20.45ms med=209.69ms max=385.77ms p(90)=226.3ms  p(95)=232.82ms p(99.9)=300.51ms
     http_reqs......................: 28488   231.765875/s
     iteration_duration.............: avg=211.47ms min=77.52ms med=210.16ms max=392.85ms p(90)=226.73ms p(95)=233.35ms p(99.9)=306.33ms
     iterations.....................: 28388   230.952319/s
     success_rate...................: 100.00% ✓ 28388      ✗ 0    
     vus............................: 50      min=0        max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-177-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

