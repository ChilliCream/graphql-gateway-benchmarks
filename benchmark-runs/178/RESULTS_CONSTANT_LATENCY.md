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
| hive-router | v0.0.49 | 1,605 | 1,605 | 1,592 | 0.6% |  |
| hotchocolate | 16.1.0-p.1.10 | 1,450 | 1,465 | 1,443 | 0.5% |  |
| grafbase | 0.53.3 | 1,156 | 1,156 | 1,129 | 1.7% |  |
| cosmo | 0.307.0 | 1,146 | 1,154 | 1,144 | 0.5% |  |
| hive-gateway-router-runtime | 2.5.25 | 510 | 516 | 503 | 1.0% |  |
| apollo-gateway | 2.13.3 | 239 | 239 | 238 | 0.3% |  |
| apollo-router | — | — | — | — | — | benchmark run failed |
| hive-gateway | — | — | — | — | — | benchmark run failed |


### Details

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.49)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 587298      ✗ 0     
     data_received..................: 17 GB   140 MB/s
     data_sent......................: 235 MB  1.9 MB/s
     http_req_blocked...............: avg=3.39µs  min=982ns   med=2.38µs  max=4.36ms   p(90)=4.02µs   p(95)=4.87µs  p(99.9)=33.34µs
     http_req_connecting............: avg=589ns   min=0s      med=0s      max=4.29ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=30.39ms min=13.67ms med=30.22ms max=310.2ms  p(90)=36.01ms  p(95)=37.85ms p(99.9)=52.02ms
       { expected_response:true }...: avg=30.39ms min=13.67ms med=30.22ms max=310.2ms  p(90)=36.01ms  p(95)=37.85ms p(99.9)=52.02ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 195866
     http_req_receiving.............: avg=81.73µs min=27.54µs med=53.13µs max=138.74ms p(90)=102.11µs p(95)=147.8µs p(99.9)=1.84ms 
     http_req_sending...............: avg=33.47µs min=5.03µs  med=9.82µs  max=264.6ms  p(90)=19.36µs  p(95)=50.9µs  p(99.9)=1.62ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=30.28ms min=13.61ms med=30.11ms max=294.22ms p(90)=35.89ms  p(95)=37.73ms p(99.9)=50.78ms
     http_reqs......................: 195866  1605.408828/s
     iteration_duration.............: avg=30.64ms min=13.87ms med=30.44ms max=361.36ms p(90)=36.22ms  p(95)=38.07ms p(99.9)=52.54ms
     iterations.....................: 195766  1604.589181/s
     success_rate...................: 100.00% ✓ 195766      ✗ 0     
     vus............................: 46      min=0         max=50  
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

     checks.........................: 100.00% ✓ 530394      ✗ 0     
     data_received..................: 16 GB   127 MB/s
     data_sent......................: 213 MB  1.7 MB/s
     http_req_blocked...............: avg=3.36µs   min=971ns   med=2.31µs  max=4.07ms   p(90)=3.98µs  p(95)=4.87µs   p(99.9)=34.38µs
     http_req_connecting............: avg=597ns    min=0s      med=0s      max=4.03ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=33.68ms  min=14.35ms med=32.64ms max=545.44ms p(90)=41.31ms p(95)=44.53ms  p(99.9)=83.13ms
       { expected_response:true }...: avg=33.68ms  min=14.35ms med=32.64ms max=545.44ms p(90)=41.31ms p(95)=44.53ms  p(99.9)=83.13ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 176898
     http_req_receiving.............: avg=831.61µs min=51.04µs med=119.3µs max=193.54ms p(90)=2.38ms  p(95)=3.55ms   p(99.9)=16.77ms
     http_req_sending...............: avg=36.16µs  min=5.22µs  med=9.38µs  max=96.76ms  p(90)=19.65µs p(95)=104.83µs p(99.9)=2.41ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=32.81ms  min=14.26ms med=31.82ms max=535.27ms p(90)=40.2ms  p(95)=43.27ms  p(99.9)=81.91ms
     http_reqs......................: 176898  1450.007874/s
     iteration_duration.............: avg=33.92ms  min=14.61ms med=32.87ms max=545.67ms p(90)=41.52ms p(95)=44.75ms  p(99.9)=83.64ms
     iterations.....................: 176798  1449.188188/s
     success_rate...................: 100.00% ✓ 176798      ✗ 0     
     vus............................: 16      min=0         max=50  
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

     checks.........................: 100.00% ✓ 422820      ✗ 0     
     data_received..................: 12 GB   101 MB/s
     data_sent......................: 169 MB  1.4 MB/s
     http_req_blocked...............: avg=3.68µs  min=992ns   med=2.36µs  max=3.99ms   p(90)=4.75µs   p(95)=5.85µs   p(99.9)=45.42µs
     http_req_connecting............: avg=701ns   min=0s      med=0s      max=3.95ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=42.29ms min=15.93ms med=41.84ms max=325.79ms p(90)=51.27ms  p(95)=54.26ms  p(99.9)=77.34ms
       { expected_response:true }...: avg=42.29ms min=15.93ms med=41.84ms max=325.79ms p(90)=51.27ms  p(95)=54.26ms  p(99.9)=77.34ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 141040
     http_req_receiving.............: avg=92.32µs min=29.18µs med=59.06µs max=24.66ms  p(90)=129.45µs p(95)=196.78µs p(99.9)=2.84ms 
     http_req_sending...............: avg=41.22µs min=5.08µs  med=10.02µs max=186.09ms p(90)=23.21µs  p(95)=110.76µs p(99.9)=2.17ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=42.15ms min=15.86ms med=41.72ms max=325.16ms p(90)=51.13ms  p(95)=54.11ms  p(99.9)=76.77ms
     http_reqs......................: 141040  1156.067055/s
     iteration_duration.............: avg=42.56ms min=16.15ms med=42.08ms max=367.49ms p(90)=51.5ms   p(95)=54.49ms  p(99.9)=77.7ms 
     iterations.....................: 140940  1155.247382/s
     success_rate...................: 100.00% ✓ 140940      ✗ 0     
     vus............................: 34      min=0         max=50  
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

     checks.........................: 100.00% ✓ 419574      ✗ 0     
     data_received..................: 12 GB   100 MB/s
     data_sent......................: 168 MB  1.4 MB/s
     http_req_blocked...............: avg=3.52µs  min=1µs     med=2.47µs  max=3.91ms   p(90)=4.06µs   p(95)=4.82µs   p(99.9)=38.09µs
     http_req_connecting............: avg=664ns   min=0s      med=0s      max=3.88ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=42.66ms min=19.19ms med=42.09ms max=351.33ms p(90)=51.93ms  p(95)=54.99ms  p(99.9)=70.97ms
       { expected_response:true }...: avg=42.66ms min=19.19ms med=42.09ms max=351.33ms p(90)=51.93ms  p(95)=54.99ms  p(99.9)=70.97ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 139958
     http_req_receiving.............: avg=85.36µs min=27.78µs med=62.05µs max=220.28ms p(90)=106.34µs p(95)=132.48µs p(99.9)=1.8ms  
     http_req_sending...............: avg=31.11µs min=5.17µs  med=10.83µs max=205.89ms p(90)=18.35µs  p(95)=23.17µs  p(99.9)=1.29ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=42.54ms min=18.5ms  med=41.98ms max=350.57ms p(90)=51.81ms  p(95)=54.87ms  p(99.9)=70.22ms
     http_reqs......................: 139958  1146.951331/s
     iteration_duration.............: avg=42.89ms min=19.39ms med=42.3ms  max=361.48ms p(90)=52.13ms  p(95)=55.19ms  p(99.9)=71.62ms
     iterations.....................: 139858  1146.131835/s
     success_rate...................: 100.00% ✓ 139858      ✗ 0     
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

     checks.........................: 100.00% ✓ 188856     ✗ 0    
     data_received..................: 5.5 GB  45 MB/s
     data_sent......................: 76 MB   613 kB/s
     http_req_blocked...............: avg=3.84µs  min=1.14µs  med=2.93µs  max=1.83ms   p(90)=4.49µs   p(95)=5.11µs   p(99.9)=69.12µs 
     http_req_connecting............: avg=649ns   min=0s      med=0s      max=1.81ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=95ms    min=24.03ms med=91.08ms max=534.57ms p(90)=119.2ms  p(95)=135.77ms p(99.9)=247.16ms
       { expected_response:true }...: avg=95ms    min=24.03ms med=91.08ms max=534.57ms p(90)=119.2ms  p(95)=135.77ms p(99.9)=247.16ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 63052
     http_req_receiving.............: avg=83.71µs min=31.39µs med=75.59µs max=14.39ms  p(90)=111.29µs p(95)=124.29µs p(99.9)=940.02µs
     http_req_sending...............: avg=20.74µs min=5.78µs  med=13.42µs max=56.61ms  p(90)=19.92µs  p(95)=22.18µs  p(99.9)=649.78µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=94.9ms  min=23.85ms med=90.98ms max=534.21ms p(90)=119.1ms  p(95)=135.64ms p(99.9)=246.22ms
     http_reqs......................: 63052   510.500184/s
     iteration_duration.............: avg=95.32ms min=43.22ms med=91.32ms max=497.66ms p(90)=119.43ms p(95)=136.04ms p(99.9)=249.82ms
     iterations.....................: 62952   509.690535/s
     success_rate...................: 100.00% ✓ 62952      ✗ 0    
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

     checks.........................: 100.00% ✓ 87993      ✗ 0    
     data_received..................: 2.6 GB  21 MB/s
     data_sent......................: 35 MB   288 kB/s
     http_req_blocked...............: avg=7.11µs   min=1.11µs  med=3.44µs   max=4.1ms    p(90)=4.83µs   p(95)=5.45µs   p(99.9)=1.77ms  
     http_req_connecting............: avg=3.5µs    min=0s      med=0s       max=4.06ms   p(90)=0s       p(95)=0s       p(99.9)=1.73ms  
     http_req_duration..............: avg=203.82ms min=24.12ms med=210.2ms  max=445.76ms p(90)=223.15ms p(95)=228.99ms p(99.9)=298.96ms
       { expected_response:true }...: avg=203.82ms min=24.12ms med=210.2ms  max=445.76ms p(90)=223.15ms p(95)=228.99ms p(99.9)=298.96ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29431
     http_req_receiving.............: avg=99.29µs  min=32.3µs  med=90.58µs  max=46.83ms  p(90)=123.64µs p(95)=136.44µs p(99.9)=678.25µs
     http_req_sending...............: avg=32.94µs  min=6µs     med=17.04µs  max=136.41ms p(90)=22.25µs  p(95)=24.22µs  p(99.9)=622.01µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=203.68ms min=23.97ms med=210.08ms max=433.2ms  p(90)=223.02ms p(95)=228.86ms p(99.9)=298.72ms
     http_reqs......................: 29431   239.484541/s
     iteration_duration.............: avg=204.72ms min=41.12ms med=210.5ms  max=456.34ms p(90)=223.43ms p(95)=229.29ms p(99.9)=306.81ms
     iterations.....................: 29331   238.670826/s
     success_rate...................: 100.00% ✓ 29331      ✗ 0    
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

