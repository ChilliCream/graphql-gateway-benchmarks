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
| hive-router | v0.0.43 | 1,583 | 1,605 | 1,569 | 0.7% |  |
| hotchocolate | 16.0.0-rc.1.21 | 1,439 | 1,462 | 1,430 | 0.7% |  |
| grafbase | 0.53.2 | 1,136 | 1,154 | 1,126 | 0.8% |  |
| cosmo | 0.298.0 | 1,133 | 1,146 | 1,123 | 0.8% | non-compatible response (3 across 3/9 runs) |
| hive-gateway-router-runtime | 2.5.14 | 568 | 584 | 528 | 2.8% |  |
| apollo-router | v2.12.1 | 362 | 373 | 358 | 1.4% |  |
| hive-gateway | 2.5.14 | 261 | 265 | 256 | 1.0% |  |
| apollo-gateway | 2.13.3 | 239 | 241 | 237 | 0.5% |  |


### Details

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.43)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 579525      ✗ 0     
     data_received..................: 17 GB   139 MB/s
     data_sent......................: 232 MB  1.9 MB/s
     http_req_blocked...............: avg=3.37µs  min=982ns   med=2.47µs  max=3.89ms   p(90)=4.35µs   p(95)=5.37µs   p(99.9)=36.25µs
     http_req_connecting............: avg=424ns   min=0s      med=0s      max=3.87ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=30.8ms  min=14.94ms med=30.53ms max=317.37ms p(90)=36.65ms  p(95)=38.63ms  p(99.9)=55.68ms
       { expected_response:true }...: avg=30.8ms  min=14.94ms med=30.53ms max=317.37ms p(90)=36.65ms  p(95)=38.63ms  p(99.9)=55.68ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 193275
     http_req_receiving.............: avg=86.62µs min=27.23µs med=55.25µs max=187.05ms p(90)=107.79µs p(95)=157.14µs p(99.9)=2.5ms  
     http_req_sending...............: avg=35.84µs min=5.28µs  med=10.02µs max=186.64ms p(90)=20.5µs   p(95)=58.72µs  p(99.9)=1.88ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=30.68ms min=14.83ms med=30.42ms max=316.38ms p(90)=36.53ms  p(95)=38.48ms  p(99.9)=53.92ms
     http_reqs......................: 193275  1583.74476/s
     iteration_duration.............: avg=31.05ms min=15.25ms med=30.75ms max=335.06ms p(90)=36.86ms  p(95)=38.85ms  p(99.9)=56.08ms
     iterations.....................: 193175  1582.925335/s
     success_rate...................: 100.00% ✓ 193175      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (.net subgraphs) (16.0.0-rc.1.21)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 526557      ✗ 0     
     data_received..................: 15 GB   126 MB/s
     data_sent......................: 211 MB  1.7 MB/s
     http_req_blocked...............: avg=3.44µs   min=962ns   med=2.25µs   max=5.04ms   p(90)=3.98µs  p(95)=4.86µs   p(99.9)=33.22µs 
     http_req_connecting............: avg=696ns    min=0s      med=0s       max=5ms      p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=33.93ms  min=14.36ms med=32.64ms  max=475.57ms p(90)=41.65ms p(95)=45.33ms  p(99.9)=107.38ms
       { expected_response:true }...: avg=33.93ms  min=14.36ms med=32.64ms  max=475.57ms p(90)=41.65ms p(95)=45.33ms  p(99.9)=107.38ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 175619
     http_req_receiving.............: avg=796.01µs min=51.61µs med=114.83µs max=301.32ms p(90)=2.2ms   p(95)=3.33ms   p(99.9)=19.99ms 
     http_req_sending...............: avg=39.54µs  min=5.12µs  med=9.31µs   max=180.29ms p(90)=19.88µs p(95)=106.65µs p(99.9)=2.43ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=33.09ms  min=13.75ms med=31.87ms  max=474.41ms p(90)=40.59ms p(95)=44.14ms  p(99.9)=90.53ms 
     http_reqs......................: 175619  1439.074215/s
     iteration_duration.............: avg=34.17ms  min=14.65ms med=32.86ms  max=475.71ms p(90)=41.87ms p(95)=45.55ms  p(99.9)=109.45ms
     iterations.....................: 175519  1438.254785/s
     success_rate...................: 100.00% ✓ 175519      ✗ 0     
     vus............................: 50      min=0         max=50  
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

     checks.........................: 100.00% ✓ 415833      ✗ 0     
     data_received..................: 12 GB   100 MB/s
     data_sent......................: 167 MB  1.4 MB/s
     http_req_blocked...............: avg=3.67µs  min=942ns   med=2.24µs  max=5.09ms   p(90)=4.76µs  p(95)=5.98µs   p(99.9)=48.11µs
     http_req_connecting............: avg=627ns   min=0s      med=0s      max=3.97ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=43.01ms min=16.7ms  med=42.53ms max=353.4ms  p(90)=52.25ms p(95)=55.62ms  p(99.9)=76.54ms
       { expected_response:true }...: avg=43.01ms min=16.7ms  med=42.53ms max=353.4ms  p(90)=52.25ms p(95)=55.62ms  p(99.9)=76.54ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 138711
     http_req_receiving.............: avg=96µs    min=29.02µs med=59.08µs max=110.48ms p(90)=129.9µs p(95)=200.15µs p(99.9)=2.95ms 
     http_req_sending...............: avg=36.8µs  min=5.39µs  med=9.92µs  max=147.4ms  p(90)=24.13µs p(95)=108.22µs p(99.9)=2.29ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=42.87ms min=16.65ms med=42.42ms max=332.51ms p(90)=52.09ms p(95)=55.44ms  p(99.9)=75.85ms
     http_reqs......................: 138711  1136.880629/s
     iteration_duration.............: avg=43.27ms min=16.91ms med=42.77ms max=360.88ms p(90)=52.48ms p(95)=55.85ms  p(99.9)=77.08ms
     iterations.....................: 138611  1136.061025/s
     success_rate...................: 100.00% ✓ 138611      ✗ 0     
     vus............................: 43      min=0         max=50  
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

     checks.........................: 100.00% ✓ 414510      ✗ 0     
     data_received..................: 12 GB   99 MB/s
     data_sent......................: 166 MB  1.4 MB/s
     http_req_blocked...............: avg=3.76µs  min=1.07µs  med=2.62µs  max=4.63ms   p(90)=4.25µs   p(95)=5.04µs   p(99.9)=39.57µs
     http_req_connecting............: avg=756ns   min=0s      med=0s      max=4.58ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=43.18ms min=18.94ms med=42.54ms max=341.47ms p(90)=52.55ms  p(95)=55.74ms  p(99.9)=73.81ms
       { expected_response:true }...: avg=43.18ms min=18.94ms med=42.54ms max=341.47ms p(90)=52.55ms  p(95)=55.74ms  p(99.9)=73.81ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 138270
     http_req_receiving.............: avg=89.3µs  min=27.78µs med=66.07µs max=192.94ms p(90)=111.18µs p(95)=138.42µs p(99.9)=1.85ms 
     http_req_sending...............: avg=30.96µs min=5.33µs  med=11.3µs  max=150.61ms p(90)=19.16µs  p(95)=24.29µs  p(99.9)=1.26ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=43.06ms min=18.79ms med=42.44ms max=341.11ms p(90)=52.43ms  p(95)=55.61ms  p(99.9)=73.15ms
     http_reqs......................: 138270  1133.049146/s
     iteration_duration.............: avg=43.42ms min=19.95ms med=42.75ms max=351.67ms p(90)=52.75ms  p(95)=55.94ms  p(99.9)=74.29ms
     iterations.....................: 138170  1132.229699/s
     success_rate...................: 100.00% ✓ 138170      ✗ 0     
     vus............................: 50      min=0         max=50  
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

     checks.........................: 100.00% ✓ 208422     ✗ 0    
     data_received..................: 6.1 GB  50 MB/s
     data_sent......................: 84 MB   683 kB/s
     http_req_blocked...............: avg=5.19µs  min=1.16µs  med=3.33µs  max=3.9ms    p(90)=5µs      p(95)=5.7µs    p(99.9)=50.53µs 
     http_req_connecting............: avg=1.5µs   min=0s      med=0s      max=3.86ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=86.01ms min=20.34ms med=83.89ms max=359.88ms p(90)=101.02ms p(95)=108.99ms p(99.9)=206.88ms
       { expected_response:true }...: avg=86.01ms min=20.34ms med=83.89ms max=359.88ms p(90)=101.02ms p(95)=108.99ms p(99.9)=206.88ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 69574
     http_req_receiving.............: avg=89.11µs min=32.48µs med=79.02µs max=103.01ms p(90)=115.27µs p(95)=128.87µs p(99.9)=841.2µs 
     http_req_sending...............: avg=24.81µs min=5.88µs  med=14.28µs max=98.46ms  p(90)=21.16µs  p(95)=23.73µs  p(99.9)=691.88µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=85.9ms  min=19.84ms med=83.77ms max=359.6ms  p(90)=100.91ms p(95)=108.86ms p(99.9)=206.78ms
     http_reqs......................: 69574   568.427729/s
     iteration_duration.............: avg=86.37ms min=31.71ms med=84.13ms max=379.9ms  p(90)=101.25ms p(95)=109.24ms p(99.9)=208.66ms
     iterations.....................: 69474   567.610717/s
     success_rate...................: 100.00% ✓ 69474      ✗ 0    
     vus............................: 50      min=0        max=50 
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

     checks.........................: 100.00% ✓ 133023     ✗ 0    
     data_received..................: 3.9 GB  32 MB/s
     data_sent......................: 53 MB   436 kB/s
     http_req_blocked...............: avg=5.8µs    min=1.18µs  med=3.46µs   max=3.67ms   p(90)=5.02µs   p(95)=5.63µs   p(99.9)=264.18µs
     http_req_connecting............: avg=2.14µs   min=0s      med=0s       max=3.64ms   p(90)=0s       p(95)=0s       p(99.9)=184.27µs
     http_req_duration..............: avg=134.82ms min=20.19ms med=132.74ms max=353.87ms p(90)=168.89ms p(95)=180.29ms p(99.9)=227.03ms
       { expected_response:true }...: avg=134.82ms min=20.19ms med=132.74ms max=353.87ms p(90)=168.89ms p(95)=180.29ms p(99.9)=227.03ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 44441
     http_req_receiving.............: avg=94.99µs  min=31.69µs med=86.49µs  max=85.94ms  p(90)=120.74µs p(95)=133.84µs p(99.9)=695.68µs
     http_req_sending...............: avg=28.92µs  min=5.71µs  med=16.48µs  max=121.46ms p(90)=22.33µs  p(95)=24.4µs   p(99.9)=591.55µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=134.7ms  min=20.02ms med=132.61ms max=352.9ms  p(90)=168.78ms p(95)=180.16ms p(99.9)=226.57ms
     http_reqs......................: 44441   362.721433/s
     iteration_duration.............: avg=135.36ms min=43.62ms med=133.05ms max=404.38ms p(90)=169.23ms p(95)=180.62ms p(99.9)=232.78ms
     iterations.....................: 44341   361.905246/s
     success_rate...................: 100.00% ✓ 44341      ✗ 0    
     vus............................: 50      min=0        max=50 
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

     checks.........................: 100.00% ✓ 95736      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 38 MB   314 kB/s
     http_req_blocked...............: avg=5.71µs   min=1.31µs  med=3.78µs   max=3.06ms   p(90)=5.39µs   p(95)=6.03µs   p(99.9)=528.46µs
     http_req_connecting............: avg=1.69µs   min=0s      med=0s       max=3.03ms   p(90)=0s       p(95)=0s       p(99.9)=489.97µs
     http_req_duration..............: avg=187.34ms min=18.55ms med=176.28ms max=609.17ms p(90)=258.62ms p(95)=372.05ms p(99.9)=553.85ms
       { expected_response:true }...: avg=187.34ms min=18.55ms med=176.28ms max=609.17ms p(90)=258.62ms p(95)=372.05ms p(99.9)=553.85ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32012
     http_req_receiving.............: avg=104.13µs min=36.65µs med=97.65µs  max=37.94ms  p(90)=131.66µs p(95)=145.27µs p(99.9)=633.95µs
     http_req_sending...............: avg=23.68µs  min=6.29µs  med=18.11µs  max=39.08ms  p(90)=23.53µs  p(95)=25.48µs  p(99.9)=523.47µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=187.21ms min=18.4ms  med=176.16ms max=609.08ms p(90)=258.5ms  p(95)=371.93ms p(99.9)=553.7ms 
     http_reqs......................: 32012   261.743939/s
     iteration_duration.............: avg=188.14ms min=33.21ms med=176.79ms max=609.37ms p(90)=259.07ms p(95)=373.1ms  p(99.9)=554.13ms
     iterations.....................: 31912   260.926296/s
     success_rate...................: 100.00% ✓ 31912      ✗ 0    
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

     checks.........................: 100.00% ✓ 88101      ✗ 0    
     data_received..................: 2.6 GB  21 MB/s
     data_sent......................: 35 MB   288 kB/s
     http_req_blocked...............: avg=6.25µs   min=1.25µs  med=3.53µs   max=3.16ms   p(90)=5.05µs   p(95)=5.67µs   p(99.9)=1.07ms  
     http_req_connecting............: avg=2.44µs   min=0s      med=0s       max=3.13ms   p(90)=0s       p(95)=0s       p(99.9)=961.17µs
     http_req_duration..............: avg=203.54ms min=21.69ms med=203.26ms max=374.65ms p(90)=219.57ms p(95)=224.9ms  p(99.9)=293.48ms
       { expected_response:true }...: avg=203.54ms min=21.69ms med=203.26ms max=374.65ms p(90)=219.57ms p(95)=224.9ms  p(99.9)=293.48ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29467
     http_req_receiving.............: avg=145.51µs min=34.24µs med=96.1µs   max=208.14ms p(90)=130.33µs p(95)=144.39µs p(99.9)=740.94µs
     http_req_sending...............: avg=27.95µs  min=6.08µs  med=17.69µs  max=57.53ms  p(90)=23.06µs  p(95)=25.07µs  p(99.9)=568.83µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=203.37ms min=21.54ms med=203.11ms max=340.91ms p(90)=219.44ms p(95)=224.74ms p(99.9)=292.69ms
     http_reqs......................: 29467   239.860801/s
     iteration_duration.............: avg=204.43ms min=81.85ms med=203.67ms max=392.75ms p(90)=219.85ms p(95)=225.22ms p(99.9)=294.43ms
     iterations.....................: 29367   239.046803/s
     success_rate...................: 100.00% ✓ 29367      ✗ 0    
     vus............................: 50      min=0        max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-173-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

