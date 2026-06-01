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
| hive-router | v0.0.49 | 1,585 | 1,603 | 1,567 | 0.7% |  |
| hotchocolate | 16.1.0-p.1.12 | 1,445 | 1,462 | 1,440 | 0.5% |  |
| cosmo | 0.307.0 | 1,170 | 1,182 | 1,159 | 0.7% | non-compatible response (1 across 1/9 runs) |
| grafbase | 0.53.3 | 1,126 | 1,152 | 1,117 | 1.0% |  |
| hive-gateway-router-runtime | 2.5.25 | 506 | 517 | 500 | 1.0% |  |
| apollo-router | v2.13.1 | 396 | 406 | 393 | 1.1% |  |
| apollo-gateway | 2.13.3 | 239 | 241 | 237 | 0.5% |  |
| hive-gateway | 2.5.25 | 230 | 235 | 228 | 1.0% |  |


### Details

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.49)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 580170     ✗ 0     
     data_received..................: 17 GB   139 MB/s
     data_sent......................: 233 MB  1.9 MB/s
     http_req_blocked...............: avg=3.36µs  min=992ns   med=2.47µs  max=13ms     p(90)=4.35µs   p(95)=5.28µs   p(99.9)=35.8µs 
     http_req_connecting............: avg=358ns   min=0s      med=0s      max=3.42ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=30.77ms min=13.67ms med=30.5ms  max=356.85ms p(90)=36.5ms   p(95)=38.45ms  p(99.9)=58.84ms
       { expected_response:true }...: avg=30.77ms min=13.67ms med=30.5ms  max=356.85ms p(90)=36.5ms   p(95)=38.45ms  p(99.9)=58.84ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 193490
     http_req_receiving.............: avg=88.81µs min=27.57µs med=54.25µs max=217.6ms  p(90)=107.34µs p(95)=160.45µs p(99.9)=2.97ms 
     http_req_sending...............: avg=37µs    min=5.18µs  med=10.03µs max=107.43ms p(90)=20.53µs  p(95)=78.93µs  p(99.9)=1.88ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=30.64ms min=13.6ms  med=30.39ms max=350.24ms p(90)=36.37ms  p(95)=38.3ms   p(99.9)=56.9ms 
     http_reqs......................: 193490  1585.55372/s
     iteration_duration.............: avg=31.01ms min=13.86ms med=30.73ms max=365.9ms  p(90)=36.72ms  p(95)=38.67ms  p(99.9)=59.65ms
     iterations.....................: 193390  1584.73427/s
     success_rate...................: 100.00% ✓ 193390     ✗ 0     
     vus............................: 50      min=0        max=50  
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (.net subgraphs) (16.1.0-p.1.12)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 529104      ✗ 0     
     data_received..................: 16 GB   127 MB/s
     data_sent......................: 212 MB  1.7 MB/s
     http_req_blocked...............: avg=3.37µs  min=951ns   med=2.27µs   max=13.15ms  p(90)=4.06µs  p(95)=4.95µs   p(99.9)=28.59µs
     http_req_connecting............: avg=594ns   min=0s      med=0s       max=4.27ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=33.77ms min=13.9ms  med=32.62ms  max=485.19ms p(90)=41.57ms p(95)=45.23ms  p(99.9)=81.84ms
       { expected_response:true }...: avg=33.77ms min=13.9ms  med=32.62ms  max=485.19ms p(90)=41.57ms p(95)=45.23ms  p(99.9)=81.84ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 176468
     http_req_receiving.............: avg=849.1µs min=51.6µs  med=115.97µs max=303.08ms p(90)=2.32ms  p(95)=3.52ms   p(99.9)=19.23ms
     http_req_sending...............: avg=38.16µs min=5.19µs  med=9.55µs   max=72.3ms   p(90)=20.8µs  p(95)=111.33µs p(99.9)=2.63ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=32.88ms min=13.77ms med=31.81ms  max=484.46ms p(90)=40.42ms p(95)=43.94ms  p(99.9)=76.93ms
     http_reqs......................: 176468  1445.802409/s
     iteration_duration.............: avg=34.01ms min=14.08ms med=32.84ms  max=485.43ms p(90)=41.79ms p(95)=45.45ms  p(99.9)=82.67ms
     iterations.....................: 176368  1444.983109/s
     success_rate...................: 100.00% ✓ 176368      ✗ 0     
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

     checks.........................: 100.00% ✓ 428289      ✗ 0     
     data_received..................: 13 GB   102 MB/s
     data_sent......................: 172 MB  1.4 MB/s
     http_req_blocked...............: avg=3.74µs   min=1.07µs  med=2.54µs  max=4.36ms   p(90)=4.21µs   p(95)=4.97µs   p(99.9)=39.9µs 
     http_req_connecting............: avg=760ns    min=0s      med=0s      max=4.22ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=41.78ms  min=15.35ms med=41.17ms max=343.37ms p(90)=50.78ms  p(95)=53.82ms  p(99.9)=70.09ms
       { expected_response:true }...: avg=41.78ms  min=15.35ms med=41.17ms max=343.37ms p(90)=50.78ms  p(95)=53.82ms  p(99.9)=70.09ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 142863
     http_req_receiving.............: avg=113.14µs min=27.99µs med=64.27µs max=211.12ms p(90)=110.91µs p(95)=139.38µs p(99.9)=2.11ms 
     http_req_sending...............: avg=32.18µs  min=5.26µs  med=11.08µs max=251.69ms p(90)=19.13µs  p(95)=24.39µs  p(99.9)=1.41ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=41.63ms  min=15.27ms med=41.06ms max=133.27ms p(90)=50.66ms  p(95)=53.69ms  p(99.9)=68.97ms
     http_reqs......................: 142863  1170.823136/s
     iteration_duration.............: avg=42.02ms  min=18.51ms med=41.38ms max=367.26ms p(90)=50.99ms  p(95)=54.03ms  p(99.9)=70.59ms
     iterations.....................: 142763  1170.003593/s
     success_rate...................: 100.00% ✓ 142763      ✗ 0     
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

     checks.........................: 100.00% ✓ 412026      ✗ 0     
     data_received..................: 12 GB   99 MB/s
     data_sent......................: 165 MB  1.4 MB/s
     http_req_blocked...............: avg=3.69µs   min=971ns   med=2.39µs  max=3.9ms    p(90)=4.91µs   p(95)=6.02µs   p(99.9)=46.69µs
     http_req_connecting............: avg=562ns    min=0s      med=0s      max=3.57ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=43.4ms   min=17.27ms med=42.97ms max=356ms    p(90)=52.66ms  p(95)=55.86ms  p(99.9)=79.5ms 
       { expected_response:true }...: avg=43.4ms   min=17.27ms med=42.97ms max=356ms    p(90)=52.66ms  p(95)=55.86ms  p(99.9)=79.5ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 137442
     http_req_receiving.............: avg=122.09µs min=29.47µs med=60.93µs max=190.7ms  p(90)=133.27µs p(95)=204.62µs p(99.9)=3.62ms 
     http_req_sending...............: avg=36.07µs  min=5.17µs  med=10.28µs max=70.05ms  p(90)=24.37µs  p(95)=111.31µs p(99.9)=2.34ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=43.24ms  min=17.1ms  med=42.84ms max=164.81ms p(90)=52.52ms  p(95)=55.68ms  p(99.9)=78.79ms
     http_reqs......................: 137442  1126.367888/s
     iteration_duration.............: avg=43.68ms  min=17.47ms med=43.21ms max=372.65ms p(90)=52.89ms  p(95)=56.1ms   p(99.9)=80.01ms
     iterations.....................: 137342  1125.548366/s
     success_rate...................: 100.00% ✓ 137342      ✗ 0     
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

     checks.........................: 100.00% ✓ 185796     ✗ 0    
     data_received..................: 5.4 GB  44 MB/s
     data_sent......................: 75 MB   609 kB/s
     http_req_blocked...............: avg=5.15µs  min=1.14µs  med=3.13µs  max=4.25ms   p(90)=4.71µs   p(95)=5.38µs   p(99.9)=47.2µs  
     http_req_connecting............: avg=1.76µs  min=0s      med=0s      max=4.2ms    p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=96.51ms min=21.6ms  med=94.34ms max=381.46ms p(90)=125.4ms  p(95)=136.93ms p(99.9)=232.64ms
       { expected_response:true }...: avg=96.51ms min=21.6ms  med=94.34ms max=381.46ms p(90)=125.4ms  p(95)=136.93ms p(99.9)=232.64ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 62032
     http_req_receiving.............: avg=92.75µs min=31.36µs med=79.56µs max=159.2ms  p(90)=116.51µs p(95)=131.16µs p(99.9)=930.7µs 
     http_req_sending...............: avg=27.27µs min=5.77µs  med=14.21µs max=162.82ms p(90)=21.08µs  p(95)=23.42µs  p(99.9)=722.54µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=96.39ms min=21.47ms med=94.23ms max=380.82ms p(90)=125.29ms p(95)=136.76ms p(99.9)=232.12ms
     http_reqs......................: 62032   506.704229/s
     iteration_duration.............: avg=96.9ms  min=37.66ms med=94.61ms max=389.23ms p(90)=125.66ms p(95)=137.34ms p(99.9)=236.36ms
     iterations.....................: 61932   505.887385/s
     success_rate...................: 100.00% ✓ 61932      ✗ 0    
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

     checks.........................: 100.00% ✓ 145236     ✗ 0    
     data_received..................: 4.2 GB  35 MB/s
     data_sent......................: 58 MB   476 kB/s
     http_req_blocked...............: avg=6.06µs   min=1.15µs  med=3.5µs    max=4.76ms   p(90)=5.09µs   p(95)=5.71µs   p(99.9)=371.08µs
     http_req_connecting............: avg=2.24µs   min=0s      med=0s       max=4.71ms   p(90)=0s       p(95)=0s       p(99.9)=298.59µs
     http_req_duration..............: avg=123.46ms min=19.25ms med=121.63ms max=371.03ms p(90)=153.84ms p(95)=163.79ms p(99.9)=211.72ms
       { expected_response:true }...: avg=123.46ms min=19.25ms med=121.63ms max=371.03ms p(90)=153.84ms p(95)=163.79ms p(99.9)=211.72ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 48512
     http_req_receiving.............: avg=91.64µs  min=31.21µs med=86.97µs  max=2.68ms   p(90)=120.86µs p(95)=134.16µs p(99.9)=659.85µs
     http_req_sending...............: avg=30.62µs  min=6.08µs  med=17.14µs  max=144.69ms p(90)=22.94µs  p(95)=25.06µs  p(99.9)=661.78µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=123.34ms min=19.14ms med=121.51ms max=370.84ms p(90)=153.69ms p(95)=163.67ms p(99.9)=211.17ms
     http_reqs......................: 48512   396.0432/s
     iteration_duration.............: avg=123.97ms min=47.84ms med=121.94ms max=401.99ms p(90)=154.15ms p(95)=164.09ms p(99.9)=218.97ms
     iterations.....................: 48412   395.226818/s
     success_rate...................: 100.00% ✓ 48412      ✗ 0    
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

     checks.........................: 100.00% ✓ 88149      ✗ 0    
     data_received..................: 2.6 GB  21 MB/s
     data_sent......................: 35 MB   288 kB/s
     http_req_blocked...............: avg=7.83µs   min=1.31µs  med=3.67µs   max=4.16ms   p(90)=5.15µs   p(95)=5.76µs   p(99.9)=2.09ms  
     http_req_connecting............: avg=3.85µs   min=0s      med=0s       max=4.11ms   p(90)=0s       p(95)=0s       p(99.9)=2ms     
     http_req_duration..............: avg=203.41ms min=20.63ms med=208.42ms max=418.99ms p(90)=220.13ms p(95)=225.75ms p(99.9)=295.55ms
       { expected_response:true }...: avg=203.41ms min=20.63ms med=208.42ms max=418.99ms p(90)=220.13ms p(95)=225.75ms p(99.9)=295.55ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29483
     http_req_receiving.............: avg=100µs    min=34.69µs med=93.86µs  max=25.87ms  p(90)=128.76µs p(95)=143.12µs p(99.9)=499.86µs
     http_req_sending...............: avg=43.11µs  min=6.38µs  med=17.87µs  max=210.69ms p(90)=23.17µs  p(95)=25.23µs  p(99.9)=436.65µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=203.26ms min=20.5ms  med=208.29ms max=418.41ms p(90)=220ms    p(95)=225.62ms p(99.9)=295.14ms
     http_reqs......................: 29483   239.955632/s
     iteration_duration.............: avg=204.34ms min=63.05ms med=208.72ms max=463.43ms p(90)=220.43ms p(95)=226.13ms p(99.9)=313.1ms 
     iterations.....................: 29383   239.141754/s
     success_rate...................: 100.00% ✓ 29383      ✗ 0    
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

     checks.........................: 100.00% ✓ 84174      ✗ 0    
     data_received..................: 2.5 GB  20 MB/s
     data_sent......................: 34 MB   276 kB/s
     http_req_blocked...............: avg=7.69µs   min=1.3µs   med=3.74µs   max=4.17ms   p(90)=5.27µs   p(95)=5.91µs   p(99.9)=1.91ms  
     http_req_connecting............: avg=3.67µs   min=0s      med=0s       max=4.13ms   p(90)=0s       p(95)=0s       p(99.9)=1.85ms  
     http_req_duration..............: avg=213.08ms min=18.87ms med=202.67ms max=700.65ms p(90)=290.03ms p(95)=435.55ms p(99.9)=607.48ms
       { expected_response:true }...: avg=213.08ms min=18.87ms med=202.67ms max=700.65ms p(90)=290.03ms p(95)=435.55ms p(99.9)=607.48ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 28158
     http_req_receiving.............: avg=102.62µs min=33.28µs med=97.69µs  max=16.65ms  p(90)=131.34µs p(95)=146.06µs p(99.9)=499.68µs
     http_req_sending...............: avg=29.26µs  min=6.23µs  med=18.25µs  max=61.71ms  p(90)=23.52µs  p(95)=25.47µs  p(99.9)=629.41µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=212.95ms min=18.72ms med=202.52ms max=700.55ms p(90)=289.92ms p(95)=435.42ms p(99.9)=607.35ms
     http_reqs......................: 28158   230.173152/s
     iteration_duration.............: avg=214.1ms  min=47.92ms med=203.17ms max=700.84ms p(90)=290.62ms p(95)=436.65ms p(99.9)=607.86ms
     iterations.....................: 28058   229.355717/s
     success_rate...................: 100.00% ✓ 28058      ✗ 0    
     vus............................: 50      min=0        max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-179-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

