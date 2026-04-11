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
| hive-router | v0.0.43 | 1,595 | 1,618 | 1,586 | 0.7% |  |
| hotchocolate | 16.0.0-rc.1.29 | 1,441 | 1,454 | 1,430 | 0.6% |  |
| cosmo | 0.298.0 | 1,157 | 1,175 | 1,151 | 0.8% | non-compatible response (2 across 2/9 runs) |
| grafbase | 0.53.2 | 1,146 | 1,157 | 1,137 | 0.5% |  |
| hive-gateway-router-runtime | 2.5.14 | 580 | 595 | 577 | 1.1% |  |
| apollo-router | v2.12.1 | 391 | 400 | 388 | 1.1% |  |
| hive-gateway | 2.5.14 | 263 | 268 | 261 | 0.9% |  |
| apollo-gateway | 2.13.3 | 227 | 231 | 226 | 0.8% |  |


### Details

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.43)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 583809      ✗ 0     
     data_received..................: 17 GB   140 MB/s
     data_sent......................: 234 MB  1.9 MB/s
     http_req_blocked...............: avg=3.15µs   min=981ns   med=2.04µs  max=4.24ms   p(90)=3.9µs    p(95)=4.84µs   p(99.9)=33.83µs
     http_req_connecting............: avg=549ns    min=0s      med=0s      max=4.19ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=30.59ms  min=13.33ms med=30.31ms max=337.63ms p(90)=36.32ms  p(95)=38.3ms   p(99.9)=58.73ms
       { expected_response:true }...: avg=30.59ms  min=13.33ms med=30.31ms max=337.63ms p(90)=36.32ms  p(95)=38.3ms   p(99.9)=58.73ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 194703
     http_req_receiving.............: avg=100.43µs min=27.24µs med=50.11µs max=191.67ms p(90)=102.32µs p(95)=151.75µs p(99.9)=3.74ms 
     http_req_sending...............: avg=36.49µs  min=5.01µs  med=9.01µs  max=169.25ms p(90)=19.68µs  p(95)=64.09µs  p(99.9)=1.99ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=30.45ms  min=13.25ms med=30.2ms  max=146.41ms p(90)=36.18ms  p(95)=38.15ms  p(99.9)=57.95ms
     http_reqs......................: 194703  1595.797339/s
     iteration_duration.............: avg=30.82ms  min=13.54ms med=30.53ms max=353.43ms p(90)=36.53ms  p(95)=38.53ms  p(99.9)=58.98ms
     iterations.....................: 194603  1594.977733/s
     success_rate...................: 100.00% ✓ 194603      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (.net subgraphs) (16.0.0-rc.1.29)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 527265      ✗ 0     
     data_received..................: 15 GB   126 MB/s
     data_sent......................: 211 MB  1.7 MB/s
     http_req_blocked...............: avg=3.07µs   min=990ns   med=2µs     max=4.09ms   p(90)=3.73µs  p(95)=4.63µs   p(99.9)=30.58µs
     http_req_connecting............: avg=585ns    min=0s      med=0s      max=4.06ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=33.88ms  min=13.45ms med=32.71ms max=688.25ms p(90)=41.51ms p(95)=45ms     p(99.9)=83.98ms
       { expected_response:true }...: avg=33.88ms  min=13.45ms med=32.71ms max=688.25ms p(90)=41.51ms p(95)=45ms     p(99.9)=83.98ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 175855
     http_req_receiving.............: avg=796.67µs min=49.95µs med=113.9µs max=152.82ms p(90)=2.33ms  p(95)=3.52ms   p(99.9)=14.64ms
     http_req_sending...............: avg=40.38µs  min=5.27µs  med=9.04µs  max=243.41ms p(90)=19.95µs p(95)=101.39µs p(99.9)=2.13ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=33.05ms  min=13.35ms med=31.9ms  max=688.11ms p(90)=40.41ms p(95)=43.85ms  p(99.9)=81.26ms
     http_reqs......................: 175855  1441.478095/s
     iteration_duration.............: avg=34.13ms  min=13.67ms med=32.93ms max=688.49ms p(90)=41.72ms p(95)=45.22ms  p(99.9)=85.26ms
     iterations.....................: 175755  1440.658398/s
     success_rate...................: 100.00% ✓ 175755      ✗ 0     
     vus............................: 22      min=0         max=50  
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

     checks.........................: 100.00% ✓ 423483      ✗ 0     
     data_received..................: 12 GB   101 MB/s
     data_sent......................: 170 MB  1.4 MB/s
     http_req_blocked...............: avg=3.41µs  min=1.03µs  med=2.26µs  max=4.94ms   p(90)=3.96µs   p(95)=4.72µs   p(99.9)=35.67µs
     http_req_connecting............: avg=711ns   min=0s      med=0s      max=3.83ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=42.26ms min=19.48ms med=41.66ms max=342.9ms  p(90)=51.39ms  p(95)=54.55ms  p(99.9)=71.78ms
       { expected_response:true }...: avg=42.26ms min=19.48ms med=41.66ms max=342.9ms  p(90)=51.39ms  p(95)=54.55ms  p(99.9)=71.78ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 141261
     http_req_receiving.............: avg=85.32µs min=28.55µs med=62.66µs max=103.69ms p(90)=108.54µs p(95)=134.05µs p(99.9)=1.7ms  
     http_req_sending...............: avg=30.85µs min=5.02µs  med=10.51µs max=183.56ms p(90)=18.63µs  p(95)=23.52µs  p(99.9)=1.31ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=42.15ms min=19.36ms med=41.55ms max=342.3ms  p(90)=51.28ms  p(95)=54.43ms  p(99.9)=71.29ms
     http_reqs......................: 141261  1157.328547/s
     iteration_duration.............: avg=42.49ms min=19.78ms med=41.87ms max=362.79ms p(90)=51.59ms  p(95)=54.76ms  p(99.9)=72.39ms
     iterations.....................: 141161  1156.509263/s
     success_rate...................: 100.00% ✓ 141161      ✗ 0     
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

     checks.........................: 100.00% ✓ 419442      ✗ 0     
     data_received..................: 12 GB   100 MB/s
     data_sent......................: 168 MB  1.4 MB/s
     http_req_blocked...............: avg=3.25µs  min=962ns   med=2.19µs  max=4.82ms   p(90)=4.53µs   p(95)=5.67µs   p(99.9)=44.83µs
     http_req_connecting............: avg=396ns   min=0s      med=0s      max=2.85ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=42.64ms min=15.13ms med=42.16ms max=332.93ms p(90)=51.9ms   p(95)=55.02ms  p(99.9)=77.56ms
       { expected_response:true }...: avg=42.64ms min=15.13ms med=42.16ms max=332.93ms p(90)=51.9ms   p(95)=55.02ms  p(99.9)=77.56ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 139914
     http_req_receiving.............: avg=96.48µs min=28.93µs med=58.35µs max=250.41ms p(90)=131.12µs p(95)=211.91µs p(99.9)=3.02ms 
     http_req_sending...............: avg=39.6µs  min=4.82µs  med=9.66µs  max=256.39ms p(90)=23.52µs  p(95)=110.57µs p(99.9)=1.99ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=42.5ms  min=15.04ms med=42.04ms max=319.67ms p(90)=51.76ms  p(95)=54.85ms  p(99.9)=77.11ms
     http_reqs......................: 139914  1146.292029/s
     iteration_duration.............: avg=42.9ms  min=17.24ms med=42.4ms  max=362.7ms  p(90)=52.14ms  p(95)=55.25ms  p(99.9)=78.52ms
     iterations.....................: 139814  1145.472746/s
     success_rate...................: 100.00% ✓ 139814      ✗ 0     
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

     checks.........................: 100.00% ✓ 212931     ✗ 0    
     data_received..................: 6.2 GB  51 MB/s
     data_sent......................: 85 MB   697 kB/s
     http_req_blocked...............: avg=4.04µs   min=1.12µs  med=3.1µs   max=2.23ms   p(90)=4.76µs   p(95)=5.46µs   p(99.9)=47.25µs 
     http_req_connecting............: avg=657ns    min=0s      med=0s      max=2.18ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=84.21ms  min=18.14ms med=84.63ms max=390.12ms p(90)=105.93ms p(95)=113.76ms p(99.9)=210.89ms
       { expected_response:true }...: avg=84.21ms  min=18.14ms med=84.63ms max=390.12ms p(90)=105.93ms p(95)=113.76ms p(99.9)=210.89ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 71077
     http_req_receiving.............: avg=162.27µs min=31.69µs med=78.03µs max=213.41ms p(90)=114.64µs p(95)=129.31µs p(99.9)=2.18ms  
     http_req_sending...............: avg=29.24µs  min=5.63µs  med=13.92µs max=235.98ms p(90)=20.82µs  p(95)=23.35µs  p(99.9)=763.53µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=84.02ms  min=17.98ms med=84.5ms  max=230.36ms p(90)=105.78ms p(95)=113.55ms p(99.9)=208.75ms
     http_reqs......................: 71077   580.568227/s
     iteration_duration.............: avg=84.55ms  min=26.57ms med=84.88ms max=390.34ms p(90)=106.16ms p(95)=114ms    p(99.9)=212.04ms
     iterations.....................: 70977   579.751411/s
     success_rate...................: 100.00% ✓ 70977      ✗ 0    
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

     checks.........................: 100.00% ✓ 143610     ✗ 0    
     data_received..................: 4.2 GB  34 MB/s
     data_sent......................: 58 MB   470 kB/s
     http_req_blocked...............: avg=5.74µs   min=1.2µs   med=3.33µs   max=3.94ms   p(90)=4.87µs   p(95)=5.47µs   p(99.9)=212.7µs 
     http_req_connecting............: avg=2.21µs   min=0s      med=0s       max=3.9ms    p(90)=0s       p(95)=0s       p(99.9)=101.79µs
     http_req_duration..............: avg=124.88ms min=21.96ms med=123.09ms max=397.47ms p(90)=155.7ms  p(95)=166.34ms p(99.9)=214.29ms
       { expected_response:true }...: avg=124.88ms min=21.96ms med=123.09ms max=397.47ms p(90)=155.7ms  p(95)=166.34ms p(99.9)=214.29ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 47970
     http_req_receiving.............: avg=91.25µs  min=31.34µs med=84.96µs  max=48.26ms  p(90)=118.35µs p(95)=131.67µs p(99.9)=789.36µs
     http_req_sending...............: avg=27.44µs  min=5.68µs  med=15.71µs  max=150.55ms p(90)=21.57µs  p(95)=23.71µs  p(99.9)=644.34µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=124.76ms min=21.81ms med=122.97ms max=395.17ms p(90)=155.57ms p(95)=166.22ms p(99.9)=213.87ms
     http_reqs......................: 47970   391.499002/s
     iteration_duration.............: avg=125.38ms min=48.7ms  med=123.39ms max=409.3ms  p(90)=155.99ms p(95)=166.66ms p(99.9)=217.95ms
     iterations.....................: 47870   390.682869/s
     success_rate...................: 100.00% ✓ 47870      ✗ 0    
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

     checks.........................: 100.00% ✓ 96318      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 39 MB   316 kB/s
     http_req_blocked...............: avg=7.05µs   min=1.25µs  med=3.59µs   max=4.06ms   p(90)=5.16µs   p(95)=5.79µs   p(99.9)=1.51ms  
     http_req_connecting............: avg=3.21µs   min=0s      med=0s       max=4.01ms   p(90)=0s       p(95)=0s       p(99.9)=1.49ms  
     http_req_duration..............: avg=186.16ms min=17.35ms med=173.68ms max=573.8ms  p(90)=215.02ms p(95)=379.25ms p(99.9)=522.83ms
       { expected_response:true }...: avg=186.16ms min=17.35ms med=173.68ms max=573.8ms  p(90)=215.02ms p(95)=379.25ms p(99.9)=522.83ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32206
     http_req_receiving.............: avg=102.05µs min=35.59µs med=96.01µs  max=37.76ms  p(90)=129.97µs p(95)=144.4µs  p(99.9)=630.69µs
     http_req_sending...............: avg=30.2µs   min=6.09µs  med=18.2µs   max=71.9ms   p(90)=23.76µs  p(95)=25.64µs  p(99.9)=614.26µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=186.03ms min=17.23ms med=173.54ms max=573.66ms p(90)=214.9ms  p(95)=379.15ms p(99.9)=522.7ms 
     http_reqs......................: 32206   263.482908/s
     iteration_duration.............: avg=186.99ms min=48.56ms med=174.07ms max=574.04ms p(90)=215.41ms p(95)=380.07ms p(99.9)=523.11ms
     iterations.....................: 32106   262.664791/s
     success_rate...................: 100.00% ✓ 32106      ✗ 0    
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

     checks.........................: 100.00% ✓ 83655      ✗ 0    
     data_received..................: 2.5 GB  20 MB/s
     data_sent......................: 34 MB   273 kB/s
     http_req_blocked...............: avg=6.27µs   min=1.18µs  med=3.46µs   max=3.63ms   p(90)=4.85µs   p(95)=5.41µs   p(99.9)=1.03ms  
     http_req_connecting............: avg=2.63µs   min=0s      med=0s       max=3.61ms   p(90)=0s       p(95)=0s       p(99.9)=1.01ms  
     http_req_duration..............: avg=214.38ms min=22.42ms med=215.51ms max=406.92ms p(90)=230.04ms p(95)=241.59ms p(99.9)=308.93ms
       { expected_response:true }...: avg=214.38ms min=22.42ms med=215.51ms max=406.92ms p(90)=230.04ms p(95)=241.59ms p(99.9)=308.93ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 27985
     http_req_receiving.............: avg=153.74µs min=33.16µs med=92.08µs  max=150.41ms p(90)=125.05µs p(95)=138.42µs p(99.9)=1.24ms  
     http_req_sending...............: avg=36.19µs  min=6.32µs  med=17.07µs  max=215.23ms p(90)=22.46µs  p(95)=24.33µs  p(99.9)=753.47µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=214.19ms min=22.23ms med=215.39ms max=326.77ms p(90)=229.84ms p(95)=241.12ms p(99.9)=303.26ms
     http_reqs......................: 27985   227.748952/s
     iteration_duration.............: avg=215.35ms min=63.32ms med=215.79ms max=407.26ms p(90)=230.31ms p(95)=242.12ms p(99.9)=315.16ms
     iterations.....................: 27885   226.935127/s
     success_rate...................: 100.00% ✓ 27885      ✗ 0    
     vus............................: 50      min=0        max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-174-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

