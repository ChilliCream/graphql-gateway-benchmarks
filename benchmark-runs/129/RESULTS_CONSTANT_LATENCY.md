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
| hive-router | v0.0.43 | 1,584 | 1,609 | 1,570 | 0.7% |  |
| hotchocolate | 16.0.0-rc.1.23 | 1,437 | 1,454 | 1,428 | 0.6% |  |
| cosmo | 0.298.0 | 1,132 | 1,148 | 1,123 | 0.8% | non-compatible response (1 across 1/9 runs) |
| grafbase | 0.53.2 | 1,127 | 1,147 | 1,124 | 0.7% |  |
| hive-gateway-router-runtime | 2.5.14 | 562 | 579 | 557 | 1.4% |  |
| apollo-router | v2.12.1 | 361 | 371 | 355 | 1.5% |  |
| hive-gateway | 2.5.14 | 267 | 272 | 265 | 1.0% |  |
| apollo-gateway | 2.13.3 | 234 | 236 | 233 | 0.5% |  |


### Details

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.43)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 579537      ✗ 0     
     data_received..................: 17 GB   139 MB/s
     data_sent......................: 232 MB  1.9 MB/s
     http_req_blocked...............: avg=3.21µs  min=962ns   med=2.2µs   max=3.8ms    p(90)=4.06µs   p(95)=4.99µs   p(99.9)=34.31µs
     http_req_connecting............: avg=505ns   min=0s      med=0s      max=3.76ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=30.8ms  min=14.58ms med=30.54ms max=335.44ms p(90)=36.6ms   p(95)=38.54ms  p(99.9)=57.18ms
       { expected_response:true }...: avg=30.8ms  min=14.58ms med=30.54ms max=335.44ms p(90)=36.6ms   p(95)=38.54ms  p(99.9)=57.18ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 193279
     http_req_receiving.............: avg=83.05µs min=27.83µs med=52.71µs max=117.75ms p(90)=104.74µs p(95)=153.64µs p(99.9)=2.52ms 
     http_req_sending...............: avg=35.94µs min=5.04µs  med=9.37µs  max=145.17ms p(90)=19.75µs  p(95)=62.39µs  p(99.9)=1.87ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=30.68ms min=14.49ms med=30.43ms max=323.9ms  p(90)=36.47ms  p(95)=38.39ms  p(99.9)=55.8ms 
     http_reqs......................: 193279  1584.386295/s
     iteration_duration.............: avg=31.05ms min=14.86ms med=30.76ms max=348.8ms  p(90)=36.82ms  p(95)=38.76ms  p(99.9)=57.57ms
     iterations.....................: 193179  1583.566554/s
     success_rate...................: 100.00% ✓ 193179      ✗ 0     
     vus............................: 7       min=0         max=50  
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

     checks.........................: 100.00% ✓ 525738      ✗ 0     
     data_received..................: 15 GB   126 MB/s
     data_sent......................: 211 MB  1.7 MB/s
     http_req_blocked...............: avg=3.37µs   min=941ns   med=2.16µs   max=9.67ms   p(90)=3.96µs  p(95)=4.82µs  p(99.9)=36.98µs
     http_req_connecting............: avg=621ns    min=0s      med=0s       max=3.97ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=33.98ms  min=13.92ms med=32.82ms  max=468.69ms p(90)=41.74ms p(95)=45.48ms p(99.9)=82.11ms
       { expected_response:true }...: avg=33.98ms  min=13.92ms med=32.82ms  max=468.69ms p(90)=41.74ms p(95)=45.48ms p(99.9)=82.11ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 175346
     http_req_receiving.............: avg=817.84µs min=51.18µs med=119.53µs max=266.55ms p(90)=2.32ms  p(95)=3.48ms  p(99.9)=16.05ms
     http_req_sending...............: avg=36.74µs  min=5.08µs  med=9.28µs   max=70.2ms   p(90)=20.09µs p(95)=106.7µs p(99.9)=2.53ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=33.12ms  min=13.83ms med=31.99ms  max=468.58ms p(90)=40.6ms  p(95)=44.17ms p(99.9)=80.59ms
     http_reqs......................: 175346  1437.253737/s
     iteration_duration.............: avg=34.23ms  min=14.16ms med=33.04ms  max=468.86ms p(90)=41.97ms p(95)=45.71ms p(99.9)=82.58ms
     iterations.....................: 175246  1436.43407/s
     success_rate...................: 100.00% ✓ 175246      ✗ 0     
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

     checks.........................: 100.00% ✓ 414369      ✗ 0     
     data_received..................: 12 GB   99 MB/s
     data_sent......................: 166 MB  1.4 MB/s
     http_req_blocked...............: avg=3.52µs  min=1.02µs  med=2.42µs  max=4.14ms   p(90)=4µs      p(95)=4.74µs   p(99.9)=36.09µs
     http_req_connecting............: avg=746ns   min=0s      med=0s      max=4.09ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=43.2ms  min=18.19ms med=42.58ms max=344.49ms p(90)=52.55ms  p(95)=55.76ms  p(99.9)=71.53ms
       { expected_response:true }...: avg=43.2ms  min=18.19ms med=42.58ms max=344.49ms p(90)=52.55ms  p(95)=55.76ms  p(99.9)=71.53ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 138223
     http_req_receiving.............: avg=87.74µs min=28.76µs med=64.88µs max=173.19ms p(90)=109.33µs p(95)=135.68µs p(99.9)=1.78ms 
     http_req_sending...............: avg=30.05µs min=5.4µs   med=10.73µs max=173.02ms p(90)=18.22µs  p(95)=22.96µs  p(99.9)=1.16ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=43.08ms min=18.01ms med=42.48ms max=343.88ms p(90)=52.44ms  p(95)=55.63ms  p(99.9)=70.87ms
     http_reqs......................: 138223  1132.716963/s
     iteration_duration.............: avg=43.43ms min=18.45ms med=42.79ms max=356.93ms p(90)=52.76ms  p(95)=55.96ms  p(99.9)=71.92ms
     iterations.....................: 138123  1131.897478/s
     success_rate...................: 100.00% ✓ 138123      ✗ 0     
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

     checks.........................: 100.00% ✓ 412272      ✗ 0     
     data_received..................: 12 GB   99 MB/s
     data_sent......................: 165 MB  1.4 MB/s
     http_req_blocked...............: avg=3.66µs  min=962ns   med=2.24µs  max=9.65ms   p(90)=4.63µs   p(95)=5.77µs   p(99.9)=54.09µs
     http_req_connecting............: avg=529ns   min=0s      med=0s      max=3.65ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=43.38ms min=15.46ms med=42.94ms max=334.24ms p(90)=52.69ms  p(95)=55.9ms   p(99.9)=81.68ms
       { expected_response:true }...: avg=43.38ms min=15.46ms med=42.94ms max=334.24ms p(90)=52.69ms  p(95)=55.9ms   p(99.9)=81.68ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 137524
     http_req_receiving.............: avg=97.12µs min=27.74µs med=59.46µs max=87.94ms  p(90)=131.86µs p(95)=207.69µs p(99.9)=3.34ms 
     http_req_sending...............: avg=38.64µs min=5.18µs  med=9.86µs  max=190.52ms p(90)=23.84µs  p(95)=111.88µs p(99.9)=2.33ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=43.24ms min=15.31ms med=42.82ms max=329.2ms  p(90)=52.55ms  p(95)=55.72ms  p(99.9)=81.44ms
     http_reqs......................: 137524  1127.141764/s
     iteration_duration.............: avg=43.65ms min=16.89ms med=43.19ms max=348.57ms p(90)=52.93ms  p(95)=56.13ms  p(99.9)=82.57ms
     iterations.....................: 137424  1126.322167/s
     success_rate...................: 100.00% ✓ 137424      ✗ 0     
     vus............................: 49      min=0         max=50  
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

     checks.........................: 100.00% ✓ 206310     ✗ 0    
     data_received..................: 6.0 GB  49 MB/s
     data_sent......................: 83 MB   676 kB/s
     http_req_blocked...............: avg=4.85µs  min=1.15µs  med=3.14µs  max=3.74ms   p(90)=4.67µs   p(95)=5.3µs    p(99.9)=46.83µs 
     http_req_connecting............: avg=1.48µs  min=0s      med=0s      max=3.71ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=86.92ms min=19.17ms med=84.06ms max=354.28ms p(90)=106.41ms p(95)=115.45ms p(99.9)=217.09ms
       { expected_response:true }...: avg=86.92ms min=19.17ms med=84.06ms max=354.28ms p(90)=106.41ms p(95)=115.45ms p(99.9)=217.09ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 68870
     http_req_receiving.............: avg=88.18µs min=31.44µs med=78.08µs max=71.05ms  p(90)=113.43µs p(95)=127.19µs p(99.9)=898.63µs
     http_req_sending...............: avg=28.35µs min=5.72µs  med=13.53µs max=214.15ms p(90)=19.97µs  p(95)=22.34µs  p(99.9)=739.44µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=86.8ms  min=19ms    med=83.95ms max=353.81ms p(90)=106.31ms p(95)=115.32ms p(99.9)=216.87ms
     http_reqs......................: 68870   562.498082/s
     iteration_duration.............: avg=87.25ms min=34.7ms  med=84.31ms max=362.89ms p(90)=106.66ms p(95)=115.77ms p(99.9)=220.89ms
     iterations.....................: 68770   561.681328/s
     success_rate...................: 100.00% ✓ 68770      ✗ 0    
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

     checks.........................: 100.00% ✓ 132384     ✗ 0    
     data_received..................: 3.9 GB  32 MB/s
     data_sent......................: 53 MB   434 kB/s
     http_req_blocked...............: avg=4.79µs   min=1.22µs  med=3.45µs   max=2.51ms   p(90)=4.92µs   p(95)=5.5µs    p(99.9)=196.86µs
     http_req_connecting............: avg=1.1µs    min=0s      med=0s       max=2.48ms   p(90)=0s       p(95)=0s       p(99.9)=131.38µs
     http_req_duration..............: avg=135.47ms min=21.6ms  med=133.41ms max=383.69ms p(90)=169.73ms p(95)=180.68ms p(99.9)=231.59ms
       { expected_response:true }...: avg=135.47ms min=21.6ms  med=133.41ms max=383.69ms p(90)=169.73ms p(95)=180.68ms p(99.9)=231.59ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 44228
     http_req_receiving.............: avg=95.75µs  min=31.13µs med=86.52µs  max=133.37ms p(90)=119.75µs p(95)=132.22µs p(99.9)=873.7µs 
     http_req_sending...............: avg=24.78µs  min=5.75µs  med=16.11µs  max=107.89ms p(90)=21.77µs  p(95)=23.8µs   p(99.9)=639.1µs 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=135.35ms min=21.47ms med=133.3ms  max=383.35ms p(90)=169.61ms p(95)=180.57ms p(99.9)=231.21ms
     http_reqs......................: 44228   361.014326/s
     iteration_duration.............: avg=136.01ms min=39.92ms med=133.72ms max=403.18ms p(90)=170.01ms p(95)=180.98ms p(99.9)=235.33ms
     iterations.....................: 44128   360.198068/s
     success_rate...................: 100.00% ✓ 44128      ✗ 0    
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

     checks.........................: 100.00% ✓ 97668      ✗ 0    
     data_received..................: 2.9 GB  23 MB/s
     data_sent......................: 39 MB   321 kB/s
     http_req_blocked...............: avg=7.68µs   min=1.23µs  med=3.74µs   max=4.49ms   p(90)=5.36µs   p(95)=5.97µs   p(99.9)=1.7ms   
     http_req_connecting............: avg=3.5µs    min=0s      med=0s       max=4.46ms   p(90)=0s       p(95)=0s       p(99.9)=1.45ms  
     http_req_duration..............: avg=183.6ms  min=18.66ms med=166.12ms max=587.7ms  p(90)=236.61ms p(95)=380.49ms p(99.9)=530.91ms
       { expected_response:true }...: avg=183.6ms  min=18.66ms med=166.12ms max=587.7ms  p(90)=236.61ms p(95)=380.49ms p(99.9)=530.91ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32656
     http_req_receiving.............: avg=109.15µs min=35.36µs med=98.34µs  max=116.24ms p(90)=132.51µs p(95)=146.41µs p(99.9)=736.6µs 
     http_req_sending...............: avg=28.44µs  min=6.37µs  med=18.24µs  max=155.5ms  p(90)=23.63µs  p(95)=25.53µs  p(99.9)=570.6µs 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=183.47ms min=18.55ms med=165.98ms max=587.57ms p(90)=236.46ms p(95)=380.37ms p(99.9)=530.78ms
     http_reqs......................: 32656   267.064601/s
     iteration_duration.............: avg=184.4ms  min=51.58ms med=166.51ms max=588.01ms p(90)=237.22ms p(95)=383.1ms  p(99.9)=531.18ms
     iterations.....................: 32556   266.246789/s
     success_rate...................: 100.00% ✓ 32556      ✗ 0    
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

     checks.........................: 100.00% ✓ 85989      ✗ 0    
     data_received..................: 2.5 GB  21 MB/s
     data_sent......................: 35 MB   281 kB/s
     http_req_blocked...............: avg=7.7µs    min=1.28µs  med=3.56µs   max=4.13ms   p(90)=4.94µs   p(95)=5.55µs   p(99.9)=2.04ms  
     http_req_connecting............: avg=3.72µs   min=0s      med=0s       max=4ms      p(90)=0s       p(95)=0s       p(99.9)=1.96ms  
     http_req_duration..............: avg=208.49ms min=20.76ms med=208.16ms max=432.22ms p(90)=236.99ms p(95)=243.05ms p(99.9)=315.77ms
       { expected_response:true }...: avg=208.49ms min=20.76ms med=208.16ms max=432.22ms p(90)=236.99ms p(95)=243.05ms p(99.9)=315.77ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 28763
     http_req_receiving.............: avg=101.7µs  min=33.48µs med=93.24µs  max=70.66ms  p(90)=126.04µs p(95)=139.4µs  p(99.9)=428.24µs
     http_req_sending...............: avg=38.61µs  min=6.11µs  med=16.95µs  max=186.35ms p(90)=22.09µs  p(95)=23.97µs  p(99.9)=566.47µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=208.35ms min=20.59ms med=208.04ms max=431.49ms p(90)=236.89ms p(95)=242.9ms  p(99.9)=315.66ms
     http_reqs......................: 28763   234.098415/s
     iteration_duration.............: avg=209.45ms min=60.46ms med=208.63ms max=457.85ms p(90)=237.32ms p(95)=243.36ms p(99.9)=324.35ms
     iterations.....................: 28663   233.284527/s
     success_rate...................: 100.00% ✓ 28663      ✗ 0    
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

