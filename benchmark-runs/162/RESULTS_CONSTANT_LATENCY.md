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
| hive-router | v0.0.49 | 1,590 | 1,613 | 1,577 | 0.8% |  |
| hotchocolate | 16.1.0-p.1.9 | 1,461 | 1,473 | 1,450 | 0.6% |  |
| cosmo | 0.307.0 | 1,164 | 1,180 | 1,155 | 0.7% | non-compatible response (1 across 1/9 runs) |
| grafbase | 0.53.3 | 1,145 | 1,163 | 1,132 | 0.9% |  |
| hive-gateway-router-runtime | 2.5.25 | 494 | 508 | 488 | 1.4% |  |
| apollo-router | v2.13.1 | 367 | 378 | 362 | 1.5% |  |
| apollo-gateway | 2.13.3 | 238 | 239 | 235 | 0.6% |  |
| hive-gateway | 2.5.25 | 238 | 242 | 235 | 1.1% |  |


### Details

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.49)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 581820      ✗ 0     
     data_received..................: 17 GB   139 MB/s
     data_sent......................: 233 MB  1.9 MB/s
     http_req_blocked...............: avg=3.1µs   min=992ns   med=2.08µs  max=4.09ms   p(90)=3.93µs   p(95)=4.87µs  p(99.9)=34.68µs
     http_req_connecting............: avg=525ns   min=0s      med=0s      max=4.05ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=30.69ms min=13.64ms med=30.43ms max=337.94ms p(90)=36.5ms   p(95)=38.41ms p(99.9)=57.9ms 
       { expected_response:true }...: avg=30.69ms min=13.64ms med=30.43ms max=337.94ms p(90)=36.5ms   p(95)=38.41ms p(99.9)=57.9ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 194040
     http_req_receiving.............: avg=98.76µs min=27.17µs med=50.98µs max=188.52ms p(90)=101.81µs p(95)=147.4µs p(99.9)=2.62ms 
     http_req_sending...............: avg=34.08µs min=5.1µs   med=9.24µs  max=263.27ms p(90)=19.48µs  p(95)=42.95µs p(99.9)=1.73ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=30.56ms min=13.59ms med=30.33ms max=149.74ms p(90)=36.38ms  p(95)=38.27ms p(99.9)=56.34ms
     http_reqs......................: 194040  1590.335975/s
     iteration_duration.............: avg=30.92ms min=13.83ms med=30.65ms max=364.39ms p(90)=36.71ms  p(95)=38.63ms p(99.9)=58.3ms 
     iterations.....................: 193940  1589.516383/s
     success_rate...................: 100.00% ✓ 193940      ✗ 0     
     vus............................: 50      min=0         max=50  
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

     checks.........................: 100.00% ✓ 534909      ✗ 0     
     data_received..................: 16 GB   128 MB/s
     data_sent......................: 214 MB  1.8 MB/s
     http_req_blocked...............: avg=3.12µs   min=1.01µs  med=2.02µs   max=3.95ms   p(90)=3.87µs  p(95)=4.8µs    p(99.9)=29.46µs
     http_req_connecting............: avg=608ns    min=0s      med=0s       max=3.9ms    p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=33.4ms   min=14.62ms med=32.21ms  max=692.23ms p(90)=41.05ms p(95)=44.66ms  p(99.9)=81.68ms
       { expected_response:true }...: avg=33.4ms   min=14.62ms med=32.21ms  max=692.23ms p(90)=41.05ms p(95)=44.66ms  p(99.9)=81.68ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 178403
     http_req_receiving.............: avg=755.45µs min=50.67µs med=109.96µs max=76.36ms  p(90)=2.17ms  p(95)=3.32ms   p(99.9)=16.3ms 
     http_req_sending...............: avg=39.14µs  min=4.75µs  med=8.91µs   max=141.61ms p(90)=20µs    p(95)=105.92µs p(99.9)=3.02ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=32.61ms  min=14.52ms med=31.45ms  max=692.13ms p(90)=39.97ms p(95)=43.47ms  p(99.9)=80.04ms
     http_reqs......................: 178403  1461.802118/s
     iteration_duration.............: avg=33.64ms  min=14.82ms med=32.43ms  max=692.41ms p(90)=41.27ms p(95)=44.88ms  p(99.9)=82.03ms
     iterations.....................: 178303  1460.982736/s
     success_rate...................: 100.00% ✓ 178303      ✗ 0     
     vus............................: 50      min=0         max=50  
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

     checks.........................: 100.00% ✓ 426054      ✗ 0     
     data_received..................: 12 GB   102 MB/s
     data_sent......................: 171 MB  1.4 MB/s
     http_req_blocked...............: avg=3.38µs  min=1.08µs  med=2.21µs  max=4.51ms   p(90)=3.9µs    p(95)=4.72µs   p(99.9)=35.4µs 
     http_req_connecting............: avg=705ns   min=0s      med=0s      max=4.01ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=42.01ms min=15.75ms med=41.41ms max=333.26ms p(90)=50.99ms  p(95)=54.04ms  p(99.9)=70.57ms
       { expected_response:true }...: avg=42.01ms min=15.75ms med=41.41ms max=333.26ms p(90)=50.99ms  p(95)=54.04ms  p(99.9)=70.57ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 142118
     http_req_receiving.............: avg=84.11µs min=27.2µs  med=62.14µs max=172.42ms p(90)=107.92µs p(95)=134.16µs p(99.9)=1.68ms 
     http_req_sending...............: avg=28.84µs min=5.25µs  med=10.44µs max=187.19ms p(90)=18.45µs  p(95)=23.51µs  p(99.9)=1.18ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=41.89ms min=15.59ms med=41.31ms max=318.57ms p(90)=50.88ms  p(95)=53.92ms  p(99.9)=69.88ms
     http_reqs......................: 142118  1164.594293/s
     iteration_duration.............: avg=42.24ms min=21.52ms med=41.62ms max=360.89ms p(90)=51.19ms  p(95)=54.24ms  p(99.9)=71.18ms
     iterations.....................: 142018  1163.774837/s
     success_rate...................: 100.00% ✓ 142018      ✗ 0     
     vus............................: 50      min=0         max=50  
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

     checks.........................: 100.00% ✓ 418848      ✗ 0     
     data_received..................: 12 GB   100 MB/s
     data_sent......................: 168 MB  1.4 MB/s
     http_req_blocked...............: avg=3.67µs  min=961ns   med=2.23µs  max=4.3ms    p(90)=4.8µs    p(95)=6µs      p(99.9)=49.36µs
     http_req_connecting............: avg=771ns   min=0s      med=0s      max=4.25ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=42.69ms min=15.36ms med=42.15ms max=333.22ms p(90)=51.99ms  p(95)=55.3ms   p(99.9)=79.58ms
       { expected_response:true }...: avg=42.69ms min=15.36ms med=42.15ms max=333.22ms p(90)=51.99ms  p(95)=55.3ms   p(99.9)=79.58ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 139716
     http_req_receiving.............: avg=96.13µs min=29.09µs med=59.88µs max=132.98ms p(90)=132.64µs p(95)=199.53µs p(99.9)=2.73ms 
     http_req_sending...............: avg=38.77µs min=5.24µs  med=9.86µs  max=176.73ms p(90)=23.67µs  p(95)=109.07µs p(99.9)=1.97ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=42.56ms min=15.23ms med=42.03ms max=332.56ms p(90)=51.83ms  p(95)=55.13ms  p(99.9)=79.3ms 
     http_reqs......................: 139716  1145.032609/s
     iteration_duration.............: avg=42.97ms min=18.23ms med=42.4ms  max=380.95ms p(90)=52.23ms  p(95)=55.53ms  p(99.9)=80.06ms
     iterations.....................: 139616  1144.213066/s
     success_rate...................: 100.00% ✓ 139616      ✗ 0     
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

     checks.........................: 100.00% ✓ 181224    ✗ 0    
     data_received..................: 5.3 GB  43 MB/s
     data_sent......................: 73 MB   594 kB/s
     http_req_blocked...............: avg=4.86µs   min=1.15µs  med=2.91µs   max=3.87ms   p(90)=4.55µs   p(95)=5.18µs   p(99.9)=54.13µs 
     http_req_connecting............: avg=1.66µs   min=0s      med=0s       max=3.82ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=98.98ms  min=22.36ms med=103.83ms max=368.38ms p(90)=130.28ms p(95)=140.75ms p(99.9)=238.89ms
       { expected_response:true }...: avg=98.98ms  min=22.36ms med=103.83ms max=368.38ms p(90)=130.28ms p(95)=140.75ms p(99.9)=238.89ms
     http_req_failed................: 0.00%   ✓ 0         ✗ 60508
     http_req_receiving.............: avg=153.36µs min=31.2µs  med=77.82µs  max=254.27ms p(90)=113.66µs p(95)=127.16µs p(99.9)=1.08ms  
     http_req_sending...............: avg=22.85µs  min=5.86µs  med=13.68µs  max=72.19ms  p(90)=20.38µs  p(95)=22.68µs  p(99.9)=745.56µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=98.8ms   min=22.25ms med=103.72ms max=265.99ms p(90)=130.11ms p(95)=140.48ms p(99.9)=235.98ms
     http_reqs......................: 60508   494.28984/s
     iteration_duration.............: avg=99.34ms  min=29.94ms med=104.09ms max=379.14ms p(90)=130.52ms p(95)=141.05ms p(99.9)=240.06ms
     iterations.....................: 60408   493.47294/s
     success_rate...................: 100.00% ✓ 60408     ✗ 0    
     vus............................: 50      min=0       max=50 
     vus_max........................: 50      min=50      max=50
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

     checks.........................: 100.00% ✓ 134565     ✗ 0    
     data_received..................: 3.9 GB  32 MB/s
     data_sent......................: 54 MB   441 kB/s
     http_req_blocked...............: avg=6.04µs   min=1.14µs  med=3.37µs   max=4.72ms   p(90)=4.9µs    p(95)=5.5µs    p(99.9)=830.38µs
     http_req_connecting............: avg=2.49µs   min=0s      med=0s       max=4.68ms   p(90)=0s       p(95)=0s       p(99.9)=807.71µs
     http_req_duration..............: avg=133.27ms min=21.3ms  med=131.23ms max=360.06ms p(90)=166.76ms p(95)=177.57ms p(99.9)=227.36ms
       { expected_response:true }...: avg=133.27ms min=21.3ms  med=131.23ms max=360.06ms p(90)=166.76ms p(95)=177.57ms p(99.9)=227.36ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 44955
     http_req_receiving.............: avg=91.64µs  min=30.97µs med=85.59µs  max=34.83ms  p(90)=119.68µs p(95)=133µs    p(99.9)=806.38µs
     http_req_sending...............: avg=24.33µs  min=5.99µs  med=16.06µs  max=98.58ms  p(90)=21.82µs  p(95)=23.77µs  p(99.9)=597.05µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=133.16ms min=21.12ms med=131.11ms max=359.91ms p(90)=166.63ms p(95)=177.45ms p(99.9)=227.3ms 
     http_reqs......................: 44955   367.041905/s
     iteration_duration.............: avg=133.79ms min=37.79ms med=131.52ms max=390.31ms p(90)=167.07ms p(95)=177.87ms p(99.9)=232ms   
     iterations.....................: 44855   366.225439/s
     success_rate...................: 100.00% ✓ 44855      ✗ 0    
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

     checks.........................: 100.00% ✓ 87594      ✗ 0    
     data_received..................: 2.6 GB  21 MB/s
     data_sent......................: 35 MB   286 kB/s
     http_req_blocked...............: avg=7.34µs   min=1.28µs  med=3.48µs   max=4.15ms   p(90)=4.98µs   p(95)=5.57µs   p(99.9)=1.91ms  
     http_req_connecting............: avg=3.59µs   min=0s      med=0s       max=4.11ms   p(90)=0s       p(95)=0s       p(99.9)=1.89ms  
     http_req_duration..............: avg=204.73ms min=21.89ms med=204.35ms max=438.73ms p(90)=220.3ms  p(95)=226.66ms p(99.9)=293.77ms
       { expected_response:true }...: avg=204.73ms min=21.89ms med=204.35ms max=438.73ms p(90)=220.3ms  p(95)=226.66ms p(99.9)=293.77ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29298
     http_req_receiving.............: avg=100.19µs min=32.33µs med=92.01µs  max=107.84ms p(90)=126.02µs p(95)=139.37µs p(99.9)=479.95µs
     http_req_sending...............: avg=34.95µs  min=5.95µs  med=17.49µs  max=197.42ms p(90)=22.89µs  p(95)=24.95µs  p(99.9)=564.89µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=204.59ms min=21.68ms med=204.23ms max=438.12ms p(90)=220.18ms p(95)=226.54ms p(99.9)=293.65ms
     http_reqs......................: 29298   238.40858/s
     iteration_duration.............: avg=205.65ms min=60.04ms med=204.68ms max=459.51ms p(90)=220.58ms p(95)=226.99ms p(99.9)=314.12ms
     iterations.....................: 29198   237.594843/s
     success_rate...................: 100.00% ✓ 29198      ✗ 0    
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

     checks.........................: 100.00% ✓ 87153      ✗ 0    
     data_received..................: 2.6 GB  21 MB/s
     data_sent......................: 35 MB   286 kB/s
     http_req_blocked...............: avg=7.24µs   min=1.27µs  med=3.5µs    max=4.48ms   p(90)=4.95µs   p(95)=5.53µs   p(99.9)=1.74ms  
     http_req_connecting............: avg=3.54µs   min=0s      med=0s       max=4.44ms   p(90)=0s       p(95)=0s       p(99.9)=1.71ms  
     http_req_duration..............: avg=205.72ms min=18.69ms med=190.79ms max=810.54ms p(90)=334.21ms p(95)=382.36ms p(99.9)=681.89ms
       { expected_response:true }...: avg=205.72ms min=18.69ms med=190.79ms max=810.54ms p(90)=334.21ms p(95)=382.36ms p(99.9)=681.89ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29151
     http_req_receiving.............: avg=104.54µs min=32.46µs med=93.95µs  max=68.2ms   p(90)=126.17µs p(95)=139.95µs p(99.9)=616.03µs
     http_req_sending...............: avg=29.02µs  min=6.33µs  med=17.39µs  max=56.62ms  p(90)=22.53µs  p(95)=24.38µs  p(99.9)=614.68µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=205.59ms min=18.53ms med=190.59ms max=810.38ms p(90)=334.1ms  p(95)=382.24ms p(99.9)=681.8ms 
     http_reqs......................: 29151   238.436381/s
     iteration_duration.............: avg=206.66ms min=36.3ms  med=192.47ms max=810.81ms p(90)=334.89ms p(95)=382.97ms p(99.9)=682.12ms
     iterations.....................: 29051   237.618445/s
     success_rate...................: 100.00% ✓ 29051      ✗ 0    
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

