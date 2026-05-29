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
| hive-router | v0.0.49 | 1,581 | 1,610 | 1,574 | 0.7% |  |
| hotchocolate | 16.1.0-p.1.12 | 1,441 | 1,462 | 1,431 | 0.7% |  |
| cosmo | 0.307.0 | 1,145 | 1,164 | 1,138 | 1.0% | non-compatible response (3 across 3/9 runs) |
| grafbase | 0.53.3 | 1,139 | 1,155 | 1,133 | 0.7% |  |
| hive-gateway-router-runtime | 2.5.25 | 499 | 511 | 494 | 1.0% |  |
| apollo-router | v2.13.1 | 396 | 406 | 393 | 1.2% |  |
| apollo-gateway | 2.13.3 | 236 | 238 | 235 | 0.4% |  |
| hive-gateway | 2.5.25 | 234 | 237 | 231 | 0.9% |  |


### Details

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.49)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 578682      ✗ 0     
     data_received..................: 17 GB   138 MB/s
     data_sent......................: 232 MB  1.9 MB/s
     http_req_blocked...............: avg=3.12µs  min=952ns   med=2.33µs  max=2.72ms   p(90)=4.24µs   p(95)=5.22µs   p(99.9)=35.94µs
     http_req_connecting............: avg=277ns   min=0s      med=0s      max=2.44ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=30.86ms min=13.98ms med=30.6ms  max=352.36ms p(90)=36.64ms  p(95)=38.59ms  p(99.9)=58.12ms
       { expected_response:true }...: avg=30.86ms min=13.98ms med=30.6ms  max=352.36ms p(90)=36.64ms  p(95)=38.59ms  p(99.9)=58.12ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 192994
     http_req_receiving.............: avg=113.4µs min=27.37µs med=53.46µs max=288.9ms  p(90)=104.79µs p(95)=150.95µs p(99.9)=3.35ms 
     http_req_sending...............: avg=35.65µs min=5.1µs   med=9.65µs  max=108.39ms p(90)=20.17µs  p(95)=48.56µs  p(99.9)=1.95ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=30.71ms min=13.84ms med=30.49ms max=122.6ms  p(90)=36.51ms  p(95)=38.44ms  p(99.9)=56.85ms
     http_reqs......................: 192994  1581.724975/s
     iteration_duration.............: avg=31.09ms min=14.33ms med=30.81ms max=364.73ms p(90)=36.86ms  p(95)=38.8ms   p(99.9)=58.5ms 
     iterations.....................: 192894  1580.905403/s
     success_rate...................: 100.00% ✓ 192894      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
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

     checks.........................: 100.00% ✓ 527403      ✗ 0     
     data_received..................: 15 GB   126 MB/s
     data_sent......................: 211 MB  1.7 MB/s
     http_req_blocked...............: avg=3.28µs   min=942ns   med=2.14µs   max=6.16ms   p(90)=3.94µs  p(95)=4.82µs   p(99.9)=29.01µs
     http_req_connecting............: avg=600ns    min=0s      med=0s       max=4.19ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=33.87ms  min=13.31ms med=32.72ms  max=480.11ms p(90)=41.63ms p(95)=45.32ms  p(99.9)=79.86ms
       { expected_response:true }...: avg=33.87ms  min=13.31ms med=32.72ms  max=480.11ms p(90)=41.63ms p(95)=45.32ms  p(99.9)=79.86ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 175901
     http_req_receiving.............: avg=833.42µs min=51.81µs med=119.42µs max=134.71ms p(90)=2.41ms  p(95)=3.55ms   p(99.9)=14.29ms
     http_req_sending...............: avg=37.71µs  min=5.24µs  med=9.2µs    max=215.42ms p(90)=20.21µs p(95)=106.75µs p(99.9)=2.26ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=33ms     min=13.21ms med=31.9ms   max=480.01ms p(90)=40.47ms p(95)=44.02ms  p(99.9)=78.4ms 
     http_reqs......................: 175901  1441.520221/s
     iteration_duration.............: avg=34.12ms  min=13.52ms med=32.95ms  max=480.33ms p(90)=41.85ms p(95)=45.54ms  p(99.9)=80.24ms
     iterations.....................: 175801  1440.700714/s
     success_rate...................: 100.00% ✓ 175801      ✗ 0     
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

     checks.........................: 100.00% ✓ 419004      ✗ 0     
     data_received..................: 12 GB   100 MB/s
     data_sent......................: 168 MB  1.4 MB/s
     http_req_blocked...............: avg=3.71µs  min=1.02µs  med=2.52µs  max=4.36ms   p(90)=4.22µs   p(95)=5µs      p(99.9)=38.38µs
     http_req_connecting............: avg=785ns   min=0s      med=0s      max=4.31ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=42.71ms min=19.49ms med=42.12ms max=326.91ms p(90)=51.91ms  p(95)=55.08ms  p(99.9)=70.97ms
       { expected_response:true }...: avg=42.71ms min=19.49ms med=42.12ms max=326.91ms p(90)=51.91ms  p(95)=55.08ms  p(99.9)=70.97ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 139768
     http_req_receiving.............: avg=85.91µs min=28.29µs med=63.95µs max=28.5ms   p(90)=109.37µs p(95)=136.06µs p(99.9)=1.82ms 
     http_req_sending...............: avg=28.65µs min=5.23µs  med=10.87µs max=117.53ms p(90)=18.88µs  p(95)=23.93µs  p(99.9)=1.32ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=42.59ms min=19.38ms med=42.01ms max=326.74ms p(90)=51.8ms   p(95)=54.95ms  p(99.9)=70.39ms
     http_reqs......................: 139768  1145.164352/s
     iteration_duration.............: avg=42.95ms min=20.56ms med=42.33ms max=339.15ms p(90)=52.11ms  p(95)=55.3ms   p(99.9)=71.39ms
     iterations.....................: 139668  1144.345019/s
     success_rate...................: 100.00% ✓ 139668      ✗ 0     
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

     checks.........................: 100.00% ✓ 416988      ✗ 0     
     data_received..................: 12 GB   100 MB/s
     data_sent......................: 167 MB  1.4 MB/s
     http_req_blocked...............: avg=3.54µs  min=982ns   med=2.22µs  max=3.78ms   p(90)=4.63µs   p(95)=5.71µs   p(99.9)=40.66µs
     http_req_connecting............: avg=711ns   min=0s      med=0s      max=3.74ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=42.88ms min=16.84ms med=42.45ms max=369.64ms p(90)=52.07ms  p(95)=55.3ms   p(99.9)=78.85ms
       { expected_response:true }...: avg=42.88ms min=16.84ms med=42.45ms max=369.64ms p(90)=52.07ms  p(95)=55.3ms   p(99.9)=78.85ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 139096
     http_req_receiving.............: avg=93.86µs min=29.1µs  med=57.34µs max=82.74ms  p(90)=127.52µs p(95)=198.23µs p(99.9)=3.14ms 
     http_req_sending...............: avg=37.52µs min=5.15µs  med=9.74µs  max=88.34ms  p(90)=23.53µs  p(95)=111.25µs p(99.9)=2.45ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=42.75ms min=16.75ms med=42.33ms max=361.34ms p(90)=51.93ms  p(95)=55.15ms  p(99.9)=78.31ms
     http_reqs......................: 139096  1139.892313/s
     iteration_duration.............: avg=43.16ms min=17.08ms med=42.68ms max=377.34ms p(90)=52.3ms   p(95)=55.53ms  p(99.9)=79.43ms
     iterations.....................: 138996  1139.072813/s
     success_rate...................: 100.00% ✓ 138996      ✗ 0     
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

     checks.........................: 100.00% ✓ 183234     ✗ 0    
     data_received..................: 5.4 GB  44 MB/s
     data_sent......................: 74 MB   600 kB/s
     http_req_blocked...............: avg=4.93µs   min=1.16µs  med=3.03µs  max=4.05ms   p(90)=4.58µs   p(95)=5.24µs   p(99.9)=51.49µs 
     http_req_connecting............: avg=1.64µs   min=0s      med=0s      max=4.01ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=97.88ms  min=19.04ms med=95.14ms max=373.59ms p(90)=122.16ms p(95)=132.92ms p(99.9)=239.88ms
       { expected_response:true }...: avg=97.88ms  min=19.04ms med=95.14ms max=373.59ms p(90)=122.16ms p(95)=132.92ms p(99.9)=239.88ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 61178
     http_req_receiving.............: avg=168.03µs min=31.35µs med=77.23µs max=257.95ms p(90)=112.89µs p(95)=126.75µs p(99.9)=1.33ms  
     http_req_sending...............: avg=21.13µs  min=5.56µs  med=13.93µs max=28.95ms  p(90)=20.62µs  p(95)=23.09µs  p(99.9)=721.13µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=97.69ms  min=18.88ms med=95.04ms max=264.95ms p(90)=121.97ms p(95)=132.64ms p(99.9)=236ms   
     http_reqs......................: 61178   499.626944/s
     iteration_duration.............: avg=98.25ms  min=29.15ms med=95.41ms max=390.62ms p(90)=122.41ms p(95)=133.25ms p(99.9)=241.24ms
     iterations.....................: 61078   498.810266/s
     success_rate...................: 100.00% ✓ 61078      ✗ 0    
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

     checks.........................: 100.00% ✓ 145320     ✗ 0    
     data_received..................: 4.2 GB  35 MB/s
     data_sent......................: 58 MB   476 kB/s
     http_req_blocked...............: avg=10.48µs  min=1.24µs  med=3.49µs   max=10.95ms  p(90)=5.05µs   p(95)=5.69µs   p(99.9)=3.45ms  
     http_req_connecting............: avg=6.65µs   min=0s      med=0s       max=10.9ms   p(90)=0s       p(95)=0s       p(99.9)=3.42ms  
     http_req_duration..............: avg=123.4ms  min=21.61ms med=121.59ms max=373.34ms p(90)=153.53ms p(95)=163.87ms p(99.9)=208.44ms
       { expected_response:true }...: avg=123.4ms  min=21.61ms med=121.59ms max=373.34ms p(90)=153.53ms p(95)=163.87ms p(99.9)=208.44ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 48540
     http_req_receiving.............: avg=92.1µs   min=31.54µs med=85.52µs  max=72.37ms  p(90)=118.96µs p(95)=132.85µs p(99.9)=666.01µs
     http_req_sending...............: avg=28.07µs  min=5.97µs  med=16.73µs  max=150.26ms p(90)=22.47µs  p(95)=24.67µs  p(99.9)=853.46µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=123.28ms min=21.51ms med=121.48ms max=355.55ms p(90)=153.41ms p(95)=163.76ms p(99.9)=208.22ms
     http_reqs......................: 48540   396.246431/s
     iteration_duration.............: avg=123.9ms  min=38.49ms med=121.89ms max=387.43ms p(90)=153.8ms  p(95)=164.17ms p(99.9)=212.23ms
     iterations.....................: 48440   395.430102/s
     success_rate...................: 100.00% ✓ 48440      ✗ 0    
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

     checks.........................: 100.00% ✓ 86802      ✗ 0    
     data_received..................: 2.5 GB  21 MB/s
     data_sent......................: 35 MB   284 kB/s
     http_req_blocked...............: avg=7.33µs   min=1.25µs  med=3.41µs   max=3.98ms   p(90)=4.82µs   p(95)=5.45µs   p(99.9)=2.04ms  
     http_req_connecting............: avg=3.71µs   min=0s      med=0s       max=3.94ms   p(90)=0s       p(95)=0s       p(99.9)=2.01ms  
     http_req_duration..............: avg=206.53ms min=22.56ms med=221.6ms  max=425.94ms p(90)=237.94ms p(95)=243.35ms p(99.9)=313.33ms
       { expected_response:true }...: avg=206.53ms min=22.56ms med=221.6ms  max=425.94ms p(90)=237.94ms p(95)=243.35ms p(99.9)=313.33ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29034
     http_req_receiving.............: avg=101.05µs min=33.14µs med=92.39µs  max=65.11ms  p(90)=126.97µs p(95)=140.72µs p(99.9)=856.85µs
     http_req_sending...............: avg=28.96µs  min=5.78µs  med=17.19µs  max=51.96ms  p(90)=22.66µs  p(95)=24.63µs  p(99.9)=527.31µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=206.4ms  min=22.4ms  med=221.48ms max=425.71ms p(90)=237.82ms p(95)=243.22ms p(99.9)=313.03ms
     http_reqs......................: 29034   236.267676/s
     iteration_duration.............: avg=207.47ms min=54.61ms med=221.96ms max=450.81ms p(90)=238.22ms p(95)=243.67ms p(99.9)=316.67ms
     iterations.....................: 28934   235.453913/s
     success_rate...................: 100.00% ✓ 28934      ✗ 0    
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

     checks.........................: 100.00% ✓ 85773      ✗ 0    
     data_received..................: 2.5 GB  21 MB/s
     data_sent......................: 34 MB   282 kB/s
     http_req_blocked...............: avg=7.74µs   min=1.24µs  med=3.72µs   max=4.69ms   p(90)=5.27µs   p(95)=5.92µs   p(99.9)=1.87ms  
     http_req_connecting............: avg=3.72µs   min=0s      med=0s       max=4.65ms   p(90)=0s       p(95)=0s       p(99.9)=1.84ms  
     http_req_duration..............: avg=209.07ms min=19.38ms med=192.35ms max=619.51ms p(90)=254.61ms p(95)=455.19ms p(99.9)=587.49ms
       { expected_response:true }...: avg=209.07ms min=19.38ms med=192.35ms max=619.51ms p(90)=254.61ms p(95)=455.19ms p(99.9)=587.49ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 28691
     http_req_receiving.............: avg=122.69µs min=36.98µs med=100.14µs max=94.95ms  p(90)=135.69µs p(95)=149.36µs p(99.9)=618.11µs
     http_req_sending...............: avg=26.16µs  min=6.46µs  med=18.74µs  max=45.94ms  p(90)=23.92µs  p(95)=25.82µs  p(99.9)=533.54µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=208.92ms min=19.2ms  med=192.24ms max=619.36ms p(90)=254.44ms p(95)=455.07ms p(99.9)=587.36ms
     http_reqs......................: 28691   234.452972/s
     iteration_duration.............: avg=210.05ms min=71.02ms med=192.82ms max=619.74ms p(90)=255.14ms p(95)=456.14ms p(99.9)=587.8ms 
     iterations.....................: 28591   233.635806/s
     success_rate...................: 100.00% ✓ 28591      ✗ 0    
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

